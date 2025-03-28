/obj/item/crowbar/freeman
	name = "blood soaked crowbar"
	desc = "A heavy handed crowbar, it drips with blood."
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/freeman.dmi'
	icon_state = "crowbar"
	force = 35
	throwforce = 45
	toolspeed = 0.1
	wound_bonus = 10
	hitsound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/weapons/crowbar2.ogg'
	mob_throw_hit_sound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/weapons/crowbar2.ogg'
	can_force_powered = TRUE

/obj/item/crowbar/freeman/ultimate
	name = "\improper Freeman's crowbar"
	desc = "A weapon wielded by an ancient physicist, the blood of hundreds seeps through this rod of iron and malice."
	force = 45

/obj/item/crowbar/freeman/ultimate/Initialize(mapload)
	. = ..()
	add_filter("rad_glow", 2, list("type" = "outline", "color" = "#fbff1479", "size" = 2))
