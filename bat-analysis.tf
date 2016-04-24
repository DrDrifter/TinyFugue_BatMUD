;; BatMud
;; Supplementary triggers for all caster guilds that have analysis of magic lore
;;
/set analysis_report=off

;; Analysis of magic lore
/def -F -mglob -aCbgred -aBCblack -p15 -t"* screams in pain." scream_pain
/def -F -mregexp -aCbgred -aBCblack -p15 -t"(.+) writhes in agony." writhe_agony=\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ### writhes %damtype (20\%) ###%;\
    /if ({analysis_report} =~ "on") @party report [%P1] writhes %damtype (20\%)%;/endif%;\
  /endif
/def -F -mregexp -aCbgred -aBCblack -p15 -t"(.+) shudders from the force of the attack." shudder=\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ### Target shrudders %damtype (40\%) ###%;\
    /if ({analysis_report} =~ "on") @party report [%P1] shrudders %damtype (40\%)%;/endif%;\
  /endif
/def -F -mregexp -aCbgred -aBCblack -p15 -t"(.+) grunts from the pain." grunt_pain=\
  /if (({spell} !~ "spark_birth") & ({spell} !~ "rift_pulse"))\
  /echo -aB ### GRUNTS %damtype (60\%) ###%;\
    /if ({analysis_report} =~ "on") @party report [%P1] grunts %damtype (60\%)%;/endif%;\
  /endif
/def -F -mregexp -aCbgblack -aBCred -p15 -t"(.+) winces a little from the pain." winces=\
  /if (({spell} !~ "spark_birth") & ({spell} != "rift_pulse"))\
  /echo -aB ### Target winces %damtype (80\%) ###%;\
    /if ({analysis_report} =~ "on") @party report [%P1] winces %damtype (80\%)%;/endif%;\
  /endif
/def -F -mregexp -aCbgblack -aBCred -p15 -t"(.+) shrugs off the attack." shrug=\
  /if (({spell} !~ "spark_birth") & ({spell} != "rift_pulse"))\
  /echo -aB ###### SHRUGS %damtype ######%;\
    /if ({analysis_report} =~ "on") @party report [%P1] SHRUGS %damtype%;/endif%;\
  /endif

;; Added this since sometimes I use commands that launch this manually
/def -F -mglob -t"You utter the magic words \'cwician ysl\'" sparkbirth_cast_manual = /set spell=spark_birth

;; Damage criticalities
/def -F -mglob -aCbgyellow -aBCred -p15 -t"You feel like your spell gained additional power." power=\
/echo -aB ** <dcrit 1> **
/def -F -mglob -aCbgyellow -aBCred -p15 -t"You feel like you managed to channel additional POWER to your spell." power2=\
/echo -aB **** <dcrit 2> ****
/def -F -mglob -aCbgyellow -aBCred -p15 -t'Your fingertips are surrounded with swirling ENERGY as you cast the spell.' power3=\
/echo -aB ****** <dcrit 3> ******
/def -F -mglob -aCbgyellow -aBCred -p15 -t'Unseen BURSTS of magic are absorbed into the spell' power4=\
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

