;; hilite triggers for use in BatMUD                                          ;;
;;                                                                            ;;
;; Triggers have a priority status.                                           ;;
;; Priorities 1-10 are kept for highliting text                               ;;
;; Use priorities 11-20 for triggers                                          ;;
;; All triggers should allow fall-thru (-F) and be named, the more            ;;
;; desciptive the name the better (to prevent clashes)                        ;;
;;                                                                            ;;
;; Originally coded by Spid, changes by Jenny.                                ;;
;;                                                                            ;;
;; Modified & maintained currently by Drifter since 2001-                     ;;
;; Last updated 9.1.2012                                                     ;;
;;                                                                            ;;
/loaded bat-hilite.tf

/set matching=glob

;; Castle dirs to ease movement
/def up = door u open ;;u ;;door d locked
/def down = door d open ;;d ;;door u locked
/def west = door w open ;;w ;;door e locked
/def east = door e open ;;e ;;door w locked
/def north = door n open ;;n ;;door s locked
/def south = door s open ;;s ;;door n locked

;; Hilite some friends (I just hilite most important ones and those that ive met rl)
/set friends=[Bb]erenn|[Bb]moa|[Bb]roetchen|[Cc]roesus|[Dd]rizzin|[Ee]lero|[Jj]uki|[Nn]edra|[Mm]oonlord|[Mm]orglum|[Ss]augor|[Ss]tarshine|[Ss]lughter|[Zz]enick|[Ff]avorit|[Mm]ithrand|[Dd]rifter|[Kk]rokodiili|[Mm]iigor|[Ff]oxbat|[Rr]onald|[Rr]obinhood|[Cc]aesar|[Jj]acen|[Ss]ir|[Dd]escad|[Gg]arou|[Cc]ran|[Ss]caler|[Gg]rimpold|[Pp]hineos|[Ss]winkkel|[Kk]ozma|[Cc]ozmo|[Rr]adium|[Mm]orloc|[Kk]ragan|[Ff]emko|[Gg]ror|[Gg]idan|[Bb]else|[Dd]arkwell|[Mm]ackakkonen|[Dd]eras|[Ss]aldas|[Kk]imvais|[Hh]orns|[Mm]inesweeper|[Aa]lcal|[Zz]ithromax|[Mm]ursia|[Tt]ascruel|[Mm]yshikin|[Ee]raser|[Ll]aaban|[Bb]leezuz|[Vv]alkrist|[Ss]olarhawk|[Mm]olotov|[Zz]orb|[Oo]mnos|[Zz]erks|[Mm]erioli
/eval /def -F -p10 -P1Cmagenta -mregexp -t"((^| )(%{friends})( |$$))" friends

/set reapers=[Aa]md|[Aa]nanator|[Aa]rnac|[Bb]oog|[Bb]rog|[Cc]aruth|[Cc]hamber|[Cc]utter|[Dd]argon|[Dd]eathwind|[Ee]ntor|[Ff]imir|[Ff]obbis|[Ff]renor|[Gg]itador|[Gg]laurung|[Hh]urin|[Kk]eat|[Mm]ahon|[Mm]endar|[Ss]earc|[Ss]raz|[Ss]eptium|[Tt]atza|[Vv]iko|[Ss]har
/eval /def -F -p10 -P1Ccyan -mregexp -t"((^| )(%{reapers})( |$$))" reapers

;; Important events and misc stuff
/def -F -p9 -aB -aCyellow -t"* tells* you '*" tell
/def -F -p9 -arB -aCred -t'* starts concentrating on a new offensive spell.' offensive
/def -F -p9 -aB -aCyellow -t'* has summoned *' summoned
/def -F -p8 -aB -aCyellow -t'When your eyes clear, * stands before you.' reloced
/def -F -p8 -aCbgyellow -aCred -t'Bank transfer from *' money_transfer
/def -F -p8 -aCbgyellow -aCred -t'* transferred * fulgurite * to you.' fulgurite_transfer
/def -F -p9 -aCbgcyan -t'You are so exhausted.' hurtmove
/def -F -p9 -aCred -t"* \'se on sarki nyt\'" destroy_armour
/def -F -p9 -aCred -t"* \'rikki ja poikki\'" destroy_weapon
/def -F -p9 -aBCyellow -aCbggreen -t"You feel like you just got slightly better *" improve_skill
/def -F -p9 -aCred -t"{*} turns very pale and shivers as if {he|she|it} had just been poisoned." stouch_in
/def -F -p6 -aBCgreen -t"*\'s flex shield wobbles." flexwork
/def -F -p6 -aBCwhite -t"Magical barrier dissolves." havendown
/def -F -p6 -aB -t"* acquires * from you\!" acuired_my_eq = @party report (WARNING: EQ ACQUIRED!)
/def -F -p6 -t"The swirling movement of the rift vortex catches your eye." rvs_available = /echo -aB (Tinyfugue) RVS Available

