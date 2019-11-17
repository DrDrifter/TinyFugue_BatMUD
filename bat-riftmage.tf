;; BatMUD
;; Triggers for use with riftwalker
;;
/loaded bat-riftmage.tf
;; Needs this file to run spell casting triggers
/require -q bat-generic.tf
/require -q bat-analysis.tf
;; This is the tick reporting mode, spell points only
/set sp_report=on
/set fire_entity_name=Bael the fire entity

;; Hi-lites
/def -F -mglob -aB -t"Your entity is prepared to do the skill." entti_skilli_hilite
/def -F -mglob -aB -t"* entity starts concentrating on a new offensive skill." entti_offuskilli_hilite
/def -F -mglob -ag -t"Your entity doesn't know that skill." gag_skilli
/def -F -mregexp -t'Your hold on ([A-z ]+)\'s life energy slips away.' sparkbirth_off = @party report Spark birth down on %P1
/def -F -mglob -aB -t'You bring the channelling to an end, and the dark shadow around * starts to dissipate.' dimleech_ends

;; Spells
/def am =/set targettype=none%;/set spell=absorbing_meld%;/do_spell
/def bre=/set targettype=none%;/set spell=beckon_rift_entity%;/do_spell
/def cr =/set targettype=misc%;/set spell=create_rift%;/set spell_rounds=10%;/do_spell %{*}
/def cw =/set targettype=sac%;/set spell=consume_weapon%;/do_spell %{*}
/def crv=/set targettype=none%;/set spell=create_rift_vortex%;/do_spell
/def dl =/set targettype=off%;/set spell=dimensional_leech%;/set spell_rounds=3%;/do_spell %{*}
/def dr =/set targettype=none%;/set spell=darkness%;/do_spell
/def dre=/set targettype=none%;/set spell=dismiss_rift_entity%;/do_spell
/def eec=/set targettype=none%;/set spell=establish_entity_control%;/do_spell%;@eecwear
/def fab=/set targettype=prot%;/set spell=force_absorption%;/do_spell %{*}
/def fl =/set targettype=prot%;/set spell=floating%;/do_spell %{*}
/def inv=/set targettype=prot%;/set spell=invisibility%;/do_spell %{*}
/def iw =/set targettype=prot%;/set spell=iron_will%;/do_spell %{*}
/def mi =/set targettype=prot%;/set spell=mirror_image%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|rift_pulse
/def rp =/set targettype=off%;/set spell=rift_pulse%;/set spell_rounds=3%;/do_spell %{*}
/def rre=/set targettype=ent%;/set spell=regenerate_rift_entity%;/do_spell %{*}%;@rrewear
/def rs =/set targettype=none%;/set spell=rift_scramble%;/do_spell
/def sb =/set targettype=off%;/set spell=spark_birth%;/set spell_rounds=2%;/do_spell %{*}
/def sre=/set targettype=sum%;/set spell=summon_rift_entity%;/do_spell %{*}
/def tre=/set targettype=sum%;/set spell=transform_rift_entity%;/do_spell %{*}


