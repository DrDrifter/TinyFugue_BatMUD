;; BatMUD
;; Triggers for use with mage guild
;; Also incorporates psionic offensive spells
;; Jenny@bat.org 1998
;;
;; Modified and maintained by Drifter since 1999->?
;; No changelog but meddled with lotsa stuff
;;
;; Needs this file to run spell casting triggers
/require -q bat-generic.tf
;; This is the tick reporting mode, spell points only
/set sp_report=on

;; Hi-lites
;;/def -F -mglob -aCbgred -aBCblack -p15 -t"* screams in pain." scream_pain
;;/def -F -mglob -aCbgred -aBCblack -p15 -t"* writhes in agony." writhe_agony= @party report Target writhes %damtype (20\%) 
;;/def -F -mglob -aCbgred -aBCblack -p15 -t"* grunts from the pain." grunt_pain= @party report Target grunts %damtype (60\%)
;;/def -F -mglob -aCbgred -aBCblack -p15 -t"* shudders from the force of the attack." shudder= @party report Target shrudders %damtype (40\%)
;;/def -F -mglob -aCbgblack -aBCred -p15 -t"* shrugs off the attack." shrug= @party report Target SHRUGS %damtype
;;/def -F -mglob -aCbgblack -aBCred -p15 -t"* winces a little from the pain." winces= @party report Target winces %damtype (80\%)
;;/def -F -mglob -aCbgyellow -aBCred -p15 -t"You feel like your spell gained additional power." power= /echo -aB ** <dcrit 1> **
;;/def -F -mglob -aCbgyellow -aBCred -p15 -t"You feel like you managed to channel additional POWER to your spell." power2= /echo -aB **** <dcrit 2> ****
;;/def -F -mglob -aCbgyellow -aBCred -p15 -t'Your fingertips are surrounded with swirling ENERGY as you cast the spell.' power3= /echo -aB ****** <dcrit 3> ******
;;/def -F -mglob -aCbgyellow -aBCred -p15 -t'Unseen BURSTS of magic are absorbed into the spell' power4= @party report <dcrit UNSEEN>

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
