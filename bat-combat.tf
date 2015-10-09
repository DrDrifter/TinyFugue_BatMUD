;; Combat skills counter
;; Monitors combat and will tells you stats
;; Command /stats or /stats party to report to party
;; of /stats tell <player> to tell someone your stats
;;
;; Copyright Jenny@bat.org 1998
;;
;; Modified and maintaned by Drifter since 2003
;;

/def stats=\
/if ({1}=~"") /set inform=/echo -aB TF info:%; /do_stats%;\
/elseif ({1}=~"party") /set inform=@party say%; /do_stats%;\
/elseif (({1}=~"tell") & ({2}!~"")) /set inform=tell %{2}%; /do_stats%;\
/elseif (({1}=~"tell") & ({2}=~"")) /echo -aB TF info: tell combat stats to who?%;\
/endif
/def do_stats=\
/eval %{inform} My scores%;\
/eval %{inform} \
Hits: $[{combat_hits}?:0] ($[{combat_hits}?({combat_hits}*100/({combat_hits}+{combat_misses}+{combat_dodgeds}+{combat_parrieds})):0]\\%%) \
Misses: $[{combat_misses}?:0] (%$[{combat_misses}?({combat_misses}*100/({combat_hits}+{combat_misses}+{combat_dodgeds}+{combat_parrieds})):0]\\%%) \
Parries: $[{combat_parrys}?:0] ($[{combat_parrys}?({combat_parrys}*100/({combat_hitteds}+{combat_dodges}+{combat_misseds})):0]\\%%)%;\
/eval %{inform} \
Ripostes: $[{combat_ripostes}?:0] ($[{combat_ripostes}?({combat_ripostes}*100/{combat_parrys}):0]\\%%) \
Stuns: $[{combat_stuns}?:0] \
Criticals: $[{combat_crits}?:0] ($[({combat_crits}*100/{combat_hits})?:0]\\%%) \
Dodges: $[{combat_dodges}?:0] ($[({combat_dodges}*100/({combat_hitteds}+{combat_misseds}+{combat_parrys}+{combat_dodges}))?:0]\\%%)%;\
/eval %{inform} \
Tumbles: $[{combat_tumbles}?:0] ($[({combat_tumbles}*100/({combat_dodgeds}+{combat_tumbles}))?:0]\\%%) \
Stunned Maneuvers: $[{combat_stunned_maneuvers}?:0]%;\
/eval %{inform} scores against me!%;\
/eval %{inform} \
Hits: $[{combat_hitteds}?:0] ($[{combat_hitteds}?({combat_hitteds}*100/({combat_hitteds}+{combat_dodges}+{combat_parrys}+{combat_misseds})):0]\\%%) \
Misses: $[{combat_misseds}?:0] ($[{combat_misseds}?({combat_misseds}*100/({combat_hitteds}+{combat_dodges}+{combat_parrys}+{combat_misseds})):0]\\%%) \
Parries: $[{combat_parrieds}?:0] ($[{combat_parrieds}?({combat_parrieds}*100/({combat_hits}+{combat_misses}+{combat_dodgeds}+{combat_parrieds})):0]\\%%)%;\
/eval %{inform} \
Ripostes: $[{combat_riposteds}?:0] ($[{combat_riposteds}?({combat_riposteds}*100/{combat_parrieds}):0]\\%%) \
Stuns: $[{combat_stunneds}?:0] \
Criticals: $[{combat_critteds}?:0] ($[{combat_critteds}?({combat_critteds}*100/{combat_hitteds}):0]\\%%) \
Dodges: $[{combat_dodgeds}?:0] ($[{combat_dodgeds}?({combat_dodgeds}*100/({combat_hits}+{combat_misses}+{combat_parrieds}+{combat_dodgeds})):0]\\%%)%;\
/eval %{inform} \
Tumbles: $[{combat_tumbleds}?:0] ($[{combat_tumbleds}?({combat_tumbleds}*100/({combat_dodges}+{combat_tumbleds})):0]\\%%) \
Stunned Maneuvers: $[{combat_stunned_maneuverds}?:0]

