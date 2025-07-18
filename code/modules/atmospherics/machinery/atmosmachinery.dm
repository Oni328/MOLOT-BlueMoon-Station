// Quick overview:
//
// Pipes combine to form pipelines
// Pipelines and other atmospheric objects combine to form pipe_networks
//   Note: A single pipe_network represents a completely open space
//
// Pipes -> Pipelines
// Pipelines + Other Objects -> Pipe network

#define PIPE_VISIBLE_LEVEL 2
#define PIPE_HIDDEN_LEVEL 1

/obj/machinery/atmospherics
	anchored = TRUE
	move_resist = INFINITY				//Moving a connected machine without actually doing the normal (dis)connection things will probably cause a LOT of issues.
	idle_power_usage = 0
	active_power_usage = 0
	power_channel = ENVIRON
	layer = GAS_PIPE_HIDDEN_LAYER //under wires
	plane = ABOVE_WALL_PLANE
	resistance_flags = FIRE_PROOF
	max_integrity = 200
	obj_flags = CAN_BE_HIT | ON_BLUEPRINTS
	var/nodealert = 0
	var/can_unwrench = 0
	var/initialize_directions = 0
	var/pipe_color
	var/piping_layer = PIPING_LAYER_DEFAULT
	var/pipe_flags = NONE

	var/static/list/iconsetids = list()
	var/static/list/pipeimages = list()

	var/image/pipe_vision_img = null

	var/device_type = 0
	var/list/obj/machinery/atmospherics/nodes

	var/construction_type
	var/pipe_state //icon_state as a pipe item
	var/on = FALSE

/obj/machinery/atmospherics/Initialize(mapload)
	. = ..()
	register_context()

/obj/machinery/atmospherics/examine(mob/user)
	. = ..()
	if(is_type_in_list(src, GLOB.ventcrawl_machinery) && isliving(user))
		var/mob/living/L = user
		if(SEND_SIGNAL(L, COMSIG_CHECK_VENTCRAWL))
			. += "<span class='notice'>Alt-click to crawl through it.</span>"

/obj/machinery/atmospherics/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	if(can_unwrench && held_item?.tool_behaviour == TOOL_WRENCH)
		LAZYSET(context[SCREENTIP_CONTEXT_LMB], INTENT_ANY, "Unfasten")
		. = CONTEXTUAL_SCREENTIP_SET

	if(is_type_in_list(src, GLOB.ventcrawl_machinery) && isliving(user) && SEND_SIGNAL(user, COMSIG_CHECK_VENTCRAWL))
		LAZYSET(context[SCREENTIP_CONTEXT_ALT_LMB], INTENT_ANY, "Crawl into")
		. = CONTEXTUAL_SCREENTIP_SET

/obj/machinery/atmospherics/New(loc, process = TRUE, setdir)
	if(!isnull(setdir))
		setDir(setdir)
	if(pipe_flags & PIPING_CARDINAL_AUTONORMALIZE)
		normalize_cardinal_directions()
	nodes = new(device_type)
	if (!armor)
		armor = list(MELEE = 25, BULLET = 10, LASER = 10, ENERGY = 100, BOMB = 0, BIO = 100, RAD = 100, FIRE = 100, ACID = 70)
	..()
	if(process)
		SSair.start_processing_machine(src)
	SetInitDirections()

/obj/machinery/atmospherics/Destroy()
	for(var/i in 1 to device_type)
		nullifyNode(i)


	SSair.stop_processing_machine(src)
	SSair.pipenets_needing_rebuilt -= src

	dropContents()
	if(pipe_vision_img)
		qdel(pipe_vision_img)

	return ..()
	//return QDEL_HINT_FINDREFERENCE

/obj/machinery/atmospherics/proc/destroy_network()
	return

/obj/machinery/atmospherics/proc/build_network()
	// Called to build a network from this node
	return

/obj/machinery/atmospherics/proc/nullifyNode(i)
	if(nodes[i])
		var/obj/machinery/atmospherics/N = nodes[i]
		N.disconnect(src)
		nodes[i] = null

/obj/machinery/atmospherics/proc/getNodeConnects()
	var/list/node_connects = list()
	node_connects.len = device_type

	for(var/i in 1 to device_type)
		for(var/D in GLOB.cardinals)
			if(D & GetInitDirections())
				if(D in node_connects)
					continue
				node_connects[i] = D
				break
	return node_connects

/obj/machinery/atmospherics/proc/normalize_cardinal_directions()
	switch(dir)
		if(SOUTH)
			setDir(NORTH)
		if(WEST)
			setDir(EAST)

//this is called just after the air controller sets up turfs
/obj/machinery/atmospherics/proc/atmosinit(list/node_connects)
	if(!node_connects) //for pipes where order of nodes doesn't matter
		node_connects = getNodeConnects()

	for(var/i in 1 to device_type)
		for(var/obj/machinery/atmospherics/target in get_step(src,node_connects[i]))
			if(can_be_node(target, i))
				nodes[i] = target
				break
	update_icon()