;; Redo rift entity skills when they stop
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} strikes its opponent a glancing blow to the shield arm." fire_entity_redo_skill1 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} SMASHES .+ kneecap!"                                     fire_entity_redo_skill2 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} quickly strikes its opponent's exposed weapon hand!"     fire_entity_redo_skill3 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} swings widely, striking its enemy's instep."             fire_entity_redo_skill4 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} carefully strikes foe's exposed thigh!"                  fire_entity_redo_skill5 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} .+ weapon aside, and strikes at the opening!"            fire_entity_redo_skill6 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t".+ howls in pain as %{fire_entity_name} smashes .+"                           fire_entity_redo_skill7 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t".+ wails in agony as %{fire_entity_name} strikes .+"                          fire_entity_redo_skill8 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} feints high, then swiftly strikes low!"                  fire_entity_redo_skill9 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} trikes out, slashing a ragged wound in .+ forehead!"     fire_entity_redo_skill10 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} pummels .+ in the jaw!"                                  fire_entity_redo_skill11 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} quickly steps forward and strikes .+ in the temple!"     fire_entity_redo_skill12 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t".+ eyes bulge with pain as %{fire_entity_name} strikes .+"                    fire_entity_redo_skill13 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} delivers a crushing blow to .+ windpipe!"                fire_entity_redo_skill14 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} ducks aside and delivers a stout blow to .+ head!"       fire_entity_redo_skill15 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"You hear a muffled crunch, as %{fire_entity_name} smashes .+ collarbone!"     fire_entity_redo_skill16 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t"^%{fire_entity_name} strikes .+ chest REALLY hard!"                           fire_entity_redo_skill17 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t".+ blood splatters on you as %{fire_entity_name} strikes .+ temple!"          fire_entity_redo_skill18 = @gem cmd use blazing sunder
/eval /def -pmaxpri -mregexp -t".+ pales as they watch %{fire_entity_name} do an impossibly complex series of movements, building in momentum and energy!.*"          fire_entity_redo_skill19 = @gem cmd use blazing sunder
/def -pmaxpri -F -mglob -t"Your fire entity does some strange combat maneuver but doesn't hit anything."      fire_entity_missed_redo = @gem cmd use blazing sunder
/def -pmaxpri -F -mglob -t"Your entity loses its concentration and cannot do the skill."  any_entity_skill_broke = @gem cmd use blazing sunder;@gem cmd use suffocating embrace;@gem cmd use subjugating backwash;@gem cmd use earthen cover
/def -pmaxpri -F -mglob -t"Your air entity falters and its wispy tendrils fall to its sides."          air_entity_redo_skill = @gem cmd use suffocating embrace
/def -pmaxpri -F -mglob -t"Your water entity stops glowing and its skin becomes still."                water_entity_redo_skill = @gem cmd use subjugating backwash
/def -pmaxpri -F -mglob -t"Your earth entity hunches down looking much less solid than a second ago."  earth_entity_redo_skill = @gem cmd use earthen cover
/def -pmaxpri -F -mglob -t"Your magic entity starts to move more normally."                            magic_entity_redo_skill = @gem cmd use wondrous stimulus
/def -ag -t"You do not have an entity to control, try summoning one." no_entity_no_target_gag

;; Ceremony
/set ceremony_status=off
/def uc=\
   /if ({ceremony_status}=~"off")\
     /set skill=ceremony%;\
     /set targettype=none%;\
     /do_skill%;\
   /else \
     /echo -aB (Tinyfugue): ceremony already catered for.%;\
   /endif
/def -F -p15 -t"You perform the ceremony." ceremony_on=\
   /set ceremony_status=on
;;/def -F -p15 -t"You have an unusual feeling as you cast the spell." ceremony_off= /set ceremony_status=off
/def -F -p15 -t"You start chanting." ceremony_off= /set ceremony_status=off

;; Keybindings
;; Note: eqset status requires bat-status for info statusbar, but it's not mandatory
;;/def key_f7 = /sb .
/def key_f8 = /rp .
/def key_f12 = /uc
/def key_f13 = /rre
/def key_f14 = /eec
/def key_f15 = /hs
/def key_f16 = /bre
/def key_f19 = @gagoutput remove kuppakeppi%;@eqset wear rift%;/set eqsetstatus=RIF
/def key_f20 = @gagoutput remove kuppakeppi%;@eqset wear cast%;/set eqsetstatus=CAS

;;
;; Entity rep in numbers 
;;

;; Init max values
/set firemax=25000
/set airmax=30000
/set watermax=50000
/set earthmax=70000
/set magicmax=500000