;; List of hits (semi-alphabetical)
/set hits=apply a painful jointlock|attack|badly smash|BARBARICALLY BEAT|barely scrape|bash|BEAT|beat|blow|boot|bore|bump|butt|cavitate|chasm|claw|crater|cruelly beat|cuff|cut|do a spectacular spinning jump-kick at|dig|DISMEMBER|dragon-punch|DRILL|drill|flail|gash|gorge|headbutt|hit|incise|jab|jostle|jump-kick|kick|knock|pat|perforate|pierce|PIERCE|poke|prick|pummel|punch|puncture|REND|riddle|RIDDLE|rive|rip|RIP|run into|savagely sock|scrape|scratch|shaft|shave|shred|SHRED|side-kick|sink|slap|slash|slit|smack|smash|SMASH|sock|spank|spin-kick|stick|step|stomp|stomp-kick|strike|STRIKE|stroke|sweep sending|tatter|tear|TEAR|THRUST|thump|triple-kick|uppercut|whack

;; Axe & Sword
;; /set cut_hits=barely graze|solidly slash|gash|lightly cut|cut|tear|incise|shred|horribly shred|slash|incisively cut|incisively tear|slit|cruelly tatter|savagely shave|rive|cruelly slash|uncontrollably slash|quickly cut|savagely rip|BRUTALLY TEAR|SAVAGELY SHRED|CRUELLY REND|BARBARICALLY REND|DISMEMBER|CRUELLY DISMEMBER

;; Blud_hits
;;/set blud_hits=lightly jostle|jostle|butt|bump|thump|stroke|thrust|jab|bash|strike|sock|cuff|knock|flail|whack|beat|smash|cruelly beat|badly smash|horribly thrust|savagely sock|savagely strike|REALLY WHACK|BRUTALLY BEAT|CRUELLY CUFF|BARBARICALLY BASH

;; Monk MA
;; /set monk_hits=slap|push|shove|grab|punch|foot-sweep|evade, and then reverse|grab and shoulder-toss|snap-kick|joint-lock|unbalance, then expertly throw|stop-kick|reverse spin-kick|pull, then cruelly throat chop|trip and head-stomp|savagely hammerfist|craftily feint and then grab and flip|fluidly evade, duck under and spine-chop|nerve-grab, causing unendurable pain to|perform a lightning fast punch and throw combo on|grab, headbutt, then NECK-SNAP|masterfully evade then JUMP-KICK|DEVASTATINGLY HEAD-THROW|HORRIBLY DOUBLE-KICK|MASTERFULLY POWER-THROW|DEVASTATINGLY SNAP-KICK

;; Pole_hits
;;/set pole_hits=barely scratch|scratch|slightly pierce|pierce|puncture|sink|bore|crater|cavitate|shaft|gorge|really poke|riddle|dig into|dig through|chasm|drill|powerfully perforate|powerfully pierce|cruelly crater|savagely shaft|uncontrollably dig through|REALLY DRILL|CRUELLY RIDDLE|BRUTALLY BORE|BARBARICALLY PIERCE

;; Tiger MA
;; /set tiger_hits=tickle|step on|grasp|toe-kick|knee|elbow|elbow-smash|stomp-kick|foot-step|twist and throw|finger-jab|joint-twist|back kick|spinning back kick|phoenix-eye punch|spinning backfist|jump up and side-kick|dragon-claw|feint high and then cruelly groin-rip|snake-strike, blocking the chi of|pummel, with dozens of chain punches,|leap, spin, and swallow-tail KICK|DEVASTATE, with a thrusting blow,|BRUTALLY THROAT RIP|SAVAGELY BELLY SMASH|CRUELLY TIGER STRIKE

;; Unarmed_hits
;;/set unarmed_hits=pat|spank|smack|bitchslap|lightly strike|boot|kick|suckerpunch|ankle-stomp|stomp|knee-kick|badly kick|jump-kick|uppercut|kidneypunch|spin-kick|headbutt|cruelly headbutt|dragon-punch|savagely triple-kick|roundhouse|bodyslam|run into|REALLY SMASH|BRUTALLY BOOT|BARBARICALLY BEAT

