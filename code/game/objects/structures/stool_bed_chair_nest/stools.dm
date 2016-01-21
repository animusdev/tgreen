// stool in hands
/obj/item/weapon/stool
	name = "stool"
	r_name = "�������"
	desc = "Apply butt."
	icon = 'icons/obj/objects.dmi'
	icon_state = "stool"
	force = 10
	throwforce = 10
	w_class = 5

/obj/item/weapon/stool/attack(mob/M as mob, mob/user as mob)
	if (prob(5) && istype(M,/mob/living))
		user.visible_message("<span class='danger'>[user] breaks [src] over [M]'s back!</span>")
		user.remove_from_mob(src)
		qdel(src)
		var/mob/living/T = M
		T.Weaken(10)
		T.apply_damage(20)
		return
	..()

/obj/item/weapon/stool/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(50))
				qdel(src)
				return
		if(3.0)
			if (prob(5))
				qdel(src)
				return

/obj/item/weapon/stool/blob_act()
	if(prob(75))
		qdel(src)