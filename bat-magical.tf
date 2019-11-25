;; BatMUD
;; Triggers for use with mage guild
;; Also incorporates psionic offensive spells
;; Jenny@bat.org 1998
;;
;; Modified and maintained by Drifter since 1999->?
;; No changelog but meddled with lotsa stuff
;;
;; Needs this file to run spell casting triggers
/loaded bat-magical.tf
/require -q bat-generic.tf
;; This is the tick reporting mode, spell points only
/set sp_report=on

/eval /set off_spell_stack=%{off_spell_stack}|acid_arrow
/def aa =/set targettype=off%;/set spell=acid_arrow%;/do_spell %{*}
/def dr =/set targettype=none%;/set spell=darkness%;/do_spell
/def fd =/set targettype=misc%;/set spell=floating_disc%;/do_spell my disc
/def fle=/set targettype=misc%;/set spell=floating_letters%;/do_spell %{*}
/def fw =/set targettype=item%;/set spell=feather_weight%;/do_spell %{*}
/def hs =/set targettype=none%;/set spell=heal_self%;/do_spell
/eval /set off_spell_stack=%{off_spell_stack}|lightning_bolt
;;/def lb =/set targettype=off%;/set spell=lightning_bolt%;/do_spell %{*}
/def mi =/set targettype=prot%;/set spell=mirror_image%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|magic_missile
/def mm =/set targettype=off%;/set spell=magic_missile%;/do_spell %{*}
/def mns=/set targettype=none%;/set spell=moon_sense%;/do_spell
/eval /set off_spell_stack=%{off_spell_stack}|shocking_grasp
/def sg =/set targettype=off%;/set spell=shocking_grasp%;/do_spell %{*}

/def -F -mglob -t"Your disc wavers dangerously." discgoingdown = @party report (Disc going down)
/def -F -mglob -t'Your floating disc suddenly disappears.' discwentdown = @party report (Disc went poof!)