;; List of stuff that would otherwise trigger a hit
/def -p99 -t"You rip the poster to small pieces. The pieces vanish." rip_poster
/def -p99 -t"You poke yourself in the eye and your spell misfires." poke_eye
/def -p99 -t"* calmly slaps your blade aside and counter attacks with a *" bloodlust
/def -p99 -t"* hits your armour and it starts to fall apart." digger1
/def -p99 -t"* attacks you in a frenzy, glad to have found some warm meat." digger2
/def -p99 -t"* knocks your head with a bony hand and yells *" skele_emote
/def -p99 -t"* The city of Oystria strikes you as *" oystria_desc
/def -p99 -t"A fish hits your head!" oystria_whirlpool
/def -p99 -t"Swish!  A staff end just misses your head." dojo_emote
/def -p99 -t"Grinning diabolically you barbarically TYPO your keyboard causing ASCII to fly everywhere!" typo
/def -p99 -t"* slaps you on the cheek." slapemote

/set hitteds=applys a painful jointlock|attacks|bashes|beats|bites|BITES|blows|boots|bores|bumps|butts|cavitates|clashes|chasms|chews|chomps|claws|craters|cuts|DISMEMBERS|digs through|drills|does a spectacular spinning jump-kick at|dragon-punches|DRILLS|flails|flogs|gashes|gnaws|gorges|headbutts|hits|incises|jabs|jostles|jump-kicks|kicks|knocks|morsels|munches|MUNCHES|nibbles|nips|pats|perforates|pierces|pokes|pricks|plunges|pummels|punches|punctures|RENDS|riddles|rips|RIPS|rives|RIVES|rams|RAMS|scrapes|scratches|side-kicks|slaps|slashes|slices|slices sharply|slits|shafts|shaves|shoves|shreds|SHREDS|sinks|smacks|snaps|socks|spanks|spin-kicks|splits|sticks|stomps|strikes|strokes|sweeps|tastes|tatters|tears|TEARS|thrusts|THRUSTS|thumps|triple-kicks|uppercuts|whacks|whips|WHIPS|wounds

;; You against monster
/eval /def -F -p5 -aCwhite -mregexp -t"^\
;; First part of hit message
(You|Grinning diabolically you|Grinning devilishly you|Grinning wickedly you|Smiling devilishly you)\
;; Possible adjectives
( | badly | barely | BARBARICALLY | BRUTALLY | craftily | CRUELLY | cruelly | DEVASTATE | DEVASTATINGLY | fluidly | horribly | HORRIBLY | incisively | lightly | masterfully | MASTERFULLY | powerfully | quickly | really | REALLY | savagely | SAVAGELY | slightly | solidly | uncontrollably )\
;; Hits are defined earlier
(%{hits})" combat_hit= /set combat_hits=$$[{combat_hits}+1]

;; CRITICALS!!
/def -F -p5 -aCred -mregexp -t"You score a CRITICAL hit!" combat_crit= /set combat_crits=$[{combat_crits}+1]
/def -F -p5 -aBCred -mregexp -t"You score a \\*CRITICAL\\* hit!" combat_crit2= /set combat_crits=$[{combat_crits}+1]

;; Tumbles
/def -F -p5 -aCmagenta -mregexp -t"tries to dodge your hit, but you are not fooled that easily!$" combat_tumble= /set combat_tumbles=$[{combat_tumbles}+1]

;; Misses
/def -F -p5 -aCcyan -mregexp -t"You miss" combat_miss= /set combat_misses=$[{combat_misses}+1]

;; Parry
/def -F -p5 -aCgreen -mregexp -t"You successfully parry" combat_parry= /set combat_parrys=$[{combat_parrys}+1]

;; Riposte
/def -F -p5 -aCmagenta -mregexp -t"...AND counterattack with ferocity." combat_riposte= /set combat_ripostes=$[{combat_ripostes}+1]

;; Dodge
/def -F -p5 -aCblue -mregexp -t"You successfully dodge" combat_dodge= /set combat_dodges=$[{combat_dodges}+1]

;; Stuns
/def -F -p5 -aBCred -mregexp -t"^You STUN" combat_stun= /set combat_stuns=$[{combat_stuns}+1]
;; Sister Cudia is suddenly almost unable to stay in balance.

;; Stunned Maneuvers
/def -F -p5 -aBCblue -mregexp -t"...BUT you break it off with intense concentration." combat_stunned_maneuver= /set combat_stunned_maneuvers=$[{combat_stunned_maneuvers}+1]

