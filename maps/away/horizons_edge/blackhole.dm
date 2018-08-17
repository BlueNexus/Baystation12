/datum/event/meteor_wave/blackhole
	startWhen = 0
	endWhen = 999
	alarmWhen = 0
	next_meteor = 40
	waves = 999
	next_meteor_lower = 5
	next_meteor_upper = 60


/datum/event/meteor_wave/blackhole/setup()
	//start_side = using_map.fore_dir

/datum/event/meteor_wave/blackhole/announce()
	return

/datum/event/meteor_wave/blackhole/tick()

	if(waves && activeFor >= next_meteor)
		send_wave()

/datum/event/meteor_wave/blackhole/send_wave()
	var/pick_side = prob(80) ? start_side : (prob(50) ? turn(start_side, 90) : turn(start_side, -90))
	spawn() spawn_meteors(get_wave_size(), get_meteors(), pick_side)
	next_meteor += rand(next_meteor_lower, next_meteor_upper) / severity

/datum/event/meteor_wave/blackhole/get_wave_size()
	return severity * rand(1,2)

/datum/event/meteor_wave/blackhole/end()
	return

/datum/event/meteor_wave/blackhole/proc/get_meteors()
	return meteors_debris

/var/list/meteors_minor = list(
	/obj/effect/meteor/medium     = 80,
	/obj/effect/meteor/dust       = 30,
	/obj/effect/meteor/irradiated = 30,
	/obj/effect/meteor/big        = 30,
	/obj/effect/meteor/flaming    = 10,
	/obj/effect/meteor/golden     = 10,
	/obj/effect/meteor/silver     = 10,
)
