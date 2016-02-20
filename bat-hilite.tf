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

/set matching=glob
/set draconian_breath=unknown

;; Castle dirs to ease movement
/def up = door u open ;;u ;;door d locked
/def down = door d open ;;d ;;door u locked
/def west = door w open ;;w ;;door e locked
/def east = door e open ;;e ;;door w locked
/def north = door n open ;;n ;;door s locked
/def south = door s open ;;s ;;door n locked

;; Hilite some friends (I just hilite most important ones and those that ive met rl)
/set friends=[Ss]tarshine|[Jj]uki|[Mm]orglum|[Ii]rmavep|[Bb]moa|[Ee]ra|[Ee]lero|[Ss]lughter|[Dd]rizzin|[Mm]oonlord|[Kk]haradus|[Ss]augor|[Cc]roesus|[Zz]enick|[Bb]roetchen|[Ff]avorit|[Mm]ithrand|[Dd]rifter|[Nn]edra|[Kk]rokodiili|[Aa]rgoroth|[Mm]iigor|[Ff]oxbat|[Rr]onald|[Rr]obinhood|[Cc]aesar|[Jj]acen|[Ss]ir|[Dd]escad|[Gg]arou|[Cc]ran|[Ss]caler|[Gg]rimpold|[Pp]hineos|[Ss]winkkel|[Kk]ozma|[Cc]ozmo|[Rr]adium|[Mm]orloc|[Kk]ragan|[Ff]emko|[Gg]ror|[Gg]idan|[Bb]else|[Dd]arkwell|[Mm]ackakkonen|[Dd]eras|[Ss]aldas|[Kk]imvais|[Hh]orns|[Mm]inesweeper|[Aa]lcal|[Zz]ithromax|[Mm]ursia|[Tt]ascruel|[Mm]yshikin|[Ee]raser|[Ll]aaban|[Bb]leezuz|[Vv]alkrist|[Ss]olarhawk|[Mm]olotov|[Zz]orb
/eval /def -F -p10 -P1Cmagenta -mregexp -t"((^| )(%{friends})( |$$))" friends

/set reapers=[Aa]md|[Aa]nanator|[Aa]rnac|[Bb]oog|[Bb]rog|[Cc]aruth|[Cc]hamber|[Cc]utter|[Dd]argon|[Dd]eathwind|[Ee]ntor|[Ff]imir|[Ff]obbis|[Ff]renor|[Gg]itador|[Gg]laurung|[Hh]urin|[Kk]eat|[Mm]ahon|[Mm]endar|[Ss]earc|[Ss]raz|[Ss]eptium|[Tt]atza|[Vv]iko|[Ss]har
/eval /def -F -p10 -P1Ccyan -mregexp -t"((^| )(%{reapers})( |$$))" reapers

;; Important events and misc stuff
/def -F -p9 -aB -aCyellow -t"* tells* you '*" tell
/def -F -p9 -arB -aCred -t'* starts concentrating on a new offensive spell.' offensive
/def -F -p9 -aB -aCyellow -t'* has summoned *' summoned
/def -F -p8 -aB -aCyellow -t'When your eyes clear, * stands before you.' reloced
/def -F -p8 -aCbgyellow -aCred -t'Bank transfer from *' transfer
/def -F -p9 -aCbgcyan -t'You are so exhausted.' hurtmove
/def -F -p9 -aCred -t"* \'se on sarki nyt\'" destroy_armour
/def -F -p9 -aCred -t"* \'rikki ja poikki\'" destroy_weapon
/def -F -p9 -aBCyellow -aCbggreen -t"You feel like you just got slightly better *" improve_skill
/def -F -p9 -aCred -t"{*} turns very pale and shivers as if {he|she|it} had just been poisoned." stouch_in
/def -F -p6 -aBCgreen -t"*\'s flex shield wobbles." flexwork
/def -F -p6 -aBCwhite -t"Magical barrier dissolves." havendown

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
/def -p6 -aCbgred -aBCyellow -mglob -t'* lava blast hits *' lava_blast
/def -p6 -aCbgred -aBCyellow -mglob -t'* flame arrow hits *' flame_arrow
/def -p6 -aCbgred -aBCyellow -mglob -t'* firebolt hits *' firebolt
/def -p6 -aCbgred -aBCyellow -mglob -t'* fire blast hits *' fire_blast
/def -p6 -aCbgred -aBCyellow -mglob -t'* meteor swarm hits *' meteor_swarm
/def -p6 -aCbgred -aBCyellow -mglob -t'* meteor blast hits *' meteor_blast
/def -p6 -aCbgred -aBCyellow -mglob -t'* lava storm hits *' lava_storm
/def -p6 -aCbgred -aBCyellow -mglob -t'* con fioco hits *' con_fiocio
/def -p6 -aCbgred -aBCyellow -mglob -t'* gem fire hits *' gem_fire
/def -p6 -aCbgred -aBCyellow -mglob -t'* channelburn hits *' channelburn
/def -p6 -aCbgred -aBCyellow -mglob -t'* hits * with * meteor swarm.' meteor_swarm_2

