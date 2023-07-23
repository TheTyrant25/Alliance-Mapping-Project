// stuff for TRL-1 by Tyrant.

/area/temporal_labs
	name = "Temporal Research Facility 1"
	icon_state = "red"

/area/temporal_labs/void
	icon_state = "purple"


/obj/item/device/audio_log/temporal_labs
	New()
		..()
		src.tape = new /obj/item/audio_tape/temporal_labs/day_four(src)

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

/obj/item/audio_tape/temporal_labs/day_nine
	New()
		..()
		src.speakers = list(
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"tape cut"
		)
		src.messages = list(
			"...",
			"There's telecrystal dust in the air. Everyone seems to be coughing.",
			"...",
			"The scientists seem a bit... manic. Like they're on a schedule. All us other staff are a bit worried.",
			"...",
			"*click*"
		)

/obj/item/audio_tape/temporal_labs/day_eleven
	New()
		..()
		src.speakers = list(
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"tape cut"
		)
		src.messages = list(
			"Okay, so, shit's gotten really really weird. Apparently, in two days time, they're going to do a big experiment.",
			"The effects of it are so strong that it's bleeding BACKWARD in time, affecting us in the present. Which is... insane.",
			"People are getting stuck in time loops. They're remembering false histories. Someone got crushed by a doorway and then uncrushed and started walking backwards.",
			"The weirdest part has to be the remembering stuff that hasn't happened. I'm beginning to lose track of what actually happened in my childhood.",
			"Hell, I can remember being called at least 4 other names, in different upbringings. I see my name on my ID and get surprised by it sometimes. Like it's not correct.",
			"...",
			"... to summarise, it's getting really weird here. Operative Saturn out. I think. I hope that's my name.",
			"*click*"
		)

/obj/item/audio_tape/temporal_labs/day_twelve
	New()
		..()
		src.speakers = list(
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"tape cut"
		)
		src.messages = list(
			"Nearly every piece of writing is now just a smear of ink or graphite. Especially names.",
			"I can't remember which name is mine.",
			"Oh, and my cover is blown. Everyone knows that I work for NT now. Or was it the syndicate?",
			"It doesn't matter. Everyone remembers working for everyone else. I really hope tomorrow's experiment fixes all this."
			"Operative, uh... something. Signing out. Fuck- did I already record this? I think I did. Damn."
			"Why am I still making these? I already have them on my desk. I- wait. No, that hasn't happened yet. I think?"
			"*click*"
		)

/obj/item/audio_tape/temporal_labs/day_thirteen
	New()
		..()
		src.speakers = list(
			"???",
			"Quiet Voice",
			"Loud Voice",
			"???",
			"Electronic Voice",
			"Confused Voice",
			"Manic Voice",
			"Calmer Voice",
			"Manic Voice",
			"distant sounding voice",
			"Electronic Voice",
			"Loud Voice",
			"Calmer Voice",
			"Quiet Voice",
			"Manic Voice",
			"???",
			"Quiet Voice",
			"???",
			"Manic Voice",
			"???",
			"???"
			"tape cut",
			"Quiet Voice",
			"Quiet Voice",
			"???",
			"Quiet Voice",
			"???",
			"Quiet Voice",
			"???",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice",
			"Quiet Voice, which you realise sounds a lot like your own voice"
			"tape cut"
		)
		src.messages = list(
			"*murmuring of voices in the background*",
			"Today's the day. Time to see what it's all about.",
			"Still making those?",
			"...",
			"INITIALISING FIRST CONTACT. ALL STAFF, BRACE FOR POSSIBLE SIDE EFFECTS.",
			"Wait, what's happening again?",
			"We're going to breach Time, fools. We're about to Time travel. Not backwards, not forwards. Sideways. Into the Trunk.",
			"What they mean to say is that Time is like a grand tree, with the bulk of the trunk actually being thousands of branches running side by side. And in the same direction.",
			"We welcome you, spirits of the beyond! Siblings of Entropy! We hear you! Do you hear us?",
			"-ly need more coffee f-",
			"POWER UP COMPLETE. OPENING GATEWAY IN T-MINUS 30.",
			"Did they really use all of that telecrystal? Seems overkill.",
			"We're about to open a fucking door to another timeline. No such thing as overkill, I'd say.",
			"Is it safe to stand here?",
			"Nope! Definitely not!",
			"*flabbergasted gasping and spluttering*",
			"What the- f- fuck-, I'm out, fuck this-",
			"*sounds of running*",
			"COWARD! GET BACK HERE AND-",
			"*loud static*",
			"*screaming, interspersed with static. A great rumbling boom is also heard in the background.*",
			"*static*",
			"...",
			"*giggling*",
			"Can I get some linear topology? Sorry, time broke. Understandable. Have a nice day.",
			"*unhinged laughter*",
			"Fucking idiots-",
			"*even more laughter*",
			"Didn't they know? That the other timelines? They also have the labs?",
			"Congratulations, dear listener. If you've found me, you're outside of Time and Space. All pasts are true. You've always been here anyway. Waiting for yourself.",
			"...",
			"The end of time, huh? What happens next?",
			"...",
			"As far as I can tell, this is the end. There is no more future.",
			"Just rocking gently back and forth over the hours before the implosion.",
			"An endless day. Again. And again.",
			"The end of the universe, forever.",
			"...",
			"Endless looped time, with a sea of stars above me...",
			"Could've been worse, honestly.",
			"See you soon.",
			"*click*"
		)
