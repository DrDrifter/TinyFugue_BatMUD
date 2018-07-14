;;
;; Bat-lelut.tf
;;

;; Init params
/set athame_status=X
/set rainstaff_status=X
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

;; Athame
;; Assuming 10 minute cooldown
/def -t"The athame severs the field surrounding this area." athamesever=@remove Leikkuri;put Leikkuri in bp;/set athame_status=_%;/set athame_time=$[time()]%;/repeat -00:10 1 /set athame_status=X

;; Rain Staff
;; Assuming 10 minute cooldown
/def -mglob -t"You strike your rain staff in the ground." strikestaff=/set rainstaff_status=_%;/set rainstaff_time=$[time()]%;/repeat -00:10 1 /set rainstaff_status=X

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
/def -mglob -t"The spirit of Morrigaine appears in your visions and grants you protection." pfe_helmet_used =\
   /set pfe_helmet_status=_%;\
   /set pfe_helmet_time=$[time()]%;\
   /repeat -0:20 1 /set pfe_helmet_status=X

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
;;You wear a golden ring with a single small ruby labeled as Fritsuli (glowing) <purple glow>. -> ring 1
;;You wear a golden ring with a single small ruby labeled as Kielari (glowing) <purple glow>.  -> ring 2
/def -mglob -t"You feel strength flowing between you and *" ringkiss = /repeat -00:10 1 /ECHO (TF Info): Ring kiss loaded

;; Fqueen wand
/def -mglob -t"You swing the wand one last time, pointing at *" fqueen_wand_zapped = /set fqueen_wand_status=_

/def lelut=\
/echo  .-----------------------------.%;\
/echo  |   Drifter's tweak eq status |%;\
/echo  +-----------------------------+%;\
/echo  | Fields:%;\
/echo  |  Athame (asev) [%athame_status] [%athame_cd]%;\
/echo  |  Rainstaff (rain) [%rainstaff_status] [%rainstaff_cd]%;\
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
/echo  |  Lizard ring1 (rkiss)  []%;\
/echo  |  Lizard ring2 (rkiss2) []%;\
/echo  |  Fairy wand (frest) [%fqueen_wand_status] [%fqueen_wand_cd]%;\
/echo  `-----------------------------`