;; Identify your entity when you type gem entities <xxx>
;; Note: This might bug if your entity is not named
/def -ag -mregexp -t'^\| ([A-Z][a-z]+), (a|an) (tiny|titchy|miniscule|small|medium|large|huge|enormous|humongous|gargantuan) (fire|air|water|earth|magic) (entity) (glowing|shimmering|gleaming|sizzling|sparkling|glittering|radiating|throbbing|pulsating|blazing) (with) (power|POWER)(\s+)(Pleased|Narked|Riled|Cross|ANGRY)\s+\|' entity_identifier=\
/set entity_type=%P4%;\
/let entkympit=%P3%;\
/let entykkoset=%P6%;\
/let entkympit=$[replace("tiny","0",{entkympit})] %;\
/let entkympit=$[replace("titchy","1",{entkympit})] %;\
/let entkympit=$[replace("miniscule","2",{entkympit})] %;\
/let entkympit=$[replace("small","3",{entkympit})] %;\
/let entkympit=$[replace("medium","4",{entkympit})] %;\
/let entkympit=$[replace("large","5",{entkympit})] %;\
/let entkympit=$[replace("huge","6",{entkympit})] %;\
/let entkympit=$[replace("enormous","7",{entkympit})] %;\
/let entkympit=$[replace("humongous","8",{entkympit})] %;\
/let entkympit=$[replace("gargantuan","9",{entkympit})] %;\
/let entykkoset=$[replace("glowing","0",{entykkoset})] %;\
/let entykkoset=$[replace("shimmering","1",{entykkoset})] %;\
/let entykkoset=$[replace("gleaming","2",{entykkoset})] %;\
/let entykkoset=$[replace("sizzling","3",{entykkoset})] %;\
/let entykkoset=$[replace("sparkling","4",{entykkoset})] %;\
/let entykkoset=$[replace("glittering","5",{entykkoset})] %;\
/let entykkoset=$[replace("radiating","6",{entykkoset})] %;\
/let entykkoset=$[replace("throbbing","7",{entykkoset})] %;\
/let entykkoset=$[replace("pulsating","8",{entykkoset})] %;\
/let entykkoset=$[replace("blazing","9",{entykkoset})] %;\
/let stringi=$[strcat({P1},", ",{P2}," ",{P3}," ",{P4}," ",{P5}," ",{P6}," ",{P7}," ",{P8})]%;\
/let pituus=$[strrep(" ",strlen({P9})-5)]%;\
/let stringi=$[strcat(stringi," (",entkympit,entykkoset,")",pituus,{P10}," |")]%;\
;;/echo -aB Entity type: [%P4] size:  [%P3] + [%P5] (%stringi)%;\
/_echo | %stringi%;\
;; keybind f7 target for multiple targets
;; (NB: this requires sufficient rep for magic entity)
/if ({entity_type}=~"magic") /def key_f7 = /sb all%;/else /def key_f7 = /sb .%;/endif

;; Translate rep (Single entity stats page gem entitites xx )
/def -ag -F -mregexp -i -t'^\| Power: ([X]*)([O]*)([o]*)([!]*)([:]*)([,]*)(\s+)' poikelot=\
/let sadattonnit=%P1%;/let kymppitonnit=%P2%;/let tonnit=%P3%;/let satkut=%P4%;/let kympit=%P5%;/let ykkoset=%P6%;\
/let pisteet_old=%pisteet%;\
/set pisteet=\
$[100000*strlen(sadattonnit)+10000*strlen(kymppitonnit)+1000*strlen(tonnit)+100*strlen(satkut)+10*strlen(kympit)+strlen(ykkoset)]%;\
/let stringi=$[strcat(sadattonnit,kymppitonnit,tonnit,satkut,kympit,ykkoset)]%;\
/let muutos=$[{pisteet}-{pisteet_old}]%;\
/let alkurep=$(/eval /_echo %%{%{entity_type}alkurep})%;\
/if ($(/eval /_echo %%{%{entity_type}alkurep})=~"") /set %{entity_type}alkurep=%pisteet%;/endif%;\
/let muutosalku=$[{pisteet}-{alkurep}]%;\
/let pituus=$[strrep(" ",strlen({P7})-strlen(%pisteet)-strlen(%muutos)-strlen(%muutosalku)-18)]%;\
/eval /_echo  | Power: %stringi (%pisteet points) [%muutos] [%muutosalku] %pituus |

;; Translate rep (All entities stats page - gem entities)
/def -ag -F -mregexp -i -t'^\| ([A-Z][a-z]+)(\s+)\| ([X]*)([O]*)([o]*)([!]*)([:]*)([,]*)([.]+) \| (Pleased|Narked|Riled|Cross|ANGRY)\s+\|$' kaikkientti_poikelot=\
/let enimi=%P1%;/let epad=%P2%;/let sadattonnit=%P3%;/let kymppitonnit=%P4%;/let tonnit=%P5%;/let satkut=%P6%;/let kympit=%P7%;/let ykkoset=%P8%;\
/let loppupad=%P9%;/let huumori=%P10%;\
/let kaikki_pisteet=\
$[100000*strlen(sadattonnit)+10000*strlen(kymppitonnit)+1000*strlen(tonnit)+100*strlen(satkut)+10*strlen(kympit)+strlen(ykkoset)]%;\
/let stringi=$[strcat(sadattonnit,kymppitonnit,tonnit,satkut,kympit,ykkoset)]%;\
/let loppupad=$[substr(%loppupad,strlen(%kaikki_pisteet)+11)]%;\
/_echo  | %enimi%epad| %stringi (%kaikki_pisteet points) %loppupad | %huumori |

