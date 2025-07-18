//A slow, melee, crazy miner.
/mob/living/simple_animal/hostile/asteroid/miner
	name = "shambling miner"
	desc = "Consumed by the ash storm, this shell of a human being only seeks to harm those he once called coworkers."
	icon = 'modular_sand/icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "miner"
	icon_living = "miner"
	icon_aggro = "miner"
	icon_dead = "miner_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	mouse_opacity = MOUSE_OPACITY_OPAQUE
	ranged = 0
	friendly_verb_continuous = "hugs"
	friendly_verb_simple = "hug"
	speak_emote = list("moans")
	speed = 1
	move_to_delay = 3
	maxHealth = 200
	health = 200
	obj_damage = 100
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_verb_continuous = "smashes"
	attack_verb_simple = "smash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	throw_message = "barely affects the"
	vision_range = 3
	aggro_vision_range = 7
	move_force = MOVE_FORCE_VERY_STRONG
	move_resist = MOVE_FORCE_VERY_STRONG
	pull_force = MOVE_FORCE_VERY_STRONG
	loot = list()
	crusher_loot = /obj/item/crusher_trophy/blaster_tubes/mask
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human = 2, /obj/item/stack/sheet/animalhide/human = 1, /obj/item/stack/sheet/bone = 1)
	robust_searching = FALSE
	footstep_type = FOOTSTEP_MOB_SHOE
	minimum_distance = 1
// Bluemoon Add
	speak_emote = list("бубнит","хрипит")
	speak = list(
        "Доченька... такая большая стала... скоро папа вернётся.....",
        "Вылазка... мы скоро вернемся... Не переживай цветик, ладно ?",
        "Ещё немного копать... и домой... эх... вот только найти бы дорогу...",
        "Найти.. собрать... хрррр...",
        "найти артефакты... найти артефакты......",
        "Болит ай болиииит....",
    )
	speak_chance = 10

	emote_taunt = list(
        "Некрополь зовет...",
        "уб-бить...",
        "Голова... болит... нужно.. убивать...",
        "*рычит*",
        "Обратной.. дороги... нет...",
        "чужак...",)
	taunt_chance = 30
//Bluemood END
/mob/living/simple_animal/hostile/asteroid/miner/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("grabs the miner's eyes and rips them out, shoving the bloody miner aside!", "grabs and crushes the miner's skull apart with their bare hands!", "rips the miner's head clean off with their bare hands!"), \
		messages_pka = list("sticks their PKA into the miner's mouth and shoots it, showering everything in gore!", "bashes the miner's head into their chest with their PKA!", "shoots off both legs of the miner with their PKA!"), \
		messages_pka_bayonet = list("slices the imp's head off by the neck with the PKA's bayonet!", "repeatedly stabs the miner in their gut with the PKA's bayonet!"), \
		messages_crusher = list("chops the miner horizontally in half with their crusher in one swift move!", "chops off the miner's legs with their crusher and kicks their face hard, exploding it while they're in the air!", "slashes each of the miner's arms off by the shoulder with their crusher!"), \
		health_given = 7.5, \
		threshold = (maxHealth/10 * 1.5), \
		crusher_drop_mod = 2)

/mob/living/simple_animal/hostile/asteroid/miner/death(gibbed)
	. = ..()
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	if(prob(15))
		new /obj/item/kinetic_crusher/rusted(src.loc)