;; Priestcrit
/def -F -p9 -aB -aCwhite -t"* ..The power of Burglefloogah takes over *" habocrit
;; Nun crits
/def -F -p9 -aB -aCwhite -t"Wave of holy force flows through *" nun_dcrit1
/def -F -p9 -aB -aCwhite -t"Air crackles as UNSEEN amount of holy power combines into *" nun_dcrit2
/def -F -p9 -aB -aCwhite -t"Fabric of space TREMBLES as immense powers are channeled *" nun_dcrit3
/def -F -p9 -aB -aCwhite -t"Fabric of space ruptures and VAST amount of energy combines into *" nun_dcrit4
/def -F -p9 -aB -aCwhite -t"* flashes brilliantly, FUMING with celestial energy." nun_dcrit5
/def -F -p9 -aB -aCwhite -t"Saints smile over * as UNBOUNDED amount of energy merges into her spell." nun_dcrit6
/def -F -p9 -aB -aCwhite -t"IMMENSE amount of holy force rushes through trembling *" nun_dcrit7
/def -F -p9 -aB -aCwhite -t"Air crackles around * as extra amount of power merges into her spell." nun_dcrit8
/def -F -p9 -aB -aCwhite -t"Holy forces coil around *, OVERPOWERING her spell." nun_dcrit9
/def -F -p9 -aB -aCwhite -t"* sustains the spell and lets its power grow before unleashing it." nun_dcrit10
/def -F -p9 -aB -aCwhite -t"Gods smile on * SUPERNATURAL glow takes over her tears of Oxtoth." nun_dcrit11
/def -F -p9 -aB -aCwhite -t"Heavenly aura surrounds Entor as she releases the spell." nun_dcrit12
/def -F -p9 -aB -aCwhite -t"Space-time continuum collapses as ENORMOUS wave of energy streams through *" nun_dcrit13
/def -F -p9 -aB -aCwhite -t"* hands jolt as she draws TREMENDOUS amount of holy force from the surroundings." nun_dcrit14

;; Mage crits
/def -F -p6 -aB -aCwhite -t"* fingertips are surrounded with swirling ENERGY as {he|she|it} casts the spell." see_damcrit2
/def -F -p9 -aB -aCwhite -t"Magical rifts open above * and hideous rays of POWER combine {his|her|its} spell." see_damcrit3
/def -F -p9 -aB -aCwhite -t"The air before * becomes electrified and crackles with pure POWER." see_damcrit1
/def -F -p9 -aCmagenta -t"You feel some of * pain!" life_link_damage
;; Havent seen this in a while...
/def -F -p9 -aBCmagenta -aCbgcyan -t"You feel your luck changing." improve_luck

;; Spells affecting players
/def -F -p9 -t"* is turned into a frog*" frogged= @party report %{1} is frogged!
/def -F -p5 -t"* turns you into a frog." froggied= @party report rhiiibit! Ribbititit *croak* hriiibit!
;/def -F -p5 -t"You SAVE against POISON." save_poison= @party say saved from poison
/def -F -p9 -t"You feel rather empty-headed." forget_on_me= @party report Someone just cast forget on me!

;; Gagging
/def -ag -hREDEF redefs

;; Colours
/def -F -P1Cwhite -mregexp -t'([Gg]lowing)' glowing
/def -F -P1BCred -mregexp -t'((^| )[Rr]ed( |$))' red
/def -F -P1Cblue -mregexp -t'((^| )[Bb]lue)' blue
/def -F -P1BCblack -mregexp -t"((^| )[Bb]lack( |$))" black
/def -F -P1Cgreen -mregexp -t'((^| )[Gg]reen( |$))' green
/def -F -P1Ccyan -mregexp -t'((^| )[Cc]yan)' cyan
/def -F -P1Cmagenta -mregexp -t'((^| )[Mm]agenta( |$))' magenta
/def -F -P1BCyellow -mregexp -t'((^| )[Bb]rown( |$))' brown
/def -F -P1BCwhite -mregexp -t'((^| )[Gg]rey( |$))' grey
/def -F -P1Cyellow -mregexp -t'((^| )[Yy]ellow( |$))' yellow
/def -F -P1Cwhite -mregexp -t'((^| )[Ww]hite( |$))' white
/def -F -P1Cwhite -mregexp -t'((^| )[Ss]himmering( |$))' shimmering
/def -F -P1BCmagenta -mregexp -t'((^| )[Pp]urple( |$))' purple
/def -F -P1Cyellow -mregexp -t'((^| )[Gg]old( |$))' gold
/def -F -P1Cwhite -mregexp -t'((^| )[Ss]ilver( |$))' silver
/def -F -P1Cmagenta -mregexp -t'((^| )[Pp]ink( |$))' pink