;; Cold blasts
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* cold ray hits *' cold_ray
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* chill touch hits *' chill_touch
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* flaming ice hits *' flaming_ice
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* darkfire hits *' darkfire
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* cone of cold hits *' cone_cold
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* icebolt hits *' ice_bolt
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* hail storm hits *' hail_storm
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* hoar frost hits *' hoar_frost
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* spark birth hits *' spark_birth_hits
/def -p6 -aCbgwhite -aBCcyan -mglob -t'* rift pulse hits *' rift_pulse_hits

;; Poison blasts
/def -p6 -aCbggreen -aBCred -mglob -t'* thorn spray hits *' thorn_spray
/def -p6 -aCbggreen -aBCred -mglob -t'* poison blast hits *' poison_blast
/def -p6 -aCbggreen -aBCred -mglob -t'* venom strike hits *' venom_strike
/def -p6 -aCbggreen -aBCred -mglob -t'* poison spray hits *' poison_spray
/def -p6 -aCbggreen -aBCred -mglob -t'* power blast hits *' power_blast
/def -p6 -aCbggreen -aBCred -mglob -t'* killing cloud hits *' killing_cloud
/def -p6 -aCbggreen -aBCred -mglob -t'* summon carnal spores hits *' carnal_spores
/def -p6 -aCbggreen -aBCred -mglob -t'* splashes a bubbling red liquid onto {his|her|its} foe, causing a scream of pain!*' aelena_poison

;; Magical blasts
/def -p6 -aCbgyellow -aBCred -mglob -t'* golden arrow hits *' golden_arrow
/def -p6 -aCbgyellow -aBCred -mglob -t'* magic missile hits *' magic_missile
/def -p6 -aCbgyellow -aBCred -mglob -t'* summon lesser spores hits *' lesser_spores
/def -p6 -aCbgyellow -aBCred -mglob -t'* levin bolt hits *' levin_bolt
/def -p6 -aCbgyellow -aBCred -mglob -t'* magic wave hits *' magic_wave
/def -p6 -aCbgyellow -aBCred -mglob -t'* summon greater spores hits *' greater_spores
/def -p6 -aCbgyellow -aBCred -mglob -t'* magic eruption hits *' magic_eruption
/def -p6 -aCbgyellow -aBCred -mglob -t'* channelball hits *' channelball
/def -p6 -aCbgyellow -aBCred -mglob -t'* star light hits *' star_light
/def -p6 -aCbgyellow -aBCred -mglob -t'* wither flesh hits *' wither_flesh
/def -p6 -aCbgyellow -aBCred -mglob -t'You hit * with your earthquake.' earthquake_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* hits * with {his|her|its} earthquake.' earthquake2_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* a fuming symbol of purify appears into the forehead of *' saintly_touch_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* hits * with her flames of righteousness.' flames_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*strikes with {sheer|terrific|blazing|purifying|immense} {rage|force|glow|power} upon *' dispel_evil_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*strikes {mightily|hard} upon *' dispel_evil_hit2
/def -p6 -aCbgyellow -aBCred -mglob -t'*through the air {bursting|slamming|detonating|exploding|popping|crashing} on *' holy_bolt_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*through the air {blowing|unbalancing|damaging|dispelling|disrupting|rendering|annihilating|pulverizing} *' dispel_undead_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'*as one big burst, {brutally|frantically|horribly|moderately|slightly|striking|uncontrollably} {burning|directly|dismembering|exploding|rendering|scorching|wounding}*' banish_demons_hit
/def -p6 -aCbgyellow -aBCred -mglob -t'* emits fuming white aura around screaming *, brutally burning him.' dispel_undead_hit3
/def -p6 -aCbgyellow -aBCred -mglob -t'* DOUBLEs over in PAIN!' wither_hurts
/def -p6 -aCbgyellow -aBCred -mglob -t'* celestial spark hits *' celestial_spark
/def -p6 -aCbgyellow -aBCred -mglob -t'*as white lightning strikes through the air tickling *' holy_lance_hit
;;Smo frantically swings BURNING crucifix of Las and shrieks ' ¤Lassum¤ '
;;Smo is bathed in bright light as heavenly choir plays celestial fanfare. The universe halts as WRATH OF LAS
;;    thunders through Smo's sparkling BURNING crucifix of Las, cleansing Lich's soul by vaporizing the body!