/obj/machinery/atmospherics/proc/setPipingLayer(new_layer)
	piping_layer = (pipe_flags & PIPING_DEFAULT_LAYER_ONLY) ? PIPING_LAYER_DEFAULT : new_layer
	update_icon()

/obj/machinery/atmospherics/proc/can_be_node(obj/machinery/atmospherics/target, iteration)
	return connection_check(target, piping_layer)

//Find a connecting /obj/machinery/atmospherics in specified direction
// BLUEMOON CHANGE перенос проков с ново тг
/obj/machinery/atmospherics/proc/findConnecting(direction, prompted_layer)
	for(var/obj/machinery/atmospherics/target in get_step(src, direction))
		if(!(target.initialize_directions & get_dir(target,src)) && !istype(target, /obj/machinery/atmospherics/pipe/simple/multiz))
			continue
		if(connection_check(target, prompted_layer))
			return target

/obj/machinery/atmospherics/proc/connection_check(obj/machinery/atmospherics/target, given_layer)
	if(src == target)
		return FALSE
	//if target is not multiz then we have to check if the target & src connect in the same direction
	if(!istype(target, /obj/machinery/atmospherics/pipe/simple/multiz) && !((initialize_directions & get_dir(src, target)) && (target.initialize_directions & get_dir(target, src))))
		return FALSE

	//both target & src can't be connected either way
	if(!isConnectable(target, given_layer) && target.isConnectable(src, given_layer))
		return FALSE

	return TRUE
// BLUEMOON CHANGE END

/obj/machinery/atmospherics/proc/isConnectable(obj/machinery/atmospherics/target, given_layer)
	if(isnull(given_layer))
		given_layer = piping_layer
	if((target.piping_layer == given_layer) || (target.pipe_flags & PIPING_ALL_LAYER))
		return TRUE
	return FALSE

/obj/machinery/atmospherics/proc/pipeline_expansion()
	return nodes

/obj/machinery/atmospherics/proc/SetInitDirections()
	return

/obj/machinery/atmospherics/proc/GetInitDirections()
	return initialize_directions

/obj/machinery/atmospherics/proc/returnPipenet()
	return

/obj/machinery/atmospherics/proc/returnPipenetAir()
	return

/obj/machinery/atmospherics/proc/setPipenet()
	return

/obj/machinery/atmospherics/proc/replacePipenet()
	return

/obj/machinery/atmospherics/proc/disconnect(obj/machinery/atmospherics/reference)
	if(istype(reference, /obj/machinery/atmospherics/pipe))
		var/obj/machinery/atmospherics/pipe/P = reference
		P.destroy_network()
	nodes[nodes.Find(reference)] = null
	update_icon()

/obj/machinery/atmospherics/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/pipe)) //lets you autodrop
		var/obj/item/pipe/pipe = W
		if(user.dropItemToGround(pipe))
			pipe.setPipingLayer(piping_layer) //align it with us
			return TRUE
	else
		return ..()

/obj/machinery/atmospherics/wrench_act(mob/living/user, obj/item/I)
	if(!can_unwrench(user))
		return ..()

	var/turf/T = get_turf(src)
	if (level==1 && isturf(T) && T.intact)
		to_chat(user, "<span class='warning'>You must remove the plating first!</span>")
		return TRUE

	var/datum/gas_mixture/int_air = return_air()
	var/datum/gas_mixture/env_air = loc.return_air()
	add_fingerprint(user)

	var/unsafe_wrenching = FALSE
	var/internal_pressure = int_air.return_pressure()-env_air.return_pressure()

	to_chat(user, "<span class='notice'>You begin to unfasten \the [src]...</span>")

	if (internal_pressure > 2*ONE_ATMOSPHERE)
		to_chat(user, "<span class='warning'>As you begin unwrenching \the [src] a gush of air blows in your face... maybe you should reconsider?</span>")
		unsafe_wrenching = TRUE //Oh dear oh dear

	if(I.use_tool(src, user, 20, volume=50))
		user.visible_message( \
			"[user] unfastens \the [src].", \
			"<span class='notice'>You unfasten \the [src].</span>", \
			"<span class='italics'>You hear ratchet.</span>")
		investigate_log("was <span class='warning'>REMOVED</span> by [key_name(usr)]", INVESTIGATE_ATMOS)

		//You unwrenched a pipe full of pressure? Let's splat you into the wall, silly.
		if(unsafe_wrenching)
			unsafe_pressure_release(user, internal_pressure)
		deconstruct(TRUE)
	return TRUE

/obj/machinery/atmospherics/proc/can_unwrench(mob/user)
	return can_unwrench

// Throws the user when they unwrench a pipe with a major difference between the internal and environmental pressure.
/obj/machinery/atmospherics/proc/unsafe_pressure_release(mob/user, pressures = null)
	if(!user)
		return
	if(!pressures)
		var/datum/gas_mixture/int_air = return_air()
		var/datum/gas_mixture/env_air = loc.return_air()
		pressures = int_air.return_pressure() - env_air.return_pressure()

	user.visible_message("<span class='danger'>[user] is sent flying by pressure!</span>","<span class='userdanger'>The pressure sends you flying!</span>")

	// if get_dir(src, user) is not 0, target is the edge_target_turf on that dir
	// otherwise, edge_target_turf uses a random cardinal direction
	// range is pressures / 250
	// speed is pressures / 1250
	user.throw_at(get_edge_target_turf(user, get_dir(src, user) || pick(GLOB.cardinals)), pressures / 250, pressures / 1250)