;; Shape
/def -F -p5 -P1BCwhite -mregexp -t"(in excellent shape)" excellent_shape
/def -F -p5 -P1BCwhite -mregexp -t"(in a good shape)" good_shape
/def -F -p5 -P1BCyellow -mregexp -t"(slightly hurt)" slightly_hurt
/def -F -p5 -P1BCgreen -mregexp -t"(noticeably hurt)" noticeably_hurt
/def -p6 -P1BCgreen -mregexp -t"(not in a good shape)" nigs
/def -F -p5 -P1BCmagenta -mregexp -t"(in bad shape)" bad_shape
/def -F -p5 -P1BCred -mregexp -t"(in very bad shape)" very_bad_shape
/def -F -p5 -P1Cred -mregexp -t"(near death)" near_death
/def -F -p5 -P1Cred -mregexp -t"(DEAD, R.I.P.)" dead_rip

;; Fire blasts
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* lava blast hits *' lava_blast
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* flame arrow hits *' flame_arrow
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* firebolt hits *' firebolt
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* hits * with * fireball.' fireball
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* fire blast hits *' fire_blast
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* meteor blast hits *' meteor_blast
/def -p6 -aCbgred -aBCyellow -mglob -t'* meteor swarm hits *' meteor_swarm
/def -p6 -aCbgred -aBCyellow -mglob -t'* hits * with * meteor swarm.' meteor_swarm_2
/def -p6 -aCbgred -aBCyellow -mglob -t'* lava storm hits *' lava_storm
/def -p6 -aCbgred -aBCyellow -mglob -t'* hits * with * lava storm.' lava_storm_2
/def -F -p6 -aCbgred -aBCyellow -mglob -t'You hit * with your lava storm.' lava_storm_3
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* con fioco hits *' con_fiocio
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* gem fire hits *' gem_fire
/def -F -p6 -aCbgred -aBCyellow -mglob -t'* channelburn hits *' channelburn

;; Cold blasts
/def -F -p6 -aCbgwhite -aBCcyan -mglob -t'* cold ray hits *' cold_ray
/def -F -p6 -aCbgwhite -aBCcyan -mglob -t'* chill touch hits *' chill_touch
/def -F -p6 -aCbgwhite -aBCcyan -mglob -t'* flaming ice hits *' flaming_ice
/def -F -p6 -aCbgwhite -aBCcyan -mglob -t'* darkfire hits *' darkfire
/def -F -p6 -aCbgwhite -aBCcyan -mglob -t'* icebolt hits *' ice_bolt
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* cone of cold hits *' cone_cold
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* hailstorm hits *' hail_storm
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* hits * with * hailstorm.' hail_storm_2
/def -F -p6 -aCbgwhite -aBCcyan -mglob -t'You hit * with your hailstorm.' hail_storm_3
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* hoar frost hits *' hoar_frost
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* spark birth hits *' spark_birth_hits
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* rift pulse hits *' rift_pulse_hits
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* dimensional leech hits *' dimensional_leech_hits

;; Poison blasts
/def -F -p6 -aCbggreen -aBCred -mglob -t'* thorn spray hits *' thorn_spray
/def -F -p6 -aCbggreen -aBCred -mglob -t'* poison blast hits *' poison_blast
/def -F -p6 -aCbggreen -aBCred -mglob -t'* venom strike hits *' venom_strike
/def -F -p6 -aCbggreen -aBCred -mglob -t'* power blast hits *' power_blast
/def -F -p6 -aCbggreen -aBCred -mglob -t'* summon carnal spores hits *' carnal_spores
/def -p6 -aCbggreen -aBCred -mglob -t'* poison spray hits *' poison_spray
/def -p6 -aCbggreen -aBCred -mglob -t'* killing cloud hits *' killing_cloud
/def -p6 -aCbggreen -aBCred -mglob -t'* hits * with * killing cloud.' killing_cloud_2
/def -F -p6 -aCbggreen -aBCred -mglob -t'You hit * with your killing cloud.' killing_cloud_3
/def -p6 -aCbggreen -aBCred -mglob -t'* splashes a bubbling red liquid onto {his|her|its} foe, causing a scream of pain!*' aelena_poison

