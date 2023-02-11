ABSTRACT_TYPE(/obj/item/clothing/head/flower)
/obj/item/clothing/head/flower
// hi flourish. Plant pot stuff for in future can go here i guess.
	max_stack = 10 //this seems about right.
	var/can_bouquet = FALSE
	attackby(obj/item/W, mob/user)
		if (istype(W, /obj/item/paper))
			make_bouquet(src, W, user)

/obj/item/clothing/head/flower/proc/make_bouquet(obj/item/paperitem, mob/user)
	if (!src.can_bouquet)
		user.visible_message("This flower can't be turned into a bouquet!")
		return
	var/obj/item/bouquet/new_bouquet = new
	paperitem.set_loc(new_bouquet.paperused)
	var/obj/item/clothing/head/flower/allocated_flower = src.split_stack(1)
	allocated_flower.set_loc(new_bouquet.flower1)
	user.visible_message("[user] rolls up a [src] into a bouquet.", "You roll up the [src] into a bouquet.")

/obj/item/clothing/head/flower/rafflesia
	name = "rafflesia"
	desc = "Usually reffered to as corpseflower due to its horrid odor, perfect for masking the smell of your stinky head."
	icon_state = "rafflesiahat"
	item_state = "rafflesiahat"

/obj/item/clothing/head/flower/gardenia
	name = "gardenia"
	desc = "A delicate flower from the Gardenia shrub native to Earth, trimmed for you to wear. These white flowers are known for their strong and sweet floral scent."
	icon_state = "flower_gard"
	item_state = "flower_gard"

/obj/item/clothing/head/flower/bird_of_paradise
	name = "bird of paradise"
	desc = "Bird of Paradise flowers, or Crane Flowers, are named for their resemblance to the ACTUAL birds of the same name. Both look great sitting on your head either way."
	icon_state = "flower_bop"
	item_state = "flower_bop"

/obj/item/clothing/head/flower/hydrangea
	name = "hydrangea"
	desc = "Hydrangeas are popular ornamental flowers due to their colourful, pastel flower arrangements; this one has been trimmed nicely for wear as an accessory."
	icon_state = "flower_hyd"
	item_state = "flower_hyd"
	can_bouquet = TRUE
	pink
		name = "pink hydrangea"
		icon_state = "flower_hyd-pink"
		item_state = "flower_hyd-pink"
	blue
		name = "blue hydrangea"
		icon_state = "flower_hyd-blue"
		item_state = "flower_hyd-blue"
	purple
		name = "purple hydrangea"
		icon_state = "flower_hyd-purple"
		item_state = "flower_hyd-purple"

/obj/item/clothing/head/flower/lavender
	name = "lavender"
	desc = "Lavender is usually used as an ingredient or as a source of essential oil; you can tuck a sprig behind your ear for that garden aesthetic too."
	icon_state = "flower_lav"
	item_state = "flower_lav"
	can_bouquet = TRUE
	New()
		src.create_reagents(100)
		..()

/obj/item/clothing/head/flower/rose
	name = "rose"
	desc = "By any other name, would smell just as sweet. This one likes to be called "
	icon = 'icons/obj/hydroponics/items_hydroponics.dmi'
	icon_state = "rose"
	can_bouquet = TRUE
	var/thorned = TRUE
	var/backup_name_txt = "names/first.txt"
	proc/possible_rose_names()
		var/list/possible_names = list()
		for(var/mob/M in mobs)
			if(!M.mind)
				continue
			if(ishuman(M))
				if(iswizard(M))
					continue
				if(isnukeop(M))
					continue
				possible_names += M
		return possible_names

	New()
		..()
		var/list/possible_names = possible_rose_names()
		var/rose_name
		if(!length(possible_names))
			rose_name = pick_string_autokey(backup_name_txt)
		else
			var/mob/chosen_mob = pick(possible_names)
			rose_name = chosen_mob.real_name
		desc = desc + rose_name + "."

	attack_hand(mob/user)
		var/mob/living/carbon/human/H = user
		if(istype(H) && src.thorned)
			if (src.thorns_protected(H))
				..()
				return
			if(ON_COOLDOWN(src, "prick_hands", 1 SECOND))
				return
			src.prick(user)
		else
			..()

	proc/thorns_protected(mob/living/carbon/human/H)
		if (H.hand)//gets active arm - left arm is 1, right arm is 0
			if (istype(H.limbs.l_arm,/obj/item/parts/robot_parts) || istype(H.limbs.l_arm,/obj/item/parts/human_parts/arm/left/synth))
				return TRUE
		else
			if (istype(H.limbs.r_arm,/obj/item/parts/robot_parts) || istype(H.limbs.r_arm,/obj/item/parts/human_parts/arm/right/synth))
				return TRUE
		if(H.gloves)
			return TRUE

	proc/prick(mob/M)
		boutput(M, "<span class='alert'>You prick yourself on [src]'s thorns trying to pick it up!</span>")
		random_brute_damage(M, 3)
		take_bleeding_damage(M, null, 3, DAMAGE_STAB)

	attackby(obj/item/W, mob/user)
		if (issnippingtool(W) && src.thorned)
			boutput(user, "<span class='notice'>You snip off [src]'s thorns.</span>")
			src.thorned = FALSE
			src.desc += " Its thorns have been snipped off."
			return
		..()

	attack(mob/living/carbon/human/M, mob/user, def_zone)
		if (istype(M) && !(M.head?.c_flags & BLOCKCHOKE) && def_zone == "head")
			M.tri_message(user, "<span class='alert'>[user] holds [src] to [M]'s nose, letting [him_or_her(M)] take in the fragrance.</span>",
				"<span class='alert'>[user] holds [src] to your nose, letting you take in the fragrance.</span>",
				"<span class='alert'>You hold [src] to [M]'s nose, letting [him_or_her(M)] take in the fragrance.</span>"
			)
			return TRUE
		..()

	pickup(mob/user)
		. = ..()
		if(ishuman(user) && src.thorned && !src.thorns_protected(user))
			src.prick(user)
			SPAWN(0.1 SECONDS)
				user.drop_item(src, FALSE)

