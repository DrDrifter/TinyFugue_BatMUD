;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;   Scripts and triggers for use by The Followers of Tarmalen in BatMUD      ;;
;;                     Jenny@batmud.org 1999                                  ;;
;;                                                                            ;;
;;            Modified and maintained by Drifter (1999-2004)                  ;;
;;                    Last updated 15.3.2004                                  ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;; Commands you can use given by this file:                                   ;;
;; /rd [target] -> raise dead     /ress [target] - >resurrect                 ;;
;; /nb [target] -> new body                                                   ;;
;; /lp [target] -> lessen poison  /rp [target] -> remove poison               ;;
;; /hw [target] -> holy way       /sum [target] -> summon                     ;;
;; /us [target] -> unstun         /unp [target] -> unpain                     ;;
;; /bot [target] -> blessing of tarmalen                                      ;;
;; /rs [target] -> remove scar    /tempt [target] -> tempt                    ;;
;; /ll [target] -> life link      /dd [target] -> deaths door                 ;;
;; /uc -> ceremony                                                            ;;
;; /clw [target] -> cure light wounds    /csw [target] -> cure serious wounds ;;
;; /ccw [target] -> cure critical wounds /mnh [target] -> minor heal          ;;
;; /mjh [target] -> major heal           /th [target] -> true heal            ;;
;; /mnp -> minor party heal        /mjp -> major party heal                   ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
/require -q ~/lib/tf-lib/bat-generic.tf
;;                                                                            ;;
;; Misc defs
/def cf=/set spell=create_food%;/set targettype=none%;/do_spell
/def rd=/set spell=raise_dead%;/set targettype=assist%;/do_spell %{*}
/def ress=/set spell=resurrect%;/set targettype=assist%;/do_spell %{*}
/def nb=/set spell=new_body%;/set targettype=assist%;/do_spell %{*}
/def lp=/set spell=lessen_poison%;/set targettype=assist%;/do_spell %{*}
/def rp=/set spell=remove_poison%;/set targettype=assist%;/do_spell %{*}
/def hway=/set spell=holy way%;/set targettype=tele%;/do_spell %{*}
/def sum=/set spell=summon%;/set targettype=tele%;/do_spell %{*}
/def us=/set spell=unstun%;/set targettype=prot%;/do_spell %{*}
/def unp=/set spell=unpain%;/set targettype=prot%;/do_spell %{*}
/def bot=/set spell=blessing_of_tarmalen%;/set targettype=prot%;/do_spell %{*}
/def rs=/set spell=remove_scar%;/set targettype=assist%;/do_spell %{*}
/stack tempt repeat_skill_stack
/def tempt=/set skill=tempt%;/set targettype=repeat%;/do_skill %{*}
/def bc=/set skill=burial_ceremony%;/set targettype=none%;/do_skill
/def ll=/set spell=life_link%;/set targettype=prot%;/do_spell %{*}
/def sp=/set spell=satiate_person%;/set targettype=assist%;/do_spell %{*}
/def ww=/set spell=water_walking%;/set targettype=assist%;/do_spell %{*}
/def da=/set spell=detect_alignment%;/set targettype=assist%;/do_spell %{*}
/def cot=/set spell=curse_of_tarmalen%;/set targettype=off%;/do_spell %{*}

;;
;; Deaths door
/def dd=/set spell=deaths_door%;/set targettype=assist%;/do_spell %{*}
;;/def -p20 -t"* lapses into unconsciousness from severe loss of blood." deaths_door= /dd %{1}%;@party say casting deaths door at %{1}
/def -mglob -p20 -t"* is unconscious and needs immediate medical care" deaths_door2= /dd %{1}%;@party say casting deaths door at %{1}
;;
;; Heal spells
;;/stack cure_light_wounds heal_spell_stack
/def clw=\
   /set spell=cure_light_wounds%;/set targettype=heal%;/do_spell %{*}
;;/stack cure_serious_wounds heal_spell_stack
/def csw=\
  /set spell=cure_serious_wounds%;/set targettype=heal%;/do_spell %{*}
;;/stack cure_critical_wounds heal_spell_stack
/def ccw=\
   /set spell=cure_critical_wounds%;/set targettype=heal%;/do_spell %{*}
;;/stack minor_heal heal_spell_stack
/def mnh=\
   /set spell=minor_heal%;/set targettype=heal%;/do_spell %{*}
;;/stack major_heal heal_spell_stack
/def mjh=\
   /set spell=major_heal%;/set targettype=heal%;/do_spell %{*}
;;/stack true_heal heal_spell_stack
/def th=\
   /set spell=true_heal%;/set targettype=heal%;/do_spell %{*}
;;/stack minor_party_heal heal_spell_stack
/def mip=\
   /set spell=minor_party_heal%;/set targettype=none%;/do_spell
;;/stack major_party_heal heal_spell_stack
/def mjp=\
   /set spell=major_party_heal%;/set targettype=none%;/do_spell
/def tph=\
   /set spell=true_party_heal%;/set targettype=none%;/do_spell

;; Post-heal trigger
;;
;; Brings up party status so you can see who to heal next
;;
;/def -F -p20 -t"You clap your hands and whisper \'judicandus mangenic\'" ccw_done= @party status short
;/def -F -p20 -t"You clap your hands and whisper \'judicandus puorgo mangenic\'" mph_done= @party status short

;; Interrupt triggers
;;/def -F -p15 -t"* is not wounded." not_wounded=zz%;/repeat -2 1 /uc
;;/def -F -p15 -mregexp -t"You heal all of ([A-Za-z]+)'s wounds." healed=zz%;/repeat -2 1 /uc
;;/def -F -p15 -mregexp -t"Cast ([A-Za-z ]+) at what?" no_target=zz%;/repeat -2 1 /uc
;;/def -F -p15 -t"You do not have enough spell points to cast the spell." not_enough_sp=/repeat  -2 1 /uc


;; Keybindings
/bind � = /cot .
/def key_f2 = /ccw 1
/def key_f3 = /ccw 2
/def key_f4 = /ccw 3
/def key_f5 = /mjh 1
/def key_f6 = /mjh 2
/def key_f7 = /mjh 3
/def key_f11 = /mjp
/def key_ctrl_f11 = /tph
/def key_f12 = /uc

;;RessRais hilites
/def -p9 -aB -aBCcyan -mglob -t"* accepts raise dead from you." raiscolor
/def -p9 -aB -aBCcyan -mglob -t"* accepts resurrect from you." resscolor

/def -p9 -t"You curse *" CoT_in = @party say (CoT in!)
