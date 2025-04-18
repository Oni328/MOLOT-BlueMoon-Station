/*! Movespeed modification datums.

	How move speed for mobs works

Move speed is now calculated by using modifier datums which are added to mobs. Some of them (nonvariable ones) are globally cached, the variable ones are instanced and changed based on need.

This gives us the ability to have multiple sources of movespeed, reliabily keep them applied and remove them when they should be

THey can have unique sources and a bunch of extra fancy flags that control behaviour

Previously trying to update move speed was a shot in the dark that usually meant mobs got stuck going faster or slower

Movespeed modification list is a simple key = datum system. Key will be the datum's ID if it is overridden to not be null, or type if it is not.

DO NOT override datum IDs unless you are going to have multiple types that must overwrite each other. It's more efficient to use types, ID functionality is only kept for cases where dynamic creation of modifiers need to be done.

When update movespeed is called, the list of items is iterated, according to flags priority and a bunch of conditions
this spits out a final calculated value which is used as a modifer to last_move + modifier for calculating when a mob
can next move

Key procs
* [add_movespeed_modifier](mob.html#proc/add_movespeed_modifier)
* [remove_movespeed_modifier](mob.html#proc/remove_movespeed_modifier)
* [has_movespeed_modifier](mob.html#proc/has_movespeed_modifier)
* [update_movespeed](mob.html#proc/update_movespeed)
*/

/datum/movespeed_modifier
	/// Whether or not this is a variable modifier. Variable modifiers can NOT be ever auto-cached. ONLY CHECKED VIA INITIAL(), EFFECTIVELY READ ONLY (and for very good reason)
	var/variable = FALSE

	/// Unique ID. You can never have different modifications with the same ID. By default, this SHOULD NOT be set. Only set it for cases where you're dynamically making modifiers/need to have two types overwrite each other. If unset, uses path (converted to text) as ID.
	var/id

	/// Determines order. Lower priorities are applied first.
	var/priority = 0
	var/flags = NONE

	/// Multiplicative slowdown
	var/multiplicative_slowdown = 0
	/// Next two variables depend on this: Should we do advanced calculations?
	var/complex_calculation = FALSE
	/// Absolute max tiles we can boost to
	var/absolute_max_tiles_per_second = 10
	/// Max tiles per second we can boost
	var/max_tiles_per_second_boost = INFINITY

	/// Movetypes this applies to
	var/movetypes = ALL

	/// Movetypes this never applies to
	var/blacklisted_movetypes = NONE

	/// Other modification datums this conflicts with.
	var/conflicts_with



/datum/movespeed_modifier/New()
	. = ..()
	if(!id)
		id = "[type]" //We turn the path into a string.

/**
  * Returns new multiplicative movespeed after modification.
  */
/datum/movespeed_modifier/proc/apply_multiplicative(existing, mob/target)
	if(!complex_calculation || (multiplicative_slowdown > 0))		// we aren't limiting how much things can slowdown.. yet.
		return existing + multiplicative_slowdown
	var/current_tiles = 10 / max(existing, world.tick_lag)
	// multiplicative_slowdown is negative due to our first check
	var/max_buff_to = max(existing + multiplicative_slowdown, 10 / absolute_max_tiles_per_second, 10 / (current_tiles + max_tiles_per_second_boost))
	// never slow the user
	return min(existing, max_buff_to)

GLOBAL_LIST_EMPTY(movespeed_modification_cache)

/// Grabs a STATIC MODIFIER datum from cache. YOU MUST NEVER EDIT THESE DATUMS, OR IT WILL AFFECT ANYTHING ELSE USING IT TOO!
/proc/get_cached_movespeed_modifier(modtype)
	if(!ispath(modtype, /datum/movespeed_modifier))
		CRASH("[modtype] is not a movespeed modification typepath.")
	var/datum/movespeed_modifier/M = modtype
	if(initial(M.variable))
		CRASH("[modtype] is a variable modifier, and can never be cached.")
	M = GLOB.movespeed_modification_cache[modtype]
	if(!M)
		M = GLOB.movespeed_modification_cache[modtype] = new modtype
	return M

