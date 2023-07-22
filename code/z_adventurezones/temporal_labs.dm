// stuff for TRL-1 by Tyrant.

/area/temporal_labs
	name = "Temporal Research Facility 1"
	icon_state = "red"

/area/temporal_labs/void
	icon_state = "purple"


/obj/item/device/audio_log/temporal_labs
	New()
		..()
		src.tape = new /obj/item/audio_tape/temporal_labs/1(src)

// they'll find the tapes lying around and have to put them into the audio log device to read them, is the idea.
// this abstract parent is to organise it
ABSTRACT_TYPE(/obj/item/audio_tape/temporal_labs)
/obj/item/audio_tape/temporal_labs

/obj/item/audio_tape/temporal_labs/day_four
	New()
		..()
		src.speakers = list(
			"Quiet Voice",
			"Quiet Voice",
			"???",
			"Quiet Voice",
			"???",
			"Different Voice",
			"Quiet Voice",
			"Tape cut"
		)
		src.messages = list(
			"Day 4 at the TRL. Seems like everyone just calls it TRL or 'the lab', instead of calling it Temporal Research Laboratory 1. Which is fair enough. ",
			"My cover remains intact, although-",
			"*static*",
			"-seems to be a bit suspicious of me. Then again, I am the first new hire they've had in months. It's fairly close knit here.",
			"*sound of a door opening*",
			"Someone threw up in the bar again. Sorry... Can you clean it up please?",
			"Oh, yeah, sure, just give me a second.",
			"*click*"
		)
