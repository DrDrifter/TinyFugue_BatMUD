;; BatMud
;; Supplementary triggers for all caster guilds that have analysis of magic lore
;;
/set analysis_report=off
/set last_analysis_target=none
/set current_analysis_target=none
/set current_resist=0
/set used_type=none
/set elec_analysis=unknown
/set acid_analysis=unknown
/set asph_analysis=unknown
/set cold_analysis=unknown
/set fire_analysis=unknown
/set total_count_blasts=0
/set count_dcrit1=0
/set count_dcrit2=0
/set count_dcrit3=0
;; Yeah, right...
/set count_unseen=0


;; Match used spell and damtype (only grab offensive mage singleblasts)
/def -F -mregexp -t'^You watch with self-pride as your (electrocution|blast lightning|shocking grasp|lightning bolt|forked lightning) hits *' used_elec_type= /set used_type=ELEC
/def -F -mregexp -t'^You watch with self-pride as your (disruption|acid wind|acid arrow|acid ray|acid blast) hits *' used_acid_type= /set used_type=ACID
/def -F -mregexp -t'^You watch with self-pride as your (vacuumbolt|suffocation|chaos bolt|strangulation|blast vacuum) hits *' used_asphyx_type= /set used_type=ASPH
/def -F -mregexp -t'^You watch with self-pride as your (chill touch|flaming ice|darkfire|icebolt|cold ray) hits *' used_cold_type= /set used_type=COLD
/def -F -mregexp -t'^You watch with self-pride as your (flame arrow|firebolt|fire blast|meteor blast|lava blast) hits *' used_fire_type= /set used_type=FIRE
/def -F -mregexp -t'^You watch with self-pride as your (magic missile|summon lesser spores|levin bolt|summon greater spores|golden arrow) hits *' used_mana_type= /set used_type=MANA
/def -F -mregexp -t'^You watch with self-pride as your (thorn spray|poison blast|venom strike|power blast|summon carnal spores) hits *' used_poison_type= /set used_type=POIS


;; Analysis of magic lore messages, grab the target's short name from here
/def -F -mregexp -aCbgred -aBCblack -p15 -t"([A-Za-z \-\'\,]+) screams in pain\." scream_pain=\
  /set current_analysis_target=%P1%;\
  /set current_resist=0%;\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse") & ({spell} !~ "dimensional_leech"))\
    /if ({analysis_report} =~ "on") /set_analysis%;/endif%;\
  /endif
/def -F -mregexp -aCbgred -aBCblack -p15 -t"([A-Za-z \-\'\,]+) writhes in agony\." writhe_agony=\
  /set current_analysis_target=%P1%;\
  /set current_resist=20%;\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ### writhes %damtype (20\%) ###%;\
    /if ({analysis_report} =~ "on") /set_analysis%;/endif%;\
  /endif
/def -F -mregexp -aCbgred -aBCblack -p15 -t"([A-Za-z \-\'\,]+) shudders from the force of the attack\." shudder=\
  /set current_analysis_target=%P1%;\
  /set current_resist=40%;\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse") & ({spell} !~ "dimensional_leech"))\
  /echo -aB ### Target shudders %damtype (40\%) ###%;\
    /if ({analysis_report} =~ "on") /set_analysis%;/endif%;\
  /endif
/def -F -mregexp -aCbgred -aBCblack -p15 -t"([A-Za-z \-\'\,]+) grunts from the pain\." grunt_pain=\
  /set current_analysis_target=%P1%;\
  /set current_resist=60%;\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse") & ({spell} !~ "dimensional_leech"))\
  /echo -aB ### GRUNTS %damtype (60\%) ###%;\
    /if ({analysis_report} =~ "on") /set_analysis%;/endif%;\
  /endif
/def -F -mregexp -aCbgblack -aBCred -p15 -t"([A-Za-z \-\'\,]+) winces a little from the pain\." winces=\
  /set current_analysis_target=%P1%;\
  /set current_resist=80%;\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse") & ({spell} !~ "dimensional_leech"))\
  /echo -aB ### Target winces %damtype (80\%) ###%;\
    /if ({analysis_report} =~ "on") /set_analysis%;/endif%;\
  /endif
/def -F -mregexp -aCbgblack -aBCred -p15 -t"([A-Za-z \-\'\,]+) shrugs off the attack\." shrug=\
  /set current_analysis_target=%P1%;\
  /set current_resist=100%;\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse") & ({spell} !~ "dimensional_leech"))\
  /echo -aB ###### SHRUGS %damtype ######%;\
    /if ({analysis_report} =~ "on") /set_analysis%;/endif%;\
  /endif

;; analysis target is blast target (eg. Guard) and result is the result of the latest blast
;; If the target has changed, we will clear the old results
/def set_analysis = \
  /set count_total_blasts=$[count_total_blasts+1]%;\
  /if ({current_analysis_target} !~ {last_analysis_target})\
    /set last_analysis_target=%current_analysis_target%;\
    /set elec_analysis=unknown%;\
    /set acid_analysis=unknown%;\
    /set asph_analysis=unknown%;\
    /set cold_analysis=unknown%;\
    /set fire_analysis=unknown%;\
    /set pois_analysis=unknown%;\
    /set mana_analysis=unknown%;\
    /set report_message=%;\
  /endif%;\
  /if ({used_type}=~"ELEC" & {elec_analysis} !~ {current_resist})\
    /set elec_analysis=%current_resist%;/do_report%;\
  /elseif ({used_type}=~"ACID" & {acid_analysis} !~ {current_resist})\
    /set acid_analysis=%current_resist%;/do_report%;\
  /elseif ({used_type}=~"ASPH" & {asph_analysis} !~ {current_resist})\
    /set asph_analysis=%current_resist%;/do_report%;\
  /elseif ({used_type}=~"COLD" & {cold_analysis} !~ {current_resist})\
    /set cold_analysis=%current_resist%;/do_report%;\
  /elseif ({used_type}=~"FIRE" & {fire_analysis} !~ {current_resist})\
    /set fire_analysis=%current_resist%;/do_report%;\
  /elseif ({used_type}=~"MANA" & {mana_analysis} !~ {current_resist})\
    /set mana_analysis=%current_resist%;/do_report%;\
  /elseif ({used_type}=~"POIS" & {pois_analysis} !~ {current_resist})\
    /set pois_analysis=%current_resist%;/do_report%;\
  /endif%;\

