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
			"Tape cut",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Tape cut"
		)
		src.messages = list(
			"Day 4 at the TRL, around lunch time. Seems like everyone just calls it TRL or 'the lab', instead of calling it Temporal Research Laboratory 1. Which is fair enough. ",
			"My cover remains intact, although-",
			"*static*",
			"-seems to be a bit suspicious of me. Then again, I am the first new hire they've had in months. It's fairly close knit here.",
			"*sound of a door opening*",
			"Someone threw up in the bar again. Sorry... Can you clean it up please?",
			"Oh, yeah, sure, just give me a second.",
			"*click*",
			"Okay, so, bit of an update, it's now a few hours later, they just announced that they've quarantined the whole facility. No contact in or out.",
			"*deep breaths*",
			"Seems like no one in or out, so no one's going to be picking up these audio logs for a while. I'll be stashing them in the drop off points agreed upon beforehand... but it may be a while before, well, yeah.",
			"Doesn't seem like anyone knows why they've done it either. I'll try and find out, of course.",
			"*click*"
		)

/obj/item/audio_tape/temporal_labs/day_eight
	New()
		..()
		src.speakers = list(
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"tape cut",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"tape cut"
		)
		src.messages = list(
			"Day 8, almost curfew. Haven't made a log in a few days, been really busy. Tensions are high.",
			"As far as I can tell, they're running some kind of very sensitive experiment involving quantum shit. Time based, obviously. Not sure of the specifics yet.",
			"They have this crate sitting in the main chamber. It's apparently full of high quality telecrystal.",
			"*inhales a shaky breath*",
			"A crate that size? Got to be worth more than, I dunno, multiple countries. No idea what they need it for. I'll keep you posted.",
			"*click*",
			"...",
			"There's three more crates now. All telecrystal. I'm honestly scared to go into that chamber.",
			"...",
			"*click*"
		)
