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
/set henry_plate_status=X
/set henry_plate_amount=750
/set yaboz_bracelets_status=_
/set yaboz_bracelets_amount=0
/set nithem_skull_status=X
/set pfe_helmet_status=X

;; Athame
/def -t"The athame severs the field surrounding this area." athamesever = @remove Leikkuri;put Leikkuri in bp;/set athame_status=_%;/set athame_time=$[time()]%;/repeat -00:10 1 /set athame_status=X

;; Rain Staff
/def -mglob -t"You strike your rain staff in the ground." strikestaff = /set rainstaff_status=_%;/set rainstaff_time=$[time()]%;/repeat -00:10 1 /set rainstaff_status=X

;; Entity drying wind
/def -t'Nagato the magic entity holds the Shield of the Wind up high!' magic_entity_wind_timer = /set ewind_status=_%;/set ewind_time=$[time()]%;/repeat -00:30 1 /set ewind_status=X

;; Mage staff
/def -mglob -t"You invoke the powers of your mage staff." invoke_magestaff = /set magestaff_status=_%;/set magestaff_time=$[time()]%;/repeat -00:5 /set magestaff_status=X

;; Orb of wind and rain
/def -mglob -t"Your orb sparkles." orbready = /set orb_status=X

;; Henry plate
/def -mglob -t"You feel magical powers flowing from it back to you." = /set henry_plate_amount = %henry_plate_amount-50
/def -mglob -t"You feel magical powers flowing from you to the breastplate." = \
   /set henry_plate_status=X%;\
   /set henry_plate_amount=%henry_plate_amount+50
/def -mglob -t"But the plate is without response." = /set henry_plate_status=_

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
   /repeat -0:20 1 /set pfe_helmet_status=X

;; Praixor gloves

;; Prism mirrors
/def -t"You call forth the power of your prism." prism_mirrors = /set prism_mirrors_status=_
/def -t"Your prism sparkles." prism_mirrors_ready = /set prism_mirrors_status=X

;; Mask of Gluttony

;; Demonic ring
/def -F -mglob -t'You wear Demonic Ring of Invisibility*' demonring_wear = /repeat -0:10 1 /set 

;; Werelizard rings
/def -mglob -t"You feel strength flowing between you and *" ringkiss = /repeat -00:10 1 @party report (Ring kiss loaded)

/def lelut=\
/echo  .-----------------------------.%;\
/echo  |   Drifter's tweak eq status |%;\
/echo  +-----------------------------+%;\
/echo  | Fields:
/echo  |  Athame [%athame_status] [%athame_cd]%;\
/echo  |  Rainstaff (rain) [%rainstaff_status] [%rainstaff_cd]%;\
/echo  |  Entity Wind (entw,ewind) [%ewind_status] [%ewind_cd] %;\
/echo  |  Magestaff (iss,ism) [%magestaff_status]%;\
/echo  |  Orb wind (owind) [%orb_status] [%orb_cd] %;\
/echo  | %;\
/echo  | SP Stores: %;\
/echo  |  Henry plate (bget,bput) [%henry_plate_status] [%henry_plate_amount] sp%;\
/echo  |  Yaboz bracelets [%yaboz_bracelets_status] [%yaboz_bracelets_sp] sp%;\
/echo  | %;\
/echo  | Zaps: %;\
/echo  |  Nithem skull (garr,gara,scss,scsa) [%nithem_skull_status] [%nithem_skull_cd]%;\
/echo  |  PfE Helmet (phelm) [%pfe_helmet_status] [%pfe_helmet_cd]%;\
/echo  |  Praixor Glove [%praixor_glove_status]%;\
/echo  |  Prism mirrors [%prism_mirrors_status] [%prism_mirrors_cd]%;\
/echo  | %;\
/echo  | Other: %;\
/echo  |  Mask of Gluttony [%mask_of_gluttony_status] [%mask_of_gluttony_cd]%;\
/echo  |  Demonic Ring [%demonic_ring_status] [%demonic_ring_cd]%;\
/echo  `-----------------------------`
