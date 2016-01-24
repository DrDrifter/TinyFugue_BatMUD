
/require -q bat-generic.tf
/require -q protter.tf

/set weapon_mount=whip
/set weapon_standard=empy
/set wielded=empy
/set riding_status=not
;; If you have a noble mount, enter name here. Otherwise "griffon" or "drake" or whatever
/set mount=Tassu

;; Riding state definitions
/def -F -mglob -t"You wield Empyrean, the Sheer Wrath of Unleashed fury*" empy_wielded = /set wielded=empy
/def -F -mglob -t"You wield a sturdy maul created to perfection* in your right claw." maul_wielded = /set wielded=maul
/def -F -mglob -t"You wield 16 edged hard leather whip tipped with highsteel razorblades* in your right claw." whip_wielded = /set wielded=whip
/def -F -mglob -t"You wield a leather whip in your right claw" whip2_wielded = /set wielded=whip
/def -F -mglob -t"You get up on * and begin to ride." riding_status_true = /set riding_status=riding%;/skillswap
/def -F -mglob -t"You are now off your mount." riding_status_false = @lead %{mount}%;/set riding_status=not%;/skillswap
/def -F -mglob -t"* is already being ridden!" riding_status_true_fix = /set riding_status=riding%;/skillswap

;; Skills
/def bu=/set skill=butchering%;/set targettype=misc%;/do_skill corpse
/def ca=/set skill=calm_animal%;/set targettype=mount%;/set skill_rounds=3%;/do_skill %{*}
/def em=/set skill=evaluate_mount%;/set targettype=mount%;/set skill_rounds=3%;/do_skill %{*}
/stack feral_attack off_skill_stack
/def fa=/set skill=feral_attack%;/set targettype=off%;/set skill_rounds=4%;/swapwhip%;/do_skill %{*}
/def fi=/set skill=fishing%;/set targettype=none%;/do_skill
/stack guided_strike off_skill_stack
/def gs=/set skill=guided_strike%;/set targettype=off%;/set skill_rounds=4%;/swapwhip%;/do_skill %{*}
/def he=/set skill=heel%;/set targettype=mount%;/set skill_rounds=1%;/do_skill %{*}
/def hu=/set skill=hunting%;/set targettype=none%;/set skill_rounds=6%;/do_skill
/def mcold=/set skill=ride_through_frost%;/set targettype=mount%;/set skill_rounds=4%;/swapwhip%;/do_skill %{mount}
/def mfire=/set skill=ride_through_flame%;/set targettype=mount%;/set skill_rounds=4%;/swapwhip%;/do_skill %{mount}
/def ml=/set skill=mount_lock%;/set targettype=mount%;/set skill_rounds=10%;/do_skill %{*}
/def mphys=/set skill=ride_through_pain%;/set targettype=mount%;/set skill_rounds=4%;/swapwhip%;/do_skill %{mount}
/def of=/set skill=overland_flight%;/set targettype=nav%;/set skill_rounds=2%;/do_skill %{*}
/stack rebuke off_skill_stack
/def rb=/set skill=rebuke%;/set targettype=off%;/set skill_rounds=2%;/swapwhip%;/do_skill %{*}
/def rug=/set skill=ride_underground%;/set targettype=mount%;/set skill_rounds=4%;/swapwhip%;/if (riding_status=~"riding") @dismount%;/endif%;/do_skill %{mount}
/stack stampede off_skill_stack
/def st=/set skill=stampede%;/set targettype=off%;/set skill_rounds=4%;/do_skill %{*}
/def stay=/set skill=stay%;/set targettype=mount%;/set skill_rounds=1%;/do_skill %{mount}
/def tm=/set skill=tame_mount%;/set targettype=mount%;/set skill_rounds=12%;/do_skill %{*}
/stack trample off_skill_stack
/def tr=/set skill=trample%;/set targettype=off%;/set skill_rounds=2%;/do_skill %{*}



/def cp=/set skill=camping%;/set targettype=none%;/if (riding_status=~"riding") @dismount%;/endif%;@barblullaby%;@wear replacing pimpero,tuhero%;/do_skill
/def -mglob -t"You don't quite feel like camping at the moment." campnotready = @mount %{mount}%;@party report (camp not yet ready)%;@wear replacing emerald ring 1,emerald ring 2%;/set camp=no
/def -mglob -t"You awaken from your short rest, and feel slightly better." campdone = @mount %{mount}%;@party report (done camping)%;@wear replacing emerald ring 1,emerald ring 2%;/set camp=no
/def -mglob -t"It'll be inconvenient to camp here with all this water." campwaterroom = @mount %{mount}%;@party report (water in room, camp unavailable)%;@wear replacing emerald ring 1,emerald ring 2
;;/def fb=/set skill=fire_building%;/set targettype=none%;/if (riding_status=~"riding") @dismount%;/endif%;@wear replacing notski,sytyke%;/do_skill
;;/def -mglob -t"A sense of pride overcomes you as you light the fire." firebuilt = @mount %{mount}%;@wear replacing emerald ring 1,emerald ring 2
;;/def -mglob -t"You must be outside to start a fire." fire_cant_be_built = @mount %{mount}%;@wear replacing emerald ring 1,emerald ring 2
;;/def -mglob -t"There is already a fire here." fire_already_built = @mount %{mount}%;@wear replacing emerald ring 1,emerald ring 2
;;/def -mglob -t"You can't make a fire if there is water in the room." firewaterroom = @mount %{mount}%;@party report (water in room, fire unavaliable)%;@wear replacing emerald ring 1,emerald ring 2
/def fb=/set skill=fire_building%;/set targettype=none%;/if (riding_status=~"riding") @dismount%;/endif%;/do_skill
/def -mglob -t"A sense of pride overcomes you as you light the fire." firebuilt = @mount %{mount}
/def -mglob -t"You must be outside to start a fire." fire_cant_be_built = @mount %{mount}
/def -mglob -t"There is already a fire here." fire_already_built = @mount %{mount}
/def -mglob -t"You can't make a fire if there is water in the room." firewaterroom = @mount %{mount}%;@party report (water in room, fire unavaliable)
/def -F -mglob -t"* does not seem impressed." tameagain = /tm
/def -F -mglob -t"You do something HORRIBLY wrong and piss * off!" tamefail = /tm
/def -F -mglob -t"You feed * to * who eats it." feeded_mount = /repeat -6600 1 @party report (My mount is about to get hungry!)