;; Echo the actual result back however you want it to be reported
;; (Note: This can also be triggered manually if you want to report resists)
/def do_report=\
  /set report_message=%;\
  /if ({elec_analysis} !~ "unknown") /set report_message=$[strcat("Elec: ",{elec_analysis},"% ",{report_message})]%;/endif%;\
  /if ({acid_analysis} !~ "unknown") /set report_message=$[strcat("Acid: ",{acid_analysis},"% ",{report_message})]%;/endif%;\
  /if ({asph_analysis} !~ "unknown") /set report_message=$[strcat("Asph: ",{asph_analysis},"% ",{report_message})]%;/endif%;\
  /if ({cold_analysis} !~ "unknown") /set report_message=$[strcat("Cold: ",{cold_analysis},"% ",{report_message})]%;/endif%;\
  /if ({fire_analysis} !~ "unknown") /set report_message=$[strcat("Fire: ",{fire_analysis},"% ",{report_message})]%;/endif%;\
  /if ({mana_analysis} !~ "unknown") /set report_message=$[strcat("Mana: ",{mana_analysis},"% ",{report_message})]%;/endif%;\
  /if ({pois_analysis} !~ "unknown") /set report_message=$[strcat("Pois: ",{pois_analysis},"% ",{report_message})]%;/endif%;\
  @%{analysis_inform} [%{current_analysis_target}] Resists: [%{report_message}]

;; Added this since sometimes I use direct commands that launch this manually
/def -F -mglob -t"You utter the magic words \'cwician ysl\'" sparkbirth_cast_manual = /set spell=spark_birth

;; Damage criticalities
/def -F -mglob -aCbgyellow -aBCred -p15 -t"You feel like your spell gained additional power." power=\
/set count_dcrit1=$[count_dcrit1+1]%;/echo -aB ** <dcrit 1> **
/def -F -mglob -aCbgyellow -aBCred -p15 -t"You feel like you managed to channel additional POWER to your spell." power2=\
/set count_dcrit2=$[count_dcrit2+1]%;/echo -aB **** <dcrit 2> ****
/def -F -mglob -aCbgyellow -aBCred -p15 -t'Your fingertips are surrounded with swirling ENERGY as you cast the spell.' power3=\
/set count_dcrit3=$[count_dcrit3+1]%;/echo -aB ****** <dcrit 3> ******
/def -F -mglob -aCbgyellow -aBCred -p15 -t'Unseen BURSTS of magic are absorbed into the spell!' power4=\
/set count_unseen=$[count_unseen+1]%;\
/echo -aB ************************************%;\
/echo -aB *****      <dcrit UNSEEN>      *****%;\
/echo -aB ************************************

/def spell_stats=\
@%{stats_inform} Critical statistics:%;\
@%{stats_inform} Total single offensive casts: %total_count_blasts%;\
@%{stats_inform} Dcrit1: %count_dcrit1 ($[(%total_count_blasts / %count_dcrit1)*100])%;\
@%{stats_inform} Dcrit2: %count_dcrit2 ($[(%total_count_blasts / %count_dcrit2)*100])%;\
@%{stats_inform} Dcrit3: %count_dcrit3 ($[(%total_count_blasts / %count_dcrit3)*100])%;\

/def anal=\
  /if (({1}=~"on") & ({2}=~"party"))\
    /set analysis_report=on%;\
    /set analysis_inform=party say%;\
    /echo -aB (TF info): damage analysis will be reported on party channel%;\
  /elseif (({1}=~"on") & ({2}=~"report"))\
    /set analysis_report=on%;\
    /set analysis_inform=party report%;\
    /echo -aB (TF info): damage analysis will be reported on party report channel%;\
  /elseif (({1}=~"on") & ({2}=~"emote"))\
    /set analysis_report=on%;\
    /set analysis_inform=emote%;\
    /echo -aB (TF info): damage analysis will be reported by emote%;\
  /elseif (({1}=~"on") & ({2}!~""))\
    /echo -aB (TF info): damage analysis can be toggled on party, report or emote%;\
  /elseif (({1}=~"on") & ({2}=~""))\
    /set analysis_report=on%;\
    /set analysis_inform=party report%;\
    /echo -aB (TF info): damage analysis will be reported on party report channel (default) %;\
  /elseif (({1}=~"stats") & ({2}=~"party"))\
    /set stats_inform=party report%;\
    /spell_stats%;\
  /elseif (({1}=~"stats") & ({2}=~"emote"))\
    /set stats_inform=party report%;\
    /spell_stats%;\
  /elseif (({1}=~"stats") & ({2}!~""))\
    /set stats_inform=party report%;\
    /spell_stats%;\
  /elseif ({1}=~"off")\
    /set analysis_report=off%;\
    /echo -aB (TF info): damage analysis iwill no longer be reported%;\
  /else \
    /echo -aB (TF info): damage analysis can be toggled either on or off.%;\
    /echo -aB (TF info): Usage: /anal [on|off|stats] (party|report|emote)%;\
  /endif