/obj/machinery/atmospherics/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(can_unwrench)
			var/obj/item/pipe/stored = new construction_type(loc, null, dir, src)
			stored.setPipingLayer(piping_layer)
			if(!disassembled)
				stored.obj_integrity = stored.max_integrity * 0.5
			transfer_fingerprints_to(stored)
	..()

/obj/machinery/atmospherics/proc/getpipeimage(iconset, iconstate, direction, col=rgb(255,255,255), piping_layer=2)

	//Add identifiers for the iconset
	if(iconsetids[iconset] == null)
		iconsetids[iconset] = num2text(iconsetids.len + 1)

	//Generate a unique identifier for this image combination
	var/identifier = iconsetids[iconset] + "_[iconstate]_[direction]_[col]_[piping_layer]"

	if((!(. = pipeimages[identifier])))
		var/image/pipe_overlay
		pipe_overlay = . = pipeimages[identifier] = image(iconset, iconstate, dir = direction)
		pipe_overlay.color = col
		PIPING_LAYER_SHIFT(pipe_overlay, piping_layer)

/obj/machinery/atmospherics/on_construction(obj_color, set_layer, set_level)
	if(can_unwrench)
		add_atom_colour(obj_color, FIXED_COLOUR_PRIORITY)
		pipe_color = obj_color
	setPipingLayer(set_layer)
	var/turf/T = get_turf(src)
	if(set_level) level = set_level
	else level = T.intact ? 2 : 1
	atmosinit()
	var/list/nodes = pipeline_expansion()
	for(var/obj/machinery/atmospherics/A in nodes)
		A.atmosinit()
		A.addMember(src)
	build_network()

/obj/machinery/atmospherics/Entered(atom/movable/AM)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.ventcrawl_layer = piping_layer
	return ..()

/obj/machinery/atmospherics/singularity_pull(S, current_size)
	if(current_size >= STAGE_FIVE)
		deconstruct(FALSE)
	return ..()

#define VENT_SOUND_DELAY 30

/obj/machinery/atmospherics/relaymove(mob/living/user, direction)
	direction &= initialize_directions
	if(!direction || !(direction in GLOB.cardinals)) //cant go this way.
		return

	if(user in buckled_mobs)// fixes buckle ventcrawl edgecase fuck bug
		return

	var/obj/machinery/atmospherics/components/unary/vent_found
	var/obj/machinery/atmospherics/target_move = findConnecting(direction, user.ventcrawl_layer)
	if(target_move)
		if(target_move.can_crawl_through())
			if(is_type_in_typecache(target_move, GLOB.ventcrawl_machinery))
				user.visible_message("<span class='notice'>Что-то вылезает из вентиляции...</span>", "<span class='notice'>Ты вылезаешь из вентиляции.")
				if(!do_after(user, 2 SECONDS, target = vent_found))
					return
				user.forceMove(target_move.loc) //handle entering and so on.

			else
				var/list/pipenetdiff = returnPipenets() ^ target_move.returnPipenets()
				if(pipenetdiff.len)
					user.update_pipe_vision(target_move)
				user.forceMove(target_move)
				user.client.eye = target_move  //Byond only updates the eye every tick, This smooths out the movement
				if(world.time - user.last_played_vent > VENT_SOUND_DELAY)
					user.last_played_vent = world.time
					playsound(src, 'sound/machines/ventcrawl.ogg', 50, 1, -3)
	else if(is_type_in_typecache(src, GLOB.ventcrawl_machinery) && can_crawl_through()) //if we move in a way the pipe can connect, but doesn't - or we're in a vent
		user.visible_message("<span class='notice'>Что-то вылезает из вентиляции...</span>", "<span class='notice'>Ты вылезаешь из вентиляции.")
		if(!do_after(user, 2 SECONDS, target = vent_found))
			return
		user.forceMove(target_move.loc) //handle entering and so on.

/obj/machinery/atmospherics/AltClick(mob/living/L)
	if(is_type_in_typecache(src, GLOB.ventcrawl_machinery))
		return SEND_SIGNAL(L, COMSIG_HANDLE_VENTCRAWL, src)
	return ..()

/obj/machinery/atmospherics/proc/can_crawl_through()
	return TRUE

/obj/machinery/atmospherics/proc/returnPipenets()
	return list()

/obj/machinery/atmospherics/update_remote_sight(mob/user)
	user.sight |= (SEE_TURFS|BLIND)

//Used for certain children of obj/machinery/atmospherics to not show pipe vision when mob is inside it.
/obj/machinery/atmospherics/proc/can_see_pipes()
	return TRUE

/obj/machinery/atmospherics/proc/update_layer()
	layer = initial(layer) + (piping_layer - PIPING_LAYER_DEFAULT) * PIPING_LAYER_LCHANGE
