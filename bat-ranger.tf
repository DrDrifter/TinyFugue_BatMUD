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

/def fb=/set targettype=none%;/set skill=fire_building%;/do_skill
/def cp=/set targettype=none%;/set skill=camping%;/do_skill%;@party say (camping)
/def lc=/set targettype=corp%;/set skill=leather_craft%;/do_skill corpse%;@drop corpse%;@loot%;@crap
/def fp=/set targettype=corp%;/set skill=fresh_pants%;/do_skill corpse
/def tc=/set targettype=none%;/set skill=torch_creation%;/do_skill

/bind ^[[12~ = /fb
/bind ^[[13~ = /cp
/bind ^[[14~ = /tc
/bind ^[[21~ = /lc
/bind ^[[23~ = /bf
/bind ^[[24~ = /bf .

/def -t"You awaken from your short rest, and feel slightly better." campdone = @party say (done camping)
/def -t"You stretch yourself and consider about camping." campready1 = @party say (can camp)
/def -t"You feel a bit tired." campready2 = @party say (can camp)
/def -t"You feel like camping a little." campready3 = @party say (can camp)
/def -t"The fire burns out, spoiling anything in it." newfire = /fb
/def -t"You fail to start the fire." fireagain = /fb
/def -t"You louse things up and break your flint." flintbroke = @party say (damnit, broke my flint!)

;; hc specific(?)
/def -t"The rain douses the fire!" firedoused = /fb
/def -t"* has a soft skin." physress_0 = @party say (0% pr)
/def -t"* seems to have a bit hardened skin." physress_40 = @party say (40% pr)
/def -t"You would get some experience for *" tune_some_exp = @party say (worth some exp)
