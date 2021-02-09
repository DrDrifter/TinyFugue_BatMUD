;;************************************************************
;;
;; Entity hit counter by drifter
;; 
;; based on Hittilaskuri v2.1 by thiamin@batmud.bat.org
;; iwhich again is based on  
;; hittilaskuri 2.release, jkotka@cc.tut.fi
;; 10.6.2000 
;;************************************************************
/loaded bat-entitystats.tf
;Broetchen (party): Gashes/butts: 0 (0.0%)                                                            
;    Broetchen (party): Lthumps/bumps: 0 (0.0%))                                                         
;    Broetchen (party): Cuts/thumps: 82 (3.2%)                                                         
;    Broetchen (party): Tears/strokes: 1431 (56.0%)                                                   
;    Broetchen (party): Incises/thrusts: 667 (26.1%)                                      
;    Broetchen (party): Shreds/jabs: 371 (14.5%)  

;/set summoned_entity_name=Yazaemon the fire entity
/set summoned_entity_name=(Bael the fire entity|Lyft the air entity|Fleot the water entity|Eard the earth entity)

;; Bashing hits
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BARBARICALLY BASHES " cr_att26=/set crhit26=$$[crhit26+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} CRUELLY CUFFS " cr_att25=/set crhit25=$$[crhit25+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BRUTALLY BEATS " cr_att24=/set crhit24=$$[crhit24+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} REALLY WHACKS " cr_att23=/set crhit23=$$[crhit23+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} savagely strikes " cr_att22=/set crhit22=$$[crhit22+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} savagely socks " cr_att21=/set crhit21=$$[crhit21+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} horribly thrusts " cr_att20=/set crhit20=$$[crhit20+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} badly smashes " cr_att19=/set crhit19=$$[crhit19+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cruelly beats " cr_att18=/set crhit18=$$[crhit18+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} smashes " cr_att17=/set crhit17=$$[crhit17+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} beats " cr_att16=/set crhit16=$$[crhit16+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} whacks " cr_att15=/set crhit15=$$[crhit15+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} flails " cr_att14=/set crhit14=$$[crhit14+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} knocks " cr_att13=/set crhit13=$$[crhit13+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cuffs " cr_att12=/set crhit12=$$[crhit12+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} socks " cr_att11=/set crhit11=$$[crhit11+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} strikes " cr_att10=/set crhit10=$$[crhit10+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} bashes " cr_att9=/set crhit9=$$[crhit9+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} jabs " cr_att8=/set crhit8=$$[crhit8+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} thrusts " cr_att7=/set crhit7=$$[crhit7+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} strokes " cr_att6=/set crhit6=$$[crhit6+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} thumps " cr_att5=/set crhit5=$$[crhit5+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} bumps " cr_att4=/set crhit4=$$[crhit4+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} butts " cr_att3=/set crhit3=$$[crhit3+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} jostles " cr_att2 =/set crhit2=$$[crhit2+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly jostles " cr_att1 =/set crhit1=$$[crhit1+1]
;; Cutting hits (slash)
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} CRUELLY DISMEMBERS " sl_att26=/set slhit26=$$[slhit26+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} DISMEMBERS " sl_att25=/set slhit25=$$[slhit25+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BARBARICALLY RENDS " sl_att24=/set slhit24=$$[slhit24+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} CRUELLY RENDS " sl_att23=/set slhit23=$$[slhit23+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} SAVAGELY SHREDS " sl_att22=/set slhit22=$$[slhit22+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BRUTALLY TEARS " sl_att21=/set slhit21=$$[slhit21+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} savagely rips " sl_att20=/set slhit20=$$[slhit20+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} quickly cuts " sl_att19=/set slhit19=$$[slhit19+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} uncontrollably slashes " sl_att18=/set slhit18=$$[slhit18+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cruelly slashes " sl_att17=/set slhit17=$$[slhit17+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} rives " sl_att16=/set slhit16=$$[slhit16+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} savagely shaves " sl_att15=/set slhit15=$$[slhit15+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cruelly tatters " sl_att14=/set slhit14=$$[slhit14+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} slits " sl_att13=/set slhit13=$$[slhit13+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} incisively tears " sl_att12=/set slhit12=$$[slhit12+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} incisively cuts " sl_att11=/set slhit11=$$[slhit11+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} slashes " sl_att10=/set slhit10=$$[slhit10+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} horribly shreds " sl_att9=/set slhit9=$$[slhit9+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} shreds " sl_att8=/set slhit8=$$[slhit8+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} incises " sl_att7=/set slhit7=$$[slhit7+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} tears " sl_att6=/set slhit6=$$[slhit6+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} cuts " sl_att5=/set slhit5=$$[slhit5+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly cuts " sl_att4=/set slhit4=$$[slhit4+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} gashes " sl_att3=/set slhit3=$$[slhit3+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} solidly slashes " sl_att2 =/set slhit2=$$[slhit2+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} barely grazes " sl_att1 =/set slhit1=$$[slhit1+1]
;; Stabbing hits
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BARBARICALLY PIERCES " pu_att26=/set puhit26=$$[puhit26+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BRUTALLY BORES " pu_att25=/set puhit25=$$[puhit25+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} CRUELLY RIDDLES " pu_att24=/set puhit24=$$[puhit24+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} REALLY DRILLS " pu_att23=/set puhit23=$$[puhit23+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} uncontrollably digs through " pu_att22=/set puhit22=$$[puhit22+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} savagely shafts " pu_att21=/set puhit21=$$[puhit21+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cruelly craters " pu_att20=/set puhit20=$$[puhit20+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} powerfully pierces " pu_att19=/set puhit19=$$[puhit19+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} powerfully perforates " pu_att18=/set puhit18=$$[puhit18+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} drills " pu_att17=/set puhit17=$$[puhit17+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} chasms " pu_att16=/set puhit16=$$[puhit16+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} digs through " pu_att15=/set puhit15=$$[puhit15+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} digs into " pu_att14=/set puhit14=$$[puhit14+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} riddles " pu_att13=/set puhit13=$$[puhit13+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} really pokes " pu_att12=/set puhit12=$$[puhit12+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} gorges " pu_att11=/set puhit11=$$[puhit11+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} shafts " pu_att10=/set puhit10=$$[puhit10+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cavitates " pu_att9=/set puhit9=$$[puhit9+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} craters " pu_att8=/set puhit8=$$[puhit8+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} bores " pu_att7=/set puhit7=$$[puhit7+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} sinks " pu_att6=/set puhit6=$$[puhit6+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} punctures " pu_att5=/set puhit5=$$[puhit5+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} pierces " pu_att4=/set puhit4=$$[puhit4+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} slightly pierces " pu_att3 =/set puhit3=$$[puhit3+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} scratches " pu_att2=/set puhit2=$$[puhit2+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} barely scratches " pu_att1=/set puhit1=$$[puhit1+1]
;; Tiger martial arts
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} tickles " ma_att1=/set mahit1=$$[mahit1+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} steps on " ma_att2=/set mahit2=$$[mahit2+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} grasps " ma_att3=/set mahit3=$$[mahit3+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} toe-kicks " ma_att4=/set mahit4=$$[mahit4+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} knees " ma_att5=/set mahit5=$$[mahit5+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} elbows " ma_att6=/set mahit6=$$[mahit6+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} elbow-smashes " ma_att7=/set mahit7=$$[mahit7+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} stomp-kicks " ma_att8=/set mahit8=$$[mahit8+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} foot-steps " ma_att9=/set mahit9=$$[mahit9+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} twists and throws " ma_att10=/set mahit10=$$[mahit10+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} finger-jabs " ma_att11=/set mahit11=$$[mahit11+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} joint-twists " ma_att12=/set mahit12=$$[mahit12+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} back kicks " ma_att13=/set mahit13=$$[mahit13+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} spinning back kicks " ma_att14=/set mahit14=$$[mahit14+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} phoenix-eye punches " ma_att15=/set mahit15=$$[mahit15+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} spinning backfists " ma_att16=/set mahit16=$$[mahit16+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} jumps up and side-kicks " ma_att17=/set mahit17=$$[mahit17+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} dragon-claws " ma_att18=/set mahit18=$$[mahit18+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} feints high and then cruelly groin-rips " ma_att19=/set mahit19=$$[mahit19+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} snake-strikes, blocking the chi of " ma_att20=/set mahit20=$$[mahit20+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} pummels, with dozens of chain punches, " ma_att21=/set mahit21=$$[mahit21+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} leaps, spins, and swallow-tail KICKS " ma_att22=/set mahit22=$$[mahit22+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} DEVASTATES, with a thrusting blow, " ma_att23=/set mahit23=$$[mahit23+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BRUTALLY THROAT RIPS " ma_att24=/set mahit24=$$[mahit24+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} SAVAGELY BELLY SMASHES " ma_att25=/set mahit25=$$[mahit25+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} CRUELLY TIGER STRIKES " ma_att26=/set mahit26=$$[mahit26+1]
;; Shield hits
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly shoves "     sh_att1=/set shhit1=$$[shhit1+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly batters "    sh_att2=/set shhit2=$$[shhit2+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly pushes "     sh_att3=/set shhit3=$$[shhit3+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly bashes "     sh_att4=/set shhit4=$$[shhit4+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly slams "      sh_att5=/set shhit5=$$[shhit5+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly crushes "    sh_att6=/set shhit6=$$[shhit6+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} heavily shoves "     sh_att7=/set shhit7=$$[shhit7+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} batters "            sh_att8=/set shhit8=$$[shhit8+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} heavily pushes "     sh_att9=/set shhit9=$$[shhit9+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} heavily bashes "     sh_att10=/set shhit10=$$[shhit10+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} slams "              sh_att11=/set shhit11=$$[shhit11+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} crushes "            sh_att12=/set shhit12=$$[shhit12+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} really shoves "      sh_att13=/set shhit13=$$[shhit13+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} really batters "     sh_att14=/set shhit14=$$[shhit14+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} really pushes "      sh_att15=/set shhit15=$$[shhit15+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} really bashes "      sh_att16=/set shhit16=$$[shhit16+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} really slams "       sh_att17=/set shhit17=$$[shhit17+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} really crushes "     sh_att18=/set shhit18=$$[shhit18+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cruelly shoves "     sh_att19=/set shhit19=$$[shhit19+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cruelly batters "    sh_att20=/set shhit20=$$[shhit20+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cruelly pushes "     sh_att21=/set shhit21=$$[shhit21+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} cruelly bashes "     sh_att22=/set shhit22=$$[shhit22+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} REALLY SLAMS "       sh_att23=/set shhit23=$$[shhit23+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} REALLY CRUSHES "     sh_att24=/set shhit24=$$[shhit24+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BRUTALLY CRUSHES "   sh_att25=/set shhit25=$$[shhit25+1]
/eval /def -F -p10 -mregexp -i -t"%{summoned_entity_name} BARBARICALLY SLAMS " sh_att26=/set shhit26=$$[shhit26+1]
;; All hits and misses
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully dodges %{summoned_entity_name}\'s pierce." pu_dodges =/set hitdod=$$[hitdod+1] 
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully dodges %{summoned_entity_name}\'s slash." sl_dodges =/set hitdod=$$[hitdod+1]
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully dodges %{summoned_entity_name}\'s bash." cr_dodges =/set hitdod=$$[hitdod+1]
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully dodges %{summoned_entity_name}\'s attack." ma_dodges =/set hitdod=$$[hitdod+1]
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully dodges %{summoned_entity_name}\'s bludgeon." ua_dodges=/set hitdod=$$[hitdod+1]
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully dodges %{summoned_entity_name}\'s shield." sh_dodges=/set hitdod=$$[hitdod+1]
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully parries %{summoned_entity_name}\'s pierce." pu_parries =/set hitpar=$$[hitpar+1] 
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully parries %{summoned_entity_name}\'s slash." sl_parries =/set hitpar=$$[hitpar+1] 
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully parries %{summoned_entity_name}\'s bash." cr_parries =/set hitpar=$$[hitpar+1] 
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully parries %{summoned_entity_name}\'s bludgeon." ua_parries=/set hitpar=$$[hitpar+1]
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully parries %{summoned_entity_name}\'s attack." ma_parries=/set hitpar=$$[hitpar+1]
/eval /def -F -p10 -mregexp -i -aBCblack -t" successfully parries %{summoned_entity_name}\'s shield." sh_parries=/set hitpar=$$[hitpar+1]
/eval /def -F -p10 -mregexp -i -aBCblack -t"^%{summoned_entity_name} misses " missi=/set miss=$$[miss+1]

/def -i -h'SEND hitstats' hittelot=\
	/set total=$[mahit1+mahit2+mahit3+mahit4+mahit5+mahit6+mahit7+mahit8+mahit9+mahit10+mahit11+mahit12+mahit13+mahit14+mahit15+mahit16+mahit17+mahit18+mahit19+mahit20+mahit21+mahit22+mahit23+mahit24+mahit25+mahit26+slhit1+slhit2+slhit3+slhit4+slhit5+slhit6+slhit7+slhit8+slhit9+slhit10+slhit11+slhit12+slhit13+slhit14+slhit15+slhit16+slhit17+slhit18+slhit19+slhit20+slhit21+slhit22+slhit23+slhit24+slhit25+slhit26+puhit1+puhit2+puhit3+puhit4+puhit5+puhit6+puhit7+puhit8+puhit9+puhit10+puhit11+puhit12+puhit13+puhit14+puhit15+puhit16+puhit17+puhit18+puhit19+puhit20+puhit21+puhit22+puhit23+puhit24+puhit24+puhit26+crhit1+crhit2+crhit3+crhit4+crhit5+crhit6+crhit7+crhit8+crhit9+crhit10+crhit11+crhit12+crhit13+crhit14+crhit15+crhit16+crhit17+crhit18+crhit19+crhit20+crhit21+crhit22+crhit23+crhit24+crhit25+crhit26+shhit1+shhit2+shhit3+shhit4+shhit5+shhit6+shhit7+shhit8+shhit9+shhit10+shhit11+shhit12+shhit13+shhit14+shhit15+shhit16+shhit17+shhit18+shhit19+shhit20+shhit21+shhit22+shhit23+shhit24+shhit25+shhit26]%;\
	/echo -ah Hits scored%;\
	/echo .......................................%;\
	/echo -p \
             BARBARIC.PIERCE:@{h}%$[pad(puhit26,3)]\@{n} (@{h}%$[pad((puhit26*100)/total,3)]\@{n}\%)   \
;;             CRUELLY STRIKE :@{h}%$[pad(mahit26,3)]\@{n} (@{h}%$[pad((mahit26*100)/total,3)]\@{n}\%)   \
             CRUEL.DISMEMBER:@{h}%$[pad(slhit26,3)]\@{n} (@{h}%$[pad((slhit26*100)/total,3)]\@{n}\%)   \
             BARBARIC. BASH :@{h}%$[pad(crhit26,3)]\@{n} (@{h}%$[pad((crhit26*100)/total,3)]\@{n}\%)   \
             BARBARIC. SLAM :@{h}%$[pad(shhit26,3)]\@{n} (@{h}%$[pad((shhit26*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             BRUTALLY BORE  :@{h}%$[pad(puhit25,3)]\@{n} (@{h}%$[pad((puhit25*100)/total,3)]\@{n}\%)   \
;;             SAVAGELY SMASH :@{h}%$[pad(mahit25,3)]\@{n} (@{h}%$[pad((mahit25*100)/total,3)]\@{n}\%)   \
             DISMEMBER      :@{h}%$[pad(slhit25,3)]\@{n} (@{h}%$[pad((slhit25*100)/total,3)]\@{n}\%)   \
             CRUELLY CUFF   :@{h}%$[pad(crhit25,3)]\@{n} (@{h}%$[pad((crhit25*100)/total,3)]\@{n}\%)   \
             BRUTALLY CRUSH :@{h}%$[pad(shhit25,3)]\@{n} (@{h}%$[pad((shhit25*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             CRUELLY RIDDLE :@{h}%$[pad(puhit24,3)]\@{n} (@{h}%$[pad((puhit24*100)/total,3)]\@{n}\%)   \
;;             BRUTALLY TH.RIP:@{h}%$[pad(mahit24,3)]\@{n} (@{h}%$[pad((mahit24*100)/total,3)]\@{n}\%)   \
             BARBARICAL.REND:@{h}%$[pad(slhit24,3)]\@{n} (@{h}%$[pad((slhit24*100)/total,3)]\@{n}\%)   \
             BRUTALLY BEAT  :@{h}%$[pad(crhit24,3)]\@{n} (@{h}%$[pad((crhit24*100)/total,3)]\@{n}\%)   \
             REALLY CRUSH   :@{h}%$[pad(shhit24,3)]\@{n} (@{h}%$[pad((shhit24*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             REALLY DRILL   :@{h}%$[pad(puhit23,3)]\@{n} (@{h}%$[pad((puhit23*100)/total,3)]\@{n}\%)   \
;;             DEVASTATE      :@{h}%$[pad(mahit23,3)]\@{n} (@{h}%$[pad((mahit23*100)/total,3)]\@{n}\%)   \
             CRUELLY REND   :@{h}%$[pad(slhit23,3)]\@{n} (@{h}%$[pad((slhit23*100)/total,3)]\@{n}\%)   \
             REALLY WHACK   :@{h}%$[pad(crhit23,3)]\@{n} (@{h}%$[pad((crhit23*100)/total,3)]\@{n}\%)   \
             REALLY SLAM    :@{h}%$[pad(shhit23,3)]\@{n} (@{h}%$[pad((shhit23*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Unc.dig through:@{h}%$[pad(puhit22,3)]\@{n} (@{h}%$[pad((puhit22*100)/total,3)]\@{n}\%)   \
;;             Leap,spin,KICK :@{h}%$[pad(mahit22,3)]\@{n} (@{h}%$[pad((mahit22*100)/total,3)]\@{n}\%)   \
             SAVAGELY SHRED :@{h}%$[pad(slhit22,3)]\@{n} (@{h}%$[pad((slhit22*100)/total,3)]\@{n}\%)   \
             Savagely strike:@{h}%$[pad(crhit22,3)]\@{n} (@{h}%$[pad((crhit22*100)/total,3)]\@{n}\%)   \
             Cruelly bash   :@{h}%$[pad(shhit22,3)]\@{n} (@{h}%$[pad((shhit22*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Savagely shaft :@{h}%$[pad(puhit21,3)]\@{n} (@{h}%$[pad((puhit21*100)/total,3)]\@{n}\%)   \
;;             Pummel,ch punch:@{h}%$[pad(mahit21,3)]\@{n} (@{h}%$[pad((mahit21*100)/total,3)]\@{n}\%)   \
             BRUTALLY TEAR  :@{h}%$[pad(slhit21,3)]\@{n} (@{h}%$[pad((slhit21*100)/total,3)]\@{n}\%)   \
             Savagely sock  :@{h}%$[pad(crhit21,3)]\@{n} (@{h}%$[pad((crhit21*100)/total,3)]\@{n}\%)   \
             Cruelly push   :@{h}%$[pad(shhit21,3)]\@{n} (@{h}%$[pad((shhit21*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Cruelly crater :@{h}%$[pad(puhit20,3)]\@{n} (@{h}%$[pad((puhit20*100)/total,3)]\@{n}\%)   \
;;             Snake-strike   :@{h}%$[pad(mahit20,3)]\@{n} (@{h}%$[pad((mahit20*100)/total,3)]\@{n}\%)   \
             Savagely rip   :@{h}%$[pad(slhit20,3)]\@{n} (@{h}%$[pad((slhit20*100)/total,3)]\@{n}\%)   \
             Horribly thrust:@{h}%$[pad(crhit20,3)]\@{n} (@{h}%$[pad((crhit20*100)/total,3)]\@{n}\%)   \
             Cruelly batter :@{h}%$[pad(shhit20,3)]\@{n} (@{h}%$[pad((shhit20*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Power.pierce   :@{h}%$[pad(puhit19,3)]\@{n} (@{h}%$[pad((puhit19*100)/total,3)]\@{n}\%)   \
;;             Feint groin-rip:@{h}%$[pad(mahit19,3)]\@{n} (@{h}%$[pad((mahit19*100)/total,3)]\@{n}\%)   \
             Quickly cut    :@{h}%$[pad(slhit19,3)]\@{n} (@{h}%$[pad((slhit19*100)/total,3)]\@{n}\%)   \
             Badly smash    :@{h}%$[pad(crhit19,3)]\@{n} (@{h}%$[pad((crhit19*100)/total,3)]\@{n}\%)   \
             Cruelly shove  :@{h}%$[pad(shhit19,3)]\@{n} (@{h}%$[pad((shhit19*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Power.perforate:@{h}%$[pad(puhit18,3)]\@{n} (@{h}%$[pad((puhit18*100)/total,3)]\@{n}\%)   \
;;             Dragon-claw    :@{h}%$[pad(mahit18,3)]\@{n} (@{h}%$[pad((mahit18*100)/total,3)]\@{n}\%)   \
             Uncontrol.slash:@{h}%$[pad(slhit18,3)]\@{n} (@{h}%$[pad((slhit18*100)/total,3)]\@{n}\%)   \
             Cruelly beat   :@{h}%$[pad(crhit18,3)]\@{n} (@{h}%$[pad((crhit18*100)/total,3)]\@{n}\%)   \
             Really crush   :@{h}%$[pad(shhit18,3)]\@{n} (@{h}%$[pad((shhit18*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Drill          :@{h}%$[pad(puhit17,3)]\@{n} (@{h}%$[pad((puhit17*100)/total,3)]\@{n}\%)   \
;;             Jump side-kick :@{h}%$[pad(mahit17,3)]\@{n} (@{h}%$[pad((mahit17*100)/total,3)]\@{n}\%)   \
             Cruelly slash  :@{h}%$[pad(slhit17,3)]\@{n} (@{h}%$[pad((slhit17*100)/total,3)]\@{n}\%)   \
             Smash          :@{h}%$[pad(crhit17,3)]\@{n} (@{h}%$[pad((crhit17*100)/total,3)]\@{n}\%)   \
             Really slam    :@{h}%$[pad(shhit17,3)]\@{n} (@{h}%$[pad((shhit17*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Chasm   	    :@{h}%$[pad(puhit16,3)]\@{n} (@{h}%$[pad((puhit16*100)/total,3)]\@{n}\%)   \
;;             Spinn backfist :@{h}%$[pad(mahit16,3)]\@{n} (@{h}%$[pad((mahit16*100)/total,3)]\@{n}\%)   \
             Rive           :@{h}%$[pad(slhit16,3)]\@{n} (@{h}%$[pad((slhit16*100)/total,3)]\@{n}\%)   \
             Beat           :@{h}%$[pad(crhit16,3)]\@{n} (@{h}%$[pad((crhit16*100)/total,3)]\@{n}\%)   \
             Really bash    :@{h}%$[pad(shhit16,3)]\@{n} (@{h}%$[pad((shhit16*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Dig through    :@{h}%$[pad(puhit15,3)]\@{n} (@{h}%$[pad((puhit15*100)/total,3)]\@{n}\%)   \
;;             Phonx-eye punch:@{h}%$[pad(mahit15,3)]\@{n} (@{h}%$[pad((mahit15*100)/total,3)]\@{n}\%)   \
             Savagely shave :@{h}%$[pad(slhit15,3)]\@{n} (@{h}%$[pad((slhit15*100)/total,3)]\@{n}\%)   \
             Whack          :@{h}%$[pad(crhit15,3)]\@{n} (@{h}%$[pad((crhit15*100)/total,3)]\@{n}\%)   \
             Really push    :@{h}%$[pad(shhit15,3)]\@{n} (@{h}%$[pad((shhit15*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Dig into       :@{h}%$[pad(puhit14,3)]\@{n} (@{h}%$[pad((puhit14*100)/total,3)]\@{n}\%)   \
;;             Spinn back kick:@{h}%$[pad(mahit14,3)]\@{n} (@{h}%$[pad((mahit14*100)/total,3)]\@{n}\%)   \
             Cruelly tatter :@{h}%$[pad(slhit14,3)]\@{n} (@{h}%$[pad((slhit14*100)/total,3)]\@{n}\%)   \
             Flail          :@{h}%$[pad(crhit14,3)]\@{n} (@{h}%$[pad((crhit14*100)/total,3)]\@{n}\%)   \
             Really batter  :@{h}%$[pad(shhit14,3)]\@{n} (@{h}%$[pad((shhit14*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Riddle  	    :@{h}%$[pad(puhit13,3)]\@{n} (@{h}%$[pad((puhit13*100)/total,3)]\@{n}\%)   \
;;             Back kick      :@{h}%$[pad(mahit13,3)]\@{n} (@{h}%$[pad((mahit13*100)/total,3)]\@{n}\%)   \
             Slit           :@{h}%$[pad(slhit13,3)]\@{n} (@{h}%$[pad((slhit13*100)/total,3)]\@{n}\%)   \
             Knock          :@{h}%$[pad(crhit13,3)]\@{n} (@{h}%$[pad((crhit13*100)/total,3)]\@{n}\%)   \
             Really shove   :@{h}%$[pad(shhit13,3)]\@{n} (@{h}%$[pad((shhit13*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Really poke    :@{h}%$[pad(puhit12,3)]\@{n} (@{h}%$[pad((puhit12*100)/total,3)]\@{n}\%)   \
;;             Joint-twist    :@{h}%$[pad(mahit12,3)]\@{n} (@{h}%$[pad((mahit12*100)/total,3)]\@{n}\%)   \
             Incisive. tear :@{h}%$[pad(slhit12,3)]\@{n} (@{h}%$[pad((slhit12*100)/total,3)]\@{n}\%)   \
             Cuff           :@{h}%$[pad(crhit12,3)]\@{n} (@{h}%$[pad((crhit12*100)/total,3)]\@{n}\%)   \
             Crush          :@{h}%$[pad(shhit12,3)]\@{n} (@{h}%$[pad((shhit12*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Gorge          :@{h}%$[pad(puhit11,3)]\@{n} (@{h}%$[pad((puhit11*100)/total,3)]\@{n}\%)   \
;;             Finger-jab     :@{h}%$[pad(mahit11,3)]\@{n} (@{h}%$[pad((mahit11*100)/total,3)]\@{n}\%)   \
             Incisive. cut  :@{h}%$[pad(slhit11,3)]\@{n} (@{h}%$[pad((slhit11*100)/total,3)]\@{n}\%)   \
             Sock           :@{h}%$[pad(crhit11,3)]\@{n} (@{h}%$[pad((crhit11*100)/total,3)]\@{n}\%)   \
             Slam           :@{h}%$[pad(shhit11,3)]\@{n} (@{h}%$[pad((shhit11*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Shaft          :@{h}%$[pad(puhit10,3)]\@{n} (@{h}%$[pad((puhit10*100)/total,3)]\@{n}\%)   \
;;             Twist and throw:@{h}%$[pad(mahit10,3)]\@{n} (@{h}%$[pad((mahit10*100)/total,3)]\@{n}\%)   \
             Slash          :@{h}%$[pad(slhit10,3)]\@{n} (@{h}%$[pad((slhit10*100)/total,3)]\@{n}\%)   \
             Strike         :@{h}%$[pad(crhit10,3)]\@{n} (@{h}%$[pad((crhit10*100)/total,3)]\@{n}\%)   \
             Heavily bash   :@{h}%$[pad(shhit10,3)]\@{n} (@{h}%$[pad((shhit10*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Cavitate  	    :@{h}%$[pad(puhit9,3)]\@{n} (@{h}%$[pad((puhit9*100)/total,3)]\@{n}\%)   \
;;             Foot-step      :@{h}%$[pad(mahit9,3)]\@{n} (@{h}%$[pad((mahit9*100)/total,3)]\@{n}\%)   \
             horribly shred :@{h}%$[pad(slhit9,3)]\@{n} (@{h}%$[pad((slhit9*100)/total,3)]\@{n}\%)   \
             Bash           :@{h}%$[pad(crhit9,3)]\@{n} (@{h}%$[pad((crhit9*100)/total,3)]\@{n}\%)   \
             Heavily push   :@{h}%$[pad(shhit9,3)]\@{n} (@{h}%$[pad((shhit9*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Crater         :@{h}%$[pad(puhit8,3)]\@{n} (@{h}%$[pad((puhit8*100)/total,3)]\@{n}\%)   \
;;             Stomp-kick     :@{h}%$[pad(mahit8,3)]\@{n} (@{h}%$[pad((mahit8*100)/total,3)]\@{n}\%)   \
             Shred          :@{h}%$[pad(slhit8,3)]\@{n} (@{h}%$[pad((slhit8*100)/total,3)]\@{n}\%)   \
             Jab            :@{h}%$[pad(crhit8,3)]\@{n} (@{h}%$[pad((crhit8*100)/total,3)]\@{n}\%)   \
             Batter         :@{h}%$[pad(shhit8,3)]\@{n} (@{h}%$[pad((shhit8*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Bore           :@{h}%$[pad(puhit7,3)]\@{n} (@{h}%$[pad((puhit7*100)/total,3)]\@{n}\%)   \
;;             Elbow-smash    :@{h}%$[pad(mahit7,3)]\@{n} (@{h}%$[pad((mahit7*100)/total,3)]\@{n}\%)   \
             Incise         :@{h}%$[pad(slhit7,3)]\@{n} (@{h}%$[pad((slhit7*100)/total,3)]\@{n}\%)   \
             Thrust         :@{h}%$[pad(crhit7,3)]\@{n} (@{h}%$[pad((crhit7*100)/total,3)]\@{n}\%)   \
             Heavily shove  :@{h}%$[pad(shhit7,3)]\@{n} (@{h}%$[pad((shhit7*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Sink           :@{h}%$[pad(puhit6,3)]\@{n} (@{h}%$[pad((puhit6*100)/total,3)]\@{n}\%)   \
;;             Elbow          :@{h}%$[pad(mahit6,3)]\@{n} (@{h}%$[pad((mahit6*100)/total,3)]\@{n}\%)   \
             Tear           :@{h}%$[pad(slhit6,3)]\@{n} (@{h}%$[pad((slhit6*100)/total,3)]\@{n}\%)   \
             Stroke         :@{h}%$[pad(crhit6,3)]\@{n} (@{h}%$[pad((crhit6*100)/total,3)]\@{n}\%)   \
             Lightly crush  :@{h}%$[pad(shhit6,3)]\@{n} (@{h}%$[pad((shhit6*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Puncture       :@{h}%$[pad(puhit5,3)]\@{n} (@{h}%$[pad((puhit5*100)/total,3)]\@{n}\%)   \
;;             Knee           :@{h}%$[pad(mahit5,3)]\@{n} (@{h}%$[pad((mahit5*100)/total,3)]\@{n}\%)   \
             Cut            :@{h}%$[pad(slhit5,3)]\@{n} (@{h}%$[pad((slhit5*100)/total,3)]\@{n}\%)   \
             Thump          :@{h}%$[pad(crhit5,3)]\@{n} (@{h}%$[pad((crhit5*100)/total,3)]\@{n}\%)   \
             Lightly slam   :@{h}%$[pad(shhit5,3)]\@{n} (@{h}%$[pad((shhit5*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Pierce         :@{h}%$[pad(puhit4,3)]\@{n} (@{h}%$[pad((puhit4*100)/total,3)]\@{n}\%)   \
;;             Toe-kick       :@{h}%$[pad(mahit4,3)]\@{n} (@{h}%$[pad((mahit4*100)/total,3)]\@{n}\%)   \
             Lightly cut    :@{h}%$[pad(slhit4,3)]\@{n} (@{h}%$[pad((slhit4*100)/total,3)]\@{n}\%)   \
             Bump           :@{h}%$[pad(crhit4,3)]\@{n} (@{h}%$[pad((crhit4*100)/total,3)]\@{n}\%)   \
             Lightly bash   :@{h}%$[pad(shhit4,3)]\@{n} (@{h}%$[pad((shhit4*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Slightly pierce:@{h}%$[pad(puhit3,3)]\@{n} (@{h}%$[pad((puhit3*100)/total,3)]\@{n}\%)   \
;;             Grasp          :@{h}%$[pad(mahit3,3)]\@{n} (@{h}%$[pad((mahit3*100)/total,3)]\@{n}\%)   \
             Gash           :@{h}%$[pad(slhit3,3)]\@{n} (@{h}%$[pad((slhit3*100)/total,3)]\@{n}\%)   \
             Butt           :@{h}%$[pad(crhit3,3)]\@{n} (@{h}%$[pad((crhit3*100)/total,3)]\@{n}\%)   \
             Lightly push   :@{h}%$[pad(shhit3,3)]\@{n} (@{h}%$[pad((shhit3*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Scratch        :@{h}%$[pad(puhit2,3)]\@{n} (@{h}%$[pad((puhit2*100)/total,3)]\@{n}\%)   \
;;             Step on        :@{h}%$[pad(mahit2,3)]\@{n} (@{h}%$[pad((mahit2*100)/total,3)]\@{n}\%)   \
             Solidly slash  :@{h}%$[pad(slhit2,3)]\@{n} (@{h}%$[pad((slhit2*100)/total,3)]\@{n}\%)   \
             Jostle         :@{h}%$[pad(crhit2,3)]\@{n} (@{h}%$[pad((crhit2*100)/total,3)]\@{n}\%)   \
             Lightly batter :@{h}%$[pad(shhit2,3)]\@{n} (@{h}%$[pad((shhit2*100)/total,3)]\@{n}\%)   %;\
	/echo -p \
             Barely scratch :@{h}%$[pad(puhit1,3)]\@{n} (@{h}%$[pad((puhit1*100)/total,3)]\@{n}\%)   \
;;             Tickle         :@{h}%$[pad(mahit1,3)]\@{n} (@{h}%$[pad((mahit1*100)/total,3)]\@{n}\%)   \
             Barely graze   :@{h}%$[pad(slhit1,3)]\@{n} (@{h}%$[pad((slhit1*100)/total,3)]\@{n}\%)   \
             Lightly jostle :@{h}%$[pad(crhit1,3)]\@{n} (@{h}%$[pad((crhit1*100)/total,3)]\@{n}\%)   \
             Lightly shove  :@{h}%$[pad(shhit1,3)]\@{n} (@{h}%$[pad((shhit1*100)/total,3)]\@{n}\%)   %;\
    /echo ........................................%;\
	/echo -p @{h}%total \($[(100*total)/((total+miss+hitpar+hitdod))]\%\)@{n} hits scored.%;\
	/echo -p @{h}%miss \($[(100*miss)/((total+miss+hitpar+hitdod))]\%\)@{n}  hits missed.%;\
	/echo -p @{h}%hitpar \($[(100*hitpar)/((total+miss+hitpar+hitdod))]\%\)@{n} hits parried.%;\
	/echo -p @{h}%hitdod \($[(100*hitdod)/((total+miss+hitpar+hitdod))]\%\)@{n} hits dodged.%;\

/def -i nollaa_hitstats=\
 /set shhit1=0%;\
 /set shhit2=0%;\
 /set shhit3=0%;\
 /set shhit4=0%;\
 /set shhit5=0%;\
 /set shhit6=0%;\
 /set shhit7=0%;\
 /set shhit8=0%;\
 /set shhit9=0%;\
 /set shhit10=0%;\
 /set shhit11=0%;\
 /set shhit12=0%;\
 /set shhit13=0%;\
 /set shhit14=0%;\
 /set shhit15=0%;\
 /set shhit16=0%;\
 /set shhit17=0%;\
 /set shhit18=0%;\
 /set shhit19=0%;\
 /set shhit20=0%;\
 /set shhit21=0%;\
 /set shhit22=0%;\
 /set shhit23=0%;\
 /set shhit24=0%;\
 /set shhit25=0%;\
 /set shhit26=0%;\
 /set slhit1=0%;\
 /set slhit2=0%;\
 /set slhit3=0%;\
 /set slhit4=0%;\
 /set slhit5=0%;\
 /set slhit6=0%;\
 /set slhit7=0%;\
 /set slhit8=0%;\
 /set slhit9=0%;\
 /set slhit10=0%;\
 /set slhit11=0%;\
 /set slhit12=0%;\
 /set slhit13=0%;\
 /set slhit14=0%;\
 /set slhit15=0%;\
 /set slhit16=0%;\
 /set slhit17=0%;\
 /set slhit18=0%;\
 /set slhit19=0%;\
 /set slhit20=0%;\
 /set slhit21=0%;\
 /set slhit22=0%;\
 /set slhit23=0%;\
 /set slhit24=0%;\
 /set slhit25=0%;\
 /set slhit26=0%;\
 /set puhit1=0%;\
 /set puhit2=0%;\
 /set puhit3=0%;\
 /set puhit4=0%;\
 /set puhit5=0%;\
 /set puhit6=0%;\
 /set puhit7=0%;\
 /set puhit8=0%;\
 /set puhit9=0%;\
 /set puhit10=0%;\
 /set puhit11=0%;\
 /set puhit12=0%;\
 /set puhit13=0%;\
 /set puhit14=0%;\
 /set puhit15=0%;\
 /set puhit16=0%;\
 /set puhit17=0%;\
 /set puhit18=0%;\
 /set puhit19=0%;\
 /set puhit20=0%;\
 /set puhit21=0%;\
 /set puhit22=0%;\
 /set puhit23=0%;\
 /set puhit23=0%;\
 /set puhit24=0%;\
 /set puhit25=0%;\
 /set puhit26=0%;\
 /set mahit1=0%;\
 /set mahit2=0%;\
 /set mahit3=0%;\
 /set mahit4=0%;\
 /set mahit5=0%;\
 /set mahit6=0%;\
 /set mahit7=0%;\
 /set mahit8=0%;\
 /set mahit9=0%;\
 /set mahit10=0%;\
 /set mahit11=0%;\
 /set mahit12=0%;\
 /set mahit13=0%;\
 /set mahit14=0%;\
 /set mahit15=0%;\
 /set mahit16=0%;\
 /set mahit17=0%;\
 /set mahit18=0%;\
 /set mahit19=0%;\
 /set mahit20=0%;\
 /set mahit21=0%;\
 /set mahit22=0%;\
 /set mahit23=0%;\
 /set mahit23=0%;\
 /set mahit24=0%;\
 /set mahit25=0%;\
 /set mahit26=0%;\
 /set crhit1=0%;\
 /set crhit2=0%;\
 /set crhit3=0%;\
 /set crhit4=0%;\
 /set crhit5=0%;\
 /set crhit6=0%;\
 /set crhit7=0%;\
 /set crhit8=0%;\
 /set crhit9=0%;\
 /set crhit10=0%;\
 /set crhit11=0%;\
 /set crhit12=0%;\
 /set crhit13=0%;\
 /set crhit14=0%;\
 /set crhit15=0%;\
 /set crhit16=0%;\
 /set crhit17=0%;\
 /set crhit18=0%;\
 /set crhit19=0%;\
 /set crhit20=0%;\
 /set crhit21=0%;\
 /set crhit22=0%;\
 /set crhit23=0%;\
 /set crhit23=0%;\
 /set crhit24=0%;\
 /set crhit25=0%;\
 /set crhit26=0%;\
 /set hitdod=0%;\
 /set hitpar=0%;\
 /set miss=0%;
