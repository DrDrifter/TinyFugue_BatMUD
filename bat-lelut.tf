;;
;; Bat-lelut.tf
;; Please note: you will need to alias bp to your rig where you hold all your toys
;;
/loaded bat-lelut.tf

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
/set zashi_arms_status=X
/set nithem_skull_status=X
/set pfe_helmet_status=X
/set bra_status=_
/set demonring_status=X
/set wlizard_ring_1_status=X
/set wlizard_ring_2_status=X
/set wyrm_ring_status=X
/set fqueen_wand_status=X

;; Converts seconds into minutes and seconds, very useful
/def -i formattime=\
 /set tmptime=%1%;\
 /set tmpmin=$[trunc(tmptime/60)]%;\
 /set tmpsek=$[trunc(tmptime-(tmpmin*60))]%;\
 /if ({tmpsek}<10) /set tmpsek=0%{tmpsek}%;/endif%;\
 /_echo %{tmpmin}:%{tmpsek}

;; Removeditems aliases
/def -F -mglob -t"You remove Black-white coif of Nuns labeled as HomoHuppu*" alias_removedcoif = @alias removeditem HomoHuppu
/def -F -mglob -t"You remove A green hat of wizardy labeled as Riemutatti*" alias_riemutatti = @alias removeditem Riemutatti
/def -F -mglob -t"You remove a black hood labeled as WhereDaHoodAt*" alias_removedhood = @alias removeditem WhereDaHoodAt
/def -F -mglob -t"You remove A black tricorn hat with a large dark feather labeled as FolioPipo*" alias_removedpipo = @alias removeditem FolioPipo
/def -F -mglob -t"You remove a coral crown, sturdy and orange*" alias_removedcrown = @alias removeditem coral crown
/def -F -mglob -t"You remove an ice cap, flickering and white*" alias_removedcap = @alias removeditem ice cap
/def -F -mglob -t"You remove a mithril ring labeled as MuumiMuki*" alias_removedring1 = @alias removeditem muumimuki
/def -F -mglob -t"You remove a ring made from sheer moonlight labeled as KeskusRakasPosliini" alias_removedring2 = @alias removeditem keskusrakasposliini
/def -F -mglob -t"You remove a ring made from sheer moonlight labeled as RajaVemputusLaitos"  alias_removedring3 = @alias removeditem rajavemputuslaitos
/def -F -mglob -t"You remove glass bracers of the Seraphim labeled as Jyrnyhihat*" alias_removedhihat = @alias removeditem jyrnyhihat
/def -F -mglob -t"You remove Sacred Bracelets of Eternity labeled as Lihamankeli*" alias_removedbracers = @alias removeditem lihamankeli
/def -F -mglob -t"You remove an insightful scale of Red Dragon*" alias_removedscale1 = @alias removeditem scale 1,scale 2
/def -F -mglob -t"You remove a crumbling scale of Red Dragon*" alias_removedscale2 = @alias removeditem scale 1,scale 2
/def -F -mglob -t"You remove a round-headed amulet labeled as Ripsipiirakka*" alias_removed_ripsipiirakka = @alias removeditem ripsipiirakka
/def -F -mglob -t"You remove a cobalt amulet labeled as Kierukka*" alias_removed_kierukka = @alias removeditem kierukka
/def -F -mglob -t"You remove The Amberley Ankh labeled as Sissijuusto*" alias_removed_sissijuusto = @alias removeditem sissijuusto
/def -F -mglob -t"You remove Spider Amulet labeled as KokkeliVekkuli*" alias_removed_kokkelivekkuli = @alias removeditem kokkelivekkuli
/def -F -mglob -t"You remove a burning amulet labeled as PattiSmurffi*" alias_removed_pattismurffi  = @alias removeditem pattismurffi
/def -F -mglob -t"You remove bracelets made of sky-blue glass beads labeled as MinttuViina*" alias_removed_minttuviina = @alias removeditem minttuviina
/def -F -mglob -t"You remove bracelets made of sky-blue glass beads labeled as HyppyKuppa*"    alias_removed_hyppykuppa = @alias removeditem hyppykuppa
/def -F -mglob -t"You remove bracelets made of sky-blue glass beads labeled as RunkkuKahleet*" alias_removed_kahleet = @alias removeditem runkkukahleet
/def -F -mglob -t"You remove bracelets made of sky-blue glass beads labeled as PalliVahaKabinetti*" alias_removed_pallivaha = @alias removeditem pallivahakabinetti
/def -F -mglob -t"You remove Ward Nadab's rippling lava bands*"                                alias_removed_bands = @alias removeditem rippling lava bands
/def -F -mglob -t"You remove a slab of magical moss labeled as SlaabiKyykky*"                  alias_removed_slab  = @alias removeditem slaabikyykky
/def -F -mglob -t"You remove a satyr tail bracelet*" alias_removed_satyrtailbracelet = @alias removeditem all satyr tail bracelet

