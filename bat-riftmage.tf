;; BatMUD
;; Triggers for use with mage guild
;; Also incorporates psionic offensive spells
;; Jenny@bat.org 1998
;;
;; Modified and maintained by Drifter since 1999->?
;; No changelog but meddled with lotsa stuff
;;
;; Needs this file to run spell casting triggers
/require -q bat-generic.tf
/require -q bat-analysis.tf
;; This is the tick reporting mode, spell points only
/set sp_report=on
;;/set fire_entity_name=Fire entity
/set fire_entity_name=Yazaemon the fire entity

;; Hi-lites
/def -F -mglob -aB -t"Your entity is prepared to do the skill." entti_skilli_hilite
/def -F -mglob -aB -t"* entity starts concentrating on a new offensive skill." entti_offuskilli_hilite
/def -F -mglob -ag -t"Your entity doesn't know that skill." gag_skilli
/def -F -mglob -t'Your hold on *\'s life energy slips away.' sparkbirth_off= @party report Spark birth down on %4

;; Spells
/def am =/set targettype=none%;/set spell=absorbing_meld%;/do_spell
/def bre=/set targettype=none%;/set spell=beckon_rift_entity%;/do_spell
/def cr =/set targettype=misc%;/set spell=create_rift%;/set spell_rounds=10%;/do_spell %{*}
/def cw =/set targettype=sac%;/set spell=consume_weapon%;/do_spell %{*}
/def crv=/set targettype=none%;/set spell=create_rift_vortex%;/do_spell
/def dl =/set targettype=off%;/set spell=dimensional_leech%;/set spell_rounds=3%;/do_spell %{*}
/def dr =/set targettype=none%;/set spell=darkness%;/do_spell
/def dre=/set targettype=none%;/set spell=dismiss_rift_entity%;/do_spell
/def eec=/set targettype=none%;/set spell=establish_entity_control%;/do_spell
/def fab=/set targettype=prot%;/set spell=force_absorption%;/do_spell %{*}
/def fl =/set targettype=prot%;/set spell=floating%;/do_spell %{*}
/def inv=/set targettype=prot%;/set spell=invisibility%;/do_spell %{*}
/def iw =/set targettype=prot%;/set spell=iron_will%;/do_spell %{*}
/def mi =/set targettype=prot%;/set spell=mirror_image%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|rift_pulse
/def rp =/set targettype=off%;/set spell=rift_pulse%;/set spell_rounds=3%;/do_spell %{*}
/def rre=/set targettype=ent%;/set spell=regenerate_rift_entity%;/do_spell %{*}
/def rs =/set targettype=none%;/set spell=rift_scramble%;/do_spell
/def sb =/set targettype=off%;/set spell=spark_birth%;/set spell_rounds=2%;/do_spell %{*}
/def sre=/set targettype=sum%;/set spell=summon_rift_entity%;/do_spell %{*}
/def tre=/set targettype=sum%;/set spell=transform_rift_entity%;/do_spell %{*}

/def -t"(Fire|Air|Water|Earth) entity eats the last of its rift sparks, and starts to look around the room with a fierce hunger in its eyes." entity_hungry = @party report (entity needs sparks)

;; Redo rift skills
/eval /def -F -mregexp -t"^%{fire_entity_name} strikes its opponent a glancing blow to the shield arm." fire_entity_redo_skill1 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} SMASHES .+ kneecap!"                                     fire_entity_redo_skill2 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} quickly strikes its opponent's exposed weapon hand!"     fire_entity_redo_skill3 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} swings widely, striking its enemy's instep."             fire_entity_redo_skill4 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} carefully strikes foe's exposed thigh!"                  fire_entity_redo_skill5 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} .+ weapon aside, and strikes at the opening!"            fire_entity_redo_skill6 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t".+ howls in pain as %{fire_entity_name} smashes .+"                           fire_entity_redo_skill7 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t".+ wails in agony as %{fire_entity_name} strikes .+"                          fire_entity_redo_skill8 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} feints high, then swiftly strikes low!"                  fire_entity_redo_skill9 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} trikes out, slashing a ragged wound in .+ forehead!"     fire_entity_redo_skill10 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} pummels .+ in the jaw!"                                  fire_entity_redo_skill11 = @gem cmd use blazing sunder
/eval /def -F -mregexp -t"^%{fire_entity_name} quickly steps forward and strikes .+ in the temple!"     fire_entity_redo_skill12 = @gem cmd use blazing sunder
/def -F -mglob -t"Your fire entity does some strange combat maneuver but doesn't hit anything."         fire_entity_missed_redo = @gem cmd use blazing sunder
/def -F -mglob -t"Your entity loses its concentration and cannot do the skill."  any_entity_skill_broke = @gem cmd use blazing sunder;@gem cmd use suffocating embrace;@gem cmd use subjugating backwash;@gem cmd use earthen cover
/def -F -mglob -t"Your air entity falters and its wispy tendrils fall to its sides."  air_entity_redo_skill = @gem cmd use suffocating embrace
/def -F -mglob -t"Your water entity stops glowing and its skin becomes still."  water_entity_redo_skill = @gem cmd use subjugating backwash
/def -F -mglob -t"Your earth entity hunches down looking much less solid than a second ago."  earth_entity_redo_skill = @gem cmd use earthen cover
/def -ag -t"You do not have an entity to control, try summoning one." no_entity_no_target


;; Ceremony
/set ceremony_status off
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

/def key_f7 = /sb .
/def key_f8 = /rp .
/def key_f12 = /uc
/def key_f13 = /rre
/def key_f14 = /eec
/def key_f15 = /hs
/def key_f16 = /bre

/def -ag -mregexp -i -t'^\| Power: ([O]*)([o]*)([!]*)([:]*)([,]*)' poikelot=\
/set kymppitonnit=%P1%;/set tonnit=%P2%;/set satkut=%P3%;/set kympit=%P4%;/set ykkoset=%P5%;\
/set pisteet=\
$[10000*strlen(kymppitonnit)+1000*strlen(tonnit)+100*strlen(satkut)+10*strlen(kympit)+strlen(ykkoset)]%;\
/set stringi=$[strcat(kymppitonnit,tonnit,satkut,kympit,ykkoset)]%;\
/echo  | Power: %stringi (%pisteet points)

;; Eitoimi
;;/def -ag -mregexp -i -t'^\| {Fire|Air|Water|Earth}[ ]+\| ([O]*)([o]*)([!]*)([:]*)([,]*)[.]+ \| {Pleased|Narked|Riled|Cross|ANGRY} \|$' kaikkientti_poikelot=\
;; Toimii
;;/def -ag -mregexp -i -t'^\| Fire[ ]+\| ([O]*)([o]*)([!]*)([:]*)([,]*)[.]+ \| Pleased \|$' kaikkientti_poikelot=\


;;/set kymppitonnit=%P1%;/set tonnit=%P2%;/set satkut=%P3%;/set kympit=%P4%;/set ykkoset=%P5%;\
;;/set pisteet=\
;;$[10000*strlen(kymppitonnit)+1000*strlen(tonnit)+100*strlen(satkut)+10*strlen(kympit)+strlen(ykkoset)]%;\
;;/set stringi=$[strcat(kymppitonnit,tonnit,satkut,kympit,ykkoset)]%;\
;;/echo  | Power: %stringi (%pisteet points)
