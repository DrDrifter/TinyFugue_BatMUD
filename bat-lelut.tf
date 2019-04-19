;;
;; Bat-lelut.tf
;;

;; Init params
/set athame_status=X
/set rainstaff01_status=X
/set rainstaff02_status=X
/set ewind_status=X
/set magestaff_status=X
/set orb_status=_
/set orb_time=$[time()]
/set ankh_status=X
/set henry_plate_status=X
/set henry_plate_amount=750
/set yaboz_bracelets_status=_
/set yaboz_bracelets_amount=0
/set nithem_skull_status=X
/set pfe_helmet_status=X
/set bra_status=_
/set demonring_status=X
/set wlizard_ring_1_status=X
/set wlizard_ring_2_status=X
/set fqueen_wand_status=X

;; Converts seconds into minutes and seconds, very useful
/def -i formattime=\
 /set tmptime=%1%;\
 /set tmpmin=$[trunc(tmptime/60)]%;\
 /set tmpsek=$[trunc(tmptime-(tmpmin*60))]%;\
 /if ({tmpsek}<10) /set tmpsek=0%{tmpsek}%;/endif%;\
 /_echo %{tmpmin}:%{tmpsek}

;; Athame
;; Assuming 10 minute cooldown
/def -t"The athame severs the field surrounding this area." athamesever=@remove Leikkuri;put Leikkuri in bp;/set athame_status=_%;/set athame_time=$[time()]%;/repeat -00:10 1 /set athame_status=X

;; Rain Staff
;; 12 minute cooldown (this varies)
;; Rain lasts 7:30 minutes
/def -mglob -t"You take an old oak staff with several odd knobs labeled as SaunaVihta *" setstaff01 = /set staff 01
/def -mglob -t"You take an old oak staff with several odd knobs labeled as KutinaKeppi *" setstaff02 = /set staff 02
/def -mglob -t"Some moisture begins to form on the staff." strikestaff=\
  /set rainstaff%{staff}_status=_%;\
  /set rainstaff%{staff}_time=$[time()+780]%;\
  /repeat -00:13 1 /set rainstaff%{staff}_status=X

;; Entity drying wind
;; Needs update, have 2 shields
/def -t'Nagato the magic entity holds the Shield of the Wind up high!' magic_entity_wind_timer=/set ewind_status=_%;/set ewind_time=$[time()]%;/repeat -00:30 1 /set ewind_status=X

;; Mage staff
/def -mglob -t"You invoke the powers of your mage staff." invoke_magestaff=/set magestaff_status=_%;/set magestaff_time=$[time()]%;/repeat -00:5 1 /set magestaff_status=X

;; Orb of wind and rain
/def -mglob -t"Your orb sparkles." orbready=/set orb_status=X

;; Ankh
/def -mglob -t"Your Amberley Ankh activates." ankh_activated=/set ankh_status=_%;/set ankh_time=$[time()]%;/repeat -00:30 1 /set ankh_status=X

;; Henry plate
/def -mglob -t"You feel magical powers flowing from it back to you." henry_plate_charged=/set henry_plate_amount=%henry_plate_amount - 50
/def -mglob -t"You feel magical powers flowing from you to the breastplate." henry_plate_drained = \
   /set henry_plate_status=X%;\
   /set henry_plate_amount= %henry_plate_amount + 50
/def -mglob -t"But the plate is without response." henry_plate_empty = /set henry_plate_status=_

;; Yaboz bracelets
;; You mumble the ancient words 'chushak phuzzs'
;; The bracelet tingles slightly and sizzles with magical powers!
;; You mumble the ancient words 'tstss bzzr brteacle'
;; The bracelet contains 257 spell points.

;; Nithem Skull

;; Pfe Helmet
;; Note: Cooldown is actually 15-25 minutes!
/def -F -mglob -t"You remove The Mask of Higher Consciousness labeled as HomoHuppu." alias_removedmask = @alias removeditem HomoHuppu
/def -mglob -t"The spirit of Morrigaine appears in your visions and grants you protection." pfe_helmet_used =\
   /set pfe_helmet_status=_%;\
   /set pfe_helmet_time=$[time()]%;\
   /repeat -0:20 1 /set pfe_helmet_status=X
/def -F -mglob -t"You press the diamond on the white dragonscale helmet." pressedhelm = @wear removeditem

;; Fairy bra
/def -mglob -t"You store * in the spell matrix." bra_stored = /set bra_status=X
/def -mglob -t"You rub the brassiere (being a little over-eager, damaging it in the process) and thus cast the spell from the spell matrix." bra_cast = /set bra_status=_

;; Praixor gloves

;; Prism mirrors
/def -t"You call forth the power of your prism." prism_mirrors = /set prism_mirrors_status=_
/def -t"Your prism sparkles." prism_mirrors_ready = /set prism_mirrors_status=X

