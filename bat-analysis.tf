;; BatMud
;; Supplementary triggers for all caster guilds that have analysis of magic lore
;;
/set analysis_report=off
/set last_analysis_target=none
/set used_type=none
/set elec_analysis=unknown
/set acid_analysis=unknown
/set asph_analysis=unknown
/set cold_analysis=unknown
/set fire_analysis=unknown


;; Elec
/def -F -mregexp -t'^You watch with self-pride as your (electrocution|blast lightning|shocking grasp|lightning bolt|forked lightning) hits *' used_elec_type= /set used_type=ELEC
/def -F -mregexp -t'^You watch with self-pride as your (disruption|acid wind|acid arrow|acid ray|acid blast) hits *' used_acid_type= /set used_type=ACID
/def -F -mregexp -t'^You watch with self-pride as your (vacuumbolt|suffocation|chaos bolt|strangulation|blast vacuum) hits *' used_asphyx_type= /set used_type=ASPH
/def -F -mregexp -t'^You watch with self-pride as your (chill touch|flaming ice|darkfire|icebolt|cold ray) hits *' used_cold_type= /set used_type=COLD
/def -F -mregexp -t'^You watch with self-pride as your (flame arrow|firebolt|fire blast|meteor blast|lava blast) hits *' used_fire_type= /set used_type=FIRE
/def -F -mregexp -t'^You watch with self-pride as your (magic missile|summon lesser spores|levin bolt|summon greater spores|golden arrow) hits *' used_mana_type= /set used_type=MANA
/def -F -mregexp -t'^You watch with self-pride as your (thorn spray|poison blast|venom strike|power blast|summon carnal spores) hits *' used_poison_type= /set used_type=POIS


;; Analysis of magic lore messages
/def -F -mglob -aCbgred -aBCblack -p15 -t"* screams in pain." scream_pain
/def -F -mregexp -aCbgred -aBCblack -p15 -t"(.+) writhes in agony\." writhe_agony=\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ### writhes %damtype (20\%) ###%;\
    /if ({analysis_report} =~ "on") /report_analysis %P1 20%;/endif%;\
  /endif
/def -F -mregexp -aCbgred -aBCblack -p15 -t"(.+) shudders from the force of the attack\." shudder=\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ### Target shrudders %damtype (40\%) ###%;\
    /if ({analysis_report} =~ "on") /report_analysis %P1 40%;/endif%;\
  /endif
/def -F -mregexp -aCbgred -aBCblack -p15 -t"(.+) grunts from the pain\." grunt_pain=\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ### GRUNTS %damtype (60\%) ###%;\
    /if ({analysis_report} =~ "on") /report_analysis %P1 60%;/endif%;\
  /endif
/def -F -mregexp -aCbgblack -aBCred -p15 -t"(.+) winces a little from the pain\." winces=\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ### Target winces %damtype (80\%) ###%;\
    /if ({analysis_report} =~ "on") /report_analysis %P1 80%;/endif%;\
  /endif
/def -F -mregexp -aCbgblack -aBCred -p15 -t"(.+) shrugs off the attack\." shrug=\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ###### SHRUGS %damtype ######%;\
    /if ({analysis_report} =~ "on") /report_analysis %P1 100%;/endif%;\
  /endif

/def report_analysis = \
;; analysis target is blast target (eg. Guard) and result is the result of the latest blast
  /set analysis_target = {1}%;\
  /set analysed_result = {2}%;\
