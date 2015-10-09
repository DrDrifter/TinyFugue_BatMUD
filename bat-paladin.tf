
; Skills
/stack bash off_skill_stack
/def bsh=/set targettype=off%;/set skill=bash%;/set skill_rounds=random%;/do_skill %{*}
/def dp=/set targettype=off%;/set skill=daunting_presence%;/set skill_rounds=random%;/do_skill %{*}
/stack ghost_army_assault off_skill_stack
/def gaa=/set targettype=off%;/set skill=ghost_army_assault%;/do_skill %{*}
/def gchan=/set targettype=channel%;/set skill=ghost_channeling%;/do_skill %{*}
/stack ghost_slash off_skill_stack
/def gsl=/set targettype=off%;/set skill=ghost_slash%;/set skill_rounds=random%;/do_skill %{*}
/def seance=/set targettype=seance%;/set skill=holy_seance%;/do_skill %{*}
/stack kick off_skill_stack
/def kk=/set targettype=off%;/set skill=kick%;/set skill_rounds=2%;/do_skill %{*}
/stack purifying_strike off_skill_stack
/def pstrike=/set targettype=off%;/set skill=purifying_strike%;/set skill_rounds=random%;/do_skill %{*}
/stack radiant_slash off_skill_stack
/def rsl=/set targettype=off%;/set skill=radiant_slash%;/set skill_rounds=random%;/do_skill %{*}
/def rg=/set targettype=ghost%;/set skill=release_ghost%;/do_skill %{*}
/stack slash off_skill_stack
/def sl=/set targettype=off%;/set skill=slash%;/set skill_rounds=random%;/do_skill %{*}
/def tempt=/set targettype=assist%;/set skill=tempt%;/do_skill %{*}
/def vh=/set targettype=off%;/set skill=vengeful_haunting%;/do_skill %{*}


;; Spells
/def ag=/set spell=appease_ghost%;/set targettype=ghost%;/do_spell %{*}
/def dd=/set spell=deaths_door%;/set targettype=assist%;/do_spell %{*}
/def ga=/set spell=ghost_armour%;/set targettype=none%;/do_spell
/def gchill=/set spell=ghost_chill%;/set targettype=assist%;/do_spell %{*}
/def gc=/set spell=ghost_companion%;/set targettype=none%;/do_spell
/def gg=/set spell=ghost_guidance%;/set targettype=ghost%;/do_spell %{*}
/def glight=/set spell=ghost_light%;/set targettype=off%;/do_spell %{*}
/def gl=/set spell=ghost_link%;/set targettype=assist%;/do_spell %{*}
/def gs=/set spell=ghost_sword%;/set targettype=sword%;/do_spell %{*}
/def gv=/set spell=ghost_vision%;/set targettype=assist%;/do_spell %{*}
/def hg=/set spell=holy_glow%;/set targettype=nonoe%;/do_spell
/def rs=/set spell=restful_sleep%;/set targettype=none%;/do_spell
/def si=/set spell=see_invisible%;/set targettype=assist%;/do_spell %{*}

/def -mglob -p20 -t"* is unconscious and needs immediate medical care" deaths_door2= /dd %{1}%;@party say casting deaths door at %{1}
/def -F -mglob -aCred -t"You use your ability to detect evil and sense some evil." evilunveiled
/def -F -mglob -t"A light orb" seanceorb = @get orb
/def -F -mglob -t"An ether current runs through here" spiritworld_healcurrent = @touch current
/def -F -mglob -t"You fail to channel the ghost." redo_channelling = /gchan

;; Liberator prots
/createprot -r1 -t0 -n"GhC" -w"^You raise your hands and shout \'I choose you, [A-Za-z]+!\'" -u"^Ghost of [A-Za-z]+ replies \'Greetings, [A-Za-z ]+, I\'m ready for some action\', steps out of the ether and starts following you." -d"^Ghost of [A-Za-z]+ whispers \'I must leave now. Good luck.\'" -p"Ghost companion"
/createprot -r1 -t0 -n"GhA" -w"^You embrace yourself and state \'protect me\'" -u"^Ghost of [A-Za-z]+ complies, and you feel protected." -d"^Your ghost armour dissipates." -p"Ghost armour"
/createprot -t0 -n"HG" -w"You embrace yourself and state \'the light within\'" -u"You feel warm. The warmth increases, but never reaches hot. The room around you brightens up." -d"Your holy glow fades." -p"Holy glow"
/createprot -r1 -t0 -n"GhS" -w"^You channel the power of [A-Za-z]+ through you, asking the ghost to protect you from draining." -u"^Ghost of [A-Za-z]+ whispers \'I shall protect you with my knowledge.\'" -d"^Ghost of [A-Za-z]+ the sage whispers \'I... I feel so weak... I must leave now.\'" -p"Ghost Sage"


/def key_f11 = /gsl .
