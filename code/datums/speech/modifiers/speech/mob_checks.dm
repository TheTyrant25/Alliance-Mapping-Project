//This one isn't great, but there were a bunch of "can I speak" checks and a modifier for each one seemed bad
TYPEINFO(/datum/speech_module/modifier/mob_checks)
	id = "mob_checks"
/datum/speech_module/modifier/mob_checks
	id = "mob_checks"

	process(datum/say_message/message)
		. = message
		var/mob/M = message.speaker
		if(!istype(M))
			CRASH("Someone put a mob_checks speech mod on a not mob thing. You can't do that!")

		if(!M.canspeak)
			boutput(M, "<span class='alert'>You can not speak!</span>")
			return null

		//this one should maybe instead be a modifier that gets added when you equip a muzzle - TODO
		if (M.wear_mask && M.wear_mask.is_muzzle)
			boutput(M, "<span class='alert'>Your muzzle prevents you from speaking.</span>")
			return null