;; Mask of Gluttony

;; Demonic ring
/def -F -mglob -t'You wear Demonic Ring of Invisibility*' demonring_wear = /set demonring_status=_%;/repeat -0:10 1 /set demonring_status=X

;; Werelizard rings
;; Cooldown 10 minutes
/def -mglob -t"You wear a golden ring with a single small ruby labeled as Fritsuli *" setring01 = /set ring 01
/def -mglob -t"You wear a golden ring with a single small ruby labeled as Kielari *" setring02 = /set ring 02
/def -mglob -t"You feel strength flowing between you and *" ringkiss=\
  /set wlizard_ring_%{ring}_status=_%;\
  /set wlizard_ring_%{ring}_time=%;\
  /repeat -00:10 1 /set wlizard_ring_%{ring}_status=X

;; Fqueen wand
/def -mglob -t"You swing the wand one last time, pointing at *" fqueen_wand_zapped = /set fqueen_wand_status=_


;; Other
/def rip = @@remove skull,nova arcanum,grimoire,wand of magic%;@@wield soul ripper%;@@rip soul from corpse
/def -mglob -t"You finish sucking the soul. You feel younger!" katana_ripped = @@remove katana%;wear removeditem%;g
/def -mglob -t"The corpse isn't powerful enough for this." katana_not_ripped = @@remove katana%;wear removeditem%;g


/def lelut=\
/let timenow=$[time()]%;\
/if (rainstaff01_time-timenow>0) /let rainstaff01_cd=$(/formattime $[{rainstaff01_time}-{timenow}])%;/else /let rainstaff01_cd=0:00%;/endif%;\
/if (rainstaff02_time-timenow>0) /let rainstaff02_cd=$(/formattime $[{rainstaff02_time}-{timenow}])%;/else /let rainstaff02_cd=0:00%;/endif%;\
/if (wlizard_ring_1_time-timenow>0) /let wlizard_ring_1_cd=$(/formattime $[{wlizard_ring_1_time}-{timenow}])%;/else /let wlizard_ring_1_cd=0:00%;/endif%;\
/if (wlizard_ring_2_time-timenow>0) /let wlizard_ring_2_cd=$(/formattime $[{wlizard_ring_2_time}-{timenow}])%;/else /let wlizard_ring_2_cd=0:00%;/endif%;\
/echo  .-----------------------------.%;\
/echo  |   Drifter's tweak eq status |%;\
/echo  +-----------------------------+%;\
/echo  | Fields:%;\
/echo  |  Athame (asev) [%athame_status] [%athame_cd]%;\
/echo  |  Rainstaff (rain) [%rainstaff01_status] [%rainstaff01_cd]    Rainstaff2 (rain2) [%rainstaff02_status] [%rainstaff02_cd]%;\
/echo  |  Entity Wind (entw,ewind) [%ewind_status] [%ewind_cd] %;\
/echo  |  Magestaff (iss,ism) [%magestaff_status]%;\
/echo  |  Orb wind (owind) [%orb_status] [%orb_cd] %;\
/echo  |  Ankh (aa) [%ankh_status] [%ankh_cd] %;\
/echo  | %;\
/echo  | SP Stores: %;\
/echo  |  Henry plate (bget,bput) [%henry_plate_status] [%henry_plate_amount] sp%;\
/echo  |  Yaboz bracelets [%yaboz_bracelets_status] [%yaboz_bracelets_sp] sp%;\
/echo  | %;\
/echo  | Zaps: %;\
/echo  |  Nithem skull (garr,gara,scss,scsa) [%nithem_skull_status] [%nithem_skull_cd]%;\
/echo  |  PfE Helmet (phelm) [%pfe_helmet_status] [%pfe_helmet_cd]%;\
/echo  |  Fairy bra (bzap) [%bra_status]%;\
/echo  |  Praixor Glove [%praixor_glove_status]%;\
/echo  |  Prism mirrors [%prism_mirrors_status] [%prism_mirrors_cd]%;\
/echo  | %;\
/echo  | Other: %;\
/echo  |  Mask of Gluttony (wispill) [%mask_of_gluttony_status] [%mask_of_gluttony_cd]%;\
/echo  |  Demonic Ring [%demonic_ring_status] [%demonic_ring_cd]%;\
/echo  |  Lizard ring1 (rkiss)  [%wlizard_ring_1_status] [%wlizard_ring_1_cd]%;\
/echo  |  Lizard ring2 (rkiss2) [%wlizard_ring_2_status] [%wlizard_ring_2_cd]%;\
/echo  |  Fairy wand (frest) [%fqueen_wand_status] [%fqueen_wand_cd]%;\
/echo  `-----------------------------`
