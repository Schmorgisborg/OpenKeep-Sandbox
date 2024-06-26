///AI Upgrades


//Malf Picker
/obj/item/malf_upgrade
	name = "combat software upgrade"
	desc = ""
	icon = 'icons/obj/module.dmi'
	icon_state = "datadisk3"


/obj/item/malf_upgrade/afterattack(mob/living/silicon/ai/AI, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(!istype(AI))
		return
	if(AI.malf_picker)
		AI.malf_picker.processing_time += 50
		to_chat(AI, "<span class='danger'>[user] has attempted to upgrade you with combat software that you already possess. You gain 50 points to spend on Malfunction Modules instead.</span>")
	else
		to_chat(AI, "<span class='danger'>[user] has upgraded you with combat software!</span>")
		to_chat(AI, "<span class='danger'>My current laws and objectives remain unchanged.</span>") //this unlocks malf powers, but does not give the license to plasma flood
		AI.add_malf_picker()
		AI.hack_software = TRUE
		log_game("[key_name(user)] has upgraded [key_name(AI)] with a [src].")
		message_admins("[ADMIN_LOOKUPFLW(user)] has upgraded [ADMIN_LOOKUPFLW(AI)] with a [src].")
	to_chat(user, "<span class='notice'>I upgrade [AI]. [src] is consumed in the process.</span>")
	qdel(src)


//Lipreading
/obj/item/surveillance_upgrade
	name = "surveillance software upgrade"
	desc = ""
	icon = 'icons/obj/module.dmi'
	icon_state = "datadisk3"

/obj/item/surveillance_upgrade/afterattack(mob/living/silicon/ai/AI, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(!istype(AI))
		return
	if(AI.eyeobj)
		AI.eyeobj.relay_speech = TRUE
		to_chat(AI, "<span class='danger'>[user] has upgraded you with surveillance software!</span>")
		to_chat(AI, "Via a combination of hidden microphones and lip reading software, you are able to use my cameras to listen in on conversations.")
	to_chat(user, "<span class='notice'>I upgrade [AI]. [src] is consumed in the process.</span>")
	log_game("[key_name(user)] has upgraded [key_name(AI)] with a [src].")
	message_admins("[ADMIN_LOOKUPFLW(user)] has upgraded [ADMIN_LOOKUPFLW(AI)] with a [src].")
	qdel(src)
