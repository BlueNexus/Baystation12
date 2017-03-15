/obj/effect/overmap/event
	name = "map event"
	icon_state = "event"
	map_z = null
	landing_areas = null
	in_space = 0
	var/dimensions = 2
	var/count = 6
	var/datum/event/linked_event

/obj/effect/overmap/event/New(loc, var/sx = null, var/sy = null)
	if(sx)
		start_x = sx
	if(sy)
		start_y = sy
	..()

/obj/effect/overmap/event/initialize()
	if(!using_map.use_overmap)
		qdel(src)
		return

	if(!start_x)
		start_x = rand(OVERMAP_EDGE, using_map.overmap_size - OVERMAP_EDGE)
	if(!start_y)
		start_y = rand(OVERMAP_EDGE, using_map.overmap_size - OVERMAP_EDGE)

	forceMove(locate(start_x, start_y, using_map.overmap_z))
	testing("Created event \"[name]\" at [start_x],[start_y]")



/obj/effect/overmap/event/proc/trigger()
	if(event_manager)
		if(!linked_event in event_manager.active_events)
			var/datum/event_meta/EM = new(EVENT_LEVEL_MODERATE, src.name, linked_event, add_to_queue = 0, is_one_shot = 1)
			new linked_event.type(EM)


/obj/effect/overmap/event/meteor
	name = "meteor shower"
	linked_event = /datum/event/meteor_wave

/obj/effect/overmap/event/electric
	name = "electrical storm"
	linked_event = /datum/event/electrical_storm


/datum/overmap_event_controller

/datum/overmap_event_controller/proc/distribute(var/obj/effect/overmap/event/E)
	var/frustration = 0
	var/start_x = rand(OVERMAP_EDGE, using_map.overmap_size - OVERMAP_EDGE)
	var/start_y = rand(OVERMAP_EDGE, using_map.overmap_size - OVERMAP_EDGE)
	new E(locate(1, 1, 1), start_x, start_y)
	var/work_range = E.dimensions
	for(var/attempt in 1 to E.count)
		frustration = 0
		var/valid = 0
		var/target_x
		var/target_y
		do
			target_x = rand(start_x - work_range, start_x + work_range)
			target_y = rand(start_y - work_range, start_y + work_range)
			var/obj/effect/overmap/event/Ev
			var/turf/target_turf = locate(target_x, target_y, using_map.overmap_z)
			if(istype(target_turf))
				if(!(Ev in target_turf.contents))
					valid = 1
				else
					frustration++
			if(frustration < 4)
				work_range++
				frustration = 0

		while(!valid)
		new E(locate(1, 1, 1), target_x, target_y)
