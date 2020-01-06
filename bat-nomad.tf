/loaded bat-nomad.tf
/require -q bat-generic.tf

/def cp=/set targettype=none%;/set skill=camping%;/do_skill%;@party say (camping)
/def fb=/set targettype=none%;/set skill=fire_building%;/do_skill
/def fp=/set targettype=corp%;/set skill=fresh_pants%;/do_skill corpse
/def tc=/set targettype=none%;/set skill=torch_creation%;/do_skill

/def -t"You awaken from your short rest, and feel slightly better." campdone = @party say (done camping)
/def -t"You stretch yourself and consider about camping." campready1 = @party say (can camp)
/def -t"You feel a bit tired." campready2 = @party say (can camp)
/def -t"You feel like camping a little." campready3 = @party say (can camp)
;;/def -t"The fire burns out, spoiling anything in it." newfire = /fb
/def -t"You fail to start the fire." fireagain = /fb
;;/def -t"Flames on the campfire are growing weaker." refuel_campfire1 = @refuel
;;/def -t"Only a few sticks are still burning on the campfire." refuel_campfire2 = @refuel
;;/def -t"The fire flickers as it starts to run out of fuel." refuel_campfire3 = @refuel


;; Note that push is defined my stack-queue.tf so using /psh
/stack push off_skill_stack
/def psh=/set skill=push%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}


