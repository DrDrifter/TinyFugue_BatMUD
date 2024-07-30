/loaded bat-grelig.tf
/require bat-generic.tf

;; Basic skills
/def bless=/set targettype=assist%;/set skill=bless%;/do_skill %{*}
/def bapt=/set targettype=assist%;/set skill=baptize%;/do_skill %{*}

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
;;/def -F -p15 -t"You have an unusual feeling as you cast the spell." ceremony_off= /set ceremony_status=off
/def -F -p15 -t"You start chanting." ceremony_off= /set ceremony_status=off

/def key_f12 = /uc

;; Heal spells
/stack cure_light_wounds heal_spell_stack
/def clw=\
   /set spell=cure_light_wounds%;/set targettype=heal%;/do_spell %{*}

;; Other
/def cf=/set spell=create_food%;/set targettype=none%;/do_spell

;; Off spell
; Celestial spark
/eval /set off_spell_stack=%{off_spell_stack}|celestial_spark
/def cs=/set spell=celestial_spark%;/set targettype=off%;/set spell_rounds=1%;/do_spell %{*}
