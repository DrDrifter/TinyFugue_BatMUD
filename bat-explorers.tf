;; Explorers subguild
/loaded bat-explorers.tf

/def fb=/set skill=fire_building%;/set targettype=none%;/do_skill
/def cp=/set skill=camping%;/set targettype=none%;/do_skill
/def -mglob -t"You awaken from your short rest, and feel slightly better." campdone = @party say (done camping)
/def -mglob -t"You stretch yourself and consider about camping." campready1 = @party say (can camp)
/def -mglob -t"You feel a bit tired." campready2 = @party say (can camp)
/def -mglob -t"You feel like camping a little." campready3 = @party say (can camp)
/def -mglob -t"You fail to start the fire." firefail = /fb