;; Acid blasts
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* disruption hits *' disruption
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* acid wind hits *' acid_wind
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* acid arrow hits *' acid_arrow
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* acid rain hits *' acid_rain1
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* with {his|her|its} acid rain.' acid_rain2
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* acid ray hits *' acid_ray
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* acid storm hits *' acid_storm
/def -p6 -aCbgyellow -aBCgreen -mglob -t'* acid blast hits *' acid_blast

;; Electric blasts
/def -p6 -aCbgblue -aBCyellow -mglob -t'* blast lightning hits *' blast_lightning
/def -p6 -aCbgblue -aBCyellow -mglob -t'* shocking grasp hits *' shocking_grasp
/def -p6 -aCbgblue -aBCyellow -mglob -t'* lightning bolt hits *' lightning_bolt
/def -p6 -aCbgblue -aBCyellow -mglob -t'* chain lightning hits *' chain_lightning1
/def -p6 -aCbgblue -aBCyellow -mglob -t'You hit * chain lightning' chain_lightning2
/def -p6 -aCbgblue -aBCyellow -mglob -t'* forked lightning hits *' forked_lightning
/def -p6 -aCbgblue -aBCyellow -mglob -t'* electrocution hits *' electrocution
/def -p6 -aCbgblue -aBCyellow -mglob -t'* storm lightning hits *' storm_lightning
/def -p6 -aCbgblue -aBCyellow -mglob -t'* channelbolt hits *' channelbolt
/def -p6 -aCbgblue -aBCyellow -mglob -t'* summon storm hits *' summon_storm

;; Asphx blasts
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* vacuumbolt hits *' vacuumbolt
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* suffocation hits *' suffocation
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* chaos bolt hits *' chaos_bolt
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* vacuum ball hits *' vacuum_ball
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* strangulation hits *' strangulation
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* vacuum globe hits *' vacuum_globe
/def -p6 -aCbgmagenta -aBCblue -mglob -t'* blast vacuum hits *' blast_vacuum

;; Psi blasts
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* mind blast hits *' mind_blast
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* psibolt hits *' psi_bolt
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* psi blast hits *' psi_blast
/def -p7 -aCbgcyan -aBCmagenta -mglob -t'* mind disruption hits *' mind_disruption
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* psychic shout hits *' psychic_shout
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* psychic storm hits *' psychic_storm
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'A psychic crush hits *' psychic_crush4
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* crushes * mind with a powerful psychic attack!' psychic_crush
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* devastates * mind with {his|her|its} powers.' psychic_crush3
/def -p6 -aCbgcyan -aBCmagenta -mglob -t'* grins as her psychic crush hits *' Psychic_crush2
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
;; NB: I commented out the avoid stuff, after hitting a room with 20 aggromobs you can
;; imagine in a 9man party what happens when everyone has a trig like that...
/def -F -p6 -mglob -t'You cannot leave, you have been AMBUSHED.' ambush= @party say I'm AMBUSHED!
;;/def -F -p6 -mregexp -t"(Your small size avoids a nasty ambush.|
;;Your marvelous intellect avoids a nasty ambush.|Your keen senses note a disturbance
;;seconds before the ambush!|Your knowledge about [A-Za-z '-]* tactics enables you to avoid the ambush.|
;;Your superb intelligence enables you to avoif
;;the ambush.)" avoid_ambush1= @party say avoided ambush