;; Magical blasts
/def -F -p6 -aCbgyellow -aBCred -mglob -t'* golden arrow hits *' golden_arrow
/def -F -p6 -aCbgyellow -aBCred -mglob -t'* magic missile hits *' magic_missile
/def -F -p6 -aCbgyellow -aBCred -mglob -t'* summon lesser spores hits *' lesser_spores
/def -F -p6 -aCbgyellow -aBCred -mglob -t'* levin bolt hits *' levin_bolt
/def -F -p6 -aCbgyellow -aBCred -mglob -t'* summon greater spores hits *' greater_spores
/def -p6 -aCbgyellow -aBCred -mglob -t'* magic wave hits *' magic_wave
/def -p6 -aCbgyellow -aBCred -mglob -t'* magic eruption hits *' magic_eruption
/def -p6 -aCbgyellow -aBCred -mglob -t'* hits * with * magic eruption.' magic_eruption_2
/def -F -p6 -aCbgyellow -aBCred -mglob -t'You hit * with your magic eruption.' magic_eruption_3
/def -p6 -aCbgyellow -aBCred -mglob -t'* channelball hits *' channelball
/def -p6 -aCbgyellow -aBCred -mglob -t'* star light hits *' star_light
/def -p6 -aCbgyellow -aBCred -mglob -t'* wither flesh hits *' wither_flesh
/def -p6 -aCbgyellow -aBCred -mglob -t'You hit * with your earthquake.' earthquake_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* hits * with {his|her|its} earthquake.' earthquake2_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* a {blazing|fuming} symbol of purify appears into the forehead of *' saintly_touch_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* saintly touch hits *' saintly_touch_hit2
/def -p6 -aCbgyellow -aBCred -mglob -t'* hits * with {his|her|its} flames of righteousness.' flames_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* hits * with {his|her|its} holy wind.' holy_wind_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*strikes with {sheer|terrific|blazing|purifying|immense} {rage|force|glow|power} upon *' dispel_evil_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*strikes {mightily|hard} upon *' dispel_evil_hit2
/def -p6 -aCbgyellow -aBCred -mglob -t'*through the air {bursting|slamming|detonating|exploding|popping|crashing} on *' holy_bolt_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*through the air {annihilating|blowing|unbalancing|damaging|dispelling|disrupting|incinerating|rendering|pulverizing|shocking} *' dispel_undead_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*as one big burst, {badly|brutally|frantically|horribly|moderately|slightly|striking|uncontrollably} {burning|directly|dismembering|exploding|rendering|scorching|wounding}*' banish_demons_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*emits fuming white aura around screaming * {badly|brutally} {burning|crushing} {him|her|it}*' dispel_undead_hit3
/def -p6 -aCbgyellow -aBCred -mglob -t'*is bathed in bright light as heavenly choir plays celestial fanfare. The universe halts as WRATH OF LAS thunders through *' wrath_of_las_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*DOUBLEs over in PAIN!' wither_hurts
/def -p6 -aCbgyellow -aBCred -mglob -t'* celestial spark hits *' celestial_spark
/def -p6 -aCbgyellow -aBCred -mglob -t'*as white lightning strikes through the air tickling *' holy_lance_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* word of destruction hits *' word_of_destruction_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* dispel evil hits *' dispel_evil_hits
/def -p6 -aCbgyellow -aBCred -mglob -t'* ghost light hits *' ghost_light_hits
;;Smo frantically swings BURNING crucifix of Las and shrieks ' ¤Lassum¤ '
;;Smo is bathed in bright light as heavenly choir plays celestial fanfare. The universe halts as WRATH OF LAS
;;    thunders through Smo's sparkling BURNING crucifix of Las, cleansing Lich's soul by vaporizing the body!


;; Acid blasts
/def -F -p6 -aCbgyellow -aBCgreen -mglob -t'* disruption hits *' disruption
/def -F -p6 -aCbgyellow -aBCgreen -mglob -t'* acid wind hits *' acid_wind
/def -F -p6 -aCbgyellow -aBCgreen -mglob -t'* acid arrow hits *' acid_arrow
/def -F -p6 -aCbgyellow -aBCgreen -mglob -t'* acid ray hits *' acid_ray
/def -F -p6 -aCbgyellow -aBCgreen -mglob -t'* acid blast hits *' acid_blast
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* acid rain hits *' acid_rain1
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* with {his|her|its} acid rain.' acid_rain2
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* acid storm hits *' acid_storm
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* hits * with * acid storm.' acid_storm_2
/def -F -p6 -aCbgyellow -aBCgreen -mglob -t'You hit * with your acid storm.' acid_storm_3