///Add a move speed modifier to a mob. If a variable subtype is passed in as the first argument, it will make a new datum. If ID conflicts, it will overwrite the old ID.
/mob/proc/add_movespeed_modifier(datum/movespeed_modifier/type_or_datum, update = TRUE)
	if(ispath(type_or_datum))
		if(!initial(type_or_datum.variable))
			type_or_datum = get_cached_movespeed_modifier(type_or_datum)
		else
			type_or_datum = new type_or_datum
	var/datum/movespeed_modifier/existing = LAZYACCESS(movespeed_modification, type_or_datum.id)
	if(existing)
		if(existing == type_or_datum)		//same thing don't need to touch
			return TRUE
		remove_movespeed_modifier(existing, FALSE)
	if(length(movespeed_modification))
		BINARY_INSERT(type_or_datum.id, movespeed_modification, /datum/movespeed_modifier, type_or_datum, priority, COMPARE_VALUE)
	LAZYSET(movespeed_modification, type_or_datum.id, type_or_datum)
	if(update)
		update_movespeed()
	return TRUE

/// Remove a move speed modifier from a mob, whether static or variable.
/mob/proc/remove_movespeed_modifier(datum/movespeed_modifier/type_id_datum, update = TRUE)
	var/key
	if(ispath(type_id_datum))
		key = initial(type_id_datum.id) || "[type_id_datum]"		//id if set, path set to string if not.
	else if(!istext(type_id_datum))		//if it isn't text it has to be a datum, as it isn't a type.
		key = type_id_datum.id
	else								//assume it's an id
		key = type_id_datum
	if(!LAZYACCESS(movespeed_modification, key))
		return FALSE
	LAZYREMOVE(movespeed_modification, key)
	if(update)
		update_movespeed(FALSE)
	return TRUE

/*! Used for variable slowdowns like hunger/health loss/etc, works somewhat like the old list-based modification adds. Returns the modifier datum if successful
	How this SHOULD work is:
	1. Ensures type_id_datum one way or another refers to a /variable datum. This makes sure it can't be cached. This includes if it's already in the modification list.
	2. Instantiate a new datum if type_id_datum isn't already instantiated + in the list, using the type. Obviously, wouldn't work for ID only.
	3. Add the datum if necessary using the regular add proc
	4. If any of the rest of the args are not null (see: multiplicative slowdown), modify the datum
	5. Update if necessary
*/
/mob/proc/add_or_update_variable_movespeed_modifier(datum/movespeed_modifier/type_id_datum, update = TRUE, multiplicative_slowdown)
	var/modified = FALSE
	var/inject = FALSE
	var/datum/movespeed_modifier/final
	if(istext(type_id_datum))
		final = LAZYACCESS(movespeed_modification, type_id_datum)
		if(!final)
			CRASH("Couldn't find existing modification when provided a text ID.")
	else if(ispath(type_id_datum))
		if(!initial(type_id_datum.variable))
			CRASH("Not a variable modifier")
		final = LAZYACCESS(movespeed_modification, initial(type_id_datum.id) || "[type_id_datum]")
		if(!final)
			final = new type_id_datum
			inject = TRUE
			modified = TRUE
	else
		if(!initial(type_id_datum.variable))
			CRASH("Not a variable modifier")
		final = type_id_datum
		if(!LAZYACCESS(movespeed_modification, final.id))
			inject = TRUE
			modified = TRUE
	if(!isnull(multiplicative_slowdown))
		final.multiplicative_slowdown = multiplicative_slowdown
		modified = TRUE
	if(inject)
		add_movespeed_modifier(final, FALSE)
	if(update && modified)
		update_movespeed(TRUE)
	return final

/// Handles the special case of editing the movement var
/mob/vv_edit_var(var_name, var_value)
	if(var_name == NAMEOF(src, control_object))
		var/obj/O = var_value
		if(!istype(O) && (var_value != null))
			return FALSE
		if(O.obj_flags & DANGEROUS_POSSESSION)
			return FALSE
	var/slowdown_edit = (var_name == NAMEOF(src, cached_multiplicative_slowdown))
	var/diff
	if(slowdown_edit && isnum(cached_multiplicative_slowdown) && isnum(var_value))
		remove_movespeed_modifier(/datum/movespeed_modifier/admin_varedit)
		diff = var_value - cached_multiplicative_slowdown
	. = ..()
	if(. && slowdown_edit && isnum(diff))
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/admin_varedit, multiplicative_slowdown = diff)

///Is there a movespeed modifier for this mob
/mob/proc/has_movespeed_modifier(datum/movespeed_modifier/datum_type_id)
	var/key
	if(ispath(datum_type_id))
		key = initial(datum_type_id.id) || "[datum_type_id]"
	else if(istext(datum_type_id))
		key = datum_type_id
	else
		key = datum_type_id.id
	return LAZYACCESS(movespeed_modification, key)

