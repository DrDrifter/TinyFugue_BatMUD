
/def rd=/set spell=raise_dead%;/set targettype=assist%;/do_spell %{*}
/def ress=/set spell=resurrect%;/set targettype=assist%;/do_spell %{*}
/def us=/set spell=unstun%;/set targettype=prot%;/do_spell %{*}
/def unp=/set spell=unpain%;/set targettype=prot%;/do_spell %{*}
/def rs=/set spell=remove_scar%;/set targettype=assist%;/do_spell %{*}
/def ll=/set spell=life_link%;/set targettype=prot%;/do_spell %{*}
/def cot=/set spell=curse_of_tarmalen%;/set targettype=off%;/do_spell %{*}
/def sp=/set spell=satiate_person%;/set targettype=assist%;/do_spell %{*}

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
/def dd=/set spell=deaths_door%;/set targettype=assist%;/do_spell %{*}
;;/def -p20 -t"* lapses into unconsciousness from severe loss of blood." deaths_door= /dd %{1}%;@party say casting deaths door at %{1}
/def -p20 -t"* is unconscious and needs immediate medical care" deaths_door2= /dd %{1}%;@party say casting deaths door at %{1}

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

;; Keybindings
/def key_f2 = /ccw 1
/def key_f3 = /ccw 2
/def key_f4 = /ccw 3

/def -p9 -t"You curse *" CoT_in = @party say (CoT in!)