;; Monster against you
;; Hits
/eval /def -F -p5 -aCyellow -mregexp -t"(%{hitteds}) you" combat_hitted= /set combat_hitteds=$$[{combat_hitteds}+1]%%; /if ({P1}=~"DRILLS") @party say DRILLED me with it's BLACK&DECKER!!%%; /elseif (({P1}=~"BITES") | ({P1}=~"MUNCHES")) @party say OW! I'm not LUNCH!%%; /endif

;; Criticals
/def -F -p5 -aCred -mregexp -t"^(Smiling devilishly|Smiling demonically|Grinning diabolically|Grinning devilishly|Grinning wickedly|Cackling demonically|Cackling devilishly) [[A-Za-z '-]+]* you" combat_critted= /set combat_critteds=$[{combat_critteds}+1]%; @party say They're beating me up!

;; Misses
/def -F -p5 -aCblue -mregexp -t"misses you." combat_missed= /set combat_misseds=$[{combat_misseds}+1]

;; Dodges
/def -F -p5 -aCcyan -mregexp -t"successfully dodges your futile" combat_dodged= /set combat_dodgeds=$[{combat_dodgeds}+1]

;;Tumbles
/def -F -p5 -aCmagenta -mregexp -t"You try to dodge, but [A-Za-z '-]+ is not fooled." combat_tumbled= /set combat_tumbleds=$[{combat_tumbleds}+1]

;; Parries
/def -F -p5 -aCcyan -mregexp -t"successfully parries your" combat_parried= /set combat_parrieds=$[{combat_parrieds}+1]

;; Ripostes
/def -F -p5 -aCyellow -mregexp -t"...AND counterattacks with ferocity." combat_riposted= /set combat_riposteds=$[{combat_riposteds}+1]

;; Stuns
/def -F -p5 -aBCred -t"You are STUNNED." combat_stunned= /set combat_stunneds=$[{combat_stunneds}+1]

;; Stunned Maneuvers
/def -F -p5 -aCblue -t"...WHO breaks the stun quickly off with intense concentration." combat_stunned_maneuvered= /set combat_stunned_maneuverds=$[{combat_stunned_maneuvereds}+1]

;; Skills
;;/def -F -p5 -aB -mregexp -t"(swings a foot in a long arc that ends at your kneecap. 'CRUNCH!'|performs a quick kick to your stomach)" kicked= @party say %{PL} kicked me!
;;/def -F -p5 -aB -mregexp -t"'s bash sends you sprawling." bashed= @party say %{PL} bashed me!
;;/def -F -p5 -aB -mregexp -t"tries to bash you, but promptly falls flat on his face." bashed_missed= @party say %{PL}'s bash missed me

;; Resists
/def -F -p5 -i -ag -mregexp -t" is defenseless against ([A-Za-z]+) damage." resist_0= @party say %{PL} has no %P1 resist
/def -F -p5 -i -ag -mregexp -t" seems to be almost defenseless against ([A-Za-z]+) damage." resist_20 = @party say %{PL} has 20\% %P1 resist.

/def -F -p5 -i -ag -mregexp -t" has some resistance against ([A-Za-z]+) damage." resist_40 = @party say %{PL} has 40\% %P1 resist.
/def -F -p5 -i -ag -mregexp -t" seems to be moderately resistant against ([A-Za-z]+) damage." resist_60 = @party say %{PL} has 60\% %P1 resist.
/def -F -p5 -i -ag -mregexp -t" has good resistance against ([A-Za-z]+) damage." resist_80 = @party say %{PL} has 80\% %P1 resist.
/def -F -p5 -i -ag -mregexp -t" seems almost immune against ([A-Za-z]+) damage." resist_100 = @party say %{PL} has 100\% %P1 resist


; New stun system

/def -F -ag -t"Your attack causes * to lose focus slightly." stun_1 = @party say Stunned mob a bit (lvl 1)
/def -F -ag -t"You hurt * who seems to become somewhat confused." stun_2 = @party say Stunned mob a bit (lvl 2)
/def -F -ag -t"You cause * world to become blurred and unfocused." stun_3 = @party say Stunned mob a bit (lvl 3)
/def -F -ag -t"You make * stagger helplessly in pain and confusion." stun_4 = @party say Stunned mob a bit (lvl 4)

