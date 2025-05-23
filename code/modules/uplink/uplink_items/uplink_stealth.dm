
// Stealthy Weapons

/*
	Uplink Items:
	Unlike categories, uplink item entries are automatically sorted alphabetically on server init in a global list,
	When adding new entries to the file, please keep them sorted by category.
*/

/datum/uplink_item/stealthy_weapons/telescopicbat
	name = "Telescopic Baseball Bat"
	desc = "A robust telescopic baseball bat that hits like a truck and can be concealed when collapsed."
	item = /obj/item/melee/baseball_bat/telescopic
	purchasable_from = UPLINK_SYNDICATE
	cost = 2

/datum/uplink_item/stealthy_weapons/telescopicbat_inteq
	name = "Telescopic Baseball Bat"
	desc = "Раскладная бейсбольная бита с шипованым навершием. Для тех, кто в душе не ебёт какие правила у бейсбола."
	item = /obj/item/melee/baseball_bat/telescopic/inteq
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)
	cost = 2

/datum/uplink_item/stealthy_weapons/combatglovesplus
	name = "Combat Gloves Plus"
	desc = "A pair of gloves that are fireproof and shock resistant, however unlike the regular Combat Gloves this one uses nanotechnology \
			to learn the abilities of krav maga to the wearer."
	item = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	cost = 4
	purchasable_from = UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS | UPLINK_SYNDICATE
	surplus = 0

/datum/uplink_item/stealthy_weapons/cqc
	name = "CQC Manual"
	desc = "A manual that teaches a single user tactical Close-Quarters Combat before self-destructing."
	item = /obj/item/book/granter/martial/cqc
	purchasable_from = ~UPLINK_CLOWN_OPS
	cost = 12
	surplus = 0

/datum/uplink_item/stealthy_weapons/dart_pistol
	name = "Dart Pistol"
	desc = "A miniaturized version of a normal syringe gun. It is very quiet when fired and can fit into any \
			space a small item can."
	item = /obj/item/gun/syringe/syndicate
	cost = 4
	surplus = 50

/datum/uplink_item/stealthy_weapons/dehy_carp
	name = "Dehydrated Space Carp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life space carp! Activate in \
			your hand before use so it knows not to kill you."
	item = /obj/item/toy/plush/carpplushie/dehy_carp
	cost = 1

/datum/uplink_item/stealthy_weapons/derringerpack
	name = "Compact Derringer"
	desc = "An easily concealable handgun capable of firing .357 rounds. Comes in an inconspicuious packet of cigarettes with additional munitions."
	item = /obj/item/storage/fancy/cigarettes/derringer
	cost = 6
	surplus = 30

/datum/uplink_item/stealthy_weapons/derringerpack/purchase(mob/user, datum/component/uplink/U)
	if(prob(10)) //For the 10%
		item = /obj/item/storage/fancy/cigarettes/derringer/gold
	..()

/datum/uplink_item/stealthy_weapons/derringerpack_nukie
	name = "Antique Derringer"
	desc = "An easy to conceal, yet extremely deadly handgun, capable of firing .45-70 Govt rounds. Comes in a unique pack of cigarettes with additional munitions."
	item = /obj/item/storage/fancy/cigarettes/derringer/midworld
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)
	cost = 10
	surplus = 2

/datum/uplink_item/stealthy_weapons/edagger
	name = "Energy Dagger"
	desc = "A dagger made of energy that looks and functions as a pen when off."
	item = /obj/item/pen/edagger
	cost = 2

/datum/uplink_item/stealthy_weapons/martialarts
	name = "Sleeping Carp Scroll"
	desc = "This scroll contains the secrets of an ancient martial arts technique. You will master unarmed combat, \
			gain skin as hard as steel and swat bullets from the air, but you also refuse to use dishonorable ranged weaponry."
	item = /obj/item/book/granter/martial/carp
	cost = 18
	player_minimum = 25
	surplus = 0
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/martialartstwo
	name = "Rising Bass Scroll"
	desc = "This scroll contains the secrets of an ancient martial arts technique. You will become proficient in fleeing situations, \
	and dodging all ranged weapon fire, but you will refuse to use dishonorable ranged weaponry."
	item = /obj/item/book/granter/martial/bass
	cost = 20
	player_minimum = 25
	surplus = 0
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/martialartsthree
	name = "Krav Maga Scroll"
	desc = "This scroll contains the secrets of an ancient martial arts technique. You will gain special unarmed attacks for \
			stealthy takedowns."
	item = /obj/item/book/granter/martial/krav_maga
	cost = 6
	surplus = 0