/// Set or update the global movespeed config on a mob
/mob/proc/update_config_movespeed()
	add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/mob_config_speedmod, multiplicative_slowdown = get_config_multiplicative_speed())
	add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/mob_config_speedmod_floating, multiplicative_slowdown = get_config_multiplicative_speed(TRUE))

/// Get the global config movespeed of a mob by type
/mob/proc/get_config_multiplicative_speed(floating = FALSE)
	var/list/read = floating? GLOB.mob_config_movespeed_type_lookup_floating : GLOB.mob_config_movespeed_type_lookup
	/* BLUEMOON REMOVAL START
	if(!islist(read) || !read[type])
		return FALSE
	else
		return read[type]
	/ BLUEMOON REMOVAL END */
	// BLUEMOON ADD START - добавлена поддержка веса персонажа
	var/value = 0
	if(read[type])
		value = read[type]
	if(src.mob_weight > MOB_WEIGHT_HEAVY && floating)
		value += 1 // сверхтяжёлые персонажи в ином случае летают по вакууму на сверх-скоростях
	return value
	// BLUEMOON ADD END

/// Go through the list of movespeed modifiers and calculate a final movespeed. ANY ADD/REMOVE DONE IN UPDATE_MOVESPEED MUST HAVE THE UPDATE ARGUMENT SET AS FALSE!
/mob/proc/update_movespeed()
	. = 0
	var/list/conflict_tracker = list()
	for(var/key in get_movespeed_modifiers())
		var/datum/movespeed_modifier/M = movespeed_modification[key]
		if(!(M.movetypes & movement_type)) // We don't affect any of these move types, skip
			continue
		if(M.blacklisted_movetypes & movement_type) // There's a movetype here that disables this modifier, skip
			continue
		var/conflict = M.conflicts_with
		var/amt = M.multiplicative_slowdown
		if(conflict)
			// Conflicting modifiers prioritize the larger slowdown or the larger speedup
			// We purposefuly don't handle mixing speedups and slowdowns on the same id
			if(abs(conflict_tracker[conflict]) < abs(amt))
				conflict_tracker[conflict] = amt
			else
				continue
		. = M.apply_multiplicative(., src)
	// your delay decreases, "give" the delay back to the client
	cached_multiplicative_slowdown = .
	if(!client)
		return
	// BLUEMOON ADD START - ограничение максимальной скорости для персонажа
	if(movespeed_override)
		cached_multiplicative_slowdown = max(cached_multiplicative_slowdown, movespeed_override)
	// BLUEMOON ADD END
	var/diff = (client.last_move - client.move_delay) - cached_multiplicative_slowdown
	if(diff > 0)
		if(client.move_delay > world.time + 1.5)
			client.move_delay -= diff
		var/timeleft = world.time - client.move_delay
		var/elapsed = world.time - client.last_move
		var/glide_size_current = glide_size
		if((timeleft <= 0) || (elapsed > 20))
			set_glide_size(16, TRUE)
			return
		var/pixels_moved = glide_size_current * elapsed * (1 / world.tick_lag)
		// calculate glidesize needed to move to the next tile within timeleft deciseconds
		var/ticks_allowed = timeleft / world.tick_lag
		var/pixels_per_tick = pixels_moved / ticks_allowed
		set_glide_size(pixels_per_tick * GLOB.glide_size_multiplier, TRUE)

/// Get the move speed modifiers list of the mob
/mob/proc/get_movespeed_modifiers()
	. = LAZYCOPY(movespeed_modification)
	for(var/id in movespeed_mod_immunities)
		. -= id

/// Calculate the total slowdown of all movespeed modifiers
/mob/proc/total_multiplicative_slowdown()
	. = 0
	for(var/id in get_movespeed_modifiers())
		var/datum/movespeed_modifier/M = movespeed_modification[id]
		. += M.multiplicative_slowdown

/**
  * Gets the movespeed modifier datum of a modifier on a mob. Returns null if not found.
  * DANGER: IT IS UP TO THE PERSON USING THIS TO MAKE SURE THE MODIFIER IS NOT MODIFIED IF IT HAPPENS TO BE GLOBAL/CACHED.
  */
/mob/proc/get_movespeed_modifier_datum(id)
	return movespeed_modification[id]

/// Checks if a move speed modifier is valid and not missing any data
/proc/movespeed_data_null_check(datum/movespeed_modifier/M)		//Determines if a data list is not meaningful and should be discarded.
	. = TRUE
	if(M.multiplicative_slowdown)
		. = FALSE