;; Electric blasts
/def -F -p6 -aCbgblue -aBCyellow -mglob -t'* blast lightning hits *' blast_lightning
/def -F -p6 -aCbgblue -aBCyellow -mglob -t'* shocking grasp hits *' shocking_grasp
/def -F -p6 -aCbgblue -aBCyellow -mglob -t'* lightning bolt hits *' lightning_bolt
/def -F -p6 -aCbgblue -aBCyellow -mglob -t'* forked lightning hits *' forked_lightning
/def -F -p6 -aCbgblue -aBCyellow -mglob -t'* electrocution hits *' electrocution
/def -p6 -aCbgblue -aBCyellow -mglob -t'* chain lightning hits *' chain_lightning1
/def -p6 -aCbgblue -aBCyellow -mglob -t'You hit * with your chain lightning.' chain_lightning2
/def -p6 -aCbgblue -aBCyellow -mglob -t'* lightning storm hits *' lightning_storm
/def -p6 -aCbgblue -aBCyellow -mglob -t'* hits * with * lightning storm.' lightning_storm_2
/def -F -p6 -aCbgblue -aBCyellow -mglob -t'You hit * with your lightning storm.' lightning_storm_3
/def -p6 -aCbgblue -aBCyellow -mglob -t'* channelbolt hits *' channelbolt
/def -p6 -aCbgblue -aBCyellow -mglob -t'* summon storm hits *' summon_storm

;; Asphx blasts
/def -F -p6 -aCbgmagenta -aBCblue -mglob -t'* vacuumbolt hits *' vacuumbolt
/def -F -p6 -aCbgmagenta -aBCblue -mglob -t'* suffocation hits *' suffocation
/def -F -p6 -aCbgmagenta -aBCblue -mglob -t'* chaos bolt hits *' chaos_bolt
/def -F -p6 -aCbgmagenta -aBCblue -mglob -t'* strangulation hits *' strangulation
/def -F -p6 -aCbgmagenta -aBCblue -mglob -t'* blast vacuum hits *' blast_vacuum
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* vacuum ball hits *' vacuum_ball
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* vacuum globe hits *' vacuum_globe
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* hits * with * vacuum globe.' vacuum_globe_2
/def -F -p6 -aCbgmagenta -aBCblue -mglob -t'You hit * with your vacuum globe.' vacuum_globe_3


;; Psi blasts
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* mind blast hits *' mind_blast
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* psibolt hits *' psi_bolt
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* psi blast hits *' psi_blast
/def -p7 -aCbgcyan -aBCmagenta -mglob -t'* mind disruption hits *' mind_disruption
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* psychic shout hits *' psychic_shout
/def -F -p6 -aCbgcyan -aBCmagenta -mglob -t'* psychic storm hits *' psychic_storm
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* hits * with * psychic storm.' psychic_storm_2
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'A psychic crush hits *' psychic_crush4
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* crushes * mind with a powerful psychic attack!' psychic_crush
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* devastates * mind with {his|her|its} powers.' psychic_crush3
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* psychic crush hits *' Psychic_crush2
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* paralyzes *' paralyzes
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* is stunned from the intrusion into {his|her|its} mind.' mind_seize
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'Your mental pathways dissolve under massive psychic forces!' crush_onme
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* bolt of knowledge hits *' bolt_of_know_hits

;; Other blasts
;;/def -p6 -aCbgblue -aBCwhite -t'* dispel evil hits *' dispel_evil
/def -p6 -aCbgblue -aBCwhite -mglob -t'* dispel good hits *' dispel_good
/def -p6 -aCbgblue -aBCwhite -mglob -t'* banish demons hits *' banish_demons
/def -p6 -aCbgblue -aBCwhite -mglob -t'* holy hand hits *' holy_hand
/def -p6 -aCbgwhite -aBCred -mglob -t'* casts a harming spell on *' harming
/def -p6 -aCbgwhite -aBCred -mglob -t'* harms you *' harming2
/def -p6 -aCbgyellow -aBCred -mglob -t"* looks wobbly and starts shaking." vortex_hit
/def -p6 -aCbgwhite -aBCred -mglob -t'* word of spite hits *' word_of_spite
/def -p6 -aCbgwhite -aBCred -mglob -t'* word of slaughter hits *' word_of_slaughter
/def -p6 -aCbgwhite -aBCred -mglob -t'* word of blasting hits *' word_of_blasting
/def -p6 -aCbgwhite -aBCred -mglob -t'* word of genocide hits *' word_of_genocide
/def -p6 -mglob -t'* {hit|hits} *  with {your|his|her|its} noituloves deathlore.' noitulove_dlore
/def -p9 -aB -aCyellow -mglob -t'* winces and looks a bit braver.' wither_ends
/def -p6 -aCbgwhite -aBCred -mglob -t'* noituloves dischord hits *' bard_discord

;; Ambush
/def -F -p6 -mglob -t'You cannot leave, you have been AMBUSHED.' ambush=@party say I'm AMBUSHED!

