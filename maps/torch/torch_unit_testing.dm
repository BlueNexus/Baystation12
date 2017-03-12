/datum/map/torch
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/AIsattele = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/aquila_hangar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/aquila_hangar/start = 0,
		/area/calypso_hangar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/calypso_hangar/start = 0,
		/area/constructionsite = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/constructionsite/ai = NO_SCRUBBER|NO_VENT,
		/area/constructionsite/atmospherics = NO_SCRUBBER,
		/area/constructionsite/teleporter = NO_SCRUBBER,
		/area/derelict/ship = NO_SCRUBBER|NO_VENT,
		/area/djstation = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/engineering/atmos/storage = NO_SCRUBBER|NO_VENT,
		/area/engineering/auxpower = NO_SCRUBBER|NO_VENT,
		/area/engineering/drone_fabrication = NO_SCRUBBER|NO_VENT,
		/area/engineering/engine_smes = NO_SCRUBBER|NO_VENT,
		/area/engineering/fuelbay = NO_SCRUBBER,
		/area/guppy_hangar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/guppy_hangar/start = 0,
		/area/hallway/primary/seconddeck/center = NO_SCRUBBER|NO_VENT,
		/area/holodeck = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/maintenance = NO_SCRUBBER|NO_VENT,
		/area/maintenance/auxsolarbridge = NO_SCRUBBER,
		/area/maintenance/auxsolarport = NO_SCRUBBER,
		/area/maintenance/auxsolarstarboard = NO_SCRUBBER,
		/area/maintenance/exterior = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/maintenance/firstdeck/foreport = NO_SCRUBBER,
		/area/maintenance/firstdeck/forestarboard = NO_SCRUBBER,
		/area/maintenance/fourthdeck/aft = 0,
		/area/maintenance/incinerator = NO_SCRUBBER,
		/area/maintenance/seconddeck/aftport = NO_SCRUBBER,
		/area/maintenance/seconddeck/forestarboard = NO_SCRUBBER,
		/area/maintenance/thirddeck/aftstarboard = NO_SCRUBBER,
		/area/mine/explored = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/mine/unexplored = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/ninja_dojo = NO_SCRUBBER |NO_VENT | NO_APC,
		/area/outpost/abandoned = NO_SCRUBBER,
		/area/rescue_base = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shield = NO_SCRUBBER|NO_VENT,
		/area/shuttle = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/merchant = NO_SCRUBBER|NO_APC,
		/area/shuttle/merchant/away = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/petrov = 0,
		/area/shuttle/petrov/away = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/skipjack_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/solar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/storage = NO_SCRUBBER|NO_VENT,
		/area/storage/auxillary/port = 0,
		/area/storage/auxillary/starboard = 0,
		/area/storage/primary = 0,
		/area/storage/tech = 0,
		/area/storage/tools = 0,
		/area/supply = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/syndicate_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/tcommsat/relay = NO_SCRUBBER|NO_VENT,
		/area/teleporter/seconddeck = NO_SCRUBBER|NO_VENT,,
		/area/thruster/d1port = NO_SCRUBBER|NO_VENT,
		/area/thruster/d1starboard = NO_SCRUBBER|NO_VENT,
		/area/thruster/d3port = NO_SCRUBBER|NO_VENT,
		/area/thruster/d3starboard = NO_SCRUBBER|NO_VENT,
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turret_protected/ai = NO_SCRUBBER|NO_VENT,
		/area/turret_protected/ai_outer_chamber = NO_SCRUBBER|NO_VENT,
		/area/vacant = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/vacant/briefing = 0,
		/area/vacant/brig = NO_SCRUBBER|NO_VENT,
		/area/vacant/cannon = NO_SCRUBBER|NO_VENT,
		/area/vacant/cargo = NO_SCRUBBER|NO_VENT,
		/area/vacant/infirmary = NO_SCRUBBER|NO_VENT,
		/area/vacant/missile = NO_SCRUBBER|NO_VENT,
		/area/vacant/monitoring = NO_SCRUBBER|NO_VENT,
		/area/vacant/office = 0
	)

	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/mine/explored,
		/area/mine/unexplored,
		/area/centcom/control,
		/area/maintenance/exterior
	)

	area_coherency_test_subarea_count = list(
			/area/constructionsite = 7,
			/area/constructionsite/maintenance = 14,
			/area/solar/constructionsite = 3,
	)

	area_usage_test_exempted_areas = list(
		/area/overmap,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape,
		/area/turbolift,
		/area/security/prison,
		/area/shuttle/syndicate_elite/station,
		/area/shuttle/escape/centcom,
		/area/rnd/xenobiology/xenoflora_storage,
		/area/turbolift,
		/area/turbolift/start,
		/area/turbolift/bridge,
		/area/turbolift/firstdeck,
		/area/turbolift/seconddeck,
		/area/turbolift/thirddeck,
		/area/turbolift/fourthdeck
	)
