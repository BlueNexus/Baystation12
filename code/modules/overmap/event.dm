/obj/effect/overmap/event
	name = "map event"
	icon_state = "event"
	map_z = null
	landing_areas = null
	in_space = 0
	var/radius = 2
	var/count = 6
	var/datum/event/linked_event
	var/datum/event/active_event = null
	var/list/possible_sprites = null

/obj/effect/overmap/event/New(loc, var/sx = null, var/sy = null)
	if(sx)
		start_x = sx
	if(sy)
		start_y = sy
	if(possible_sprites)
		icon_state = pick(possible_sprites)
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



/obj/effect/overmap/event/proc/trigger()
	if(event_manager)
		var/datum/event_meta/EM = new(EVENT_LEVEL_MODERATE, src.name, linked_event, add_to_queue = 0, is_one_shot = 1)
		active_event = new linked_event(EM)
		active_event.startWhen = 0
		active_event.endWhen = 999
		if(istype(linked_event, /datum/event/meteor_wave))
			var/datum/event/meteor_wave/MW = linked_event
			MW.next_meteor = 0

/obj/effect/overmap/event/proc/leave()
	if(active_event)
		active_event.kill()
		active_event = null

/obj/effect/overmap/event/meteor
	name = "asteroid field"
	linked_event = /datum/event/meteor_wave
	count = 6
	possible_sprites = list("meteor1", "meteor2", "meteor3", "meteor4")

/obj/effect/overmap/event/electric
	name = "electrical storm"
	linked_event = /datum/event/electrical_storm
	count = 8
	possible_sprites = list("electrical1", "electrical2", "electrical3", "electrical4")

/obj/effect/overmap/event/dust
	name = "dust cloud"
	linked_event = /datum/event/dust
	count = 10
	possible_sprites = list("dust1", "dust2", "dust3", "dust4")
