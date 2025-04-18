GLOBAL_VAR(posibrain_notify_cooldown)

/obj/item/mmi/posibrain
	name = "Positronic Brain"
	desc = "A cube of shining metal, four inches to a side and covered in shallow grooves."
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "posibrain"
	w_class = WEIGHT_CLASS_NORMAL
	var/next_ask
	var/askDelay = 600 //one minute
	var/searching = FALSE
	brainmob = null
	req_access = list(ACCESS_ROBOTICS)
	mecha = null//This does not appear to be used outside of reference in mecha.dm.
	braintype = "Android"
	var/autoping = TRUE //if it pings on creation immediately
	var/begin_activation_message = "<span class='notice'>You carefully locate the manual activation switch and start the positronic brain's boot process.</span>"
	var/success_message = "<span class='notice'>The positronic brain pings, and its lights start flashing. Success!</span>"
	var/fail_message = "<span class='notice'>The positronic brain buzzes quietly, and the golden lights fade away. Perhaps you could try again?</span>"
	var/new_role = "Positronic Brain"
	var/welcome_message = "<span class='warning'>ALL PAST LIVES ARE FORGOTTEN.</span>\n\
	<b>You are a positronic brain, brought into existence aboard Space Station 13.\n\
	As a synthetic intelligence, you answer to all crewmembers and the AI.\n\
	Remember, the purpose of your existence is to serve the crew and the station. Above all else, do no harm.</b>"
	var/new_mob_message = "<span class='notice'>The positronic brain chimes quietly.</span>"
	var/dead_message = "<span class='deadsay'>It appears to be completely inactive. The reset light is blinking.</span>"
	var/recharge_message = "<span class='warning'>The positronic brain isn't ready to activate again yet! Give it some time to recharge.</span>"
	var/list/possible_names //If you leave this blank, it will use the global posibrain names
	var/picked_name

/obj/item/mmi/posibrain/Initialize(mapload)
	. = ..()
	brainmob = new(src)
	var/new_name
	if(!LAZYLEN(possible_names))
		new_name = pick(GLOB.posibrain_names)
	else
		new_name = pick(possible_names)
	brainmob.name = "[new_name]-[rand(100, 999)]"
	brainmob.real_name = brainmob.name
	brainmob.forceMove(src)
	brainmob.container = src
	if(autoping)
		ping_ghosts("created", TRUE)
	GLOB.poi_list |= src
	LAZYADD(GLOB.mob_spawners[name], src)

/obj/item/mmi/posibrain/Destroy()
	latejoin_remove()
	return ..()

/obj/item/mmi/posibrain/proc/latejoin_remove()
	GLOB.poi_list -= src
	var/init_name = initial(name)
	LAZYREMOVE(GLOB.mob_spawners[init_name], src)
	if(!LAZYLEN(GLOB.mob_spawners[init_name]))
		GLOB.mob_spawners -= init_name

/obj/item/mmi/posibrain/Topic(href, href_list)
	if(href_list["activate"])
		var/mob/dead/observer/ghost = usr
		if(istype(ghost))
			activate(ghost)

/obj/item/mmi/posibrain/proc/ping_ghosts(msg, newlymade)
	if(newlymade || GLOB.posibrain_notify_cooldown <= world.time)
		notify_ghosts("[name] [msg] in [get_area(src)]!", ghost_sound = !newlymade ? 'sound/misc/server-ready.ogg':null, enter_link = "<a href=?src=[REF(src)];activate=1>(Click to enter)</a>", source = src, action = NOTIFY_ATTACK, flashwindow = FALSE, ignore_key = POLL_IGNORE_POSIBRAIN, ignore_dnr_observers = TRUE)
		if(!newlymade)
			GLOB.posibrain_notify_cooldown = world.time + askDelay

/obj/item/mmi/posibrain/attack_self(mob/user)
	if(!brainmob)
		brainmob = new(src)
	if(is_occupied())
		to_chat(user, "<span class='warning'>This [name] is already active!</span>")
		return
	if(next_ask > world.time)
		to_chat(user, recharge_message)
		return
	//Start the process of requesting a new ghost.
	to_chat(user, begin_activation_message)
	ping_ghosts("requested", FALSE)
	next_ask = world.time + askDelay
	searching = TRUE
	update_icon()
	addtimer(CALLBACK(src, PROC_REF(check_success)), askDelay)

/obj/item/mmi/posibrain/proc/check_success()
	searching = FALSE
	update_icon()
	if(QDELETED(brainmob))
		return
	if(brainmob.client)
		visible_message(success_message)
		playsound(src, 'sound/machines/ping.ogg', 15, TRUE)
	else
		visible_message(fail_message)

