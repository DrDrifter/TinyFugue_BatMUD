;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;        BatMUD nun trigs by drifter@bat.org                                 ;;
;;            Note: HIGHLY experimental. Add your own stuff                   ;;
;; Commands you can use given by this file:                                   ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
/require -q bat-generic.tf
/set sp_report on
;;                                                                            ;;
;; Misc defs
/def rp=/set spell=remove_poison%;/set targettype=assist%;/do_spell %{*}
/def sum=/set spell=summon%;/set targettype=tele%;/do_spell %{*}
/def rs=/set spell=remove_scar%;/set targettype=assist%;/do_spell %{*}
/stack tempt repeat_skill_stack
/def tempt=/set skill=tempt%;/set targettype=repeat%;/do_skill %{*}
/def pfe=/set spell=protection_from_evil%;/set targettype=prot%;/do_spell %{*}
/def ss=/set spell=soul_shield%;/set targettype=prot%;/do_spell %{*}

;; Offensive triggers
/def st=/set spell=saintly_touch%;/set spell_rounds=2%;/set targettype=off%;/do_spell %{*}
/def hh=/set spell=holy_hand%;/set spell_rounds=3%;/set targettype=off%;/do_spell %{*}
/def du=/set spell=dispel_undead%;/set spell_rounds=5%;/set targettype=off%;/do_spell %{*}
/def de=/set spell=dispel_evil%;/set spell_rounds=4%;/set targettype=off%;/do_spell %{*}
/def hb=/set spell=holy_bolt%;/set spell_rounds=7%;/set targettype=off%;/do_spell %{*}
/def fr=/set spell=flames_of_righteousness%;/set spell_rounds=5%;/set targettype=off%;/do_spell %{*}
/def hw=/set spell=holy wind%;/set spell_rounds=6%;/set targettype=off%;/do_spell %{*}
/def bd=/set spell=banish_demons%;/set spell_rounds=5%;/set targettype=off%;/do_spell %{*}

/def -F -p9 -mregexp -t"(Your small size avoids a nasty ambush.|Your marvelous intellect avoids a nasty ambush.|Your keen senses note a disturbance seconds before the ambush!|Your knowledge about [A-Za-z' ]* tactics enables you to avoid the ambush.|You superb intelligence enables you to avoif the ambush.)" auto_caster =\
   /if ({auto_cast}=~"on")\
;; Triggered to cast best spell, if you don't have that, change 
;; to something you do
     /do_spell .%;\
   /endif

;;
;; Ceremony
/set ceremony_status off
/def uc=\
   /if ({ceremony_status}=~"off")\
     /set skill=ceremony%;\
     /set targettype=none%;\
     /do_skill%;\
   /else \
     /echo -aB (Tinyfugue): ceremony already catered for.%;\
   /endif
/def -F -p15 -t"You perform the ceremony." ceremony_on=\
   /set ceremony_status=on
/def -F -p15 -t"You have an unusual feeling as you cast the spell." ceremony_off= /set ceremony_status=off
;;
;; Deaths door
/def -p20 -t"* lapses into unconsciousness from severe loss of blood." someone_uncon= @party say %{1} is unconscious!
/def -p20 -t"* is unconscious and needs immediate medical care" someone_uncon2= @party say %{1} is unconscious and needs help!
;;
;; Heal spells
/stack cure_light_wounds heal_spell_stack
/def clw=\
   /set spell=cure_light_wounds%;/set targettype=heal%;/do_spell %{*}
/stack cure_serious_wounds heal_spell_stack
/def csw=\
  /set spell=cure_serious_wounds%;/set targettype=heal%;/do_spell %{*}
/stack cure_critical_wounds heal_spell_stack
/def ccw=\
   /set spell=cure_critical_wounds%;/set targettype=heal%;/do_spell %{*}
;;
;; Interrupt triggers
/def -F -p15 -t"* is not wounded." not_wounded=zz%;/repeat -2 1 /uc
;;/def -F -p15 -mregexp -t"You heal all of ([A-Za-z]+)'s wounds." healed=zz%;/repeat -2 1 /uc
/def -F -p15 -mregexp -t"Cast ([A-Za-z ]+) at what?" no_target=zz%;/repeat -2 1 /uc
/def -F -p15 -t"You do not have enough spell points to cast the spell." not_enough_sp=/repeat  -2 1 /uc
;; Keybindings
/def -b'^[[24~' = /uc
/def -b'^[OQ' = /ccw 1
/def -b'^[OR' = /ccw 2
/def -b'^[OS' = /ccw 3

;; Crits
/def -t'Wave of holy force flows through you, boosting your spell.' damcrit = party say damcritted!
/def -t'Saints smile over you as UNBOUNDED amount of energy merges into your spell.' damcrit2 = party say DamCritted!!
/def -t'Gods smile on you as SUPERNATURAL glow takes over your Aquamarine Cross.' damcrit3 = party say DAMCRITTED!!!
/def -t'Your Aquamarine Cross flashes brilliantly, FUMING with celestial energy.' damcrit4 = party say DamCritted!!!
/def -t'Your strong faith helps you to channel IMMENSE amount of holy force.' damcrit5 = party say DamCritted!!!
