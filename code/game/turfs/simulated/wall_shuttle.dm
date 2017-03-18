/turf/simulated/shuttle
	name = "shuttle"
	icon = 'icons/turf/shuttle.dmi'
	thermal_conductivity = 0.05
	heat_capacity = 0

/turf/simulated/shuttle/wall
	name = "wall"
	icon_state = "wall1"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog0"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog1"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog2"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog3"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog4"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog5"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog6"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog7"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog8"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog9"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog10"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog11"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog12"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog13"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog14"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall
	name = "alien wall"
	icon_state = "bog15"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall/corner
	var/corner_overlay_state = "diagonalWall"
	var/image/corner_overlay

/turf/simulated/shuttle/wall/corner/New()
	..()
	reset_base_appearance()
	reset_overlay()

//Grabs the base turf type from our area and copies its appearance
/turf/simulated/shuttle/wall/corner/proc/reset_base_appearance()
	var/turf/base_type = get_base_turf_by_area(src)
	if(!base_type) return

	icon = initial(base_type.icon)
	icon_state = initial(base_type.icon_state)

/turf/simulated/shuttle/wall/corner/proc/reset_overlay()
	if(corner_overlay)
		overlays -= corner_overlay
	else
		corner_overlay = image(icon = 'icons/turf/shuttle.dmi', icon_state = corner_overlay_state, dir = src.dir)
		corner_overlay.plane = plane
		corner_overlay.layer = layer
	overlays += corner_overlay

//Predefined Shuttle Corners
/turf/simulated/shuttle/wall/corner/smoothwhite
	icon_state = "corner_white" //for mapping preview
	corner_overlay_state = "corner_white"
/turf/simulated/shuttle/wall/corner/smoothwhite/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/smoothwhite/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/smoothwhite/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/smoothwhite/sw
	dir = SOUTH|WEST

/turf/simulated/shuttle/wall/corner/blockwhite
	icon_state = "corner_white_block"
	corner_overlay_state = "corner_white_block"
/turf/simulated/shuttle/wall/corner/blockwhite/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/blockwhite/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/blockwhite/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/blockwhite/sw
	dir = SOUTH|WEST

/turf/simulated/shuttle/wall/corner/dark
	icon_state = "corner_dark"
	corner_overlay_state = "corner_dark"
/turf/simulated/shuttle/wall/corner/dark/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/dark/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/dark/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/dark/sw
	dir = SOUTH|WEST


/turf/simulated/shuttle/wall/corner/alien
	icon_state = "corner_alien"
	corner_overlay_state = "corner_alien"
/turf/simulated/shuttle/wall/corner/alien/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/alien/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/alien/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/alien/sw
	dir = SOUTH|WEST