
#define A_BIG_NUMBER			9999999
#define STATE_COUNT_NORMAL		4
#define STATE_COUNT_DIAGONAL	7


/mob/verb/ChooseDMI(dmi as file)
	var/dmifile = file(dmi)
	if(isfile(dmifile) && (copytext("[dmifile]",-4) == ".dmi"))
		SliceNDice(dmifile)
	else
		world << "\red Bad DMI file '[dmifile]'"


/proc/SliceNDice(dmifile as file)
	var/icon/sourceIcon = icon(dmifile)
	var/list/states = sourceIcon.IconStates()
	world << "<B>[dmifile] - states: [states.len]</B>"

	switch(states.len)
		if(0 to (STATE_COUNT_NORMAL - 1))
			var/cont = alert(usr, "Too few states: [states.len],  expected [STATE_COUNT_NORMAL], Continue?", "Unexpected Amount of States", "Yes", "No")
			if(cont == "No")
				return
		if(STATE_COUNT_NORMAL)
			world << "4 States, running in Non-Diagonal mode"
		//if(STATE_COUNT_DIAGONAL)
		//	world << "5 States, running in Diagonal mode"
		if((STATE_COUNT_NORMAL + 1) to A_BIG_NUMBER)
			var/cont = alert(usr, "Too many states: [states.len],  expected [STATE_COUNT_NORMAL], Continue?", "Unexpected Amount of States", "Yes", "No")
			if(cont == "No")
				return


	var/icon/outputIcon = new /icon()

	var/filename = "[copytext("[dmifile]", 1, -4)]-smooth.dmi"
	fdel(filename) //force refresh

	var/base_state = input("Enter the base state's name. ('metal1' 'metal2' etc)") as null|text
	if(!base_state)
		base_state = ""

	for(var/state in states)
		var/statename = lowertext(state)
		outputIcon = icon(filename) //open the icon again each iteration, to work around byond memory limits

		switch(statename)
			if("box")
				var/icon/box = icon(sourceIcon, state)
				var/icon/alldirs = new()
				var/icon/corner1i = icon(box)
				corner1i.DrawBox(null, 1, 1, 32, 16)
				corner1i.DrawBox(null, 17, 1, 32, 32)
				alldirs.Insert(corner1i, statename, 1)

				var/icon/corner2i = icon(box)
				corner2i.DrawBox(null, 1, 1, 16, 32)
				corner2i.DrawBox(null, 17, 1, 32, 16)
				alldirs.Insert(corner2i, statename, 4)

				var/icon/corner3i = icon(box)
				corner3i.DrawBox(null, 1, 32, 32, 17)
				corner3i.DrawBox(null, 17, 32, 32, 1)
				alldirs.Insert(corner3i, statename, 8)

				var/icon/corner4i = icon(box)
				corner4i.DrawBox(null, 1, 1, 16, 32)
				corner4i.DrawBox(null, 17, 17, 32, 32)
				alldirs.Insert(corner4i, statename, 2)
				outputIcon.Insert(alldirs, "[base_state]0")
				outputIcon.Insert(alldirs, "[base_state]2")

				world << "Box: \icon[box] -> \icon[corner1i] \icon[corner2i] \icon[corner3i] \icon[corner4i]"

			if("line")
				var/icon/line = icon(sourceIcon, state)
				var/icon/alldirs = new()

				//Vertical
				var/icon/line1n = icon(line)
				line1n.DrawBox(null, 1, 1, 32, 16)
				line1n.DrawBox(null, 17, 1, 32, 32)
				alldirs.Insert(line1n, statename, 1)

				var/icon/line2n = icon(line)
				line2n.DrawBox(null, 1, 1, 16, 32)
				line2n.DrawBox(null, 17, 1, 32, 16)
				alldirs.Insert(line2n, statename, 4)

				var/icon/line3s = icon(line)
				line3s.DrawBox(null, 1, 32, 32, 17)
				line3s.DrawBox(null, 17, 32, 32, 1)
				alldirs.Insert(line3s, statename, 8)

				var/icon/line4s = icon(line)
				line4s.DrawBox(null, 1, 1, 16, 32)
				line4s.DrawBox(null, 17, 17, 32, 32)
				alldirs.Insert(line4s, statename, 2)
				outputIcon.Insert(alldirs, "[base_state]4")
				outputIcon.Insert(alldirs, "[base_state]6")

				//Horizontal
				var/icon/line1w = icon(line3s) //Correct
				line1w.Turn(90)
				alldirs.Insert(line1w, statename, 1)

				var/icon/line2e = icon(line1n)
				line2e.Turn(90)
				alldirs.Insert(line2e, statename, 4)

				var/icon/line3w = icon(line4s)
				line3w.Turn(90)
				alldirs.Insert(line3w, statename, 8)

				var/icon/line4e = icon(line2n)
				line4e.Turn(90)
				alldirs.Insert(line4e, statename, 2)
				outputIcon.Insert(alldirs, "[base_state]1")
				outputIcon.Insert(alldirs, "[base_state]3")


				world << "Line: \icon[line] -> \icon[line1n] \icon[line2n] \icon[line3s] \icon[line4s] \icon[line1w] \icon[line2e] \icon[line3w] \icon[line4e]"

			if("center_4")
				var/icon/center4 = icon(sourceIcon, state)
				var/icon/alldirs = new()

				var/icon/corner1nw = icon(center4)
				corner1nw.DrawBox(null, 1, 1, 32, 16)
				corner1nw.DrawBox(null, 17, 1, 32, 32)
				alldirs.Insert(corner1nw, statename, 1)

				var/icon/corner2ne = icon(center4)
				corner2ne.DrawBox(null, 1, 1, 16, 32)
				corner2ne.DrawBox(null, 17, 1, 32, 16)
				alldirs.Insert(corner2ne, statename, 4)

				var/icon/corner3sw = icon(center4)
				corner3sw.DrawBox(null, 1, 32, 32, 17)
				corner3sw.DrawBox(null, 17, 32, 32, 1)
				alldirs.Insert(corner3sw, statename, 8)

				var/icon/corner4se = icon(center4)
				corner4se.DrawBox(null, 1, 1, 16, 32)
				corner4se.DrawBox(null, 17, 17, 32, 32)
				alldirs.Insert(corner4se, statename, 2)
				outputIcon.Insert(alldirs, "[base_state]5")

				world << "Center4: \icon[center4] -> \icon[corner1nw] \icon[corner2ne] \icon[corner3sw] \icon[corner4se]"

			if("center_8")
				var/icon/center8 = icon(sourceIcon, state)
				var/icon/alldirs = new()


				var/icon/corner1f = icon(center8)
				corner1f.DrawBox(null, 1, 1, 32, 16)
				corner1f.DrawBox(null, 17, 1, 32, 32)
				alldirs.Insert(corner1f, statename, 1)

				var/icon/corner2f = icon(center8)
				corner2f.DrawBox(null, 1, 1, 16, 32)
				corner2f.DrawBox(null, 17, 1, 32, 16)
				alldirs.Insert(corner2f, statename, 4)

				var/icon/corner3f = icon(center8)
				corner3f.DrawBox(null, 1, 32, 32, 17)
				corner3f.DrawBox(null, 17, 32, 32, 1)
				alldirs.Insert(corner3f, statename, 8)

				var/icon/corner4f = icon(center8)
				corner4f.DrawBox(null, 1, 1, 16, 32)
				corner4f.DrawBox(null, 17, 17, 32, 32)
				alldirs.Insert(corner4f, statename, 2)
				outputIcon.Insert(alldirs, "[base_state]7")

				world << "Center8: \icon[center8] -> \icon[corner1f] \icon[corner2f] \icon[corner3f] \icon[corner4f]"

