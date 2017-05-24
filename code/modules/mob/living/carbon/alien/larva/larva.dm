/mob/living/carbon/broodling/larva
	name = "larva"
	real_name = "larva"
	adult_form = /mob/living/carbon/broodling/larva/corpser
	speak_emote = list("hisses") //todoB
	icon_state = "larva"
	language = "Hivemind"
	maxHealth = 35
	health = 35

/mob/living/carbon/alien/larva/New()
	..()
	add_language("Broodling") //Bonus language.
	SetSleeping(60, lock = 1)

/mob/living/carbon/alien/larva/corpser
	name = "corpser"