;; This file has been a bit "stable" since -98 or so when I last were a ranger...
;; NB: I use this mostly for hcbat, so tweak it a bit for yourself mmkay?
;; Rangers =)
/require -q bat-generic.tf
/set hp_report on

;; Note that push is defined my stack-queue.tf so using /psh
/stack push off_skill_stack
/def psh=/set skill=push%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

/stack kick off_skill_stack
/def kk=/set skill=kick%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

/stack bladed_fury off_skill_stack
/def bf=/set skill=bladed_fury%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

/def cda=/set targettype=none%;/set skill=combat_damage_analysis%;/do_skill
/def cp=/set targettype=none%;/set skill=camping%;/do_skill%;@party report (camping)
/def eol=/set targettype=eol%;/set skill=eye_of_loraen%;/do_skill %{*}
/def fa=/set targettype=help%;/set skill=first_aid%;/do_skill %{*}
/def fb=/set targettype=none%;/set skill=fire_building%;/do_skill
/def fi=/set targettype=none%;/set skill=fishing%;/do_skill
/def fp=/set targettype=corp%;/set skill=fresh_pants%;/do_skill corpse
/def ht=/set targettype=hunt%;/set skill=hunting%;/do_skill %{*}
/def lc=/set targettype=corp%;/set skill=leather_craft%;/do_skill corpse%;@drop all corpse%;@remove marion axe%;@wield knife
/def lw=/set targettype=none%;/set skill=locate_water%;/do_skill
/def mb=/set targettype=none%;/set skill=make_bandage%;/do_skill
/def tc=/set targettype=none%;/set skill=torch_creation%;/do_skill
/def wt=/set targettype=none%;/set skill=wipe_tracks%;/do_skill

/def key_f5 = /fb
/def key_f6 = /cp
/def key_f7 = /lc
/def key_f8 = /cda
/def key_f9 = /psh .
/def key_f10 = /kk .
/def key_f11 = /bf
/def key_f12 = /bf .

/def -t"You awaken from your short rest, and feel slightly better." campdone = @party report (done camping)
/def -t"You stretch yourself and consider about camping." campready1 = @party report (can camp)
/def -t"You stretch yourself and consider camping." campready2 = @party report (can camp)
/def -t"You feel a bit tired." campready3 = @party report (can camp)
/def -t"You feel like camping a little." campready4 = @party report (can camp)
/def -t"The fire burns out, spoiling anything in it." newfire = /fb
/def -t"You fail to start the fire." fireagain = /fb
/def -t"You use your knife and start skinning the corpse." leathercrafted = @remove knife%;@wield marion axe
/def -t"No such item here." leathercraftnocorpse = @remove knife%;@wield marion axe
;;/def -t"You louse things up and break your flint." flintbroke = @party say (damnit, broke my flint!)

;; BFury messages:
; * stumbles from the force of your attack
; * eyes widden in terror as you ruthlessly wound him.
; Your attack causes * to wince from immense pain.
; * is knocked back from the force of your attack.
; Your ruthless onslaught of attacks causes * to stumble back and fall to its knees begging for mercy.
; With great precision and speed you maliciously assault *.
;* screams of agony deafen you as you cruelly chop him to little pieces! (bfury150)
;* reels from your onslaught and collapses upon the ground coughing up internal organs.



;; hc specific(?)
/def -t"The rain douses the fire!" firedoused = /fb
/def -t"* has a soft skin." physress_0 = @party say (0% pr)
/def -t"* seems to have a bit hardened skin." physress_40 = @party say (40% pr)
/def -t"You would get some experience for *" tune_some_exp = @party say (worth some exp)
