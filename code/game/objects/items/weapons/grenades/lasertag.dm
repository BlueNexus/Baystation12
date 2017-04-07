/obj/item/weapon/grenade/lasertag
	name = "omni lasertag grenade"
	icon_state = "laseromni"
	item_state = "emp"
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 1)
	var/target_suit = null
	var/flash_type = /obj/screen/fullscreen/flash

/obj/item/weapon/grenade/lasertag/detonate()
	for(var/mob/living/carbon/human/H in view(3, src))
		if(istype(H))
			if(target_suit && (!istype(H.wear_suit, target_suit)))
				continue
			H.Weaken(5)
			H.flash_eyes(type=flash_type)
	playsound(src.loc, 'sound/weapons/wave.ogg', 50, 1, 30)
	..()

/obj/item/weapon/grenade/lasertag/red
	name = "red lasertag grenade"
	icon_state = "laserred"
	target_suit = /obj/item/clothing/suit/bluetag
	flash_type = /obj/screen/fullscreen/flash/red

/obj/item/weapon/grenade/lasertag/blue
	name = "blue lasertag grenade"
	icon_state = "laserblue"
	target_suit = /obj/item/clothing/suit/redtag
	flash_type = /obj/screen/fullscreen/flash/blue