/obj/item/clothing/head/flower/rose/poisoned
	///Trick roses don't poison on attack, only on pickup
	var/trick = FALSE
	attack(mob/M, mob/user, def_zone)
		if (!..() || is_incapacitated(M) || src.trick)
			return
		src.poison(M)

	prick(mob/user)
		..()
		src.poison(user)

	proc/poison(mob/M)
		if (!M.reagents?.has_reagent("capulettium"))
			if (M.mind?.assigned_role == "Mime")
				//since this is used for faking your own death, have a little more reagent
				M.reagents?.add_reagent("capulettium_plus", 20)
				//mess with medics a little
				M.bioHolder.AddEffect("dead_scan", timeleft = 40 SECONDS, do_stability = FALSE, magical = TRUE)
			else
				M.reagents?.add_reagent("capulettium", 13)
		//DO NOT add the SECONDS define to this, bioHolders are cursed and don't believe in ticks
		M.bioHolder?.AddEffect("mute", timeleft = 40, do_stability = FALSE, magical = TRUE)

/obj/item/clothing/head/flower/rose/holorose
	name = "holo rose"
	desc = "A holographic display of a Rose. This one likes to be called "
	icon_state = "holorose"
	backup_name_txt = "names/ai.txt"

	possible_rose_names()
		var/list/possible_names = list()
		for(var/mob/living/silicon/M in mobs)
			possible_names += M
		return possible_names

/obj/item/clothing/head/flower/poppy
	name = "poppy"
	desc = "A distinctive red flower."
	icon = 'icons/obj/hydroponics/items_hydroponics.dmi'
	icon_state = "poppy"
	can_bouquet = TRUE

// I'm putting the bouquet code here because for some reason bouquet.dm wasnt compiling
ABSTRACT_TYPE(/obj/item/bouquet)
/obj/item/bouquet
	name = "empty bouquet"
	desc = "If you're seeing this, something's wrong"
	var/max_flowers = 3
	var/min_flowers = 1 // can't have a bouquet with no flowers
	var/paperused = null
	var/flower1 = null
	var/flower2 = null
	var/flower3 = null
	var/hiddenitem = null
	attackby(obj/item/W, mob/user)
		// should give us back the paper and flowers when done with snipping tool
		if (issnippingtool(W))
			boutput(user, "<span class='notice'>You disassemble the [src].</span>")
			playsound(src.loc, 'sound/items/Scissor.ogg', 30, 1)
			qdel(src)
		if (istype(W, /obj/item/clothing/head/flower))
			var/obj/item/clothing/head/flower/dummy_flower = W
			if (!dummy_flower.can_bouquet)
				user.visible_message("This flower can't be turned into a bouquet!")
				return
			if (!isnull(src.flower3))
				user.visible_message("This bouquet is full!")
				return
			// now we pick where it goes
			var/targetslot = src.flower3
			if (isnull(flower2))
				targetslot = src.flower2
			W.set_loc(targetslot)
			qdel(targetslot)
	attack_self(mob/user)
		if (isnull(src.flower2))
			return
		if (isnull(src.flower3))
			swapflowers(src.flower1, src.flower2)
			return
		// in order to reshuffle 3 flowers and get every possible arrangement, we can either:
		// take the front one and put it at the back 123 -> 231 or 312
		// or swap two 123 -> 213 or 132 or 321
		// gonna make it random between the second method so that flower reshuffling is more random
		// of course if you want it in an actual order just put them in in the right order silly
		var/reshuffle_cycle = pick(1, 2, 3)
		if (reshuffle_cycle == 1)
			swapflowers(src.flower1, src.flower2)
		else if (reshuffle_cycle == 2)
			swapflowers(src.flower2, src.flower3)
		else
			swapflowers(src.flower1, src.flower3)
		qdel(reshuffle_cycle)
	proc/swapflowers(f1,f2)
			var/tempflower = f1
			f1 = f2
			f2 = tempflower
			qdel(tempflower)