;; Riding trigs
/def -F -mglob -t"You are knocked off your mount!" knockedoff = /set riding_status=not%;@lead %{mount}%;/skillswap
/def -F -mglob -t"Your annoyed mount throws you!" thrownoff = /set riding_status=not%;@lead %{mount}%;/skillswap
/def -F -mglob -t"Your mount throws you!" thrownoff2 = /set riding_status=not%;@lead %{mount}%;/skillswap
/def -F -mglob -t"* is being led." release_and_mount = @mount %{mount}
/def -F -mglob -t"* cannot be ridden right now." mount_huuuungry = @party report (Mount hungry!)
/def -F -mglob -t"* gives you a big slobbery lick." mount_arrived = \
	/if ({1} =~ {mount})\
		@mount %{mount}%;\
	/else \
		@lead %{1} %{2}%;\
	/endif
/def swapmaul=/if (wielded =~ "whip") @remove whip%;@wield maul%;/endif
/def swapempy=/if (wielded =~ "whip") @remove whip%;@wield empyrean%;/endif
/def swapwhip=\
	/if (wielded=~"maul")\
		@remove maul%;@wield whip%;\
	/elseif (wielded=~"empy")\
		@remove empyrean%;@wield whip%;\
	/endif%;

;; Prot timers
/def -mglob -aB -F -t'Your mount responds to the motivation and ignores pain.' mount_phys_up=/let timenow=$[time()]%;/set prots=$(/addprot MPain_%{timenow}_1_0_%You %prots)%;/swapempy%;@party report (Ride through pain up)
/def -mglob -aB -F -t'You think that * should be worried about pain right about now.' mount_phys_down=/set prots=$(/removeprot MPain %prots)%;@party report (Ride through pain down)
/def -mglob -aB -F -t'Your mount responds to the motivation and ignores fire.' mount_fire_up=/let timenow=$[time()]%;/set prots=$(/addprot MFire_%{timenow}_1_0_%You %prots)%;/swapempy%;@party report (Ride through fire up)
/def -mglob -aB -F -t'You think that * should be worried about fire right about now.' mount_fire_down=/set prots=$(/removeprot MFire %prots)%;@party report (Ride through flame down)
/def -mglob -aB -F -t'Your mount responds to the motivation and ignores cold.' mount_cold_up=/let timenow=$[time()]%;/set prots=$(/addprot MCold_%{timenow}_1_0_%You %prots)%;/swapempy%;@party report (Ride through frost up)
/def -mglob -aB -F -t'You think that * should be worried about cold right about now.' mount_cold_down=/set prots=$(/removeprot MCold %prots)%;@party report (Ride through frost down)
/def -mglob -aB -F -t'It responds to the motivation and reluctantly slinks forward.' mount_rug_up=/let timenow=$[time()]%;/set prots=$(/addprot MRug_%{timenow}_1_0_%You %prots)%;@mount %{mount}%;/swapempy%;@party report (RUG up)
/def -mglob -aB -F -t'It responds to the motivation and treat and reluctantly slinks forward.' mount_rug_up_2=/let timenow=$[time()]%;/set prots=$(/addprot MRug_%{timenow}_1_0_%You %prots)%;@mount %{mount}%;/swapempy%;@party report (RUG up)
/def -mglob -aB -F -t'You think that * should be worried about being underground right about now.' mount_rug_about_to_drop=/set prots=$(/removeprot MRug %prots)%;@party report ULIULIULI SPANK MOUNT RUG ABOUT TO DROP ULIULIULI!!!


;; Pound
/stack pound off_skill_stack
/def pnd=/set skill=pound%;/set skill_rounds=random%;/set targettype=off%;/swapmaul%;/do_skill %{*}

;; command to unlead and mount, for some reason my keyboard does not work well with the first one
/bind § = @release %{mount}%;/repeat -1 1 @mount %{mount}
/bind ~[' = @release %{mount}%;/repeat -1 1 @mount %{mount}

/def skillswap=\
	/if (riding_status=~"riding")\
		/def key_f12 = /ch .%;\
		/if (wielded=~"whip")\
			/def key_f10 = /gs .%;\
		/else \
			/def key_f10 = /fa .%;\
		/endif%;\
	/elseif (riding_status=~"not" & wielded=~"maul")\
		/def key_f12 = /pnd .%;\
	/elseif (riding_status=~"not" & wielded=~"empy")\
		/def key_f12 = /imp .%;\
	/endif%;

;; Load combat triggers from Cavalier
/load bat-cavalier.tf

/skillswap

/def mountdebug=\
	/echo -aB -p (Debug) riding_status=%{riding_status} wielded=%{wielded}
