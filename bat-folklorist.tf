




;; Skills
/def auto= /set skill=autopsy%;/set targettype=corpse%;/do_skill corpse
/def fa= /set skill=first_aid%;/set targettype=assist%;/do_skill %1
/def sc= /set skill=study_creature%;/set targettype=off%;/do_skill %*


;; Spells
/def bok=/set spell=bolt_of_knowledge%;/set targettype=off%;/do_spell %*
/def ch= /set spell=create_herb%;/set targettype=none%;/do_spell
/def cp= /set spell=cryptozoological_protection%;/set targettype=prot%;/do_spell %*
/def fop=/set spell=field_of_poison%;/set targettype=none%;/do_spell
/def gch=/set spell=greater_create_herb%;/set targettype=herb%;/do_spell %*
/def hh= /set spell=herbal_healing%;/set targettype=heal%;/do_spell %1 use %2
/def hhm=/set spell=herbal_healing%;/set targettype=heal%;/do_spell %1 use mixture
/def hb= /set spell=herbal_poison_blast%;/set targettype=off%;/do_spell %1 use %2
/def hbm=/set spell=herbal_poison_blast%;/set targettype=off%;/do_spell %1 use mixture
/def kp= /set spell=kinemortological_protection%;/set targettype=prot%;/do_spell %*
/eval /set off_spell_stack=%{off_spell_stack}|levin_bolt
/def lbo=/set spell=levin_bolt%;/set rounds=3%;/set targettype=off%;/do_spell %{*}
/def lp= /set spell=living_poison%;/set targettype=off%;/do_spell %{*}
/def ml= /set spell=monster_lore%;/set targettype=off%;/do_spell %{*}
/def mm= /set spell=magic_mount%;/set targettype=none%;/do_spell
/def mms=/set spell=magic_mount%;/set targettype=mount%;/do_spell summon
/def mp= /set spell=minor_protection%;/set targettype=prot%;/do_spell %*
/eval /set off_spell_stack=%{off_spell_stack}|venom_strike
/def vs=/set spell=venom_strike%;/set rounds=3%;/set targettype=off%;/do_spell %{*}
/def zp= /set spell=zoological_protection%;/set targettype/prot%;/do_spell %*


;; Redo skills
/def -t"You fail your skill attempt." studyfail = /do_skill

;;
/def -t"Pegasus licks you." Pegasushere = @@mount pegasus
