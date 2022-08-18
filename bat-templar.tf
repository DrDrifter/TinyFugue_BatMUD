;;;;;;;;;;;;;;;;;;;;;;;;;
;; Templar guild       ;;
;; By Drifter (2004->) ;;
;; last mod: 18.2.11   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
/loaded bat-templar.tf
/require -q bat-generic.tf

/def lh=/set targettype=temp%;/set spell=laying_on_hands%;/do_spell %{*}
/def da=/set targettype=temp%;/set spell=detect_alignment%;/do_spell %{*}
/def de=/set targettype=shld%;/set spell=divine_enhancement%;/do_spell %{*}
/def ba=/set targettype=maul%;/set spell=bless_armament%;/do_spell %{*}
/def bof=/set targettype=prot%;/set spell=blessing_of_faerwon%;/do_spell %{*}
/def sof=/set targettype=prot%;/set spell=shield_of_faith%;/do_spell %{*}
/def rp=/set targettype=temp%;/set spell=remove_poison%;/do_spell %{*}


/def an=/set targettype=none%;/set skill=combat_damage_analysis%;/do_skill
/def bc=/set targettype=none%;/set skill=burial_ceremony%;/do_skill
/def cda=/set targettype=off%;/set skill=combat_damage_analysis%;/do_skill %{*}
/def cov=/set targettype=none%;/set skill=congregation_of_the_virtuous%;/do_skill
/def pr=/set targettype=pray%;/set skill=prayer%;/do_skill %{*}
/def protect=/set targettype=protect%;/set skill=protection_by_sacrifice%;/do_skill %{*}
/def sr=/set targettype=none%;/set skill=stance_of_the_righteous%;/do_skill

/stack kick off_skill_stack
/def kk=/set targettype=off%;/set skill=kick%;/set skill_rounds=2%;/do_skill %{*}

/stack pound off_skill_stack
/def po=/set targettype=off%;/set skill=pound%;/set skill_rounds=random%;/do_skill %{*}

/stack holy_blaze off_skill_stack
/def hb=/set targettype=off%;/set skill=holy_blaze%;/set skill_rounds=random%;/do_skill %{*}

/stack holy_strike off_skill_stack
/def hs=/set targettype=off%;/set skill=holy_strike%;/set skill_rounds=random%;/do_skill %{*}
/def -F -t"You need a blessed weapon to use this skill." noblessonweapon = @party report (Weapon is not blessed!)
/def -F -t"This skill only works on evil targets." targetnotevil = @party report (Target is not evil enough!)

/stack bash off_skill_stack
/def bs=/set targettype=off%;/set skill=bash%;/set skill_rounds=random%;/do_skill %{*}

;/def -F -mglob -t"* seems to lose * concentration and stops skill." bashworks = @party say (Broke enemys skill)
;/def -F -mglob -t"* seems hurt and confused." bashworks = @party say (Broke enemys skill)

/def -F -mglob -p9 -aB -aCwhite -t"You plant your feet and cry out \'I will not be moved!\'" stance_up
/def -F -mglob -p9 -aB -aCwhite -t"You try to plant your feet against the attack, but cannot form a fighting stance." stance_not_up = /sr
/def -F -mglob -p9 -aB -aCyellow -t'You refuse to back down from your evil foes.' templar_stance

/def -F -mglob -p9 -t"Just as you are about to utter the final part of the prayer you get unsure of yourself and forget the last words of the prayer." prayer_fail = /pr

;; Coming later on...

;Your marvellous sense of combat prevents your mace of Faerwon from getting scratched.

/createprot -t0 -n"BlessA" -w"You pray for a moment and yell \'Faerwon, grant your favor!\'" -u"You successfully bless Empyrean." -d"The blessing on your Empyrean fades away." -p"Bless armament"
/createprot -t0 -n"BlA" -w"You pray for a moment and yell \'Faerwon, grant your favor!\'" -u"You successfully bless maul of divinities." -d"The blessing on your maul of divinities fades away." -p"Bless armament"

;You strike at your foe but miss completely.
;You strike x hard in the side.
;You strike x quickly in the belly making [him|her|it] grunt in pain.
;You strike x swiftly in the chest crushing a rib.
;You strike x precisely in the throat crushing her windpipe making [him|her|it] gurgle in pain.
;You strike x furiously in the side of the head making [him|her|it] cry in agony.
;You strike x viciously straight in the forehead crushing [his|her|its] brow making blood and brain tissue pour out from the wound.
;You strike x SAVAGELY in the chest with such force that it totally crushes [his|her|its] ribcage collapsing lungs making serious amounts of blood fly from the wound and almost as much blood pour out from his coughing mouth.
;You strike x PERFECTLY in the middle of the head crushing the better part of the cranium making blood and parts of the brain splatter all around the room staining everything and everyone leaving a real mess.


;; Resists
/def -F -p5 -i -ag -mregexp -t" is defenseless against ([A-Za-z]+) damage." resist_0= @party say %{PL} has no %P1 resist
/def -F -p5 -i -ag -mregexp -t" seems to be almost defenseless against ([A-Za-z]+) damage." resist_20 = @party say %{PL} has 20\% %P1 resist.
/def -F -p5 -i -ag -mregexp -t" has some resistance against ([A-Za-z]+) damage." resist_40 = @party say %{PL} has 40\% %P1 resist.
/def -F -p5 -i -ag -mregexp -t" seems to be moderately resistant against ([A-Za-z]+) damage." resist_60 = @party say %{PL} has 60\% %P1 resist.
/def -F -p5 -i -ag -mregexp -t" has good resistance against ([A-Za-z]+) damage." resist_80 = @party say %{PL} has 80\% %P1 resist.
/def -F -p5 -i -ag -mregexp -t" seems almost immune against ([A-Za-z]+) damage." resist_100 = @party say %{PL} has 100\% %P1 resist



;..and as the weapon strikes, holy light emerges from it, burning its target.

/def -F -t'a skeleton guard (undead)' holz_skeleton1 = @hp skeleton
/def -F -t'a skeleton warrior (undead)' holz_skeleton2 = @hp skeleton


;; Keybindings
/def key_f8 = /sr
/def key_f9 = /hs .
/def key_f10 = /po .