;; Party
/def -F -p9 -t"* offers you membership to party:*" party_join=@party join
/def -F -p9 -abCyellow -mglob -t"* is the new leader of the party." party_new_leader=@party follow
/def -F -p9 -aBCyellow -mglob -t'You are the new leader of the party.' party_leader=@party forcefollow all
;;/def -F -p9 -aBCyellow -t'lapses into unconsciousness from severe loss of blood.' unconscious= party say %{1} UNCONSCIOUS
/def -F -p6 -mregexp -t'([A-Za-z \-\'\,\.]+) starts grappling ([A-Za-z ]+)\\.$' grapplestart = @party report %P2 has been grappled by %P1
/def -F -p6 -mglob -t"You feel more vital." death_stats_gone = @party report (Recovered from death)

;; Greed
/set generic_amount_list=(One|one|Two|two|Three|three|Four|four|Five|five|Six|six|[Ss]even|[Ee]ight|[Nn]ine|[Tt]en|[Mm]any|[Aa] small pile of|[Aa] pile of|[Aa] huge pile of|[Aa] big pile of|[Aa] small hill of|[Aa] mountain of|[0-9]*)
/def greed=\
  /if ({1}!~"on") \
    /undef greed_mith%;\
    /undef greed_bati%;\
    /undef greed_anip%;\
    /undef greed_plat%;\
    /undef greed_gold%;\
    /undef greed_head%;\
    /undef greed_mail%;\
    /undef greed_wings%;\
    /undef greed_hugewings%;\
    /undef greed_dagger%;\
    /undef greed_woodclub%;\
    /undef greed_catcollar%;\
    /undef greed_pike%;\
    /undef greed_lightstone%;\
    /undef greed_essence%;\
    /undef greed_fulgurite_map%;\
    /echo -aB TF info: Greed triggers (off)%; \
  /else \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} mithril coin' greed_mith = @get mithril%; \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} batium coin' greed_bati = @get batium%; \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} anipium coin' greed_anip = @get anipium%; \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} platinum coin' greed_plat = @get platinum%; \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} gold coin' greed_gold = @get gold%; \
    /def -F -p3 -P0 -mregexp -t'^([Tt]he|%{generic_amount_list}) head.? of a (barbarian|troll)' greed_head = @get all head%;\
    /def -F -p9 -P0 -mregexp -t'^An old iron plate mail' greed_mail = @get mail%;\
    /def -F -p9 -P0 -mregexp -t'^a pair of insect wings' greed_wings = @get all%;\
    /def -F -p9 -P0 -mregexp -t'^a pair of HUGE insect wings' greed_hugewings = @get all%;\
    /def -F -p9 -P0 -mregexp -t'^A very sharp dagger' greed_dagger = @get dagger%;\
    /def -F -p9 -P0 -mregexp -t'^A wood club' greed_woodclub = @get wood club%;\
    /def -F -p9 -P0 -mregexp -t'^Collar of the CatDemon' greed_catcollar = @get collar%;\
    /def -F -p9 -P0 -mregexp -t'^a well made pike' greed_pike = @get pike%;\
    /def -F -p9 -P0 -mregexp -t'^a brightly glowing lightstone' greed_lightstone = @get lightstone%;\
    /def -F -p9 -P0 -mregexp -t'.* spills some of (his|her|its) essence.' greed_essence = @get essence%;\
    /def -F -p9 -P0 -mregexp -t'^a piece of a map' greed_fulgurite_map = @get map%;\
    /echo -aB TF info: Greed triggers (on)%; \
  /endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Degen/COT/Touch timer ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

/set degentimer=0
/set cottimer=0
/set touchtimer=0
/set togwtimer=0

/def -F -mregexp -t"([A-Za-z \-\'\,\.]+) turns very pale!" cotwentin = /set cottimer=$[time()]%;/set cottgt=%P1
/def -F -mregexp -t"([A-Za-z \-\'\,\.]+) appears weakened!" degenin = /set degentimer=$[time()]%;/set degentgt=%P1
/def -F -mregexp -t"([A-Za-z \-\'\,\.]+) turns very pale and shivers as if (he|she|it) had just been poisoned." touchin = /set touchtimer=$[time()]%;/set touchtgt=%P1
/def -F -mregexp -t"([A-Za-z \-\'\,\.]+) shivers as it is trapped in the cold center of the funnel." togwin = /set togwtimer=$[time()]%;/set togwtgt=%P1
/def -F -mregexp -t"([A-Za-z \-\'\,\.]+) is moving normally again." togwdown = @party report (Glacial Wind on %P1 is down!)

