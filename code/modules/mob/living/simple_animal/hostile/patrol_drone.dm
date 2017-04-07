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
	new src(src.loc)
	new src(src.loc)
	//Make this spawn two more

/mob/living/simple_animal/hostile/patrol_drone/rocket
	icon_state = "syndrone_interceptor_m"
	icon_living = "syndrone_interceptor_m"
	projectiletype = /obj/item/projectile/bullet/gyro
	attack_delay = DEFAULT_ATTACK_COOLDOWN * 2
	break_stuff_probability = 100
	environment_smash = 1

/mov/living/simple_animal/hostile/patrol_drone/flea
	icon_state = "syndrone_flea"
	icon_living = "syndrone_flea"
	ranged = 0
	health = 200
	maxHealth = 200
	speed = 5
	break_stuff_probability = 100
	melee_damage_lower = 25
	melee_damage_upper = 35
	environment_smash = 2

/mob/living/simple_animal/hostile/patrol_drone/flea/ListTargets(var/dist = 25)
	var/list/L = hearers(src, dist)

	for (var/obj/mecha/M in mechas_list)
		if (M.z == src.z && get_dist(src, M) <= dist)
			L += M

	return L


/mob/living/simple_animal/hostile/patrol_drone/flea/DestroySurroundings()
	if(prob(break_stuff_probability))
		for(var/dir in cardinal) // North, South, East, West
			var/obj/effect/shield/S = locate(/obj/effect/shield, get_step(src, dir))
			if(S && S.gen && S.gen.check_flag(MODEFLAG_NONHUMANS))
				S.attack_generic(src,rand(melee_damage_lower,melee_damage_upper,environment_smash),attacktext)
				return
			for(var/obj/structure/window/obstacle in get_step(src, dir))
				if(obstacle.dir == reverse_dir[dir]) // So that windows get smashed in the right order
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper,environment_smash),attacktext)
					return
			var/obj/structure/obstacle = locate(/obj/structure, get_step(src, dir))
			if(istype(obstacle, /obj/structure/window) || istype(obstacle, /obj/structure/closet) || istype(obstacle, /obj/structure/table) || istype(obstacle, /obj/structure/grille))
				obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper,environment_smash),attacktext)
			var/turf/simulated/wall/W = get_step(src, dir)
				W.attack_generic(src,rand(melee_damage_lower,melee_damage_upper,environment_smash),attacktext)

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