;; re-wears
/def -F -mglob -t"You put A glowing green amulet labeled as SalaRaKastelija <green glow> to *" = /repeat -00:00:01 1 @wear removeditem
/def -F -mglob -t"You hold your staff in front of yourself and slowly sweep it from left to right." invisdone = @put sonnibileet in bp%;/repeat -00:00:01 1 @wear removeditem


;; Athame
;; Assuming 10 minute cooldown
/def -F -t"The athame severs the field surrounding this area." athamesever=@put Leikkuri in bp;/set athame_status=_%;/set athame_time=$[time()]%;/repeat -00:10 1 /set athame_status=X
/def -ag -h"send {asev}" athame_do_sever = /SEND @remove all held;get athame from bp;wield athame;sever field

;; Rain Staff
;; 12 minute cooldown (this varies)
;; Rain lasts 7:30 minutes
/def -F -mglob -t"You take an old oak staff with several odd knobs labeled as SaunaVihta *" setstaff01 = /set staff 01
/def -F -mglob -t"You take an old oak staff with several odd knobs labeled as KutinaKeppi *" setstaff02 = /set staff 02
/def -F -mglob -t"Some moisture begins to form on the staff." strikestaff=\
  /set rainstaff%{staff}_status=_%;\
  /set rainstaff%{staff}_time=$[time()+780]%;\
  /repeat -00:13 1 /set rainstaff%{staff}_status=X
/def -ag -h"send {rain}" rainstaff1_do_action = /SEND @get saunavihta from bp;strike staff;put saunavihta in bp
/def -ag -h"send {rain2}" rainstaff2_do_action = /SEND @get kutinakeppi from bp;strike staff;put kutinakeppi in bp

;; Entity drying wind
;; Needs update, have more shields
/def -F -t'Drycraeft the magic entity holds the Shield of the Wind up high!' magic_entity_wind_timer=/set ewind_status=_%;/set ewind_time=$[time()]%;/repeat -00:30 1 /set ewind_status=X


;; Mage staff
/def -F -mglob -t"You invoke the powers of your mage staff." invoke_magestaff=/set magestaff_status=_%;/set magestaff_time=$[time()]%;/repeat -00:5 1 /set magestaff_status=X

;; Orb of wind and rain
/def -F -mglob -t"Your orb sparkles." orbready=/set orb_status=X

;; Ankh
/def -F -mglob -t"Your Amberley Ankh activates." ankh_activated=/set ankh_status=_%;/set ankh_time=$[time()]%;/repeat -00:30 1 /set ankh_status=X

;; Henry plate
/def -F -mglob -t"You feel magical powers flowing from it back to you." henry_plate_charged=@wear removeditem%;/set henry_plate_amount=%henry_plate_amount - 50
/def -F -mglob -t"You feel magical powers flowing from you to the breastplate." henry_plate_drained = \
   @wear removeditem%;\
   /set henry_plate_status=X%;\
   /set henry_plate_amount= %henry_plate_amount + 50
/def -mglob -t"But the plate is without response." henry_plate_empty = /set henry_plate_status=_

;; Yaboz bracelets
;; You mumble the ancient words 'chushak phuzzs'
;; The bracelet tingles slightly and sizzles with magical powers!
;; You mumble the ancient words 'tstss bzzr brteacle'
;; The bracelet contains 257 spell points.

;; Zashi arms
;;/def -mglob -t"The sleeves glow with magical energy!" zashi_arms_ready=/repeat -00:00:30 1 @@touch sleeve
;;/def -mglob -t"Nothing happens as you touch one of your translucent sleeves." zashi_arms_in_cooldown=@put all sparkling sleeve in bp;wear removeditem
;;/def -mglob -t"As you touch one of your translucent sleeves, they start to glow!" zashi_arms_used=@put all sparkling sleeve in bp;@wear removeditem%;/set zashi_arms_status=_%;/set zashi_arms_time=$[time()]%;/repeat -00:15 1 /set zashi_arms_status=X

;; Nithem Skull
/def -ag -h"send {scss}" nithem_invoke_spell1 = /SEND @nithem_skull type poison;nithem_skull blast
/def -ag -h"send {scsa}" nithem_invoke_spell2 = /SEND @nithem_skull type poison;nithem_skull area
/def -ag -h"send {garr}" nithem_invoke_spell3 = /SEND @nithem_skull type magic;nithem_skull blast
/def -ag -h"send {gara}" nithem_invoke_spell4 = /SEND @nithem_skull type magic;nithem_skull area

