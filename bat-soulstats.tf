;;
;; Animist soul companion combat hit counter
;;
;; Monitors animist soul companion performance in combat
;;
;; Copyright drifter@bat.org 2013

/def sstats=\
/if ({1}=~"") /set inform=/echo -aB TF info:%; /do_stats%;\
/elseif ({1}=~"party") /set inform=@party say%; /do_stats%;\
/elseif (({1}=~"tell") & ({2}!~"")) /set inform=tell %{2}%; /do_stats%;\
/elseif (({1}=~"tell") & ({2}=~"")) /echo -aB TF info: tell combat stats to who?%;\
/endif
/def do_stats=\
/eval %{inform} My soul scores%;\
/eval %{inform} \
Hits: $[{soul_combat_hits}?:0] ($[{soul_combat_hits}?({soul_combat_hits}*100/({soul_combat_hits}+{soul_combat_misses}+{soul_combat_dodgeds}+{soul_combat_parrieds})):0]\\%%) \
Misses: $[{soul_combat_misses}?:0] (%$[{soul_combat_misses}?({soul_combat_misses}*100/({soul_combat_hits}+{soul_combat_misses}+{soul_combat_dodgeds}+{soul_combat_parrieds})):0]\\%%) \
Parries: $[{soul_combat_parrys}?:0] ($[{soul_combat_parrys}?({soul_combat_parrys}*100/({soul_combat_hitteds}+{soul_combat_dodges}+{soul_combat_misseds})):0]\\%%)%; \
/eval %{inform} \
Ripostes: $[{soul_combat_ripostes}?:0] ($[{soul_combat_ripostes}?({soul_combat_ripostes}*100/{soul_combat_parrys}):0]\\%%) \
Stuns: $[{soul_combat_stuns}?:0] \
Criticals: $[{soul_combat_crits}?:0] ($[({soul_combat_crits}*100/{soul_combat_hits})?:0]\\%%) \
Dodges: $[{soul_combat_dodges}?:0] ($[({soul_combat_dodges}*100/({soul_combat_hitteds}+{soul_combat_misseds}+{soul_combat_parrys}+{soul_combat_dodges}))?:0]\\%%)%;\
/eval %{inform} \
Tumbles: $[{soul_combat_tumbles}?:0] ($[({soul_combat_tumbles}*100/({soul_combat_dodgeds}+{soul_combat_tumbles}))?:0]\\%%) \
/eval %{inform} Scores against my soul%;\
/eval %{inform} \
Hits: $[{soul_combat_hitteds}?:0] ($[{soul_combat_hitteds}?({soul_combat_hitteds}*100/({soul_combat_hitteds}+{soul_combat_dodges}+{soul_combat_parrys}+{soul_combat_misseds})):0]\\%%) \
Misses: $[{soul_combat_misseds}?:0] ($[{soul_combat_misseds}?({soul_combat_misseds}*100/({soul_combat_hitteds}+{soul_combat_dodges}+{soul_combat_parrys}+{soul_combat_misseds})):0]\\%%) \
Parries: $[{soul_combat_parrieds}?:0] ($[{soul_combat_parrieds}?({soul_combat_parrieds}*100/({soul_combat_hits}+{soul_combat_misses}+{soul_combat_dodgeds}+{soul_combat_parrieds})):0]\\%%)%;\
/eval %{inform} \
Ripostes: $[{soul_combat_riposteds}?:0] ($[{soul_combat_riposteds}?({soul_combat_riposteds}*100/{soul_combat_parrieds}):0]\\%%) \
Stuns: $[{soul_combat_stunneds}?:0] \
Criticals: $[{soul_combat_critteds}?:0] ($[{soul_combat_critteds}?({soul_combat_critteds}*100/{soul_combat_hitteds}):0]\\%%) \
Dodges: $[{soul_combat_dodgeds}?:0] ($[{soul_combat_dodgeds}?({soul_combat_dodgeds}*100/({soul_combat_hits}+{soul_combat_misses}+{soul_combat_parrieds}+{soul_combat_dodgeds})):0]\\%%)%;\
/eval %{inform} \
Tumbles: $[{soul_combat_tumbleds}?:0] ($[{soul_combat_tumbleds}?({soul_combat_tumbleds}*100/({combat_dodges}+{combat_tumbleds})):0]\\%%) \
Stunned Maneuvers: $[{soul_combat_stunned_maneuverds}?:0]

;; Soul against monsters

;; Soul slash
/def -F -p5 -aCyellow -mregexp -t"Drifter's soul companion swings (his|her) sword in (weak|average|strong|mighty) arc, and hits [A-Za-z]+." animist_soul_slashed = /set soul_combat_slashed=$[{soul_combat_slashed}+1]