/def lastdg= \
  /if (degentimer!=0)\
    /let lastdgtime=$[time()-degentimer]%;\
    /let dgin=$(/formattime %lastdgtime)%;\
  /else \
    /let dgin=0:00%;\
  /endif%;\
  /if (cottimer!=0)\
    /let lastcottime=$[time()-cottimer]%;\
    /let cotin=$(/formattime %lastcottime)%;\
  /else \
    /let cotin=0:00%;\
  /endif%;\
  /if (touchtimer!=0)\
    /let lasttouchtime=$[time()-touchtimer]%;\
    /let touchin=$(/formattime %lasttouchtime)%;\
  /else \
    /let touchin=0:00%;\
  /endif%;\
  /if (togwtimer!=0)\
    /let lasttogwtime=$[time()-togwtimer]%;\
    /let gwindin=$(/formattime %lasttogwtime)%;\
  /else \
     /let gwindin=0:00%;\
  /endif%;\
  @emote ,-----------------------------.%;\
  @emote |  TIMERS                     |%;\
  @emote `-----------------------------'%;\
  @emote |  Degen: %dgin (%degentgt)%;\
  @emote |  Cot:   %cotin (%cottgt)%;\
  @emote |  Touch: %touchin (%touchtgt)%;\
  @emote |  GWind: %gwindin (%togwtgt)

/def -mregexp -t'^([A-Za-z]+) twirls before you.' reportdg = /lastdg


;;;;;;;;;;;;;;;;;;;;;
;; Misc eq hilites ;;
;;;;;;;;;;;;;;;;;;;;;

;;/def -mglob -t"You feel a sharp stab in your finger as if something bit you!" tazbal_special = @party report (Stats boosted by ring)
;;/def -mglob -t"Suddenly, the runes on the Shield of the Wind glow bright*" shield_of_wind = /echo -aB (TF Info): Wind special avail
;;/def -mglob -t"Your orb sparkles." orbready = /echo -aB (TF Info): Wind invoke reloaded
;;/def -mglob -t"You feel strength flowing between you and *" ringkiss = /repeat -00:10 1 @party report (Ring kiss loaded)
;; Thundermace
;/def -mglob -aCbgblue -aBCyellow -t"* blazes with blue flames as a ray of lightning hits *" mace_special1
;/def -mglob -aCbgblue -aBCyellow -t"* sparkles under heavy magical pressure finally ZAPPING *" mace_special2
;/def -mglob -aCbgblue -aBCyellow -t"Air crackles around * as blue lightning electrocutes *" mace_special3
;/def -mglob -aCbgblue -aBCyellow -t"* fumes with electric power and hurls a ray of lightning*" mace_special4
;/def -mglob -aCbgblue -aBCyellow -t"* cuts deep into * flesh opening nasty wounds." mace_special5
;/def -mglob -aCbgblue -aBCyellow -t"You yell in trance, \'Glory to Curath\' and slashes *" mace_special6
;/def -mglob -aCbgblue -aBCyellow -t"* mace of Thunder in your hand is suddenly surrounded with bright blue*" mace_special7
;/def -mglob -aCbgblue -aBCyellow -t"You wave * mace of Thunder menacingly before *" mace_special8
;/def -mglob -aCbgblue -aBCyellow -t"The air around your * mace of Thunder is suddenly heavily*" mace_special9
;/def -mglob -aCbgblue -aBCyellow -t"The skies above open and ENORMOUS flash of lightning dashes down from the*" mace_special10
;/def -mglob -aCbgblue -aBCyellow -t"The skies above open and an ENORMOUS flash of lightning dashes down, SCORCHING*" mace_special11
;; Empyrean
;/def -mglob -aCbgwhite -aBCcyan -t"Suddenly there are icicles flying from the blade of Empyrean towards *" empyrean_special1
;/def -mglob -aCbgyellow -aBCred -t"Holy power engulfs you as Empyrean unleashes it's wrath on *" empyrean_special2
;/def -mglob -aCbgred -aBCyellow -t"White hot flame from Empyrean shoots outward, incinerating *" empyrean_special3
;/def -mglob -aCbgblue -aBCyellow -t"Supernatural lightnings from Empyrean STRIKES*" empyrean_special4
;/def -mglob -aCbgyellow -aBCred -t"Divine flame surrounds you while the Empyrean strikes furiously at *" empyrean_special5
;/def -mglob -t"As you channel your will to Las through Empyrean, the god grants you a protective shield of Faith." empyrean_sof_ok = @party say (empyrean SoF active)
;/def -mglob -t"You try to channel your will through Empyrean.. but something goes wrong." empyrean_wof_fail = @party say EMPYREAN FUCKED!

/def -mglob -t"You awaken from your short rest, and feel slightly better." campdone = @party report (done camping)
/def -mglob -t"You stretch yourself and consider camping." campready1 = @party report (can camp)
/def -mglob -t"You feel a bit tired." campready2 = @party report (can camp)
/def -mglob -t"You feel like camping a little." campready3 = @party report (can camp)
;;/def -mglob -t"You feel extra powers flowing into you from your bracers of divine knowledge." bracelet_boost = /echo -aB (TinyFugue) Int/spr boosted from bracers

/def -F -mglob -t'You wear Demonic Ring of Invisibility*' demonring_wear = /repeat -0:10 1 /echo -aB (TF Info): Demonic ring ready
;;/def -F -mglob -t'a tiny squirrel running around' darkwood_key = @kill squirrel

;;;;;;;;;;;;;
;; GAGGING ;;
;;;;;;;;;;;;;
/def -ag -mregexp -t"\[\d\d:\d\d\]:[A-z]+\s[\{\(\[]\w+[\)\]\}]:.*mapsies.*" gagmapsies
/def -mglob -ag -t"The turtle starts squirming." turtlesquirm_gag
/def -mglob -ag -t"The green turtle makes some tiny snoring noises." turtlesnore_gag
/def -mglob -ag -t"The green turtle slumber peacefully." turtleslumber_gag
/def -mregexp -ag -t"A cart labeled \'.*\' emotes \'.*\'" merchantcart_gag
/def -mglob -ag -t"The devil monkey of * whispers*" asmomoney_gag
/def -mglob -ag -t"Shasti tells you *" shasti_gag
/def -mglob -ag -t"Ramon tells you *"  ramon_gag
/def -mglob -ag -t"Biff Swift shouts*" biffswift_gag
/def -mglob -ag -t"Garunia tells you*" garunia_gag
/def -mglob -ag -t"* is surrounded by an orange force field." pumpkin_shit01
/def -mglob -ag -t"Your pumpkin shell shield begins recharging." pumpkin_shit02
/def -mglob -ag -t"Your pumpkin shell shield is fully recharged." pumpkin_shit03
/def -mglob -ag -t"Your pumpkin shell shield bursts and vanishes." pumpkin_shit04
/def -mglob -ag -t"* orange force field bursts and vanishes." pumpkin_shit05
/def -mregexp -ag -t"[A-Z][a-z]+ kneel|kneels down before Broetchen\.$" broe_tiara1
/def -mregexp -ag -t"[A-Z][a-z]+ kneel|kneels down before Ewige\.$" ewige_tiara1
/def -mregexp -ag -t"[A-Z][a-z]+ (booms|buzzes|echo|gurgles|mewls|says|quacks) \'Your majesty\.\'$" broe_tiara2

;; Swashbucking gag
/def -mglob -ag -t"* speech seems to catch *" swashbuckling_gag1
/def -mglob -ag -t"* speech doesn't seem to interest *" swashbuckling_gag2
/def -mglob -ag -t"* speech doesn't seem to have very strong influence on *" swashbuckling_gag3
/def -mglob -ag -t"* speech is too provocative to you." swashbuckling_gag4

;; Stormfall gag
/def -mglob -ag -t"Stormfall axe says*"    stormfall_axe_gag1
/def -mglob -ag -t"Stormfall axe screams*" stormfall_axe_gag2
/def -mglob -ag -t"Stormfall axe asks*"    stormfall_axe_gag3

;; Praixor glove help
/def glovegem =\
/echo  .-----------------------------.%;\
/echo  |   Praixor's Gem Zap List    |%;\
/echo  +-----------------------------+%;\
/echo  | Amber      -> Int           |%;\
/echo  | Aquamarine -> Rain          |%;\
/echo  | Bloodstone -> Acid Wind     |%;\
/echo  | Diamond    -> Lesser Spores |%;\
/echo  | Emerald    -> Poison        |%;\
/echo  | Hematite   -> Str           |%;\
/echo  | Jade       -> Dex           |%;\
/echo  | Moonstone  -> Wis           |%;\
/echo  | Onyx       -> Flaming Ice   |%;\
/echo  | Opal       -> Suffocation   |%;\
/echo  | Pearl      -> Banish        |%;\
/echo  | Pearl(blk) -> Area Banish   |%;\
/echo  | Ruby       -> Firebolt      |%;\
/echo  | Sapphire   -> Psibolt       |%;\
/echo  | Sunstone   -> Wind          |%;\
/echo  | Topaz      -> LightningBolt |%;\
/echo  |                             |%;\
/echo  |HEAL= carnelian,alexandrite  |%;\
/echo  |olivine,chrysoberyl,amethyst |%;\
/echo  |moss agate,zircon,quartz,    |%;\
/echo  |turquoise,malachite,garnet   |%;\
/echo  |rhodonite,                   |%;\
/echo  `-----------------------------` 

;; Skill drain hit
;; You feel DRAINED of knowledge!!!