;; Absorbing meld, only works if you have protter.tf loaded!
/createprot -t0 -n"AM" -w"You utter the magic words \'bredan forswelgan\'" \
-u"You successfully surround yourself with a barrier of energy which melds itself with your body." \
-d"You feel the melded barrier of energy dissipate from your body." -p"Absorbing Meld"

;; EQ swaps for riftwalker eq
/def -F -mglob -t"You remove lucky Nova Arcanum, Melkior's book of necromancy labeled as Great book of Tits." removed_in_wisset = \
@alias removeditem Nova Arcanum, Melkior's book of necromancy labeled as Great book of Tits
/def -F -mglob -t"You remove the black grimoire labeled as Mein Humpf." removed_in_asphset = \
@alias removeditem the black grimoire labeled as Mein Humpf
/def -F -mglob -t"You remove a dark staff adorned with a shadowy orb * labeled as KuppaKeppi from your right hand." removed_in_typeset = \
@alias removeditem long shadowy staff
/def -F -mglob -t"You remove a skull labeled as (s)kulli." removed_in_other_castset = \
@alias removeditem a skull labeled as (s)kulli
/def -F -mglob -t"You remove a wand of magic labeled as LateksiDildo." removed_in_sprset = \
@alias removeditem a wand of magic labeled as LateksiDildo
/def -F -mglob -t"You successfully establish control over your entity." entity_controlled = @put ohjauskeppi in hiivasylinteri;wear removeditem
/def -F -mglob -t"The entity is fully healed." entity_healed = @put parannustikku in hiivasylinteri;wear removeditem
/def -F -mglob -t"* the magic entity sees that you are unhurt and interrupts the channelling." entity_heal_me = \
@put parannustikku in hiivasylinteri;wear removeditem


;; Hilites
/def -mregexp -t"(Fire|Air|Water|Earth|Magic) entity eats the last of its rift sparks, and starts to look around the room with a fierce hunger in its eyes." entity_hungry = @party report (Entity needs sparks)
/def -mglob -t"You notice your entity's weapon glow with power!" entity_weapon_up = /echo TF Info: Entity weapon gained gem
/eval /def -mregexp -t"^%{fire_entity_name} (licks you\.|hugs you\.|cackles gleefully at you\.|slaps a thundering high-five with you\.|flexes its muscles before you\.|giggles inanely at you\.|screams happily\.|drools uncontrollably over you\.|lets out a yell of perverse delight as it feels the pain of battle\!|exclaims \'show me more pain master\!\'|lets out a yell of BEASTIAL bliss as it feels the pain of battle\!)" fire_entity_got_critted = @gem cmd parry 51
/eval /def -mregexp -t"^%{fire_entity_name}\'s battle joys come to an end." fire_entity_battlejoy_down = @gem cmd parry 0
/def  -F -p8 -aCbgyellow -aCred -t"You successfully sold * for * gold." sold_entity_shop


;; Reports (note: I've only listed the most useful reports here)
/def -t'Entity sense: You feel the pain of your entity as it is stunned!' entity_is_stunned = @party report (Entity is STUNNED)
/def -t'Entity sense: You feel free of your master but it leaves you feeling weak.' entity_ec_down = @party report (Entity Control down)
/def -t'Entity sense: Your crystal clear shield fades out.' entity_aoa_down = @party report (Entity AOA down)
/def -t'Entity sense: You no longer feel protected from being stunned.' entity_iw_down = @party report (Entity IW down)
/def -t'Entity sense: A skin brown flash momentarily surrounds you and then vanishes.' entity_fabs_down = @party report (Entity fabs down)
/def -t'Entity sense: Your flex shield wobbles, PINGs and vanishes.' entity_flex_down = @party report (Entity flex down)


;; Just some debug stuff
/def entdebug=\
   /echo -aB -p (Debug) entity=%{entity_type} spell=%{spell} executing_skill=%{executing_skill} start_flag=%{start_flag} targettype=%{targettype} %{targettype}_target=%%{%{targettype}_target}