;; Party
;;/def -F -p9 -t"* offers you membership to party:*" party_join= party join
/def -F -p9 -abCyellow -mglob -t"* is the new leader of the party." party_new_leader= party follow
/def -F -p9 -aBCyellow -mglob -t'You are the new leader of the party.' party_leader= party forcefollow all
;;/def -F -p9 -aBCyellow -t'lapses into unconsciousness from severe loss of blood.' unconscious= party say %{1} UNCONSCIOUS
/def -F -p6 -mregexp -t' starts grappling ([A-z]*)\\.$' grapplestart = @party report %P1 has been grappled!
/def -F -p6 -mglob -t"You feel more vital." death_stats_gone = @party report (Recovered from death)
/def -F -p6 -mglob -t"(*) fails to touch *" harm_missed = @say kurkota %P1 kurkota
;; Vampire warnings
/def -F -p99 -mglob -t"The water BURNS your skin." water_burns = @party say WATER BURNS!
/def -F -p99 -mglob -t"Your greater darkness spell dissolves." darkness_down = @party report Greater darkness down, please recast!
/def -F -p99 -mglob -t"The light here BURNS!!!" light_burns_poor_bat = @party report SUNLIGHT BURNS MEEEEE, OUCHOUCHOUCH!

/set generic_amount_list=(One|one|Two|two|Three|three|Four|four|Five|five|Six|six|[Ss]even|[Ee]ight|[Nn]ine|[Tt]en|[Mm]any|[Aa] small pile of|[Aa] pile of|[Aa] huge pile of|[Aa] big pile of|[Aa] small hill of|[Aa] mountain of|[0-9]*)
;; Greed
/def greed=\
  /if ({1}!~"on") \
    /undef greed_mith%;\
    /undef greed_bati%;\
    /undef greed_anip%;\
    /undef greed_plat%;\
    /undef greed_gold%;\
    /undef greed_head%;\
    /undef greed_mail%;\
    /undef greed_dagger%;\
    /undef greed_woodclub%;\
    /undef greed_catcollar%;\
    /undef greed_pike%;\
    /echo -aB TF info: Greed triggers (off)%; \
  /else \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} mithril coin' greed_mith = @get mithril%; \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} batium coin' greed_bati = @get batium%; \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} anipium coin' greed_anip = @get anipium%; \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} platinum coin' greed_plat = @get platinum%; \
    /def -F -p3 -P0 -mregexp -t'^%{generic_amount_list} gold coin' greed_gold = @get gold%; \
    /def -F -p3 -P0 -mregexp -t'^([Tt]he|%{generic_amount_list}) head.? of a (barbarian|troll)' greed_head = @get all head%;\
    /def -F -p3 -P0 -mregexp -t'^an aquamarine compass' greed_compass = @get compass%;\
    /def -F -p9 -P0 -mregexp -t'^An old iron plate mail' greed_mail = @get mail%;\
    /def -F -p9 -P0 -mregexp -t'^A very sharp dagger' greed_dagger = @get dagger%;\
    /def -F -p9 -P0 -mregexp -t'^A wood club' greed_woodclub = @get wood club%;\
    /def -F -p9 -P0 -mregexp -t'^Collar of the CatDemon' greed_catcollar = @get collar%;\
    /def -F -p9 -P0 -mregexp -t'^a well made pike' greed_pike = @get pike%;\
    /echo -aB TF info: Greed triggers (on)%; \
  /endif

