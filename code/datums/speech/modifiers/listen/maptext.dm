TYPEINFO(/datum/listen_module/modifier/maptext)
	id = "maptext"
/datum/listen_module/modifier/maptext
	id = "maptext"

	process(datum/say_message/message)
		if(!message.heard_range || message.flags & SAYFLAG_NO_MAPTEXT)
			return message

		var/image/chat_maptext/chat_text = null

		if(!message.maptext_css_values["color"])
			var/num = hex2num(copytext(md5(message.speaker.name), 1, 7))
			message.maptext_css_values["color"] = hsv2rgb(num % 360, (num / 360) % 10 + 18, num / 360 / 10 % 15 + 85)

		var/maptext_css = ""
		for(var/key in message.maptext_css_values)
			maptext_css += "[key]: [message.maptext_css_values[key]]; "

		chat_text = make_chat_maptext(message.speaker, message.content, maptext_css)

		if(length(message.maptext_animation_colors))
			for(var/i in 1 to length(message.maptext_animation_colors))
				if(message.maptext_animation_colors[i] == "start_color")
					message.maptext_animation_colors[i] = message.maptext_css_values["color"]
			oscillate_colors(chat_text, message.maptext_animation_colors)

		if(chat_text)
			if(!message.speaker.chat_text)
				message.speaker.chat_text = new(null, message.speaker) //lazy init maptext holder for atoms
			var/obj/chat_maptext_holder/holder = message.speaker.chat_text

			for(var/image/chat_maptext/I in holder.lines)
				if(I != chat_text)
					I.bump_up(chat_text.measured_height)

			message.maptext = chat_text
		return message
