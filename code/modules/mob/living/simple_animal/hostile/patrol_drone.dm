//fully functional combat drones
/mob/living/simple_animal/hostile/patrol_drone
	name = "interceptor drone"
	desc = "An automated combat drone armed with state of the art weaponry and shielding." //Todo
	icon_state = "syndrone_interceptor"
	icon_living = "syndrone_interceptor"
	icon_dead = null //Explodes on death
	ranged = 1
	turns_per_move = 3
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	a_intent = I_HURT
	stop_automated_movement_when_pulled = 0
	health = 125
	maxHealth = 125
	speed = 8
	projectiletype = /obj/item/projectile/beam/drone/patrol
	projectilesound = 'sound/weapons/laser3.ogg'
	destroy_surroundings = 1
	var/datum/effect/effect/system/trail/ion_trail
	var/disabled = 0
	attack_delay = DEFAULT_ATTACK_COOLDOWN * 0.80
	break_stuff_probability = 100

	//Drones aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	var/has_loot = 1
	faction = "patrol_drone"

/mob/living/simple_animal/hostile/patrol_drone/New()
	..()
	ion_trail = new /datum/effect/effect/system/trail/ion()
	ion_trail.set_up(src)
	ion_trail.start()

/mob/living/simple_animal/hostile/patrol_drone/Life()
	if(disabled)
		if(prob(5))
			disabled = 0
		return
	..()

/mob/living/simple_animal/hostile/patrol_drone/emp_act(severity)
	health -= rand(3,10) * (severity + 1)
	disabled = 1

/mob/living/simple_animal/hostile/patrol_drone/Allow_Spacemove(var/check_drift = 0)
	return 1

/mob/living/simple_animal/hostile/patrol_drone/ListTargets()
		return view(src, 10)

//Horrible copypaste
/mob/living/simple_animal/hostile/patrol_drone/death()
	..(null,"ceases functioning and detonates.")
	qdel(src)

/mob/living/simple_animal/hostile/patrol_drone/Destroy()
	//some random debris left behind
	if(has_loot)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		var/obj/O

		//shards
		O = new /obj/item/weapon/material/shard(src.loc)
		step_to(O, get_turf(pick(view(7, src))))
		if(prob(75))
			O = new /obj/item/weapon/material/shard(src.loc)
			step_to(O, get_turf(pick(view(7, src))))
		if(prob(50))
			O = new /obj/item/weapon/material/shard(src.loc)
			step_to(O, get_turf(pick(view(7, src))))
		if(prob(25))
			O = new /obj/item/weapon/material/shard(src.loc)
			step_to(O, get_turf(pick(view(7, src))))

		//rods
		O = new /obj/item/stack/rods(loc)
		step_to(O, get_turf(pick(view(7, src))))
		if(prob(75))
			O = new /obj/item/stack/rods(loc)
			step_to(O, get_turf(pick(view(7, src))))
		if(prob(50))
			O = new /obj/item/stack/rods(loc)
			step_to(O, get_turf(pick(view(7, src))))
		if(prob(25))
			O = new /obj/item/stack/rods(loc)
			step_to(O, get_turf(pick(view(7, src))))

		//plasteel
		O = new /obj/item/stack/material/plasteel(src.loc)
		step_to(O, get_turf(pick(view(7, src))))
		if(prob(75))
			O = new /obj/item/stack/material/plasteel(src.loc)
			step_to(O, get_turf(pick(view(7, src))))
		if(prob(50))
			O = new /obj/item/stack/material/plasteel(src.loc)
			step_to(O, get_turf(pick(view(7, src))))
		if(prob(25))
			O = new /obj/item/stack/material/plasteel(src.loc)
			step_to(O, get_turf(pick(view(7, src))))

		//also drop dummy circuit boards deconstructable for research (loot)
		var/obj/item/weapon/circuitboard/C

		//spawn 1-4 boards of a random type
		var/spawnees = 0
		var/num_boards = rand(1,4)
		var/list/options = list(1,2,4,8,16,32,64)
		for(var/i=0, i<num_boards, i++)
			var/chosen = pick(options)
			options.Remove(options.Find(chosen))
			spawnees |= chosen

		if(spawnees & 1)
			C = new(src.loc)
			C.name = "Drone CPU motherboard"
			C.origin_tech = list(TECH_DATA = rand(3, 6))

		if(spawnees & 2)
			C = new(src.loc)
			C.name = "Drone artificial intelligence"
			C.origin_tech = list(TECH_DATA = rand(4,7))

		if(spawnees & 4)
			C = new(src.loc)
			C.name = "Drone suspension processor"
			C.origin_tech = list(TECH_MAGNET = rand(3,6))

		if(spawnees & 8)
			C = new(src.loc)
			C.name = "Drone power capacitor"
			C.origin_tech = list(TECH_POWER = rand(3,6))

		if(spawnees & 16)
			C = new(src.loc)
			C.name = "Drone hull reinforcer"
			C.origin_tech = list(TECH_MATERIAL = rand(3,6))

		if(spawnees & 32)
			C = new(src.loc)
			C.name = "Drone phoron overcharge counter"
			C.origin_tech = list(TECH_PHORON = rand(3,6))

		if(spawnees & 64)
			C = new(src.loc)
			C.name = "Drone targetting circuitboard"
			C.origin_tech = list(TECH_COMBAT = rand(3,6))


	..()

/mob/living/simple_animal/hostile/patrol_drone/locust //Weak anti-personnel swarm drones
	name = "locust drone"
	icon_state = "syndrone_locust"
	icon_living = "syndrone_locust"
	health = 50
	maxHealth = 50
	speed = 6
	projectiletype = /obj/item/projectile/energy/crescent
	attack_delay = DEFAULT_ATTACK_COOLDOWN * 0.33
	break_stuff_probability = 5

/mob/living/simple_animal/hostile/patrol_drone/locust/New()
	..()
	return
	//Make this spawn two more

/mob/living/simple_animal/hostile/patrol_drone/rocket
	icon_state = "syndrome_interceptor_m"
	icon_living = "syndrone_interceptor_m"
	projectiletype = /obj/item/projectile/bullet/gyro
	attack_delay = DEFAULT_ATTACK_COOLDOWN * 2
	break_stuff_probability = 100

/mob/living/simple_animal/hostile/patrol_drone/rocket/ListTargets()
		return null //Doesn't care about people, just the hull

/obj/item/projectile/beam/drone/patrol //General-purpose
	damage = 25

/obj/item/projectile/energy/crescent
	icon_state = "crescent"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER
	fire_sound = 'sound/weapons/laser3.ogg'
	damage = 7.5
	armor_penetration = 25
	damage_type = BURN
	check_armour = "laser"
	penetrating = 1
	sharp = 1
