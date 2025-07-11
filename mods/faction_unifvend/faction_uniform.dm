/obj/item/card/id
	var/faction

/obj/item/card/id/Initialize()
	. = ..()
	if(istype(loc, /mob/living/carbon)) // might give us some runtime, cause
		var/mob/living/carbon/card_owner = loc
		faction = card_owner.client.prefs.cultural_info[TAG_FACTION] // need that for no char.setup abuse


/obj/machinery/uniform_vendor/faction
	name = "uniform vendor"
	desc= "A uniform vendor for utility, service, and dress uniforms."
	icon = 'icons/obj/machines/vending.dmi'
	icon_state = "uniform"
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	density = TRUE

	// Power
	use_power = 1
	idle_power_usage = 10
	vend_power_usage = 150 //actuators and stuff


/obj/machinery/uniform_vendor/faction/interact(mob/user)
	var/dat = list()
	dat += "User ID: <a href='byond://?src=\ref[src];ID=1'>[ID ? "[ID.registered_name], [ID.military_rank], [ID.military_branch]" : "--------"]</a>"
	dat += "<hr>"
	if(!ID)
		dat += "Insert your ID card to proceed."
	else
		var/datum/job/job = SSjobs.get_by_path(ID.job_access_type)
		if(job)
			uniforms = find_uniforms(ID.military_rank, ID.military_branch, job.department_flag, ID.faction) /////////////////////////////////////
		for(var/T in uniforms)
			dat += "<b>[T]</b> <a href='byond://?src=\ref[src];get_all=[T]'>Select All</a>"
			var/list/uniform = uniforms[T]
			for(var/piece in uniform)
				if(piece)
					var/obj/item/clothing/C = piece
					if(piece in selected_outfit)
						dat += "<span class='linkOn'>[sanitize(initial(C.name))]</span><a href='byond://?src=\ref[src];rem=\ref[piece]'>X</a>"
					else if (can_issue(C))
						dat += "<a href='byond://?src=\ref[src];add=\ref[piece]'>[sanitize(initial(C.name))]</a>"
					else
						dat += "[sanitize(initial(C.name))] (ISSUED)"
			dat += "<hr>"
		dat += "<a href='byond://?src=\ref[src];vend=[1]'>Dispense</a>"
	dat = jointext(dat,"<br>")
	var/datum/browser/popup = new(user, "Uniform Dispenser","Uniform Dispenser", 300, 700, src)
	popup.set_content(dat)
	popup.open()

/*	Outfit structures
	branch
	branch/department
	branch/department/officer
	branch/department/officer/command

	The one exception to the above is the command department, due to the fact that you have to be an officer to
	be in command, and there are no variants as a result. Also no special CO uniform :(
*/
/obj/machinery/uniform_vendor/faction/find_uniforms(datum/mil_rank/user_rank, datum/mil_branch/user_branch, department, datum/preferences/user_faction) //returns 1 if found branch and thus has a base uniform, 2, branch and department, 0 if failed.
	var/singleton/hierarchy/mil_uniform/user_outfit = GET_SINGLETON(/singleton/hierarchy/mil_uniform)
	var/mil_uniforms = user_outfit

	if(istype(user_branch, /datum/mil_branch/contractor)) // Only contractors should be have in-faction fluff
		for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children) // If not contractor, we should check a branch
			if(user_faction == child.faction)
				user_outfit = child

	else
		for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children) // If not contractor, we should check a branch
			if(istype(user_branch,child.branches))
				user_outfit = child

	if(user_outfit == mil_uniforms) //We haven't found a branch/faction
		return null //Return no uniforms, which will cause the machine to spit out an error.

	// we have found a branch.
	if(department == COM) //Command only has one variant and they have to be an officer
		for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children)
			if(child.departments & COM)
				user_outfit = child
				for(var/singleton/hierarchy/mil_uniform/seniorchild in user_outfit.children) //Check for variants of command outfits
					if(user_rank.sort_order >= seniorchild.min_rank && user_outfit.min_rank < seniorchild.min_rank)
						user_outfit = seniorchild
	else
		var/tmp_department = department
		tmp_department &= ~COM //Parse departments, with complete disconsideration to the command flag (so we don't flag 2 outfit trees)

		for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children) //find base department outfit
			if(child.departments & tmp_department)
				user_outfit = child
				break
		for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children) //find highest applicable ranking department outfit
			if(user_rank.sort_order >= child.min_rank && user_outfit.min_rank < child.min_rank)
				user_outfit = child
		if(department & COM) //user is in command of their department
			if(user_outfit.children[1])// Command outfit exists
				user_outfit = user_outfit.children[1]
				for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children) //Check for variants of command outfits
					if(user_rank.sort_order >= child.min_rank && user_outfit.min_rank < child.min_rank)
						user_outfit = child

	return populate_uniforms(user_outfit) //Generate uniform lists.
/*
/obj/machinery/uniform_vendor/faction/populate_uniforms(singleton/hierarchy/mil_uniform/user_outfit) // We need it for Away-locs and others
	var/list/res = list()
	res["PT"] = list(
		user_outfit.pt_under,
		user_outfit.pt_shoes
		)

	res["Utility"] = list(
		user_outfit.utility_under,
		user_outfit.utility_shoes,
		user_outfit.utility_hat
		)
	if (user_outfit.utility_extra)
		res["Utility Extras"] = user_outfit.utility_extra

	res["Service"] = list(
		user_outfit.service_under,
		user_outfit.service_skirt,
		user_outfit.service_over,
		user_outfit.service_shoes,
//		user_outfit.service_heels,
		user_outfit.service_hat,
		user_outfit.service_gloves
		)
	if(user_outfit.service_extra)
		res["Service Extras"] = user_outfit.service_extra

	res["Dress"] = list(
		user_outfit.dress_under,
		user_outfit.dress_skirt,
		user_outfit.dress_over,
		user_outfit.dress_shoes,
//		user_outfit.dress_heels,
		user_outfit.dress_hat,
		user_outfit.dress_gloves
		)
	if(user_outfit.dress_extra)
		res["Dress Extras"] = user_outfit.dress_extra

	return res
*/
