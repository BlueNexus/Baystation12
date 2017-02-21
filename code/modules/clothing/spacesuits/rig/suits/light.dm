// Light rigs are not space-capable, but don't suffer excessive slowdown or sight issues when depowered.
/obj/item/weapon/rig/light
	name = "light suit control module"
	desc = "A lighter, less armoured rig suit."
	icon_state = "ninja_rig"
	suit_type = "light suit"
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/weapon/cell)
	armor = list(melee = 50, bullet = 15, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)
	siemens_coefficient = 0.4
	emp_protection = 10
	online_slowdown = 0
	item_flags = STOPPRESSUREDAMAGE | THICKMATERIAL
	offline_slowdown = TINT_NONE
	offline_vision_restriction = TINT_NONE

	chest_type = /obj/item/clothing/suit/space/rig/light
	helm_type =  /obj/item/clothing/head/helmet/space/rig/light
	boot_type =  /obj/item/clothing/shoes/magboots/rig/light
	glove_type = /obj/item/clothing/gloves/rig/light

/obj/item/clothing/suit/space/rig/light
	name = "suit"
	breach_threshold = 18 //comparable to voidsuits

/obj/item/clothing/gloves/rig/light
	name = "gloves"

/obj/item/clothing/shoes/magboots/rig/light
	name = "shoes"
	
	sprite_sheets = list(
		"Resomi" = 'icons/mob/species/resomi/shoes.dmi'
	)

/obj/item/clothing/head/helmet/space/rig/light
	name = "hood"
	
	sprite_sheets = list(
		"Resomi" = 'icons/mob/species/resomi/helmet.dmi'
	)

/obj/item/weapon/rig/light/hacker
	name = "cybersuit control module"
	suit_type = "cyber"
	desc = "An advanced powered armour suit with many cyberwarfare enhancements. Comes with built-in insulated gloves for safely tampering with electronics."
	icon_state = "hacker_rig"

	req_access = list(access_syndicate)

	airtight = 0
	seal_delay = 5 //not being vaccum-proof has an upside I guess

	helm_type = /obj/item/clothing/head/lightrig/hacker
	chest_type = /obj/item/clothing/suit/lightrig/hacker
	glove_type = /obj/item/clothing/gloves/lightrig/hacker
	boot_type = /obj/item/clothing/shoes/lightrig/hacker

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/datajack,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/voice,
		/obj/item/rig_module/vision,
		)

//The cybersuit is not space-proof. It does however, have good siemens_coefficient values
/obj/item/clothing/head/lightrig/hacker
	name = "HUD"
	flags = 0

/obj/item/clothing/suit/lightrig/hacker
	siemens_coefficient = 0.2

/obj/item/clothing/shoes/lightrig/hacker
	siemens_coefficient = 0.2
	flags = NOSLIP //All the other rigs have magboots anyways, hopefully gives the hacker suit something more going for it.

/obj/item/clothing/gloves/lightrig/hacker
	siemens_coefficient = 0

/obj/item/weapon/rig/light/ninja
	var/has_custom_name = 0
	var/has_custom_desc = 0
	var/unique_name 
	var/unique_desc		
	
	suit_type = "ominous"
	icon_state = "ninja_rig"
	armor = list(melee = 50, bullet = 15, laser = 30, energy = 10, bomb = 25, bio = 100, rad = 30)
	siemens_coefficient = 0.2 //heavy hardsuit level shock protection
	emp_protection = 40 //change this to 30 if too high.
	online_slowdown = 0
	aimove_power_usage = 50

	chest_type = /obj/item/clothing/suit/space/rig/light/ninja
	glove_type = /obj/item/clothing/gloves/rig/light/ninja
	cell_type =  /obj/item/weapon/cell/hyper

	req_access = list(access_syndicate)

	initial_modules = list(
		/obj/item/rig_module/teleporter,
		/obj/item/rig_module/stealth_field,
		/obj/item/rig_module/mounted/energy_blade,
		/obj/item/rig_module/vision,
		/obj/item/rig_module/voice,
		/obj/item/rig_module/fabricator/energy_net,
		/obj/item/rig_module/chem_dispenser,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/datajack,
		/obj/item/rig_module/self_destruct
		)
	
	sprite_sheets = list(
		"Resomi" = 'icons/mob/species/resomi/back.dmi'
	)

	..()

/obj/item/weapon/rig/light/ninja/new()
	if(!has_custom_name)
		name = "Ominous voidsuit control module"		
	else
		name = unique_name
	if(!has_custom_desc)
		desc = "A unique, vaccum-proof suit of nano-enhanced armor designed specifically for assassins."
	else
		desc = unique_desc	
	..()
	
/obj/item/clothing/gloves/rig/light/ninja/verb/rename_suit()
	set name = "Name Ninja Suit"
	set desc = "Rename your black voidsuit."
	set category = "Object"
	var/mob/M = usr
	if(!M.mind) return 0
	if(M.incapacitated()) return 0
	if(!(access_syndicate in M.access)) return 0
	var/input = sanitizeSafe(input("What do you want to name your suit?", "Rename suit"), MAX_NAME_LEN)
	if(src && input && !M.incapacitated() && in_range(M,src))
		if(!findtext(input, "the", 1, 4))
			input = "\improper [input]"
		unique_name = input
		to_chat(M, "Suit naming succesful!")
		return 1
	has_custom_name = 1
	
/obj/item/clothing/gloves/rig/light/ninja/verb/rewrite_suit_desc()
	set name = "Describe Ninja suit"
	set desc = "Give your voidsuit a custom description."
	set category = "Object"
	var/mob/M = usr
	if(!M.mind) return 0
	if(M.incapacitated()) return 0
	if(!(access_syndicate in M.access)) return 0
	var/input = sanitizeSafe(input("What is your voidsuit? ", "write description"), MAX_DESC_LEN)
	if(src && input && !M.incapacitated() && in_range(M,src))
		unique_desc = input
		to_chat(M, "Suit description succesful!")
		return 1
	has_custom_desc = 1


	
/obj/item/clothing/gloves/rig/light/ninja
	name = "insulated gloves"
	siemens_coefficient = 0
	
	sprite_sheets = list(
		"Resomi" = 'icons/mob/species/resomi/gloves.dmi'
	)

/obj/item/clothing/suit/space/rig/light/ninja
	breach_threshold = 38 //comparable to regular hardsuits
	
	sprite_sheets = list(
		"Resomi" = 'icons/mob/species/resomi/suit.dmi'
	)

/obj/item/weapon/rig/light/stealth
	name = "stealth suit control module"
	suit_type = "stealth"
	desc = "A highly advanced and expensive suit designed for covert operations."
	icon_state = "stealth_rig"

	req_access = list(access_syndicate)

	initial_modules = list(
		/obj/item/rig_module/stealth_field,
		/obj/item/rig_module/vision
		)