;; Crap money
;/def -c0 -F -p5 -mregexp -t"^[0-9]+ coins \\(" crap_money=\
;   /edit -c100 extra_crap_money%;\
;   /repeat -1 1 /edit -c0 extra_crap_money%;\
;   /while ({#})\
;     /if ((regmatch(("silver|bronze|copper|tin|zinc|mowgles"), {1})) & (!(regmatch("platinum", {1}))))\
;       /if ((substr({1},-1,1)=~",") | (substr({1},-1,1)=~")"))\
;         /let crapmoney=$[substr({1},0,-1)]%;\
;       /else \
;         /let crapmoney=%{1}%;\
;       /endif%;\
;     drop %{crapmoney}%;\
;     /endif%;\
;     /shift%;\
;   /done
;/def -F -p5 -c0 -mregexp -t"\\[Cash:" extra_crap_money=\
;   /while ({#})\
;     /if ((regmatch(("silver|bronze|copper|tin|zinc|mowgles"), {1})) & (!(regmatch("platinum", {1}))))\
;       /if ((substr({1},-1,1)=~",") | (substr({1},-1,1)=~")"))\
;         /let crapmoney=$[substr({1},0,-1)]%;\
;       /else \
;         /let crapmoney=%{1}%;\
;       /endif%;\
;     drop %{crapmoney}%;\
;     /endif%;\
;     /shift%;\
;   /done

;; Donates
;; Give approximation only. Valuable stuff doesn't donate for as much.
;;
;; Has bugs, commented out. im not fixing.

;/set donated=0
;/def -F -p2 -mregexp -t'which was worth ([0-9]+) gold' damogran_donates =\
;   /set donated=$[donated +{P1}]%;\
;   /echo -aB TF info: total amount donated %{donated}
;
;/def -F -p2 -t"has donated stuff worth {*} gold" actual_donated=\
;   /if ({1}=~"{my-name}")/set donated=%{6}%;/endif
;/def -F -p5 -t"List of donaters:" start_donate_list= /set total_donated=0
;/def -F -p3 -t"* has donated stuff worth {*} gold" total_donations= /set total_donated=$[{total_donated} + {6}]
;/def donates=\
;   /echo -aB TF info: your %% of total donates = $[({donated}*100)/{total_donated}]%%

;;
;; Percolor and party trig belong to Spid@batmud.org
;;
;; NB: I had this part commented out for a while because of some lil bugs,
;; mostly with eq labels. I copied from spid's other pshow trig the regexp
;; (I'm lazy, but I don't have to re-invent the wheel) and it "should" work
;;
;; Addenum: In the end I had to tweak the trig a bit, not sure if it works
;;
;; If you notice tf hanging up when someone swaps eq, comment the pcolour out
;; //Drif
;;
/def -i percolor =\
  /if ({2}!=0)\
    /set tmpvar=$[({1}*100)/{2}]%;\
  /else \
    /if ({1}>=0)\
      /set tmpvar=100%;\
    /else \
      /set tmpvar=0%;\
    /endif%;\
  /endif%;\
  /if (tmpvar>75)\
    /echo BCwhite%;\
  /elseif (tmpvar>50)\
    /echo BCyellow%;\
  /elseif (tmpvar>35)\
    /echo BCgreen%;\
  /elseif (tmpvar>20)\
    /echo BCmagenta%;\
  /elseif (tmpvar>10)\
    /echo BCred%;\
  /elseif (tmpvar<10)\
    /echo Cred%;\
  /endif
;/def -i -p9 -ag -mregexp -t' ([\\-]*[0-9]+)\\([ ]*([\\-]*[0-9]+)\\) [ ]*([\\-]*[0-9]+)\\([ ]*([\\-]*[0-9]+)\\) [ ]*([\\-]*[0-9]+)\\([ ]*([\\-]*[0-9]+)\\) \\| [ ]*([0-9]+) \\| [ ]*([0-9]+) \\|$' pcolour=\

/def -ag -F -mregexp -t'^\\|([\\* ])([1-3\\?])\\.([1-3\\?])[ ]+([A-z\\+]*)[ ]+(ldr|fol|rest|form|dead|mbr|ld|stun|unc|amb)[ ]+([\\-]*[0-9]+)\\([ ]*([\\-]*[0-9]+)\\)[ ]+([\\-]*[0-9]+)\\([ ]*([\\-]*[0-9]+)\\)[ ]+([\\-]*[0-9]+)\\([ ]*([\\-]*[0-9]+)\\)[ ]+\\|[ ]+([0-9IVX\\?]+)[ ]+\\|[ ]+([0-9]+)[ ]+\\|' pcolour=\
/let TP2=$[pad({P1},1)]%;\
/let TP3=$[pad({P4},-12)]%;\
/let TP4=$[pad({P5}, 4)]%;\
/let TP5=$[pad({P6},4)]%;\
/let TP6=$[pad({P7},4)]%;\
/let TP7=$[pad({P8},4)]%;\
/let TP8=$[pad({P9},4)]%;\
/let TP9=$[pad({P10},3)]%;\
/let TP10=$[pad({P11},3)]%;\
/let TP11=$[pad({P12},3)]%;\
/let TP12=$[pad({P13},12)]%;\
/echo -w -p |%TP2 %P2.%P3   %TP3 %TP4 @{$(/percolor %P6 %P7)}%TP5@{n}(@{BCwhite}%TP6@{n}) @{$(/percolor %P8 %P9)}%TP7@{n}(@{BCwhite}%TP8@{n}) @{$(/percolor %P10 %P11)}%TP9@{n}(@{BCwhite}%TP10@{n}) | %TP11 | %TP12 |



;/def -i -h"PROMPT * * * * * >" prompt_colour=\
;   /echo -p hp:@{$(/percolor %{1} %{2})}%{1}@{n} ep:@{$(/percolor %{3} %{4})}%{3}@{n} exp:%{5} >
;/def -F -p5 -t"HELL ()." in_hell=/edit -c0 prompt_colour
;/def -F -p5 -t"You enter the corpse." outa_hell=/edit -c100 prompt_colour

/set degentimer=0
/set cotintimer=0

/def -mglob -t"* turns very pale!" cotwentin = /set cotintimer=$[time()]
/def -mglob -t"* appears weakened!" degenin = /set degentimer=$[time()]
/def -mglob -t"* turns very pale and shivers as if {he|she|it} had just been poisoned." touchin = /set touchtimer=$[time()]

/def lastdg= \
  /if (degentimer!=0)\
    /let lastdgtime=$[time()-degentimer]%;\
    /let dgin=$(/formattime %lastdgtime)%;\
  /else \
    /let dgin=0:00%;\
  /endif%;\
  /if (cotintimer!=0)\
    /let lastcottime=$[time()-cotintimer]%;\
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
  @party report ,--------------------------------------------------.%;\
  @party report #  TIMERS [ degene: %dgin  cot: %cotin touch: %touchin]  #%;\
  @party report `--------------------------------------------------'

/def -mregexp -t'^([A-Za-z]+) twirls before you.' reportdg = /lastdg

;special eq hilites, theyse are my own
/def -mglob -t"You feel a sharp stab in your finger as if something bit you!" tazbal_special = @party report (Stats boosted by ring)
/def -mglob -t"Suddenly, the runes on the Shield of the Wind glow bright*" shield_of_wind = @party report (Wind special avail)
/def -mglob -t"You finish sucking the soul. You feel younger!" ripper_done = hh
/def -mglob -t"The corpse isn't powerful enough for this." ripper_unable = hh
;; Thundermace
/def -mglob -aCbgblue -aBCyellow -t"* blazes with blue flames as a ray of lightning hits *" mace_special1
/def -mglob -aCbgblue -aBCyellow -t"* sparkles under heavy magical pressure finally ZAPPING *" mace_special2
/def -mglob -aCbgblue -aBCyellow -t"Air crackles around * as blue lightning electrocutes *" mace_special3
/def -mglob -aCbgblue -aBCyellow -t"* fumes with electric power and hurls a ray of lightning*" mace_special4
/def -mglob -aCbgblue -aBCyellow -t"* cuts deep into * flesh opening nasty wounds." mace_special5
/def -mglob -aCbgblue -aBCyellow -t"You yell in trance, \'Glory to Curath\' and slashes *" mace_special6
/def -mglob -aCbgblue -aBCyellow -t"* mace of Thunder in your hand is suddenly surrounded with bright blue*" mace_special7
/def -mglob -aCbgblue -aBCyellow -t"You wave * mace of Thunder menacingly before *" mace_special8
/def -mglob -aCbgblue -aBCyellow -t"The air around your * mace of Thunder is suddenly heavily*" mace_special9
/def -mglob -aCbgblue -aBCyellow -t"The skies above open and ENORMOUS flash of lightning dashes down from the*" mace_special10
/def -mglob -aCbgblue -aBCyellow -t"The skies above open and an ENORMOUS flash of lightning dashes down, SCORCHING*" mace_special11
;; Empyrean
/def -mglob -aCbgwhite -aBCcyan -t"Suddenly there are icicles flying from the blade of Empyrean towards *" empyrean_special1
/def -mglob -aCbgyellow -aBCred -t"Holy power engulfs you as Empyrean unleashes it's wrath on *" empyrean_special2
/def -mglob -aCbgred -aBCyellow -t"White hot flame from Empyrean shoots outward, incinerating *" empyrean_special3
/def -mglob -aCbgblue -aBCyellow -t"Supernatural lightnings from Empyrean STRIKES*" empyrean_special4
/def -mglob -aCbgyellow -aBCred -t"Divine flame surrounds you while the Empyrean strikes furiously at *" empyrean_special5
/def -mglob -t"As you channel your will to Las through Empyrean, the god grants you a protective shield of Faith." empyrean_sof_ok = @party say (empyrean SoF active)
/def -mglob -t"You try to channel your will through Empyrean.. but something goes wrong." empyrean_wof_fail = @party say EMPYREAN FUCKED!
;; Stormfall gag
/def -mglob -ag -t"Stormfall axe says*"
/def -mglob -ag -t"Stormfall axe screams*"
/def -mglob -ag -t"Stormfall axe asks*"

/def -mglob -t"You awaken from your short rest, and feel slightly better." campdone = @party report (done camping)
/def -mglob -t"You stretch yourself and consider camping." campready1 = @party report (can camp)
/def -mglob -t"You feel a bit tired." campready2 = @party report (can camp)
/def -mglob -t"You feel like camping a little." campready3 = @party report (can camp)
/def -mglob -t"You feel extra powers flowing into you from your bracers of divine knowledge." bracelet_boost = /echo -aB (TinyFugue) Int/spr boosted from bracers
/def -mglob -ag -t"The turtle starts squirming."


;/def fmob = /quote -S -dsend emote !grep -i \'%{*}\' /home/drifter/lib/casters.txt
;/def fmob = /quote -S -dsend emote !/home/drifter/lib/findmob.pl %{*}

/def -mglob -t"This location is now surrounded in a shimmering blue forcefield." shelt_is_up = /set sheltertimer=$[time()]
/def -mglob -t"The shimmering blue forcefield vanishes." shelter_is_down = /let shelttime=$[time()-sheltertimer]%;\
   /let fshelttime=$(/formattime %shelttime)%;\
   /echo -aB (TinyFugue) Shelter DOWN, timer: %fshelttime

/def -F -mglob -t'a tiny squirrel running around' darkwood_key = @kill squirrel
/def -F -mglob -t'You wear Demonic Ring of Invisibility*' demonring_wear = /repeat -300 1 /echo -aB (TF Info): Demonic ring ready

;; Draco race breath
/set draco_breath=ready
/def -mglob -t"You drift off into a deep daydream*" draconian_breath_ready = /set draco_breath_time=$[time()-draco_breath_timer]%;\
   /let fdraco_breath_time=$(/formattime %draco_breath_time)%;\
   /echo -aB (TF Info): Draconian breath available (%fdraco_breath_time)%;\
   /set draco_breath=ready
/def -mglob -t"Your innate power to breathe gas has restored." draconian_breath_ready2 = /set draco_breath_time=$[time()-draco_breath_timer]%;\
   /let fdraco_breath_time=$(/formattime %draco_breath_time)%;\
   /echo -aB (TF Info): Draconian breath available (%fdraco_breath_time)%;\
   /set draco_breath=ready
/def -mglob -t"You hit * with your blaze of magical fire." draconian_breath_used = /set draco_breath=charging%;/set draco_breath_timer=$[time()]
/def -mglob -t"Your innate ability has not restored itself." draconian_breath_not_ready = /set draco_breath=charging

;;
;; Tank timers
;;
/set herb_timer=0

/def -F -mglob -t'You eat a green mistletoe*' mistletoe_eaten = /set herb_timer=$[time()]%;/repeat -420 1 /echo -aB (TF Info): Herb ready
/def -F -mglob -t'You eat yarrow flower*' yarrow_eaten = /set herb_timer=$[time()]%;/repeat -420 1 /echo -aB (TF Info): Herb ready
/def -F -mglob -t'You eat burdock leaf*' burdock_eaten = /set herb_timer=$[time()]%;/repeat -420 1 /echo -aB (TF Info): Herb ready

/def herbs= \
	/if (herb_timer != 0)\
		/let lastherbtime=$[time()-herb_timer]%;\
		/let flastherb=$(/formattime %lastherbtime)%;\
	/else \
		/let flastherb=0:00%;\
	/endif%;\
	/echo -aB (TF Info): Breath: [%draco_breath]  Herb: [%flastherb]



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