/datum/uplink_item/stealthy_weapons/crossbow
	name = "Miniature Energy Crossbow"
	desc = "A short bow mounted across a tiller in miniature. Small enough to \
		fit into a pocket or slip into a bag unnoticed. It will synthesize \
		and fire bolts tipped with a paralyzing toxin that will briefly stun \
		targets and cause them to slur as if inebriated. It can produce an \
		infinite number of bolts, but takes time to automatically recharge \
		after each shot."
	item = /obj/item/gun/energy/kinetic_accelerator/crossbow
	cost = 12
	surplus = 50
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/traitor_chem_bottle
	name = "Poison Kit"
	desc = "An assortment of deadly chemicals packed into a compact box. Comes with a syringe for more precise application."
	item = /obj/item/storage/box/syndie_kit/chemical
	cost = 6
	surplus = 50

/datum/uplink_item/stealthy_weapons/romerol_kit
	name = "Romerol"
	desc = "A highly experimental bioterror agent which creates dormant nodules to be etched into the grey matter of the brain. \
			On death, these nodules take control of the dead body, causing limited revivification, \
			along with slurred speech, aggression, and the ability to infect others with this agent."
	item = /obj/item/storage/box/syndie_kit/romerol
	cost = 25
	player_minimum = 25
	cant_discount = TRUE
	hijack_only = TRUE
	purchasable_from = ~UPLINK_NUKE_OPS

/datum/uplink_item/stealthy_weapons/sleepy_pen
	name = "Sleepy Pen"
	desc = "A syringe disguised as a functional pen, filled with a potent mix of drugs, including a \
			strong anesthetic and a chemical that prevents the target from speaking. \
			The pen holds one dose of the mixture, and can be refilled with any chemicals. Note that before the target \
			falls asleep, they will be able to move and act."
	item = /obj/item/pen/sleepy
	cost = 4
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/taeclowndo_shoes
	name = "Tae-clown-do Shoes"
	desc = "A pair of shoes for the most elite agents of the honkmotherland. They grant the mastery of taeclowndo with some honk-fu moves as long as they're worn."
	cost = 6
	item = /obj/item/clothing/shoes/clown_shoes/taeclowndo
	purchasable_from = UPLINK_CLOWN_OPS

/datum/uplink_item/stealthy_weapons/suppressor
	name = "Suppressor"
	desc = "This suppressor will silence the shots of the weapon it is attached to for increased stealth and superior ambushing capability. \
			It is compatible with many small ballistic guns including the Stechkin and C-20r, but not revolvers or energy guns."
	item = /obj/item/suppressor
	cost = 1
	surplus = 10

/datum/uplink_item/stealthy_weapons/soap
	name = "Syndicate Soap"
	desc = "A sinister-looking surfactant used to clean blood stains to hide murders and prevent DNA analysis. \
			You can also drop it underfoot to slip people."
	item = /obj/item/soap/syndie
	cost = 1
	surplus = 50
	purchasable_from = UPLINK_SYNDICATE // Bluemoon Changes

/datum/uplink_item/stealthy_weapons/soap_inteq // Bluemoon Changes
	name = "InteQ Soap"
	desc = "A sinister-looking surfactant used to clean blood stains to hide murders and prevent DNA analysis. \
			You can also drop it underfoot to slip people."
	item = /obj/item/soap/inteq
	cost = 1
	surplus = 50
	purchasable_from = ~(UPLINK_SYNDICATE)

/datum/uplink_item/stealthy_weapons/soap_clusterbang
	name = "Slipocalypse Clusterbang"
	desc = "A traditional clusterbang grenade with a payload consisting entirely of soap. Useful in any scenario!"
	item = /obj/item/grenade/clusterbuster/soap
	cost = 3
	purchasable_from = UPLINK_SYNDICATE

/datum/uplink_item/stealthy_weapons/soap_clusterbang/inteq
	item = /obj/item/grenade/clusterbuster/soap/inteq
	purchasable_from = ~(UPLINK_SYNDICATE)

//BLUEMOON add добавил набор оригами в аплинк.

/datum/uplink_item/stealthy_weapons/origami_bundle
	name = "Boxed Origami Kit"
	desc = "This box contains a guide on how to craft masterful works of origami, allowing you to transform normal pieces of paper into perfectly aerodynamic (and potentially lethal) paper airplanes."
	item = /obj/item/storage/box/inteq_kit/origami_bundle
	cost = 4
	surplus = 0
	purchasable_from = ~UPLINK_NUKE_OPS

//BLUEMOON add end
