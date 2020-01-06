/loaded bat-bard.tf
/require -q bat-generic.tf
/set sp_report on

;; Misc defs
;; /def ss=/set spell=soothing_sounds

/def ae=/set spell=achromatic_eyes%;/set targettype=bard%;/do_spell %{*}
/def cs=/set spell=catchy_singalong%;/set targettype=none%;/do_spell
/def ct=/set spell=campfire_tune%;/set targettype=none%;/do_spell
/def cl=/set spell=clandestine_thoughts%;/set targettype=none%;/do_spell
/def jt=/set spell=jesters_trivia%;/set targettype=none%;/do_spell
/def kf=/set spell=kings_feast%;/set targettype=none%;/do_spell
/def ma=/set spell=musicians_alm%;/set targettype=none%;/do_spell
/def me=/set spell=melodical_embracement%;/set targettype=none%;/do_spell
/def pf=/set spell=pathfinder%;/set targettype=tele%;/do_spell %{*}
/def sl=/set spell=sweet_lullaby%;/set targettype=none%;/do_spell
/def ss=/set spell=singing_shepherd%;/set targettype=none%;/do_spell
/def so=/set spell=sounds_of_silence%;/set targettype=none%;/do_spell
/def su=/set spell=strength_in_unity%;/set targettype=none%;/do_spell
/def we=/set spell=war_ensemble%;/set targettype=none%;/do_spell
/def vm=/set spell=vigilant_melody%;/set targettype=none%;/do_spell
/def vw=/set spell=venturers_way%;/set targettype=none%;/do_spell

;; Offspells
/eval /set off_spell_stack=%{off_spell_stack}|noituloves_dischord
/def di=/set spell=noituloves_dischord%;/set rounds=1%;/set targettype=off%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|uncontrollable_mosh
/def um=/set spell=uncontrollable_mosh%;/set rounds=2%;/set targettype=off%;/do_spell .
/eval /set off_spell_stack=%{off_spell_stack}|noituloves_deathore
/def nd=/set spell=noituloves_deathlore%;/set rounds=3%;/set targettype=off%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|con_fioco
/def cf=/set spell=con_fioco%;/set rounds=3%;/set targettype=off%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|dancing_blades
/def db=/set spell=dancing_blades%;/set rounds=3%;/set targettype=off%;/do_spell %{*}

;; Keybindings

;; Unix keys
;f2
/def -b'^[[12~' = /vw
;f3
/def -b'^[[13~' = /sl
;f4
/def -b'^[[14~' = /ccw 3
;f5
/def -b'^[[15~' = /mjh 1
;f6
/def -b'^[[17~' = /mjh 2
;f7
/def -b'^[[18~' = /mjh 3
;f11
/def -b'^[[23~' = /mjp
;f12
/def -b'^[[24~' = /uc
