// ---- master ---- \\

/singleton/hierarchy/mil_uniform
	var/list/faction = null


/singleton/hierarchy/mil_uniform/ec
	name = "Master EC outfit"
	hierarchy_type = /singleton/hierarchy/mil_uniform/ec
	branches = list(/datum/mil_branch/contractor) // they can be only contractors
	faction = FACTION_EXPEDITIONARY

	pt_under = /obj/item/clothing/under/solgov/pt/expeditionary
	pt_shoes = /obj/item/clothing/shoes/black

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary
	utility_shoes = /obj/item/clothing/shoes/dutyboots
	utility_hat = /obj/item/clothing/head/soft/solgov/expedition
	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition, /obj/item/clothing/head/ushanka/solgov, /obj/item/clothing/suit/storage/hooded/wintercoat/solgov, /obj/item/clothing/shoes/jackboots/unathi)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary
	service_hat = /obj/item/clothing/head/solgov/service/expedition

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt
	dress_over = /obj/item/clothing/suit/storage/solgov/dress/expedition
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_heels = /obj/item/clothing/shoes/dressheels
	dress_hat = /obj/item/clothing/head/solgov/service/expedition

	dress_gloves = /obj/item/clothing/gloves/white

	dress_extra = list(
		/obj/item/clothing/accessory/solgov/ec_scarf,
		/obj/item/clothing/suit/storage/solgov/dress/expedition/senior,
		/obj/item/clothing/suit/storage/solgov/dress/expedition/chief,
		/obj/item/clothing/suit/storage/solgov/dress/expedition/command,
		/obj/item/clothing/head/solgov/service/expedition/command
	)


// ---- ENGI ---- \\

/singleton/hierarchy/mil_uniform/ec/eng
	name = "EC engineering"
	departments = ENG

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/engineering
	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition/engineering,
						 /obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/shoes/jackboots/unathi,
						 /obj/item/clothing/gloves/thick/duty/solgov/eng)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/engineering

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/engineering
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt/engineering

// ---- SEC ---- \\

/singleton/hierarchy/mil_uniform/ec/sec
	name = "EC security"
	departments = SEC

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/security
	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition/security,
						 /obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/gloves/thick/duty/solgov/sec)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/security

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/security
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt/security

// ---- MEDICS ---- \\


/singleton/hierarchy/mil_uniform/ec/med
	name = "EC medical"
	departments = MED

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/medical
	utility_extra = list(
						 /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical,
						 /obj/item/clothing/head/beret/solgov/expedition/medical,
						 /obj/item/clothing/head/beret/solgov/expedition/command,
						 /obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/gloves/thick/duty/solgov/med)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/medical
	service_extra = list(
		/obj/item/clothing/suit/storage/solgov/service/expeditionary/command/medical
	)

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/medical
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt/medical

	dress_extra = list(
		/obj/item/clothing/under/solgov/dress/expeditionary/command/medical,
		/obj/item/clothing/under/solgov/dress/expeditionary/command/skirt/medical,
		/obj/item/clothing/accessory/solgov/ec_scarf,
		/obj/item/clothing/suit/storage/solgov/dress/expedition/senior,
		/obj/item/clothing/suit/storage/solgov/dress/expedition/chief,
		/obj/item/clothing/suit/storage/solgov/dress/expedition/command,
		/obj/item/clothing/head/solgov/service/expedition/command
	)

// ---- Service ---- \\

/singleton/hierarchy/mil_uniform/ec/srv
	name = "EC service"
	departments = SRV

	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition/service,
						 /obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/gloves/thick/duty/solgov/svc)
	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/service

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/service

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/service
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt/service

// ---- EC EXP ---- \\

/singleton/hierarchy/mil_uniform/ec/exp
	name = "EC exploration"
	departments = EXP

	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition/exploration,
						 /obj/item/clothing/head/beret/solgov/expedition/command,
						 /obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/gloves/thick/duty/solgov/exp)
	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/exploration

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/exploration

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/exploration
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt/exploration

/singleton/hierarchy/mil_uniform/ec/exp/officer
	name = "EC exploration CO"
	// min_rank = 11

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/officer/exploration
	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition/command,
						 /obj/item/clothing/head/beret/solgov/expedition/exploration,
						 /obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/shoes/jackboots/unathi,
						 /obj/item/clothing/gloves/thick/duty/solgov/exp)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/command/exploration
	service_hat = /obj/item/clothing/head/solgov/service/expedition/command

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/command/exploration
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/command/skirt/exploration
	dress_over = /obj/item/clothing/suit/storage/solgov/dress/expedition/command
	dress_hat = /obj/item/clothing/head/solgov/service/expedition/command

// ---- SUPPLY ---- \\

/singleton/hierarchy/mil_uniform/ec/sup
	name = "EC supply"
	departments = SUP

	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition/supply,
						 /obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/gloves/thick/duty/solgov/sup)
	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/supply

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/supply

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/supply
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt/supply

	// ---- Science ---- \\


/singleton/hierarchy/mil_uniform/ec/sci
	name = "EC science"
	departments = SCI

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/research
	utility_extra = list(/obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/head/beret/solgov/expedition/command,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/suit/storage/toggle/labcoat/science/ec,
						 /obj/item/clothing/gloves/thick/duty/solgov/sci)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/research

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/research
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt/research

/singleton/hierarchy/mil_uniform/ec/sci/officer
	name = "EC science CO"
	// min_rank = 11

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary/officer/research
	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition/command,
						 /obj/item/clothing/head/ushanka/solgov,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov,
						 /obj/item/clothing/suit/storage/toggle/labcoat/science/ec,
						 /obj/item/clothing/gloves/thick/duty/solgov/sci)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary/command/research
	service_hat = /obj/item/clothing/head/solgov/service/expedition/command

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary/command/research
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/command/skirt/research
	dress_over = /obj/item/clothing/suit/storage/solgov/dress/expedition/command
	dress_hat = /obj/item/clothing/head/solgov/service/expedition/command
