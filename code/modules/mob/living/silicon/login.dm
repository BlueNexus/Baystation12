/mob/living/silicon/Login()
	SetSleeping(0) //Won't wake up if sleep_locked (exploit prevention)
	..()