;; Soul heal
/def -F -p5 -aCgreen -mregexp -t"Drifter's soul companion chants 'healitus minimus'" animist_soul_healed = /set soul_combat_healed=$[{soul_combat_healed}+1]

;; Hits
/def -F -p5 -aCyellow -mregexp -t"^(Cackling Grinning |Smiling |)(diabolically |devilishly |wickedly |)Drifter's soul companion (cuts|cruelly slashes|cruelly tatters|gashes|horribly shreds|incises|incisively cuts|lightly cuts|pierces|quickly cuts|rives|savagely rips|savagely shaves|shreds|slashes|slits|solidly slashes|tears|uncontrollably slashes) [[A-Za-z ]+]*" animist_soul_hits = /set soul_combat_hits=$[{soul_combat_hits}+1]

;; Criticals
/def -F -p5 -aB -aCyellow -mregexp -t"^(Cackling|Grinning|Smiling) (demonically|devilishly|diabolically|wickedly) Drifter's soul companion" animist_soul_crits = /set soul_combat_crits=$[{soul_combat_crits}+1]

;; Miss
/def -F -p5 -aCcyan -mglob -t"Drifter's soul companion misses *" animist_soul_missed = /set soul_combat_misses=$[{soul_combat_misses}+1]

;; Tumble
/def -F -p5 -aCyellow -mregexp -t"tries to dodge, but Drifter's soul companion is not fooled that easily!$" animist_soul_tumbled = /set soul_combat_tumbled=$[{soul_combat_tumbled}+1]

;; Dodgeds
/def -F -p5 -aCcyan -mglob -t"* successfully dodges Drifter's soul companion's slash." animist_soul_mobdodged = /set soul_combat_dodgeds=$[{soul_combat_dodgeds}+1]

;; Parrieds
/def -F -p5 -aCcyan -mregexp -t"successfully parries Drifter's soul companion's slash.$" animist_soul_mobparries = /set soul_combat_parrieds=$[{soul_combat_parrieds}+1]

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Monsters against soul ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Hits
/def -F -p5 -aCred -mregexp -t"(applys a painful jointlock|attacks|bashes|beats|bites|BITES|blows|boots|bores|bumps|butts|cavitates|clashes|chasms|chews|chomps|claws|craters|cuts|DISMEMBERS|digs through|drills|does a spectacular spinning jump-kick at|dragon-punches|DRILLS|flails|flogs|gashes|gnaws|gorges|headbutts|hits|incises|jabs|jostles|jump-kicks|kicks|knocks|morsels|munches|MUNCHES|nibbles|nips|pats|perforates|pierces|pokes|pricks|plunges|pummels|punches|punctures|RENDS|riddles|rips|RIPS|rives|RIVES|rams|RAMS|scrapes|scratches|side-kicks|slaps|slashes|slices|slices sharply|slits|shafts|shaves|shoves|shreds|SHREDS|sinks|smacks|snaps|socks|spanks|spin-kicks|splits|sticks|stomps|strikes|strokes|sweeps|tastes|tatters|tears|TEARS|thrusts|THRUSTS|thumps|triple-kicks|uppercuts|whacks|whips|WHIPS|wounds) Drifter's soul companion" animist_soul_mobhit = /set soul_combat_hitteds=$[{soul_combat_hitteds}+1]

;; Criticals
/def -F -p5 -aB -aCred -mregexp -t"^(Cackling|Grinning|Smiling) (demonically|devilishly|diabolically|wickedly) [A-Za-z '-]* Drifter's soul companion" animist_soul_mobcritted = /set soul_combat_critteds=$[{soul_combat_critteds}+1]

;; Misses
/def -F -p5 -aCgreen -mregexp -t"misses Drifter's soul companion.$" animist_soul_mobmissed = /set soul_combat_misseds=$[{soul_combat_misseds}+1]

;; Dodge
/def -F -p5 -aCgreen -mregexp -t"^Drifter's soul companion successfully dodges" animist_soul_dodged = /set soul_combat_dodged=$[{soul_combat_dodged}+1]

;; Parry
/def -F -p5 -aCgreen -mregexp -t"^Drifter's soul companion successfully parries" animist_soul_parried = /set soul_combat_parrys=$[{soul_combat_parrys}+1]

;; Tumbles
/def -F -p5 -aCred -mregexp -t"^Drifter's soul companion tries to dodge, but [A-Za-z '-]+ is not fooled that easily!$" animist_soul_tumbleds = /set soul_combat_tumbleds=$[{soul_combat_tumbleds}+1]