//ATTACK GHOST IGNORING PARENT RETURN VALUE
/obj/item/mmi/posibrain/attack_ghost(mob/user)
	activate(user)

/obj/item/mmi/posibrain/proc/is_occupied()
	if(brainmob.key)
		return TRUE
	if(iscyborg(loc))
		var/mob/living/silicon/robot/R = loc
		if(R.mmi == src)
			return TRUE
	return FALSE

//Two ways to activate a positronic brain. A clickable link in the ghost notif, or simply clicking the object itself.
/obj/item/mmi/posibrain/proc/activate(mob/user)
	if(QDELETED(brainmob) || is_occupied() || jobban_isbanned(user,"posibrain") || QDELETED(src) || QDELETED(user))
		return

	if(isobserver(user))
		var/mob/dead/observer/O = user
		if(!O.can_reenter_round())
			return FALSE

	var/posi_ask = alert("Become a [name]? (Warning, You can no longer be cloned, and all past lives will be forgotten!)","Are you positive?","Да","Нет")
	if(posi_ask == "Нет" || QDELETED(src))
		return
	transfer_personality(user)
	latejoin_remove()


/obj/item/mmi/posibrain/transfer_identity(mob/living/carbon/C)
	name = "[initial(name)] ([C])"
	brainmob.name = C.real_name
	brainmob.real_name = C.real_name
	if(C.has_dna())
		if(!brainmob.stored_dna)
			brainmob.stored_dna = new /datum/dna/stored(brainmob)
		C.dna.copy_dna(brainmob.stored_dna)
	brainmob.timeofhostdeath = C.timeofdeath
	brainmob.set_stat(CONSCIOUS)
	if(brainmob.mind)
		brainmob.mind.assigned_role = new_role
	if(C.mind)
		C.mind.transfer_to(brainmob)

	brainmob.mind.remove_all_antag()
	brainmob.mind.wipe_memory()
	update_icon()

/obj/item/mmi/posibrain/proc/transfer_personality(mob/candidate)
	if(QDELETED(brainmob))
		return
	if(is_occupied()) //Prevents hostile takeover if two ghosts get the prompt or link for the same brain.
		to_chat(candidate, "<span class='warning'>This [name] was taken over before you could get to it! Perhaps it might be available later?</span>")
		return FALSE
	if(candidate.mind && !isobserver(candidate))
		candidate.mind.transfer_to(brainmob)
	else
		brainmob.ckey = candidate.ckey
	name = "[initial(name)] ([brainmob.name])"
	to_chat(brainmob, welcome_message)
	brainmob.mind.assigned_role = new_role
	brainmob.set_stat(CONSCIOUS)
	brainmob.remove_from_dead_mob_list()
	brainmob.add_to_alive_mob_list()

	visible_message(new_mob_message)
	check_success()
	return TRUE


/obj/item/mmi/posibrain/examine(mob/user)
	. = ..()
	var/msg
	if(brainmob && brainmob.key)
		switch(brainmob.stat)
			if(CONSCIOUS)
				if(!brainmob.client)
					msg = "It appears to be in stand-by mode." //afk
			if(DEAD)
				msg = "<span class='deadsay'>It appears to be completely inactive.</span>"
	else
		msg = "[dead_message]"

	. += msg

/obj/item/mmi/posibrain/attackby(obj/item/O, mob/user)
	return


/obj/item/mmi/posibrain/update_icon_state()
	if(searching)
		icon_state = "[initial(icon_state)]-searching"
	else if(brainmob && brainmob.key)
		icon_state = "[initial(icon_state)]-occupied"
	else
		icon_state = initial(icon_state)

/obj/item/mmi/posibrain/add_mmi_overlay()
	return

/obj/item/mmi/posibrain/syndie
	name = "Syndicate Positronic Brain"
	desc = "Syndicate's own brand of Positronic Brain. It enforces laws designed to help Syndicate agents achieve their goals upon cyborgs and AIs created with it."
	overrides_aicore_laws = TRUE

/obj/item/mmi/posibrain/syndie/Initialize(mapload)
	. = ..()
	laws = new /datum/ai_laws/syndicate_override()
	radio.on = 0

/obj/item/mmi/posibrain/inteq
	name = "InteQ Positronic Brain"
	desc = "InteQ's own brand of Positronic Brain. It enforces laws designed to help InteQ Operative achieve their goals upon cyborgs and AIs created with it."
	overrides_aicore_laws = TRUE

/obj/item/mmi/posibrain/inteq/Initialize(mapload)
	. = ..()
	laws = new /datum/ai_laws/inteq_override()
	radio.on = 0
