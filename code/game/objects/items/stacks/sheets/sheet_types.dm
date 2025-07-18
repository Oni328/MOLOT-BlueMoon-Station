/* Diffrent misc types of sheets
 * Contains:
 * Metal
 * Plasteel
 * Wood
 * Bamboo
 * Cloth
 * Durathread
 * Wax
 * Cardboard
 * Runed Metal (cult)
 * Brass (clockwork cult)
 * Bronze (bake brass)
 * Gems
 * Bones
 * Plastic
 * Paper Frames
 * Cotton/Duracotton
 */

/*
 * Metal
 */
GLOBAL_LIST_INIT(metal_recipes, list ( \
	new/datum/stack_recipe("stool", /obj/structure/chair/stool, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("bar stool", /obj/structure/chair/stool/bar, one_per_turf = TRUE, on_floor = TRUE), \
	//SPLURT CHANGE: Add beds list and pod beds
	new/datum/stack_recipe_list("beds", list( \
		new/datum/stack_recipe("bed", /obj/structure/bed, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("double bed", /obj/structure/bed/double, 4, one_per_turf = TRUE, on_floor = TRUE), \
		// BLUEMOON ADD START
		new/datum/stack_recipe("bdsm bed", /obj/structure/bed/bdsm_bed, 4, one_per_turf = TRUE, on_floor = TRUE), \
		// BLUEMOON ADD END
		new/datum/stack_recipe("pod bed", /obj/structure/bed/pod, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("double pod bed", /obj/structure/bed/double/pod, 4, one_per_turf = TRUE, on_floor = TRUE), \
	)), \
		//SPLURT CHANGE END
	//BLUEMOON ADD гигансткие кровати для гигантских персон
	new/datum/stack_recipe_list("giant beds", list( \
		new/datum/stack_recipe("giant bed (corner)", /obj/structure/bed/giant, 4, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("giant bed (side)", /obj/structure/bed/giant/side, 4, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("giant bed (pillow corner)", /obj/structure/bed/giant/pillow, 4, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("giant bed (pillow side)", /obj/structure/bed/giant/pillow/side, 4, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("giant bed (middle)", /obj/structure/bed/giant/middle, 4, one_per_turf = TRUE, on_floor = TRUE), \
	)), \
	//BLUEMOON END
	//CIT CHANGE - adds sofas to metal recipe list
	new/datum/stack_recipe_list("sofas", list( \
		new /datum/stack_recipe("sofa (middle)", /obj/structure/chair/sofa, one_per_turf = TRUE, on_floor = TRUE), \
		new /datum/stack_recipe("sofa (left)", /obj/structure/chair/sofa/left, one_per_turf = TRUE, on_floor = TRUE), \
		new /datum/stack_recipe("sofa (right)", /obj/structure/chair/sofa/right, one_per_turf = TRUE, on_floor = TRUE), \
		new /datum/stack_recipe("sofa (corner)", /obj/structure/chair/sofa/corner, one_per_turf = TRUE, on_floor = TRUE), \
		)), \
	//END OF CIT CHANGES
	new/datum/stack_recipe_list("fancy sofas", list( \
		new /datum/stack_recipe("sofa (middle)", /obj/structure/chair/sofa/corp, one_per_turf = TRUE, on_floor = TRUE), \
		new /datum/stack_recipe("sofa (left)", /obj/structure/chair/sofa/corp/right, one_per_turf = TRUE, on_floor = TRUE), \
		new /datum/stack_recipe("sofa (right)", /obj/structure/chair/sofa/corp/left, one_per_turf = TRUE, on_floor = TRUE), \
		new /datum/stack_recipe("sofa (corner)", /obj/structure/chair/sofa/corp/corner, one_per_turf = TRUE, on_floor = TRUE), \
		)), \
	null, \
	new/datum/stack_recipe_list("office chairs", list( \
		new/datum/stack_recipe("dark office chair", /obj/structure/chair/office/dark, 5, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("light office chair", /obj/structure/chair/office/light, 5, one_per_turf = TRUE, on_floor = TRUE), \
		)), \
	new/datum/stack_recipe_list("comfy chairs", list( \
		new/datum/stack_recipe("beige comfy chair", /obj/structure/chair/comfy/beige, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("black comfy chair", /obj/structure/chair/comfy/black, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("brown comfy chair", /obj/structure/chair/comfy/brown, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("green comfy chair", /obj/structure/chair/comfy/green, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("lime comfy chair", /obj/structure/chair/comfy/lime, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("teal comfy chair", /obj/structure/chair/comfy/teal, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("purple comfy chair", /obj/structure/chair/comfy/purple, 2, one_per_turf = TRUE, on_floor = TRUE), \
		)), \
	null, \
	new/datum/stack_recipe("rack parts", /obj/item/rack_parts, 3), \
	// BLUEMOON ADD - Добавляет в меню крафта создание полки для ящиков
	new/datum/stack_recipe("crate shelf parts", /obj/item/rack_parts/shelf, 10), \
	// BLUEMOON ADD END (ну не хочет оно не такими кривыми комментами работать, увы)
	new/datum/stack_recipe("shelf parts", /obj/item/shelf_parts, 5), \
	new/datum/stack_recipe("closet", /obj/structure/closet, 2, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new/datum/stack_recipe("canister", /obj/machinery/portable_atmospherics/canister, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("trash bin", /obj/structure/closet/crate/bin, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE),\
	null, \
	new/datum/stack_recipe("floor tile", /obj/item/stack/tile/plasteel, 1, 4, 20), \
	new/datum/stack_recipe("metal rod", /obj/item/stack/rods, 1, 2, 60), \

	null, \
	new/datum/stack_recipe("wall girders", /obj/structure/girder, 2, time = 40, one_per_turf = TRUE, on_floor = TRUE, trait_booster = TRAIT_QUICK_BUILD, trait_modifier = 0.75), \
	null, \
	new/datum/stack_recipe("computer frame", /obj/structure/frame/computer, 5, time = 25, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("modular console", /obj/machinery/modular_computer/console/buildable, 10, time = 25, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("machine frame", /obj/structure/frame/machine, 5, time = 25, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new /datum/stack_recipe_list("airlock assemblies", list( \
		new /datum/stack_recipe("standard airlock assembly", /obj/structure/door_assembly, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("public airlock assembly", /obj/structure/door_assembly/door_assembly_public, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("command airlock assembly", /obj/structure/door_assembly/door_assembly_com, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("security airlock assembly", /obj/structure/door_assembly/door_assembly_sec, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("engineering airlock assembly", /obj/structure/door_assembly/door_assembly_eng, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("mining airlock assembly", /obj/structure/door_assembly/door_assembly_min, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("atmospherics airlock assembly", /obj/structure/door_assembly/door_assembly_atmo, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("research airlock assembly", /obj/structure/door_assembly/door_assembly_research, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("freezer airlock assembly", /obj/structure/door_assembly/door_assembly_fre, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("science airlock assembly", /obj/structure/door_assembly/door_assembly_science, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("medical airlock assembly", /obj/structure/door_assembly/door_assembly_med, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("virology airlock assembly", /obj/structure/door_assembly/door_assembly_viro, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("maintenance airlock assembly", /obj/structure/door_assembly/door_assembly_mai, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("external airlock assembly", /obj/structure/door_assembly/door_assembly_ext, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("external maintenance airlock assembly", /obj/structure/door_assembly/door_assembly_extmai, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("airtight hatch assembly", /obj/structure/door_assembly/door_assembly_hatch, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("maintenance hatch assembly", /obj/structure/door_assembly/door_assembly_mhatch, 4, time = 50, one_per_turf = 1, on_floor = 1), \
	)), \
	null, \
	new/datum/stack_recipe("firelock frame", /obj/structure/firelock_frame, 3, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("turret frame", /obj/machinery/porta_turret_construct, 5, time = 25, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("meatspike frame", /obj/structure/kitchenspike_frame, 5, time = 25, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("reflector frame", /obj/structure/reflector, 5, time = 25, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new/datum/stack_recipe("grenade casing", /obj/item/grenade/chem_grenade), \
	new/datum/stack_recipe("mortar", /obj/item/reagent_containers/glass/mortar, 3), \
	new/datum/stack_recipe("metal baseball bat", /obj/item/melee/baseball_bat/ablative, 25, time = 100), \
	new/datum/stack_recipe("ashtray", /obj/item/ashtray, 1), \
	new/datum/stack_recipe("light fixture frame", /obj/item/wallframe/light_fixture, 2), \
	new/datum/stack_recipe("small light fixture frame", /obj/item/wallframe/light_fixture/small, 1), \
	null, \
	new/datum/stack_recipe("apc frame", /obj/item/wallframe/apc, 2), \
	new/datum/stack_recipe("air alarm frame", /obj/item/wallframe/airalarm, 2), \
	new/datum/stack_recipe("fire alarm frame", /obj/item/wallframe/firealarm, 2), \
	new/datum/stack_recipe("extinguisher cabinet frame", /obj/item/wallframe/extinguisher_cabinet, 2), \
	new/datum/stack_recipe("button frame", /obj/item/wallframe/button, 1), \
	null, \
	new /datum/stack_recipe_list("chess pieces", list( \
		new /datum/stack_recipe("White Pawn", /obj/structure/chess/whitepawn, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("White Rook", /obj/structure/chess/whiterook, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("White Knight", /obj/structure/chess/whiteknight, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("White Bishop", /obj/structure/chess/whitebishop, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("White Queen", /obj/structure/chess/whitequeen, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("White King", /obj/structure/chess/whiteking, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("Black Pawn", /obj/structure/chess/blackpawn, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("Black Rook", /obj/structure/chess/blackrook, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("Black Knight", /obj/structure/chess/blackknight, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("Black Bishop", /obj/structure/chess/blackbishop, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("Black Queen", /obj/structure/chess/blackqueen, 2, time = 10, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("Black King", /obj/structure/chess/blackking, 2, time = 10, one_per_turf = 1, on_floor = 1), \
	)), \
	null, \
	new/datum/stack_recipe("iron door", /obj/structure/mineral_door/iron, 20, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("pestle", /obj/item/pestle, 1, time = 50), \
	new/datum/stack_recipe("floodlight frame", /obj/structure/floodlight_frame, 5, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("iron ingot", /obj/item/ingot/iron, 6, time = 100), \
	null, \
	new/datum/stack_recipe("tiny fan", /obj/structure/fans/tiny, 2, time = 4, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("Metal Barricade", /obj/structure/deployable_barricade/metal, 2, time = 1 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("desk bell", /obj/structure/desk_bell, 2, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/metal
	name = "metal"
	desc = "Sheets made out of metal."
	singular_name = "metal sheet"
	icon_state = "sheet-metal"
	item_state = "sheet-metal"
	custom_materials = list(/datum/material/iron=MINERAL_MATERIAL_AMOUNT)
	throwforce = 10
	flags_1 = CONDUCT_1
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/metal
	grind_results = list(/datum/reagent/iron = 20)
	point_value = 2
	tableVariant = /obj/structure/table
	material_type = /datum/material/iron

/obj/item/stack/sheet/metal/ratvar_act()
	new /obj/item/stack/tile/brass(loc, amount)
	qdel(src)

/obj/item/stack/sheet/metal/narsie_act()
	new /obj/item/stack/sheet/runed_metal(loc, amount)
	qdel(src)

/obj/item/stack/sheet/metal/fifty
	amount = 50

/obj/item/stack/sheet/metal/twenty
	amount = 20

/obj/item/stack/sheet/metal/ten
	amount = 10

/obj/item/stack/sheet/metal/five
	amount = 5

/obj/item/stack/sheet/metal/cyborg
	custom_materials = null
	is_cyborg = TRUE
	source = /datum/robot_energy_storage/metal
	cost = MINERAL_MATERIAL_AMOUNT * 0.25

/obj/item/stack/sheet/metal/get_main_recipes()
	. = ..()
	. += GLOB.metal_recipes

/obj/item/stack/sheet/metal/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins whacking себя over the head with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS

/*
 * Plasteel
 */
GLOBAL_LIST_INIT(plasteel_recipes, list ( \
	new/datum/stack_recipe("AI core", /obj/structure/ai_core, 4, time = 50, one_per_turf = TRUE), \
	new/datum/stack_recipe("bomb assembly", /obj/machinery/syndicatebomb/empty, 10, time = 50), \
	new/datum/stack_recipe("plasteel keg", /obj/structure/custom_keg, 10, time = 50), \
	new/datum/stack_recipe("pressure tank", /obj/machinery/atmospherics/components/unary/tank, 15, time = 60, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("micro powered fan assembly", /obj/machinery/fan_assembly, 5, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("plasteel barricade", /obj/structure/deployable_barricade/metal/plasteel, 2, time = 1 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe_list("crates", list( \
		new /datum/stack_recipe("gray crate", /obj/structure/closet/crate, 5, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("internals crate", /obj/structure/closet/crate/internals, 5, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("trash cart", /obj/structure/closet/crate/trashcart, 5, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("medical crate", /obj/structure/closet/crate/medical, 5, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("freezer crate", /obj/structure/closet/crate/freezer, 8, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("blood bag crate", /obj/structure/closet/crate/freezer/blood/fake, 8, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("surplus limbs crate", /obj/structure/closet/crate/freezer/surplus_limbs/fake, 8, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("radiation containment crate", /obj/structure/closet/crate/radiation, 8, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("hydroponics crate", /obj/structure/closet/crate/hydroponics, 5, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("engineering crate", /obj/structure/closet/crate/engineering, 5, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("eletrical crate", /obj/structure/closet/crate/engineering/electrical, 5, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("RCD storage crate", /obj/structure/closet/crate/rcd/fake, 5, time = 50, one_per_turf = 1, on_floor = 1), \
		new /datum/stack_recipe("science crate", /obj/structure/closet/crate/science, 5, time = 50, one_per_turf = 1, on_floor = 1), \
	)), \
	new /datum/stack_recipe_list("airlock assemblies", list( \
		new/datum/stack_recipe("high security airlock assembly", /obj/structure/door_assembly/door_assembly_highsecurity, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("vault door assembly", /obj/structure/door_assembly/door_assembly_vault, 6, time = 50, one_per_turf = 1, on_floor = 1), \
	)), \

))

/obj/item/stack/sheet/plasteel
	name = "plasteel"
	singular_name = "plasteel sheet"
	desc = "This sheet is an alloy of iron and plasma."
	icon_state = "sheet-plasteel"
	item_state = "sheet-metal"
	custom_materials = list(/datum/material/iron=MINERAL_MATERIAL_AMOUNT, /datum/material/plasma=MINERAL_MATERIAL_AMOUNT)
	throwforce = 10
	flags_1 = CONDUCT_1
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 80)
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/plasteel
	grind_results = list(/datum/reagent/iron = 20, /datum/reagent/toxin/plasma = 20)
	point_value = 23
	tableVariant = /obj/structure/table/reinforced

/obj/item/stack/sheet/plasteel/get_main_recipes()
	. = ..()
	. += GLOB.plasteel_recipes

/obj/item/stack/sheet/plasteel/twenty
	amount = 20

/obj/item/stack/sheet/plasteel/fifty
	amount = 50

/*
 * Wood
 */
GLOBAL_LIST_INIT(wood_recipes, list ( \
	new/datum/stack_recipe("Wooden Sandals", /obj/item/clothing/shoes/sandal, 1), \
	new/datum/stack_recipe("Sauna Oven", /obj/structure/sauna_oven, 50, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("Wooden Half-Barricade", /obj/structure/deployable_barricade/wooden, 5, time = 2 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("tiki mask", /obj/item/clothing/mask/gas/tiki_mask, 2), \
	new/datum/stack_recipe("wood table frame", /obj/structure/table_frame/wood, 2, time = 10), \
	null, \
	new/datum/stack_recipe("wooden floor tile", /obj/item/stack/tile/wood, 1, 4, 20), \
	new/datum/stack_recipe("large wooden floor tile", /obj/item/stack/tile/wood/wood_large, 1, 4, 20), \
	new/datum/stack_recipe("tiled wooden floor tile", /obj/item/stack/tile/wood/wood_tiled, 1, 4, 20), \
	new/datum/stack_recipe("diagonal wooden floor tile", /obj/item/stack/tile/wood/wood_diagonal, 1, 4, 20), \
	null, \
	new/datum/stack_recipe_list("pews", list(
		new /datum/stack_recipe("pew (middle)", /obj/structure/chair/pew, 3, one_per_turf = TRUE, on_floor = TRUE),\
		new /datum/stack_recipe("pew (left)", /obj/structure/chair/pew/left, 3, one_per_turf = TRUE, on_floor = TRUE),\
		new /datum/stack_recipe("pew (right)", /obj/structure/chair/pew/right, 3, one_per_turf = TRUE, on_floor = TRUE),\
		)),
	null, \
	new/datum/stack_recipe("rifle stock", /obj/item/weaponcrafting/stock, 10, time = 20), \
	new/datum/stack_recipe("rolling pin", /obj/item/kitchen/rollingpin, 2, time = 30), \
	new/datum/stack_recipe("unrolling pin", /obj/item/kitchen/unrollingpin, 2, time = 30), \
	new/datum/stack_recipe("wooden bucket", /obj/item/reagent_containers/glass/bucket/wood, 2, time = 30), \
	new/datum/stack_recipe("painting frame", /obj/item/wallframe/painting, 1, time = 10),\
	new/datum/stack_recipe("wooden buckler", /obj/item/shield/riot/buckler, 25, time = 120), \
	new/datum/stack_recipe("baseball bat", /obj/item/melee/baseball_bat, 25, time = 100),\
	new/datum/stack_recipe("Stick For Angry Plants", /obj/item/scythe/stick, 25, time = 100),\
	null, \
	new/datum/stack_recipe("wooden chair", /obj/structure/chair/wood, 3, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("winged wooden chair", /obj/structure/chair/wood/wings, 3, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("plywood chair", /obj/structure/chair/comfy/plywood, 4, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new/datum/stack_recipe("wooden barricade", /obj/structure/barricade/wooden, 5, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("wooden door", /obj/structure/mineral_door/wood, 10, time = 20, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("rustic wooden door", /obj/structure/mineral_door/woodrustic, 10, time = 20, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new/datum/stack_recipe("wooden barrel", /obj/structure/fermenting_barrel, 10, time = 20, one_per_turf = TRUE, on_floor = TRUE),\
	new/datum/stack_recipe("coffin", /obj/structure/closet/crate/coffin, 5, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("book case", /obj/structure/bookcase, 4, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("drying rack", /obj/machinery/smartfridge/drying_rack, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("dog bed", /obj/structure/bed/dogbed, 10, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("dresser", /obj/structure/dresser, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("ore box", /obj/structure/ore_box, 4, time = 50, one_per_turf = TRUE, on_floor = TRUE),\
	new/datum/stack_recipe("wooden crate", /obj/structure/closet/crate/wooden, 6, time = 50, one_per_turf = TRUE, on_floor = TRUE),\
	new/datum/stack_recipe("display case chassis", /obj/structure/displaycase_chassis, 5, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("loom", /obj/structure/loom, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("apiary", /obj/structure/beebox, 40, time = 50),\
	null, \
	new/datum/stack_recipe("picture frame", /obj/item/wallframe/picture, 1, time = 10),\
	new/datum/stack_recipe("painting frame", /obj/item/wallframe/painting, 1, time = 10),\
	new/datum/stack_recipe("urn", /obj/item/reagent_containers/glass/mortar/urn, 3), \
	new/datum/stack_recipe("honey frame", /obj/item/honey_frame, 5, time = 10),\
	new/datum/stack_recipe("notice board frame", /obj/item/wallframe/noticeboard, 5, time = 10),\
	new/datum/stack_recipe("wooden block", /obj/item/stamp_block, 10, time = 10)
	))

/obj/item/stack/sheet/mineral/wood
	name = "wooden plank"
	desc = "One can only guess that this is a bunch of wood. You might be able to make a stake with this if you use something sharp on it"
	singular_name = "wood plank"
	icon_state = "sheet-wood"
	item_state = "sheet-wood"
	icon = 'icons/obj/stack_objects.dmi'
	custom_materials = list(/datum/material/wood=MINERAL_MATERIAL_AMOUNT)
	sheettype = "wood"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 50, ACID = 0)
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/sheet/mineral/wood
	material_type = /datum/material/wood
	grind_results = list(/datum/reagent/cellulose = 20)
	walltype = /turf/closed/wall/mineral/wood

/obj/item/stack/sheet/mineral/wood/attackby(obj/item/W, mob/user, params) // NOTE: sheet_types.dm is where the WOOD stack lives. Maybe move this over there.
	// Taken from /obj/item/stack/rods/attackby in [rods.dm]
	if(W.get_sharpness())
		user.visible_message("[user] begins whittling [src] into a pointy object.", \
				 "<span class='notice'>You begin whittling [src] into a sharp point at one end.</span>", \
				 "<span class='italics'>You hear wood carving.</span>")
		// 8 Second Timer
		if(!do_after(user, 8 SECONDS,  src))
			return
		// Make Stake
		var/obj/item/stake/basic/new_item = new(user.loc)
		user.visible_message("[user] finishes carving a stake out of [src].", \
				 "<span class='notice'>You finish carving a stake out of [src].</span>")
		// Prepare to Put in Hands (if holding wood)
		var/obj/item/stack/sheet/mineral/wood/N = src
		var/replace = (user.get_inactive_held_item() == N)
		// Use Wood
		N.use(1)
		// If stack depleted, put item in that hand (if it had one)
		if (!N && replace)
			user.put_in_hands(new_item)
	if(istype(W, merge_type))
		var/obj/item/stack/S = W
		if(merge(S))
			to_chat(user, "<span class='notice'>Your [S.name] stack now contains [S.get_amount()] [S.singular_name]\s.</span>")
	else
		. = ..()

/obj/item/stack/sheet/mineral/wood/get_main_recipes()
	. = ..()
	. += GLOB.wood_recipes

/obj/item/stack/sheet/mineral/wood/twenty
	amount = 20

/obj/item/stack/sheet/mineral/wood/fifty
	amount = 50

/*
 * Bamboo
 */

GLOBAL_LIST_INIT(bamboo_recipes, list ( \
	new/datum/stack_recipe("punji sticks trap", /obj/structure/punji_sticks, 5, time = 30, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("blow gun", /obj/item/gun/syringe/blowgun, 10, time = 70), \
	))

/obj/item/stack/sheet/mineral/bamboo
	name = "bamboo cuttings"
	desc = "Finely cut bamboo sticks."
	singular_name = "cut bamboo"
	icon_state = "sheet-bamboo"
	item_state = "sheet-bamboo"
	icon = 'icons/obj/stack_objects.dmi'
	custom_materials = list(/datum/material/bamboo = MINERAL_MATERIAL_AMOUNT)
	throwforce = 15
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 50, ACID = 0)
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/sheet/mineral/bamboo
	grind_results = list(/datum/reagent/cellulose = 10)
	material_type = /datum/material/bamboo

/obj/item/stack/sheet/mineral/bamboo/get_main_recipes()
	. = ..()
	. += GLOB.bamboo_recipes

/obj/item/stack/sheet/mineral/bamboo/ten
	amount = 10

/obj/item/stack/sheet/mineral/bamboo/twenty
	amount = 20

/obj/item/stack/sheet/mineral/bamboo/fifty
	amount = 50

/*
 * Cloth
 */
GLOBAL_LIST_INIT(cloth_recipes, list ( \
	new/datum/stack_recipe("grey jumpsuit", /obj/item/clothing/under/color/grey, 3), \
	new/datum/stack_recipe("black shoes", /obj/item/clothing/shoes/sneakers/black, 2), \
	new/datum/stack_recipe("cloth footwraps", /obj/item/clothing/shoes/footwraps, 2), \
	new/datum/stack_recipe("loincloth", /obj/item/clothing/under/costume/loincloth/cloth/sensor, 2), \
	new/datum/stack_recipe("sensorless loincloth", /obj/item/clothing/under/costume/loincloth/cloth, 2), \
	new/datum/stack_recipe("tunic", /obj/item/clothing/under/tunic, 3), \
	//SPLURT CHANGE: ADD MATTRESSES
	new/datum/stack_recipe_list("matresses", list( \
		new/datum/stack_recipe("mattress (random)", /obj/structure/bed/matress, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("mattress (clean)", /obj/structure/bed/matress/clean, 2, one_per_turf = TRUE, on_floor = TRUE), \
		new/datum/stack_recipe("mattress (clean, pillowed)", /obj/structure/bed/matress/clean_pillowed, 2, one_per_turf = TRUE, on_floor = TRUE), \
	)), \
	//SPLURT CHANGE END
	null, \
	new/datum/stack_recipe("backpack", /obj/item/storage/backpack, 4), \
	new/datum/stack_recipe("duffel bag", /obj/item/storage/backpack/duffelbag, 6), \
	null, \
	new/datum/stack_recipe("plant bag", /obj/item/storage/bag/plants, 4), \
	new/datum/stack_recipe("book bag", /obj/item/storage/bag/books, 4), \
	new/datum/stack_recipe("mining satchel", /obj/item/storage/bag/ore, 4), \
	new/datum/stack_recipe("chemistry bag", /obj/item/storage/bag/chemistry, 4), \
	new/datum/stack_recipe("bio bag", /obj/item/storage/bag/bio, 4), \
	new/datum/stack_recipe("material bag", /obj/item/storage/bag/material, 4), \
	new/datum/stack_recipe("construction bag", /obj/item/storage/bag/construction, 4), \
	null, \
	new/datum/stack_recipe("string", /obj/item/weaponcrafting/string, 1, time = 10), \
	new/datum/stack_recipe("improvised gauze", /obj/item/stack/medical/gauze/improvised, 1, 2, 10), \
	new/datum/stack_recipe("rag", /obj/item/reagent_containers/rag, 1), \
	new/datum/stack_recipe("towel", /obj/item/reagent_containers/rag/towel, 3), \
	new/datum/stack_recipe("bedsheet", /obj/item/bedsheet, 3), \
	new/datum/stack_recipe("double bedsheet", /obj/item/bedsheet/double, 6), \
	new/datum/stack_recipe("empty sandbag", /obj/item/emptysandbag, 4), \
	new/datum/stack_recipe("padded floor tile", /obj/item/stack/tile/padded, 1, 4, 20), \
	null, \
	new/datum/stack_recipe("fingerless gloves", /obj/item/clothing/gloves/fingerless, 1),\
	new/datum/stack_recipe("white gloves", /obj/item/clothing/gloves/color/white, 1),\
	new/datum/stack_recipe("black gloves", /obj/item/clothing/gloves/color/black, 3), \
	null, \
	new/datum/stack_recipe("blindfold", /obj/item/clothing/glasses/sunglasses/blindfold, 2), \
	null, \
	new/datum/stack_recipe("19x19 canvas", /obj/item/canvas/nineteenXnineteen, 3), \
	new/datum/stack_recipe("23x19 canvas", /obj/item/canvas/twentythreeXnineteen, 4), \
	new/datum/stack_recipe("23x23 canvas", /obj/item/canvas/twentythreeXtwentythree, 5) \
	))

/obj/item/stack/sheet/cloth
	name = "cloth"
	desc = "Is it cotton? Linen? Denim? Burlap? Canvas? You can't tell."
	singular_name = "cloth roll"
	icon_state = "sheet-cloth"
	item_state = "sheet-cloth"
	resistance_flags = FLAMMABLE
	force = 0
	throwforce = 0
	merge_type = /obj/item/stack/sheet/cloth
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'
	grind_results = list(/datum/reagent/cellulose = 2)

/obj/item/stack/sheet/cloth/get_main_recipes()
	. = ..()
	. += GLOB.cloth_recipes

/obj/item/stack/sheet/cloth/ten
	amount = 10

/obj/item/stack/sheet/cloth/thirty
	amount = 30

/*
 * Durathread
 */
GLOBAL_LIST_INIT(durathread_recipes, list ( \
	new/datum/stack_recipe("durathread jumpsuit", /obj/item/clothing/under/misc/durathread, 4, time = 40),
	new/datum/stack_recipe("durathread beret", /obj/item/clothing/head/beret/durathread, 2, time = 40), \
	new/datum/stack_recipe("durathread beanie", /obj/item/clothing/head/beanie/durathread, 2, time = 40), \
	new/datum/stack_recipe("durathread bandana", /obj/item/clothing/mask/bandana/durathread, 1, time = 25), \
	))

/obj/item/stack/sheet/durathread
	name = "durathread"
	desc = "A fabric sown from incredibly durable threads, known for its usefulness in armor production."
	singular_name = "durathread roll"
	icon_state = "sheet-durathread"
	item_state = "sheet-cloth"
	resistance_flags = FLAMMABLE
	force = 0
	throwforce = 0
	merge_type = /obj/item/stack/sheet/durathread
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'

/obj/item/stack/sheet/durathread/get_main_recipes()
	. = ..()
	. += GLOB.durathread_recipes

/* Wax */

GLOBAL_LIST_INIT(wax_recipes, list (new/datum/stack_recipe("Wax tile", /obj/item/stack/tile/mineral/wax, 1, 4, 20)))

/obj/item/stack/sheet/wax
	name = "wax"
	icon_state = "sheet-wax"
	item_state = "sheet-wax"
	singular_name = "wax block"
	force = 1
	throwforce = 2
	grind_results = list(/datum/reagent/consumable/honey = 20)
	merge_type = /obj/item/stack/sheet/wax

/obj/item/stack/sheet/wax/get_main_recipes()
	. = ..()
	. += GLOB.wax_recipes

/*
 * Cardboard
 */
GLOBAL_LIST_INIT(cardboard_recipes, list ( \
	new/datum/stack_recipe("box", /obj/item/storage/box),										\
	new/datum/stack_recipe("cardborg suit", /obj/item/clothing/suit/cardborg, 3),				\
	new/datum/stack_recipe("cardborg helmet", /obj/item/clothing/head/cardborg),				\
	new/datum/stack_recipe("large box", /obj/structure/closet/cardboard, 4),					\
	new/datum/stack_recipe("cardboard cutout", /obj/item/cardboard_cutout, 5),					\
	new/datum/stack_recipe("pizza box", /obj/item/pizzabox),									\
	new/datum/stack_recipe("folder", /obj/item/folder),											\
	new/datum/stack_recipe("cardboard card", /obj/item/cardboard_card, 1),						\
	// holy fuck why are there so many boxes
	new/datum/stack_recipe_list("fancy boxes", list ( \
		new /datum/stack_recipe("donut box", /obj/item/storage/fancy/donut_box), 				\
		new /datum/stack_recipe("egg box", /obj/item/storage/fancy/egg_box), 					\
		new /datum/stack_recipe("donk-pockets box", /obj/item/storage/box/donkpockets), 		\
		new /datum/stack_recipe("monkey cube box", /obj/item/storage/box/monkeycubes), 			\
		new /datum/stack_recipe("nugget box", /obj/item/storage/fancy/nugget_box),				\
		new /datum/stack_recipe("box (internals)", /obj/item/storage/box/otwo), 				\
		null, 																					\
		new /datum/stack_recipe("security-styled box", /obj/item/storage/box/seclooking), 		\
		new /datum/stack_recipe("buckshot shell box", /obj/item/storage/box/lethalshot),		\
		new /datum/stack_recipe("rubber shot shell box", /obj/item/storage/box/rubbershot),		\
		new /datum/stack_recipe("beanbag shell box", /obj/item/storage/box/beanbag),			\
		new /datum/stack_recipe("slug shell box", /obj/item/storage/box/lethalslugs), 			\
		new /datum/stack_recipe("stunslug shell box", /obj/item/storage/box/stunslug), 			\
		new /datum/stack_recipe("tech shell box", /obj/item/storage/box/techsslug), 			\
		new /datum/stack_recipe("incendiary ammo box", /obj/item/storage/box/fireshot), 		\
		new /datum/stack_recipe("loose ammo box", /obj/item/storage/box/ammoshells), 			\
		new /datum/stack_recipe("firing pins box", /obj/item/storage/box/firingpins), 			\
		null,																					\
		new /datum/stack_recipe("flashbang box", /obj/item/storage/box/flashbangs),				\
		new /datum/stack_recipe("flashes box", /obj/item/storage/box/flashes),					\
		new /datum/stack_recipe("handcuffs box", /obj/item/storage/box/handcuffs),				\
		new /datum/stack_recipe("ID card box", /obj/item/storage/box/ids),						\
		new /datum/stack_recipe("PDA box", /obj/item/storage/box/PDAs),							\
		null,																					\
		new /datum/stack_recipe("pill bottle box", /obj/item/storage/box/pillbottles),			\
		new /datum/stack_recipe("beaker box", /obj/item/storage/box/beakers),					\
		new /datum/stack_recipe("syringe box", /obj/item/storage/box/syringes),					\
		new /datum/stack_recipe("latex gloves box", /obj/item/storage/box/gloves),				\
		new /datum/stack_recipe("sterile masks box", /obj/item/storage/box/masks),				\
		new /datum/stack_recipe("body bag box", /obj/item/storage/box/bodybags),				\
		new /datum/stack_recipe("prescription glasses box", /obj/item/storage/box/rxglasses),	\
		new /datum/stack_recipe("oxygen tank box", /obj/item/storage/box/emergencytank),	\
		new /datum/stack_recipe("extended oxygen tank box", /obj/item/storage/box/engitank),	\
		null,																					\
		new /datum/stack_recipe("disk box", /obj/item/storage/box/disks),						\
		new /datum/stack_recipe("light tubes box", /obj/item/storage/box/lights/tubes),			\
		new /datum/stack_recipe("light bulbs box", /obj/item/storage/box/lights/bulbs),			\
		new /datum/stack_recipe("mixed lights box", /obj/item/storage/box/lights/mixed),		\
		new /datum/stack_recipe("power cell box", /obj/item/storage/box/cells), 				\
		new /datum/stack_recipe("mouse traps box", /obj/item/storage/box/mousetraps),			\
		new /datum/stack_recipe("candle box", /obj/item/storage/fancy/candle_box),				\
		null,																					\
		new /datum/stack_recipe("box (brown)", /obj/item/storage/box/brown), 					\
		new /datum/stack_recipe("box (green)", /obj/item/storage/box/green), 					\
		new /datum/stack_recipe("box (blue)", /obj/item/storage/box/blue), 						\
		new /datum/stack_recipe("box (red)", /obj/item/storage/box/red), 						\
		new /datum/stack_recipe("box (yellow)", /obj/item/storage/box/yellow), 					\
		new /datum/stack_recipe("box (pink)", /obj/item/storage/box/pink), 						\
		new /datum/stack_recipe("box (purple)", /obj/item/storage/box/purple), 					\
		)),
	null,																						\
))

/obj/item/stack/sheet/cardboard	//BubbleWrap //it's cardboard you fuck
	name = "cardboard"
	desc = "Large sheets of card, like boxes folded flat."
	singular_name = "cardboard sheet"
	icon_state = "sheet-card"
	custom_materials = list(/datum/material/cardboard = MINERAL_MATERIAL_AMOUNT)
	item_state = "sheet-card"
	resistance_flags = FLAMMABLE
	force = 0
	throwforce = 0
	merge_type = /obj/item/stack/sheet/cardboard
	novariants = FALSE
	material_type = /datum/material/cardboard

/obj/item/stack/sheet/cardboard/get_main_recipes()
	. = ..()
	. += GLOB.cardboard_recipes

/obj/item/stack/sheet/cardboard/fifty
	amount = 50

/obj/item/stack/sheet/cardboard/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stamp/clown) && !istype(loc, /obj/item/storage))
		var/atom/droploc = drop_location()
		if(use(1))
			playsound(I, 'sound/items/bikehorn.ogg', 50, 1, -1)
			to_chat(user, "<span class='notice'>You stamp the cardboard! It's a clown box! Honk!</span>")
			if (amount >= 0)
				new/obj/item/storage/box/clown(droploc) //bugfix
	else
		. = ..()

/*
 * Runed Metal
 */

GLOBAL_LIST_INIT(runed_metal_recipes, list ( \
	new/datum/stack_recipe("Station Curse Sphere", /obj/item/station_curse, 50, time = 500, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("runed door", /obj/machinery/door/airlock/cult, 1, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("runed girder", /obj/structure/girder/cult, 1, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("pylon", /obj/structure/destructible/cult/pylon, 4, time = 40, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("forge", /obj/structure/destructible/cult/forge, 3, time = 40, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("archives", /obj/structure/destructible/cult/tome, 3, time = 40, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("altar", /obj/structure/destructible/cult/talisman, 3, time = 40, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("Наковальня", /obj/structure/anvil/obtainable/narsie, 4, time = 40, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("runic ingot", /obj/item/ingot/cult, 2, time = 100), \
	new/datum/stack_recipe("rune smith's hammer", /obj/item/melee/smith/hammer/narsie, 6), \
	))

/obj/item/stack/sheet/runed_metal
	name = "runed metal"
	desc = "Sheets of cold metal with shifting inscriptions writ upon them."
	singular_name = "runed metal sheet"
	icon_state = "sheet-runed"
	item_state = "sheet-runed"
	icon = 'icons/obj/stack_objects.dmi'
	custom_materials = list(/datum/material/runedmetal = MINERAL_MATERIAL_AMOUNT)
	sheettype = "runed"
	merge_type = /obj/item/stack/sheet/runed_metal
	novariants = FALSE
	grind_results = list(/datum/reagent/iron = 5, /datum/reagent/blood = 15)
	material_type = /datum/material/runedmetal

/obj/item/stack/sheet/runed_metal/ratvar_act()
	new /obj/item/stack/tile/brass(loc, amount)
	qdel(src)

/obj/item/stack/sheet/runed_metal/attack_self(mob/living/user)
	if(!iscultist(user))
		to_chat(user, "<span class='warning'>Only one with forbidden knowledge could hope to work this metal...</span>")
		return
	var/turf/T = get_turf(user) //we may have moved. adjust as needed...
	var/area/A = get_area(user)
	if(A?.area_flags & CULTMAGIC_BYPASS) //Bypass code so areas that aren't on-station can still use cult magics.
		return ..()
	if((!is_station_level(T.z) && !is_mining_level(T.z)) || !(A?.area_flags & CULT_PERMITTED))
		to_chat(user, "<span class='warning'>The veil is not weak enough here.</span>")
		return FALSE
	return ..()

/obj/item/stack/sheet/runed_metal/get_main_recipes()
	. = ..()
	. += GLOB.runed_metal_recipes

/obj/item/stack/sheet/runed_metal/fifty
	amount = 50

/obj/item/stack/sheet/runed_metal/ten
	amount = 10

/obj/item/stack/sheet/runed_metal/five
	amount = 5

/*
 * Brass
 */
GLOBAL_LIST_INIT(brass_recipes, list ( \
	new/datum/stack_recipe("wall gear", /obj/structure/destructible/clockwork/wall_gear, 3, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new/datum/stack_recipe("brass pinion airlock", /obj/machinery/door/airlock/clockwork, 5, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("brass pinion airlock - windowed", /obj/machinery/door/airlock/clockwork/brass, 5, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("brass windoor", /obj/machinery/door/window/clockwork, 2, time = 30, on_floor = TRUE, window_checks = TRUE), \
	null, \
	new/datum/stack_recipe("brass reflector", /obj/structure/destructible/clockwork/reflector, 10, time = 100, one_per_turf = TRUE, on_floor = TRUE, window_checks = TRUE), \
	null, \
	new/datum/stack_recipe("brass window - directional", /obj/structure/window/reinforced/clockwork/unanchored, time = 0, on_floor = TRUE, window_checks = TRUE), \
	new/datum/stack_recipe("brass window - fulltile", /obj/structure/window/reinforced/clockwork/fulltile/unanchored, 2, time = 0, on_floor = TRUE, window_checks = TRUE), \
	new/datum/stack_recipe("brass chair", /obj/structure/chair/brass, 1, time = 0, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("brass bar stool",  /obj/structure/chair/stool/bar/brass, 1, time = 0, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("brass stool", /obj/structure/chair/stool/brass, 1, time = 0, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("brass table frame", /obj/structure/table_frame/brass, 1, time = 5, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("brass anvil", /obj/structure/anvil/obtainable/ratvar, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("brass furnace", /obj/structure/furnace/infinite/ratvar, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new/datum/stack_recipe("sender - pressure sensor", /obj/structure/destructible/clockwork/trap/trigger/pressure_sensor, 2, time = 20, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("sender - mech sensor", /obj/structure/destructible/clockwork/trap/trigger/pressure_sensor/mech, 2, time = 20, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("sender - lever", /obj/structure/destructible/clockwork/trap/trigger/lever, 1, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("sender - repeater", /obj/structure/destructible/clockwork/trap/trigger/repeater, 2, time = 20, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new/datum/stack_recipe("receiver - brass skewer", /obj/structure/destructible/clockwork/trap/brass_skewer, 2, time = 20, one_per_turf = TRUE, on_floor = TRUE, placement_checks = STACK_CHECK_ADJACENT), \
	new/datum/stack_recipe("receiver - steam vent", /obj/structure/destructible/clockwork/trap/steam_vent, 3, time = 30, one_per_turf = TRUE, on_floor = TRUE, placement_checks = STACK_CHECK_CARDINALS), \
	new/datum/stack_recipe("receiver - power nullifier", /obj/structure/destructible/clockwork/trap/power_nullifier, 5, time = 20, one_per_turf = TRUE, on_floor = TRUE, placement_checks = STACK_CHECK_CARDINALS), \
	null, \
	new/datum/stack_recipe("brass flask", /obj/item/reagent_containers/food/drinks/bottle/holyoil/empty), \
	new/datum/stack_recipe("brass smith's hammer", /obj/item/melee/smith/hammer/ratvar, 6), \
	new/datum/stack_recipe("brass ingot", /obj/item/ingot/ratvar, 6, time = 100), \
))

/obj/item/stack/tile/brass
	name = "brass"
	desc = "Sheets made out of brass."
	singular_name = "brass sheet"
	icon_state = "sheet-brass"
	item_state = "sheet-brass"
	icon = 'icons/obj/stack_objects.dmi'
	resistance_flags = FIRE_PROOF | ACID_PROOF
	throwforce = 10
	max_amount = 50
	throw_speed = 1
	throw_range = 3
	turf_type = /turf/open/floor/clockwork
	novariants = FALSE
	grind_results = list(/datum/reagent/iron = 5, /datum/reagent/teslium = 15, /datum/reagent/fuel/holyoil = 1)
	merge_type = /obj/item/stack/tile/brass
	tableVariant = /obj/structure/table/reinforced/brass

/obj/item/stack/tile/brass/narsie_act()
	new /obj/item/stack/sheet/runed_metal(loc, amount)
	qdel(src)

/obj/item/stack/tile/brass/attack_self(mob/living/user)
	if(!is_servant_of_ratvar(user))
		to_chat(user, "<span class='danger'>[src] seems far too fragile and rigid to build with.</span>") //haha that's because it's actually replicant alloy you DUMMY
		return
	..()

/obj/item/stack/tile/brass/get_main_recipes()
	. = ..()
	. += GLOB.brass_recipes

/obj/item/stack/tile/brass/fifty
	amount = 50

/*
 * Bronze
 */

GLOBAL_LIST_INIT(bronze_recipes, list ( \
	new/datum/stack_recipe("wall gear", /obj/structure/girder/bronze, 2, time = 20, one_per_turf = TRUE, on_floor = TRUE), \
	null,
	new/datum/stack_recipe("directional bronze window", /obj/structure/window/bronze/unanchored, time = 0, on_floor = TRUE, window_checks = TRUE), \
	new/datum/stack_recipe("fulltile bronze window", /obj/structure/window/bronze/fulltile/unanchored, 2, time = 0, on_floor = TRUE, window_checks = TRUE), \
	new/datum/stack_recipe("pinion airlock assembly", /obj/structure/door_assembly/door_assembly_bronze, 4, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("bronze pinion airlock assembly", /obj/structure/door_assembly/door_assembly_bronze/seethru, 4, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("bronze hat", /obj/item/clothing/head/bronze), \
	new/datum/stack_recipe("bronze suit", /obj/item/clothing/suit/bronze), \
	new/datum/stack_recipe("bronze boots", /obj/item/clothing/shoes/bronze), \
	new/datum/stack_recipe("bronze uniform", /obj/item/clothing/under/misc/cog), \
	new/datum/stack_recipe("bronze jumpskirt", /obj/item/clothing/under/misc/cog/jumpskirt), \
	new/datum/stack_recipe("cog plant", /obj/item/kirbyplants/brass, 15, time = 50, on_floor = TRUE), \
	null,
	new/datum/stack_recipe("bronze chair", /obj/structure/chair/bronze, 1, time = 0, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("bronze bar stool",  /obj/structure/chair/stool/bar/bronze, 1, time = 0, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("bronze stool", /obj/structure/chair/stool/bronze, 1, time = 0, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("bronze anvil",/obj/structure/anvil/obtainable/bronze, 20, time = 110, one_per_turf = TRUE, on_floor = TRUE), \
	null,
	new/datum/stack_recipe("bronze ingot", /obj/item/ingot/bronze, 6, time = 100), \
	new/datum/stack_recipe("ashtray", /obj/item/ashtray/bronze, 1), \
	new/datum/stack_recipe("bronze floor tiles", /obj/item/stack/tile/bronze, 1, 4, 20), \
))

/obj/item/stack/sheet/bronze
	name = "brass"
	desc = "On closer inspection, what appears to be wholly-unsuitable-for-building brass is actually more structurally stable bronze."
	singular_name = "bronze sheet"
	icon_state = "sheet-brass"
	item_state = "sheet-brass"
	icon = 'icons/obj/stack_objects.dmi'
	custom_materials = list(/datum/material/bronze = MINERAL_MATERIAL_AMOUNT)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	grind_results = list(/datum/reagent/iron = 5, /datum/reagent/copper = 3) //we have no "tin" reagent so this is the closest thing
	merge_type = /obj/item/stack/sheet/bronze
	tableVariant = /obj/structure/table/bronze
	material_type = /datum/material/bronze

/obj/item/stack/sheet/bronze/attack_self(mob/living/user)
	if(is_servant_of_ratvar(user)) //still lets them build with it, just gives a message
		to_chat(user, "<span class='danger'>Wha... what is this cheap imitation crap? This isn't brass at all!</span>")
	..()

/obj/item/stack/sheet/bronze/get_main_recipes()
	. = ..()
	. += GLOB.bronze_recipes

/obj/item/stack/sheet/bronze/thirty
	amount = 30

/*
 * Lesser and Greater gems - unused
 */
/obj/item/stack/sheet/lessergem
	name = "lesser gems"
	desc = "Rare kind of gems which are only gained by blood sacrifice to minor deities. They are needed in crafting powerful objects."
	singular_name = "lesser gem"
	icon_state = "sheet-lessergem"
	item_state = "sheet-lessergem"
	novariants = TRUE


/obj/item/stack/sheet/greatergem
	name = "greater gems"
	desc = "Rare kind of gems which are only gained by blood sacrifice to minor deities. They are needed in crafting powerful objects."
	singular_name = "greater gem"
	icon_state = "sheet-greatergem"
	item_state = "sheet-greatergem"
	novariants = TRUE

	/*
 * Bones
 */

GLOBAL_LIST_INIT(bone_recipes, list(
	new /datum/stack_recipe("Bone Dagger", /obj/item/kitchen/knife/combat/bone, 2, time = 20), \
	new /datum/stack_recipe("Skull Helmet", /obj/item/clothing/head/helmet/skull, 4, time = 30), \
	new /datum/stack_recipe("Bone Armor", /obj/item/clothing/suit/armor/bone, 6, time = 30),\
	new /datum/stack_recipe("Processable Bone", /obj/item/ingot/bone, 2, time = 20),\
	new /datum/stack_recipe("Bone Statue", /obj/structure/statue/boney, time = 40)\
))

/obj/item/stack/sheet/bone
	name = "bones"
	icon = 'icons/obj/mining.dmi'
	icon_state = "bone"
	item_state = "sheet-bone"
	custom_materials = list(/datum/material/bone = MINERAL_MATERIAL_AMOUNT)
	singular_name = "bone"
	desc = "Someone's been drinking their milk."
	force = 7
	throwforce = 5
	max_amount = 12
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 1
	throw_range = 3
	grind_results = list(/datum/reagent/carbon = 10)
	merge_type = /obj/item/stack/sheet/bone
	material_type = /datum/material/bone

/obj/item/stack/sheet/bone/get_main_recipes()
	. = ..()
	. += GLOB.bone_recipes

	/*
 * Plastic
 */

GLOBAL_LIST_INIT(plastic_recipes, list(
	new /datum/stack_recipe("see-through plastic flaps", /obj/structure/plasticflaps, 5, one_per_turf = TRUE, on_floor = TRUE, time = 40), \
	new /datum/stack_recipe("opaque plastic flaps", /obj/structure/plasticflaps/opaque, 5, one_per_turf = TRUE, on_floor = TRUE, time = 40), \
	new /datum/stack_recipe("water bottle", /obj/item/reagent_containers/glass/beaker/waterbottle/empty), \
	new /datum/stack_recipe("large water bottle", /obj/item/reagent_containers/glass/beaker/waterbottle/large/empty,3), \
	new /datum/stack_recipe("shower curtain", /obj/structure/curtain, 10, time = 10, one_per_turf = 1, on_floor = 1), \
	new /datum/stack_recipe("duct", /obj/item/stack/ducts, 1, 5, 50), \
	new /datum/stack_recipe("laser pointer case", /obj/item/glasswork/glass_base/laserpointer_shell, 3, 1, 1, 30 SECONDS), \
	new /datum/stack_recipe("wet floor sign", /obj/item/clothing/suit/caution, 2), \
	new/datum/stack_recipe("ashtray", /obj/item/ashtray/plastic, 1), \
	new /datum/stack_recipe("micro bricks", /obj/item/stack/sheet/micro_bricks, 1, 5, 15,)))

/obj/item/stack/sheet/plastic
	name = "plastic"
	desc = "Compress dinosaur over millions of years, then refine, split and mold, and voila! You have plastic."
	singular_name = "plastic sheet"
	icon_state = "sheet-plastic"
	item_state = "sheet-plastic"
	custom_materials = list(/datum/material/plastic=MINERAL_MATERIAL_AMOUNT)
	throwforce = 7
	grind_results = list(/datum/reagent/glitter/white = 60)
	material_type = /datum/material/plastic
	merge_type = /obj/item/stack/sheet/plastic

/obj/item/stack/sheet/plastic/fifty
	amount = 50

/obj/item/stack/sheet/plastic/twenty
	amount = 20

/obj/item/stack/sheet/plastic/five
	amount = 5

/obj/item/stack/sheet/plastic/get_main_recipes()
	. = ..()
	. += GLOB.plastic_recipes

GLOBAL_LIST_INIT(paperframe_recipes, list(
new /datum/stack_recipe("paper frame separator", /obj/structure/window/paperframe, 2, one_per_turf = TRUE, on_floor = TRUE, time = 10), \
new /datum/stack_recipe("paper frame door", /obj/structure/mineral_door/paperframe, 3, one_per_turf = TRUE, on_floor = TRUE, time = 10 )))

/obj/item/stack/sheet/paperframes
	name = "paper frames"
	desc = "A thin wooden frame with paper attached."
	singular_name = "paper frame"
	icon_state = "sheet-paper"
	item_state = "sheet-paper"
	custom_materials = list(/datum/material/paper = MINERAL_MATERIAL_AMOUNT)
	merge_type = /obj/item/stack/sheet/paperframes
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/sheet/paperframes
	material_type = /datum/material/paper

/obj/item/stack/sheet/paperframes/get_main_recipes()
	. = ..()
	. += GLOB.paperframe_recipes

/obj/item/stack/sheet/paperframes/five
	amount = 5
/obj/item/stack/sheet/paperframes/twenty
	amount = 20
/obj/item/stack/sheet/paperframes/fifty
	amount = 50

//durathread and cotton raw
/obj/item/stack/sheet/cotton
	name = "raw cotton bundle"
	desc = "A bundle of raw cotton ready to be spun on the loom."
	max_amount = 80
	singular_name = "raw cotton ball"
	icon_state = "sheet-cotton"
	resistance_flags = FLAMMABLE
	force = 0
	throwforce = 0
	merge_type = /obj/item/stack/sheet/cotton
	var/pull_effort = 30
	var/loom_result = /obj/item/stack/sheet/cloth
	grind_results = list(/datum/reagent/cellulose = 5)

/obj/item/stack/sheet/cotton/ten
	amount = 10

/obj/item/stack/sheet/cotton/thirty
	amount = 30

/obj/item/stack/sheet/cotton/durathread
	name = "raw durathread bundle"
	desc = "A bundle of raw durathread ready to be spun on the loom."
	singular_name = "raw durathread ball"
	icon_state = "sheet-durathreadraw"
	merge_type = /obj/item/stack/sheet/cotton/durathread
	pull_effort = 70
	loom_result = /obj/item/stack/sheet/durathread
	grind_results = list(/datum/reagent/cellulose = 10)

/obj/item/stack/sheet/meat
	name = "meat sheets"
	desc = "Something's bloody meat compressed into a nice solid sheet"
	singular_name = "meat sheet"
	icon_state = "sheet-meat"
	material_flags = MATERIAL_COLOR
	custom_materials = list(/datum/material/meat = MINERAL_MATERIAL_AMOUNT)
	merge_type = /obj/item/stack/sheet/meat
	material_type = /datum/material/meat
	material_modifier = 1 //None of that wussy stuff

/obj/item/stack/sheet/meat/fifty
	amount = 50
/obj/item/stack/sheet/meat/twenty
	amount = 20
/obj/item/stack/sheet/meat/five
	amount = 5

/obj/item/stack/sheet/pizza
	name = "pepperoni sheetzzas"
	desc = "It's a delicious pepperoni sheetzza!"
	singular_name = "pepperoni sheetzza"
	icon_state = "sheet-pizza"
	custom_materials = list(/datum/material/pizza = MINERAL_MATERIAL_AMOUNT)
	merge_type = /obj/item/stack/sheet/pizza
	material_type = /datum/material/pizza
	material_modifier = 1

/obj/item/stack/sheet/pizza/fifty
	amount = 50
/obj/item/stack/sheet/pizza/twenty
	amount = 20
/obj/item/stack/sheet/pizza/five
	amount = 5

/obj/item/stack/sheet/sandblock
	name = "blocks of sand"
	desc = "You're too old to be playing with sandcastles. Now you build... sandstations."
	singular_name = "block of sand"
	icon_state = "sheet-sandstone"
	custom_materials = list(/datum/material/sand = MINERAL_MATERIAL_AMOUNT)
	merge_type = /obj/item/stack/sheet/sandblock
	material_type = /datum/material/sand
	material_modifier = 1

/obj/item/stack/sheet/sandblock/fifty
	amount = 50
/obj/item/stack/sheet/sandblock/twenty
	amount = 20
/obj/item/stack/sheet/sandblock/five
	amount = 5

// Titanium

GLOBAL_LIST_INIT(bluemoon_titanium_recipes, list(
	new/datum/stack_recipe("spaceship plating", /obj/item/stack/sheet/spaceship, 1, time = 5),
))

/obj/item/stack/sheet/mineral/titanium/get_main_recipes()
	. = ..()
	. += GLOB.bluemoon_titanium_recipes

//Made ashtrays craftable. - Gardelin0