/*
			if("diag")
				var/icon/diag = icon(sourceIcon, state)

				var/icon/diagse = icon(diag) //No work
				outputIcon.Insert(diagse, "d-se")

				var/icon/diagsw = icon(diag)
				diagsw.Turn(90)
				outputIcon.Insert(diagsw, "d-sw")

				var/icon/diagne = icon(diag)
				diagne.Turn(-90)
				outputIcon.Insert(diagne, "d-ne")

				var/icon/diagnw = icon(diag)
				diagnw.Turn(180)
				outputIcon.Insert(diagnw, "d-nw")

				world << "Diag: \icon[diag] -> \icon[diagse] \icon[diagsw] \icon[diagne] \icon[diagnw]"

			if("diag_corner_a")
				var/icon/diag_corner_a = icon(sourceIcon, state)

				var/icon/diagse0 = icon(diag_corner_a) //No work
				outputIcon.Insert(diagse0, "d-se-0")

				var/icon/diagsw0 = icon(diag_corner_a)
				diagsw0.Turn(90)
				outputIcon.Insert(diagsw0, "d-sw-0")

				var/icon/diagne0 = icon(diag_corner_a)
				diagne0.Turn(-90)
				outputIcon.Insert(diagne0, "d-ne-0")

				var/icon/diagnw0 = icon(diag_corner_a)
				diagnw0.Turn(180)
				outputIcon.Insert(diagnw0, "d-nw-0")

				world << "Diag_Corner_A: \icon[diag_corner_a] -> \icon[diagse0] \icon[diagsw0] \icon[diagne0] \icon[diagnw0]"

			if("diag_corner_b")
				var/icon/diag_corner_b = icon(sourceIcon, state)

				var/icon/diagse1 = icon(diag_corner_b) //No work
				outputIcon.Insert(diagse1, "d-se-0")

				var/icon/diagsw1 = icon(diag_corner_b)
				diagsw1.Turn(90)
				outputIcon.Insert(diagsw1, "d-sw-0")

				var/icon/diagne1 = icon(diag_corner_b)
				diagne1.Turn(-90)
				outputIcon.Insert(diagne1, "d-ne-0")

				var/icon/diagnw1 = icon(diag_corner_b)
				diagnw1.Turn(180)
				outputIcon.Insert(diagnw1, "d-nw-0")

				world << "Diag_Corner_B: \icon[diag_corner_b] -> \icon[diagse1] \icon[diagsw1] \icon[diagne1] \icon[diagnw1]"

*/

		fcopy(outputIcon, filename)	//Update output icon each iteration
	world << "Finished [filename]!"
