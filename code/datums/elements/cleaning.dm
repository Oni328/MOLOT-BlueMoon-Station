/datum/element/cleaning
	element_flags = ELEMENT_BESPOKE|ELEMENT_DETACH
	id_arg_index = 2
	/// Range of cleaning on moving
	var/range = 0

/datum/element/cleaning/Attach(atom/movable/cleaner, cleaning_range)
	. = ..()
	if(!istype(cleaner))
		return ELEMENT_INCOMPATIBLE
	if(cleaning_range)
		range = cleaning_range
	RegisterSignal(cleaner, COMSIG_MOVABLE_MOVED, PROC_REF(Clean), TRUE)

/datum/element/cleaning/Detach(atom/movable/cleaner)
	. = ..()
	UnregisterSignal(cleaner, COMSIG_MOVABLE_MOVED)

/datum/element/cleaning/proc/Clean(atom/movable/cleaner)
	for (var/turf/turf in RANGE_TURFS(range, cleaner.loc))
		SEND_SIGNAL(turf, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
		for(var/atom/atom as anything in turf)
			if(is_cleanable(atom))
				qdel(atom)
			else if(isitem(atom))
				var/obj/item/cleaned_item = atom
				SEND_SIGNAL(cleaned_item, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
				cleaned_item.clean_blood()
				if(ismob(cleaned_item.loc))
					var/mob/mob = cleaned_item.loc
					mob.regenerate_icons()
			else if(ishuman(atom))
				var/mob/living/carbon/human/cleaned_human = atom
				if(cleaned_human.lying)
					if(cleaned_human.head)
						SEND_SIGNAL(cleaned_human.head, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
						cleaned_human.head.clean_blood()
						cleaned_human.update_inv_head()
					if(cleaned_human.wear_suit)
						SEND_SIGNAL(cleaned_human.wear_suit, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
						cleaned_human.wear_suit.clean_blood()
						cleaned_human.update_inv_wear_suit()
					else if(cleaned_human.w_uniform)
						SEND_SIGNAL(cleaned_human.w_uniform, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
						cleaned_human.w_uniform.clean_blood()
						cleaned_human.update_inv_w_uniform()
					//skyrat edit
					else if(cleaned_human.w_underwear)
						SEND_SIGNAL(cleaned_human.w_underwear, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
						cleaned_human.w_underwear.clean_blood()
						cleaned_human.update_inv_w_underwear()
					else if(cleaned_human.w_socks)
						SEND_SIGNAL(cleaned_human.w_socks, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
						cleaned_human.w_socks.clean_blood()
						cleaned_human.update_inv_w_socks()
					else if(cleaned_human.w_shirt)
						SEND_SIGNAL(cleaned_human.w_shirt, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
						cleaned_human.w_shirt.clean_blood()
						cleaned_human.update_inv_w_shirt()
					else if(cleaned_human.wrists)
						SEND_SIGNAL(cleaned_human.wrists, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
						cleaned_human.w_shirt.clean_blood()
						cleaned_human.update_inv_wrists()
					//
					if(cleaned_human.shoes)
						SEND_SIGNAL(cleaned_human.shoes, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
						cleaned_human.shoes.clean_blood()
						cleaned_human.update_inv_shoes()
					SEND_SIGNAL(cleaned_human, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
					cleaned_human.clean_blood()
					cleaned_human.wash_cream()
					cleaned_human.regenerate_icons()
					to_chat(cleaned_human, span_danger("[cleaner] cleans your face!"))