;; If the target has changed, we will clear the old results
  /if ({analysis_target} != {last_analysis_target})\
    /set last_analysis_target = analysis_target%;\
    /set elec_analysis=unknown%;\
    /set acid_analysis=unknown%;\
    /set asph_analysis=unknown%;\
    /set cold_analysis=unknown%;\
    /set fire_analysis=unknown%;\
    /set report_message=""%;
  /endif%;\
  /if ({used_type} =~ "ELEC" & ({elec_analysis} != "unknown" | {elec_analysis} != {analyzed_result}))\
    /set elec_analysis=analysed_result%;\
    /set report_message=$[strcat("Elec: "{elec_analysis}," ",{report_message})]%;
  /endif%;\
  /if ({used_type} =~ "ACID" & ({acid_analysis} != "unknown" | {acid_analysis} != {analyzed_result}))\
    /set acid_analysis=analysed_result%;
    /set report_message=$[strcat("Acid: "{acid_analysis}," ",{report_message})]%;
  /endif%;\
  /if ({used_type} =~ "ASPH" & ({asph_analysis} != "unknown" | {asph_analysis} != {analyzed_result}))\
    /set asph_analysis=analysed_result%;\
    /set report_message=$[strcat("Asph: "{asph_analysis}," ",{report_message})]%;
  /endif%;\
  /if ({used_type} =~ "COLD" & ({cold_analysis} != "unknown" | {cold_analysis} != {analyzed_result}))\
    /set cold_analysis=analysed_result%;\
    /set report_message=$[strcat("Cold: "{cold_analysis}," ",{report_message})]%;
  /endif%;\
  /if ({used_type} =~ "FIRE" & ({fire_analysis} != "unknown" | {fire_analysis} != {analyzed_result}))\
    /set fire_analysis=analysed_result%;\
    /set report_message=$[strcat("Fire: "{fire_analysis}," ",{report_message})]%;
  /endif%;\
  /if ({used_type} =~ "MANA" & ({mana_analysis} != "unknown" | {mana_analysis} != {analyzed_result}))\
    /set mana_analysis=analysed_result%;\
    /set report_message=$[strcat("Mana: "{mana_analysis}," ",{report_message})]%;
  /endif%;\
  /if ({used_type} =~ "POIS" & ({pois_analysis} != "unknown" | {pois_analysis} != {analyzed_result}))\
    /set pois_analysis=analysed_result%;\
    /set report_message=$[strcat("Pois: "{pois_analysis}," ",{report_message})]%;
  /endif%;\
  @party report [{analysis_target}] Resists: [{report_message}]


;; Added this since sometimes I use commands that launch this manually
/def -F -mglob -t"You utter the magic words \'cwician ysl\'" sparkbirth_cast_manual = /set spell=spark_birth

;; Damage criticalities
/def -F -mglob -aCbgyellow -aBCred -p15 -t"You feel like your spell gained additional power." power=\
/echo -aB ** <dcrit 1> **
/def -F -mglob -aCbgyellow -aBCred -p15 -t"You feel like you managed to channel additional POWER to your spell." power2=\
/echo -aB **** <dcrit 2> ****
/def -F -mglob -aCbgyellow -aBCred -p15 -t'Your fingertips are surrounded with swirling ENERGY as you cast the spell.' power3=\
/echo -aB ****** <dcrit 3> ******
/def -F -mglob -aCbgyellow -aBCred -p15 -t'Unseen BURSTS of magic are absorbed into the spell!' power4=\
/echo -aB ************************************%;\
/echo -aB *****      <dcrit UNSEEN>      *****%;\
/echo -aB ************************************

/def anal=\
  /if (({1}=~"on") & ({2}=~"party"))\
    /set analysis_report=on%;\
    /set analysis_inform=party say%;\
    /echo -aB TF info: damage analysis will be reported on party channel%;\
  /elseif (({1}=~"on") & ({2}=~"report"))\
    /set analysis_report=on%;\
    /set analysis_inform=party report%;\
    /echo -aB TF info: damage analysis will be reported on party report channel%;\
  /elseif (({1}=~"on") & ({2}!~""))\
    /echo -aB TF info: damage analysis can be either toggled on party or report%;\
  /elseif (({1}=~"on") & ({2}=~""))\
    /set analysis_report=on%;\
    /set analysis_inform=party report%;\
    /echo -aB TF info: damage analysis will be reported on party report channel (default) %;\
  /elseif ({1}=~"off")\
    /set analysis_report=off%;\
    /echo -aB TF info: damage analysis iwill no longer be reported%;\
  /else \
    /echo -aB TF info: damage analysis can be toggled either on or off.%;\
    /echo -aB TF info: Usage: /anal [on|off] (party|report)%;\
  /endif

