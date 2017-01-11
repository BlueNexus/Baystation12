/datum/controller/process/radiation
	var/repository/radiation/linked = null

/datum/controller/process/radiation/setup()
	name = "radiation controller"
	schedule_interval = 20 // every 2 seconds
	linked = radiation_repository

/datum/controller/process/radiation/doWork()
//	set background = 1
	for(var/thing in linked.sources)
		if(!thing)
			linked.sources.Remove(thing)
			continue
		var/atom/emitter = thing
		linked.sources[thing] = min(round(sqrt(emitter.rad_power / config.radiation_lower_limit)), 31)
		linked.sources[thing] = min(emitter.x, world.maxx - emitter.x, emitter.y, world.maxy - emitter.y, linked.sources[thing])
		SCHECK
/*
	for(var/thing in linked.resistance_cache)
		if(!thing)
			linked.resistance_cache.Remove(thing)
			continue
		var/turf/T = thing
		if((length(T.contents) + 1) != linked.resistance_cache[T])
			T.calc_rad_resistance()
		SCHECK
*/