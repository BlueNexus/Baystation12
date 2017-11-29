
/mob/living/simple_animal/hostile/sarashen
	name = "creature"
	icon = 'icons/mob/mob.dmi'
	icon_state = "phazon metroid"
	icon_living = "phazon metroid"
	icon_dead = "phazon metroid"
	icon_gib = "phazon metroid"
	maxHealth = 60
	health = 35
	speed = 5
	speak_chance = 0
	turns_per_move = 3
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	break_stuff_probability = 0
	faction = "sarashen"
	harm_intent_damage = 3
	melee_damage_lower = 3
	melee_damage_upper = 4
	light_color = "#0000FF"
	attacktext = "bitten"
	attack_sound = 'sound/weapons/bite.ogg'
	min_gas = null
	max_gas = null
	minbodytemp = 0
	var/datum/disease2/disease/carried
	var/cloaked = 0
	var/mob/living/carbon/human/gripping = null
	var/blood_per_tick = 4
	var/health_per_tick = 0.7

/mob/living/simple_animal/hostile/sarashen/New()
	. = ..()
	if(prob(40))
		carried = new/datum/disease2/disease()
		carried.makerandom(rand(2, 4))

/mob/living/simple_animal/hostile/sarashen/Allow_Spacemove(var/check_drift = 0)
	return 1

/mob/living/simple_animal/hostile/sarashen/Life()
	. = ..()
	if(gripping)
		if(!(get_turf(src) == get_turf(gripping)))
			gripping = null
			stop_automated_movement = 0
		var/blood_volume = round(gripping.vessel.get_reagent_amount(/datum/reagent/blood))
		if(blood_volume > 5)
			gripping.vessel.remove_reagent(/datum/reagent/blood, blood_per_tick)
			health = min(health + health_per_tick, maxHealth)
			if(prob(15))
				to_chat(gripping, "<span class='danger'>You feel your blood being drawn out through your veins!</span>")
		else
			gripping = null
			stop_automated_movement = 0

	if(stance == HOSTILE_STANCE_IDLE && !cloaked)
		cloaked = 1
		update_icon()
	if(health == maxHealth)
		new/mob/living/simple_animal/hostile/sarashen(src.loc)
		new/mob/living/simple_animal/hostile/sarashen(src.loc)
		gib()
		return
	if(health < 1)
		gib()
		return

/mob/living/simple_animal/hostile/sarashen/update_icon()
	if(cloaked)
		alpha = 50
		set_light(0)
		icon_state = initial(icon_state)
	else
		alpha = 255
		icon_state = "phazon metroid glow"
		set_light(5)

/mob/living/simple_animal/hostile/sarashen/AttackingTarget()
	. = ..()
	if(ishuman(.))
		var/mob/living/carbon/human/H = .
		if(gripping == H)
			H.Weaken(3)
			return
		if(!gripping && (cloaked || prob(health)))
			gripping = H
			cloaked = 0
			update_icon()
			H.Weaken(3)
			H.visible_message("<span class='danger'>\the [src] appears and latches onto \the [H], pulsating!</span>")
			if(carried && !length(gripping.virus2))
				carried.majormutate()
				gripping.virus2.Add(carried)
			stop_automated_movement = 1
			src.loc = gripping.loc
			return

/mob/living/simple_animal/hostile/sarashen/swarm/New()
	new/mob/living/simple_animal/hostile/sarashen(src.loc)
	if(prob(75)) new/mob/living/simple_animal/hostile/sarashen(src.loc)
	if(prob(50)) new/mob/living/simple_animal/hostile/sarashen(src.loc)
	qdel(src)