;; Pfe Helmet
;; Note: Cooldown is actually 15-25 minutes!
/def -F -mglob -t"The spirit of Morrigaine appears in your visions and grants you protection." pfe_helmet_used =\
   /set pfe_helmet_status=_%;\
   /set pfe_helmet_time=$[time()]%;\
   /repeat -0:20 1 /set pfe_helmet_status=X
/def -F -mglob -t"You press the diamond on the white dragonscale helmet." pressedhelm = @wear removeditem

;; Fairy bra
/def -F -mglob -t"You store * in the spell matrix." bra_stored = /set bra_status=X
/def -F -mglob -t"You rub the brassiere (being a little over-eager, damaging it in the process) and thus cast the spell from the spell matrix." bra_cast = /set bra_status=_

;; Praixor gloves

;; Prism mirrors
/def -F -t"You call forth the power of your prism." prism_mirrors = /set prism_mirrors_status=_
/def -F -t"Your prism sparkles." prism_mirrors_ready = /set prism_mirrors_status=X

;; Mask of Gluttony

;; Demonic ring
/def -F -mglob -t'You wear Demonic Ring of Invisibility*' demonring_wear = /set demonring_status=_%;/repeat -0:10 1 /set demonring_status=X

;; Werelizard rings
;; Cooldown 10 minutes
/def -F -mglob -t"You wear a golden ring with a single small ruby labeled as Fritsuli *" setring01 = /set ring 01
/def -F -mglob -t"You wear a golden ring with a single small ruby labeled as Kielari *" setring02 = /set ring 02
/def -F -mglob -t"You feel strength flowing between you and *" ringkiss=\
  /set wlizard_ring_%{ring}_status=_%;\
  /set wlizard_ring_%{ring}_time=%;\
  /repeat -00:10 1 /set wlizard_ring_%{ring}_status=X

;; DMP ring
/def -F -mglob -t"Your finger tingles as the Wyrm breathes its magic!" wyrm_ring_zapped = /set wyrn_ring_status=_%;@wear removeditem%;/repeat -00:20 1 /set wyrm_ring_status=X
/def -F -mglob -t"Your ring of the Wyrm does not respond." wyrm_ring_in_cd = @wear removeditem%;/echo -aB (TF Info): Wyrm ring in cooldown!
/def -ag -h"send {dmpall}" wyrm_ring_do_action = /SEND @get lampaannussija from bp;remove muumimuki;wear replacing lampaannussija;twist ring;put lampaannussija in bp


;; Fqueen wand
/def -F -mglob -t"You swing the wand one last time, pointing at *" fqueen_wand_zapped = /set fqueen_wand_status=_

;; Other
/def rip = @@remove skull,nova arcanum,grimoire,lateksidildo%;@@wield soul ripper%;@@rip soul from corpse
/def -F -mglob -t"You finish sucking the soul. You feel younger!" katana_ripped = @@remove katana%;wear removeditem%;g
/def -F -mglob -t"The corpse isn't powerful enough for this." katana_not_ripped = @@remove katana%;wear removeditem%;g
;; As you caress Fleot, an enormous water entity your gloves become painfully hot.


;; Special item handling


/def lelut=\
/let timenow=$[time()]%;\
/if (rainstaff01_time-timenow>0) /let rainstaff01_cd=$(/formattime $[{rainstaff01_time}-{timenow}])%;/else /let rainstaff01_cd=0:00%;/endif%;\
/if (rainstaff02_time-timenow>0) /let rainstaff02_cd=$(/formattime $[{rainstaff02_time}-{timenow}])%;/else /let rainstaff02_cd=0:00%;/endif%;\
/if (wlizard_ring_1_time-timenow>0) /let wlizard_ring_1_cd=$(/formattime $[{wlizard_ring_1_time}-{timenow}])%;/else /let wlizard_ring_1_cd=0:00%;/endif%;\
/if (wlizard_ring_2_time-timenow>0) /let wlizard_ring_2_cd=$(/formattime $[{wlizard_ring_2_time}-{timenow}])%;/else /let wlizard_ring_2_cd=0:00%;/endif%;\
/if (zashi_arms_time-timenow>0) /let zashi_arms_cd=$(/formattime $[{zashi_arms_time}-{timenow}])%;/else /let zashi_arms_cd=0:00%;/endif%;\
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
/echo  |  Yaboz bracelets (brget,brput) [%yaboz_bracelets_status] [%yaboz_bracelets_sp] sp%;\
/echo  |  Zashi sleeves (sget) [%zashi_arms_status] [%zashi_arms_cd]%;\
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
/echo  |  DMP ring (dmpall) [%wyrm_ring_status]%;\
/echo  |  Fairy wand (frest) [%fqueen_wand_status] [%fqueen_wand_cd]%;\
/echo  `-----------------------------`
