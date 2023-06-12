TYPEINFO(/datum/listen_module/input/ears)
	id = "ears"
/datum/listen_module/input/ears
	id = "ears"
	channel = SAY_CHANNEL_OUTLOUD

	process(datum/say_message/message)
		if(message.heard_range == 0)
			if(src.parent_tree.parent == message.speaker.loc) //range 0 means it's only audible if it's from inside you (ie radios, direct messages)
				. = ..()
		else if(src.parent_tree.parent in hearers(message.speaker, message.heard_range)) //This isn't optimised in BYOND, hopefully it can be in OD
			. = ..()

	format(datum/say_message/message)
		//because radio messages need to impart a little extra info, but they are heard like any spoken message, we do that formatting here conditionally
		if(message.flags & SAYFLAG_RADIO_SENT)
			//radio message

			// Alright, this code is heinous and definitely needs redoing, but I'm already reworking the entirety of speech so this can be a future job
			// for some poor sap (probably me)
			// I basically just copy pasted this from /obj/item/radio and hacked it in to working form. it's bad.
			var/rendered = ""
			var/obj/item/device/radio/radio_speaker = message.speaker
			if(!istype(radio_speaker))
				CRASH("A radio message seems to have been spoken by a thing that wasn't a radio. Fuck.")

			// Gets the various decorators for the message, like icons, colours, special formatting
			var/secure =  length(message.prefix) > 1 ? radio_speaker.secure_frequencies[radio_speaker.secure_frequencies[copytext(message.prefix, 2, length(message.prefix))]] : null
			var/textColor = secure ? null : radio_speaker.device_color
			var/classes = ""
			if(radio_speaker.chat_class)
				classes = " [radio_speaker.chat_class]"
			if (secure)
				if(secure in radio_speaker.secure_classes)
					classes = " [radio_speaker.secure_classes["[secure]"]]"
				else
					classes = " [radio_speaker.secure_classes[1]]"
				textColor = radio_speaker.secure_colors["[secure]"]
				if (!textColor)
					if (radio_speaker.secure_colors.len)
						textColor = radio_speaker.secure_colors[1]
			var/css_style = ""
			if(textColor)
				css_style = " style='color: [textColor]'"
			var/part_a
			if (ismob(message.ident_speaker) && message.ident_speaker:mind)
				part_a = "<span class='radio[classes]'[css_style]>[radio_speaker.radio_icon(message.ident_speaker)]<span class='name' data-ctx='\ref[message.ident_speaker:mind]'>"
			else
				part_a = "<span class='radio[classes]'[css_style]>[radio_speaker.radio_icon(message.ident_speaker)]<span class='name'>"
			var/part_b = "</span><b> \[[format_frequency(radio_speaker.frequency)]\]</b> <span class='message'>"
			var/part_c = "</span></span>"

			// grab the job ID from the message's ident_speaker
			var/eqjobname = ""
			if (ishuman(message.ident_speaker))
				var/mob/living/carbon/human/H = message.ident_speaker
				if (H.wear_id)
					eqjobname = H.wear_id:assignment
				else
					eqjobname = "No ID"
			else if (isAI(message.ident_speaker))
				eqjobname = "AI"
			else if (isrobot(message.ident_speaker))
				eqjobname = "Cyborg"
			else if (istype(message.ident_speaker, /obj/machinery/computer)) // :v
				eqjobname = "Computer"
			else
				eqjobname = "Unknown"

			// Display the message
			if(message.voice_ident != message.card_ident)
				if(message.card_ident)
					rendered = "[part_a][message.card_ident][part_b][message.say_verb], \"[message.content]\"[part_c]"
				else
					rendered = "[part_a][message.voice_ident][part_b][message.say_verb], \"[message.content]\"[part_c]"

			var/mob/recieve_mob = src.parent_tree.parent
			if(istype(recieve_mob))
				if (recieve_mob.isAIControlled())
					rendered = "[part_a]<a href='?src=\ref[src];track3=[message.real_ident];track2=\ref[recieve_mob];track=\ref[message.ident_speaker]'>[message.real_ident] ([eqjobname]) </a>[part_b][message.say_verb], \"[message.content]\"[part_c]"

				if (recieve_mob.client && recieve_mob.client.holder && ismob(message.ident_speaker) && message.ident_speaker:mind)
					rendered = "<span class='adminHearing' data-ctx='[recieve_mob.client.chatOutput.getContextFlags()]'>[rendered]</span>"
			return rendered
		else
			//normal spoken message
			.=..() //just do default behaviour
