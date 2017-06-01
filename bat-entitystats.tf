;;************************************************************
;;
;; Hittilaskuri v2.1 by thiamin@batmud.bat.org
;; based on 
;; hittilaskuri 2.release, jkotka@cc.tut.fi
;; 10.6.2000 
;;************************************************************
;Broetchen (party): Gashes/butts: 0 (0.0%)                                                            
;    Broetchen (party): Lthumps/bumps: 0 (0.0%))                                                         
;    Broetchen (party): Cuts/thumps: 82 (3.2%)                                                         
;    Broetchen (party): Tears/strokes: 1431 (56.0%)                                                   
;    Broetchen (party): Incises/thrusts: 667 (26.1%)                                      
;    Broetchen (party): Shreds/jabs: 371 (14.5%)  

/set summoned_entity_name=Yazaemon the fire entity

/def -pmaxpri -mglob -t"* strikes * chest REALLY hard!" dont_count_this_skill

;; Bashing hits
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} BARBARICALLY BASHES " cr_att26=/set crhit26=$$[crhit26+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} CRUELLY CUFFS " cr_att25=/set crhit25=$$[crhit25+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} BRUTALLY BEATS " cr_att24=/set crhit24=$$[crhit24+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} REALLY WHACKS " cr_att23=/set crhit23=$$[crhit23+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} savagely strikes " cr_att22=/set crhit22=$$[crhit22+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} savagely socks " cr_att21=/set crhit21=$$[crhit21+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} horribly thrusts " cr_att20=/set crhit20=$$[crhit20+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} badly smashes " cr_att19=/set crhit19=$$[crhit19+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} cruelly beats " cr_att18=/set crhit18=$$[crhit18+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} smashes " cr_att17=/set crhit17=$$[crhit17+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} beats " cr_att16=/set crhit16=$$[crhit16+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} whacks " cr_att15=/set crhit15=$$[crhit15+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} flails " cr_att14=/set crhit14=$$[crhit14+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} knocks " cr_att13=/set crhit13=$$[crhit13+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} cuffs " cr_att12=/set crhit12=$$[crhit12+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} socks " cr_att11=/set crhit11=$$[crhit11+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} strikes " cr_att10=/set crhit10=$$[crhit10+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} bashes " cr_att9=/set crhit9=$$[crhit9+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} jabs " cr_att8=/set crhit8=$$[crhit8+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} thrusts " cr_att7=/set crhit7=$$[crhit7+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} strokes " cr_att6=/set crhit6=$$[crhit6+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} thumps " cr_att5=/set crhit5=$$[crhit5+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} bumps " cr_att4=/set crhit4=$$[crhit4+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} butts " cr_att3=/set crhit3=$$[crhit3+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} jostles " cr_att2 =/set crhit2=$$[crhit2+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} lightly jostles " cr_att1 =/set crhit1=$$[crhit1+1]
;; Cutting hits (slash)
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} CRUELLY DISMEMBERS " sl_att26=/set slhit26=$$[slhit26+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} DISMEMBERS " sl_att25=/set slhit25=$$[slhit25+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} BARBARICALLY RENDS " sl_att24=/set slhit24=$$[slhit24+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} CRUELLY RENDS " sl_att23=/set slhit23=$$[slhit23+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} SAVAGELY SHREDS " sl_att22=/set slhit22=$$[slhit22+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} BRUTALLY TEARS " sl_att21=/set slhit21=$$[slhit21+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} savagely rips " sl_att20=/set slhit20=$$[slhit20+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} quickly cuts " sl_att19=/set slhit19=$$[slhit19+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} uncontrollably slashes " sl_att18=/set slhit18=$$[slhit18+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} cruelly slashes " sl_att17=/set slhit17=$$[slhit17+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} rives " sl_att16=/set slhit16=$$[slhit16+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} savagely shaves " sl_att15=/set slhit15=$$[slhit15+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} cruelly tatters " sl_att14=/set slhit14=$$[slhit14+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} slits " sl_att13=/set slhit13=$$[slhit13+1]
/eval /def -F -p10 -mregexp -i -t"^%{summoned_entity_name} incisively tears " sl_att12=/set slhit12=$$[slhit12+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} incisively cuts " sl_att11=/set slhit11=$$[slhit11+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} slashes " sl_att10=/set slhit10=$$[slhit10+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} horribly shreds " sl_att9=/set slhit9=$$[slhit9+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} shreds " sl_att8=/set slhit8=$$[slhit8+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} incises " sl_att7=/set slhit7=$$[slhit7+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} tears " sl_att6=/set slhit6=$$[slhit6+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} cuts " sl_att5=/set slhit5=$$[slhit5+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} lightly cuts " sl_att4=/set slhit4=$$[slhit4+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} gashes " sl_att3=/set slhit3=$$[slhit3+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} solidly slashes " sl_att2 =/set slhit2=$$[slhit2+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} barely grazes " sl_att1 =/set slhit1=$$[slhit1+1]
;; Stabbing hits
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} BARBARICALLY PIERCES " pu_att26=/set puhit26=$$[puhit26+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} BRUTALLY BORES " pu_att25=/set puhit25=$$[puhit25+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} CRUELLY RIDDLES " pu_att24=/set puhit24=$$[puhit24+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} REALLY DRILLS " pu_att23=/set puhit23=$$[puhit23+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} uncontrollably digs through " pu_att22=/set puhit22=$$[puhit22+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} savagely shafts " pu_att21=/set puhit21=$$[puhit21+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} cruelly craters " pu_att20=/set puhit20=$$[puhit20+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} powerfully pierces " pu_att19=/set puhit19=$$[puhit19+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} powerfully perforates " pu_att18=/set puhit18=$$[puhit18+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} drills " pu_att17=/set puhit17=$$[puhit17+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} chasms " pu_att16=/set puhit16=$$[puhit16+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} digs through " pu_att15=/set puhit15=$$[puhit15+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} digs into " pu_att14=/set puhit14=$$[puhit14+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} riddles " pu_att13=/set puhit13=$$[puhit13+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} really pokes " pu_att12=/set puhit12=$$[puhit12+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} gorges " pu_att11=/set puhit11=$$[puhit11+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} shafts " pu_att10=/set puhit10=$$[puhit10+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} cavitates " pu_att9=/set puhit9=$$[puhit9+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} craters " pu_att8=/set puhit8=$$[puhit8+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} bores " pu_att7=/set puhit7=$$[puhit7+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} sinks " pu_att6=/set puhit6=$$[puhit6+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} punctures " pu_att5=/set puhit5=$$[puhit5+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} pierces " pu_att4=/set puhit4=$$[puhit4+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} slightly pierces " pu_att3 =/set puhit3=$$[puhit3+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} scratches " pu_att2=/set puhit2=$$[puhit2+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} barely scratches " pu_att1=/set puhit1=$$[puhit1+1]
;; Tiger martial arts
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} tickles " ma_att1=/set mahit1=$$[mahit1+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} steps on " ma_att2=/set mahit2=$$[mahit2+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} grasps " ma_att3=/set mahit3=$$[mahit3+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} toe-kicks " ma_att4=/set mahit4=$$[mahit4+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} knees " ma_att5=/set mahit5=$$[mahit5+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} elbows " ma_att6=/set mahit6=$$[mahit6+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} elbow-smashes " ma_att7=/set mahit7=$$[mahit7+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} stomp-kicks " ma_att8=/set mahit8=$$[mahit8+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} foot-steps " ma_att9=/set mahit9=$$[mahit9+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} twists and throws " ma_att10=/set mahit10=$$[mahit10+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} finger-jabs " ma_att11=/set mahit11=$$[mahit11+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} joint-twists " ma_att12=/set mahit12=$$[mahit12+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} back kicks " ma_att13=/set mahit13=$$[mahit13+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} spinning back kicks " ma_att14=/set mahit14=$$[mahit14+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} phoenix-eye punches " ma_att15=/set mahit15=$$[mahit15+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} spinning backfists " ma_att16=/set mahit16=$$[mahit16+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} jumps up and side-kicks " ma_att17=/set mahit17=$$[mahit17+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} dragon-claws " ma_att18=/set mahit18=$$[mahit18+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} feints high and then cruelly groin-rips " ma_att19=/set mahit19=$$[mahit19+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} snake-strikes, blocking the chi of " ma_att20=/set mahit20=$$[mahit20+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} pummels, with dozens of chain punches, " ma_att21=/set mahit21=$$[mahit21+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} leaps, spins, and swallow-tail KICKS " ma_att22=/set mahit22=$$[mahit22+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} DEVASTATES, with a thrusting blow, " ma_att23=/set mahit23=$$[mahit23+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} BRUTALLY THROAT RIPS " ma_att24=/set mahit24=$$[mahit24+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} SAVAGELY BELLY SMASHES " ma_att25=/set mahit25=$$[mahit25+1]
/eval /def -F -p99 -mregexp -i -t"^%{summoned_entity_name} CRUELLY TIGER STRIKES " ma_att26=/set mahit26=$$[mahit26+1]

/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully dodges %{summoned_entity_name}'s pierce." pu_dodges =/set hitdod=$$[hitdod+1] 
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully dodges %{summoned_entity_name}'s slash." sl_dodges =/set hitdod=$$[hitdod+1]
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully dodges %{summoned_entity_name}'s bash." cr_dodges =/set hitdod=$$[hitdod+1]
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully dodges %{summoned_entity_name}'s attack." ma_dodges =/set hitdod=$$[hitdod+1]
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully dodges %{summoned_entity_name}'s bludgeon." ua_dodges=/set hitdod=$$[hitdod+1]
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully dodges %{summoned_entity_name}'s shield." ua_dodges=/set hitdod=$$[hitdod+1]
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully parries %{summoned_entity_name}'s pierce." pu_parries =/set hitpar=$$[hitpar+1] 
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully parries %{summoned_entity_name}'s slash." sl_parries =/set hitpar=$$[hitpar+1] 
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully parries %{summoned_entity_name}'s bash." cr_parries =/set hitpar=$$[hitpar+1] 
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully parries %{summoned_entity_name}'s bludgeon." ua_parries=/set hitpar=$$[hitpar+1]
/eval /def -F -p99 -mglob -i -aBCblack -t"* successfully parries %{summoned_entity_name}'s attack." ma_parries=/set hitpar=$$[hitpar+1]
/eval /def -F -p99 -mglob -i -aBCblack -t"^%{summoned_entity_name} misses *" missi=/set miss=$$[miss+1]

/def -i -h'SEND hitstats' hittelot=\
	/set total=$[mahit1+mahit2+mahit3+mahit4+mahit5+mahit6+mahit7+mahit8+mahit9+mahit10+mahit11+mahit12+mahit13+mahit14+mahit15+mahit16+mahit17+mahit18+mahit19+mahit20+mahit21+mahit22+mahit23+mahit24+mahit25+mahit26+slhit1+slhit2+slhit3+slhit4+slhit5+slhit6+slhit7+slhit8+slhit9+slhit10+slhit11+slhit12+slhit13+slhit14+slhit15+slhit16+slhit17+slhit18+slhit19+slhit20+slhit21+slhit22+slhit23+slhit24+slhit25+slhit26+puhit1+puhit2+puhit3+puhit4+puhit5+puhit6+puhit7+puhit8+puhit9+puhit10+puhit11+puhit12+puhit13+puhit14+puhit15+puhit16+puhit17+puhit18+puhit19+puhit20+puhit21+puhit22+puhit23+puhit24+puhit24+puhit26+crhit1+crhit2+crhit3+crhit4+crhit5+crhit6+crhit7+crhit8+crhit9+crhit10+crhit11+crhit12+crhit13+crhit14+crhit15+crhit16+crhit17+crhit18+crhit19+crhit20+crhit21+crhit22+crhit23+crhit24+crhit25+crhit26]%;\
	/echo -ah Hits scored%;\
	/echo .......................................%;\
	/echo -p BARBARIC. BEAT :@{h}%uahit26@{n} (@{h}%$[(uahit26*100)/total]\@{n}\%)   \
             CRUEL.DISMEMBER:@{h}%slhit26@{n} (@{h}%$[(slhit26*100)/total]\@{n}\%)   \
;;             BARBARIC.PIERCE:@{h}%puhit26@{n} (@{h}%$[(puhit26*100)/total]\@{n}\%)   \
             BARBARIC. BASH :@{h}%crhit26@{n} (@{h}%$[(crhit26*100)/total]\@{n}\%)   \
             CRUELLY STRIKE :@{h}%mahit26@{n} (@{h}%$[(mahit26*100)/total]\@{n}\%)%;\
	/echo -p BRUTALLY BOOT  :@{h}%uahit25@{n} (@{h}%$[(uahit25*100)/total]\@{n}\%)   \
             DISMEMBER      :@{h}%slhit25@{n} (@{h}%$[(slhit25*100)/total]\@{n}\%)   \
;;             BRUTALLY BORE  :@{h}%puhit25@{n} (@{h}%$[(puhit25*100)/total]\@{n}\%)   \
             CRUELLY CUFF   :@{h}%crhit25@{n} (@{h}%$[(crhit25*100)/total]\@{n}\%)   \
             SAVAGELY SMASH :@{h}%mahit25@{n} (@{h}%$[(mahit25*100)/total]\@{n}\%)%;\
	/echo -p REALLY SMASH   :@{h}%uahit24@{n} (@{h}%$[(uahit24*100)/total]\@{n}\%)   \
             BARBARICAL.REND:@{h}%slhit24@{n} (@{h}%$[(slhit24*100)/total]\@{n}\%)   \
;;             CRUELLY RIDDLE :@{h}%puhit24@{n} (@{h}%$[(puhit24*100)/total]\@{n}\%)   \
             BRUTALLY BEAT  :@{h}%crhit24@{n} (@{h}%$[(crhit24*100)/total]\@{n}\%)   \
             BRUTALLY TH.RIP:@{h}%mahit24@{n} (@{h}%$[(mahit24*100)/total]\@{n}\%)%;\
	/echo -p Run into       :@{h}%uahit23@{n} (@{h}%$[(uahit23*100)/total]\@{n}\%)   \
             CRUELLY REND   :@{h}%slhit23@{n} (@{h}%$[(slhit23*100)/total]\@{n}\%)   \
;;             REALLY DRILL   :@{h}%puhit23@{n} (@{h}%$[(puhit23*100)/total]\@{n}\%)   \
             REALLY WHACK   :@{h}%crhit23@{n} (@{h}%$[(crhit23*100)/total]\@{n}\%)   \
             DEVASTATE      :@{h}%mahit23@{n} (@{h}%$[(mahit23*100)/total]\@{n}\%)%;\
	/echo -p Bodyslam       :@{h}%uahit22@{n} (@{h}%$[(uahit22*100)/total]\@{n}\%)   \
             SAVAGELY SHRED :@{h}%slhit22@{n} (@{h}%$[(slhit22*100)/total]\@{n}\%)   \
;;             Unc.dig through:@{h}%puhit22@{n} (@{h}%$[(puhit22*100)/total]\@{n}\%)   \
             Savagely Strike:@{h}%crhit22@{n} (@{h}%$[(crhit22*100)/total]\@{n}\%)   \
             Leap,spin,KICK :@{h}%mahit22@{n} (@{h}%$[(mahit22*100)/total]\@{n}\%)%;\
	/echo -p Roundhouse     :@{h}%uahit21@{n} (@{h}%$[(uahit21*100)/total]\@{n}\%)   \
             BRUTALLY TEAR  :@{h}%slhit21@{n} (@{h}%$[(slhit21*100)/total]\@{n}\%)   \
;;             Savagely shaft :@{h}%puhit21@{n} (@{h}%$[(puhit21*100)/total]\@{n}\%)   \
             Savagely sock  :@{h}%crhit21@{n} (@{h}%$[(crhit21*100)/total]\@{n}\%)   \
             Pummel,ch punch:@{h}%mahit21@{n} (@{h}%$[(mahit21*100)/total]\@{n}\%)%;\
	/echo -p Svg triple-kick:@{h}%uahit20@{n} (@{h}%$[(uahit20*100)/total]\@{n}\%)   \
             Savagely rip   :@{h}%slhit20@{n} (@{h}%$[(slhit20*100)/total]\@{n}\%)   \
;;             Cruelly crater :@{h}%puhit20@{n} (@{h}%$[(puhit20*100)/total]\@{n}\%)   \
             Horribly Thrust:@{h}%crhit20@{n} (@{h}%$[(crhit20*100)/total]\@{n}\%)   \
             Sname-strike   :@{h}%mahit20@{n} (@{h}%$[(mahit20*100)/total]\@{n}\%)%;\
	/echo -p Dragon-punch   :@{h}%uahit19@{n} (@{h}%$[(uahit19*100)/total]\@{n}\%)   \
             Quickly cut    :@{h}%slhit19@{n} (@{h}%$[(slhit19*100)/total]\@{n}\%)   \
;;             Power.pierce   :@{h}%puhit19@{n} (@{h}%$[(puhit19*100)/total]\@{n}\%)   \
             Badly smash    :@{h}%crhit19@{n} (@{h}%$[(crhit19*100)/total]\@{n}\%)   \
             Feint groin-rip:@{h}%mahit19@{n} (@{h}%$[(mahit19*100)/total]\@{n}\%)%;\
	/echo -p Cruel. headbutt:@{h}%uahit18@{n} (@{h}%$[(uahit18*100)/total]\@{n}\%)   \
             Uncontrol.slash:@{h}%slhit18@{n} (@{h}%$[(slhit18*100)/total]\@{n}\%)   \
;;             Power.perforate:@{h}%puhit18@{n} (@{h}%$[(puhit18*100)/total]\@{n}\%)   \
             Cruelly Beat   :@{h}%crhit18@{n} (@{h}%$[(crhit18*100)/total]\@{n}\%)   \
             Dragon-claw    :@{h}%mahit18@{n} (@{h}%$[(mahit18*100)/total]\@{n}\%)%;\
	/echo -p headbutt       :@{h}%uahit17@{n} (@{h}%$[(uahit17*100)/total]\@{n}\%)   \
             Cruelly slash  :@{h}%slhit17@{n} (@{h}%$[(slhit17*100)/total]\@{n}\%)   \
;;             Drill          :@{h}%puhit17@{n} (@{h}%$[(puhit17*100)/total]\@{n}\%)   \
             Smash          :@{h}%crhit17@{n} (@{h}%$[(crhit17*100)/total]\@{n}\%)   \
             Jump side-kick :@{h}%mahit17@{n} (@{h}%$[(mahit17*100)/total]\@{n}\%)%;\
	/echo -p Spin-kick      :@{h}%uahit16@{n} (@{h}%$[(uahit16*100)/total]\@{n}\%)   \
             Rive           :@{h}%slhit16@{n} (@{h}%$[(slhit16*100)/total]\@{n}\%)   \
;;             Chasm   	    :@{h}%puhit16@{n} (@{h}%$[(puhit16*100)/total]\@{n}\%)   \
             Beat   	    :@{h}%crhit16@{n} (@{h}%$[(crhit16*100)/total]\@{n}\%)   \
             Spinn backfist :@{h}%mahit16@{n} (@{h}%$[(mahit16*100)/total]\@{n}\%)%;\
	/echo -p Kidneypunch    :@{h}%uahit15@{n} (@{h}%$[(uahit15*100)/total]\@{n}\%)   \
             Savagely shave :@{h}%slhit15@{n} (@{h}%$[(slhit15*100)/total]\@{n}\%)   \
;;             Dig through    :@{h}%puhit15@{n} (@{h}%$[(puhit15*100)/total]\@{n}\%)   \
             Whack          :@{h}%crhit15@{n} (@{h}%$[(crhit15*100)/total]\@{n}\%)   \
             Phx-eye punch  :@{h}%mahit15@{n} (@{h}%$[(mahit15*100)/total]\@{n}\%)%;\
	/echo -p Uppercut       :@{h}%uahit14@{n} (@{h}%$[(uahit14*100)/total]\@{n}\%)   \
             Cruelly tatter :@{h}%slhit14@{n} (@{h}%$[(slhit14*100)/total]\@{n}\%)   \
;;             Dig into       :@{h}%puhit14@{n} (@{h}%$[(puhit14*100)/total]\@{n}\%)   \
             Flail          :@{h}%crhit14@{n} (@{h}%$[(crhit14*100)/total]\@{n}\%)   \
             Spinn back kick:@{h}%mahit14@{n} (@{h}%$[(mahit14*100)/total]\@{n}\%)%;\
	/echo -p Jump-kick      :@{h}%uahit13@{n} (@{h}%$[(uahit13*100)/total]\@{n}\%)   \
             Slit           :@{h}%slhit13@{n} (@{h}%$[(slhit13*100)/total]\@{n}\%)   \
;;             Riddle  	    :@{h}%puhit13@{n} (@{h}%$[(puhit13*100)/total]\@{n}\%)   \
             Knock  	    :@{h}%crhit13@{n} (@{h}%$[(crhit13*100)/total]\@{n}\%)   \
             Back kick      :@{h}%mahit13@{n} (@{h}%$[(mahit13*100)/total]\@{n}\%)%;\
	/echo -p Badly kick     :@{h}%uahit12@{n} (@{h}%$[(uahit12*100)/total]\@{n}\%)   \
             Inc. slash     :@{h}%slhit12@{n} (@{h}%$[(slhit12*100)/total]\@{n}\%)   \
;;             Really poke    :@{h}%puhit12@{n} (@{h}%$[(puhit12*100)/total]\@{n}\%)   \
             Cuff           :@{h}%crhit12@{n} (@{h}%$[(crhit12*100)/total]\@{n}\%)   \
             Joint-twist    :@{h}%mahit12@{n} (@{h}%$[(mahit12*100)/total]\@{n}\%)%;\
	/echo -p Knee-kick      :@{h}%uahit11@{n} (@{h}%$[(uahit11*100)/total]\@{n}\%)   \
             Inc. cut       :@{h}%slhit11@{n} (@{h}%$[(slhit11*100)/total]\@{n}\%)   \
;;             Gorge          :@{h}%puhit11@{n} (@{h}%$[(puhit11*100)/total]\@{n}\%)   \
             Sock           :@{h}%crhit11@{n} (@{h}%$[(crhit11*100)/total]\@{n}\%)   \
             Finger-jab     :@{h}%mahit11@{n} (@{h}%$[(mahit11*100)/total]\@{n}\%)%;\
	/echo -p Stomp          :@{h}%uahit10@{n} (@{h}%$[(uahit10*100)/total]\@{n}\%)   \
             Slash          :@{h}%slhit10@{n} (@{h}%$[(slhit10*100)/total]\@{n}\%)   \
;;             Shaft          :@{h}%puhit10@{n} (@{h}%$[(puhit10*100)/total]\@{n}\%)   \
             Strike         :@{h}%crhit10@{n} (@{h}%$[(crhit10*100)/total]\@{n}\%)   \
             Twist and throw:@{h}%mahit10@{n} (@{h}%$[(mahit10*100)/total]\@{n}\%)%;\
	/echo -p Ankle-stomp    :@{h}%uahit9@{n} (@{h}%$[(uahit9*100)/total]\@{n}\%)   \
             Horribly shred :@{h}%slhit9@{n} (@{h}%$[(slhit9*100)/total]\@{n}\%)   \
;;             Cavitate  	    :@{h}%puhit9@{n} (@{h}%$[(puhit9*100)/total]\@{n}\%)   \
             Bash  	    :@{h}%crhit9@{n} (@{h}%$[(crhit9*100)/total]\@{n}\%)   \
             Foot-step 	    :@{h}%mahit9@{n} (@{h}%$[(mahit9*100)/total]\@{n}\%)%;\
	/echo -p Suckerpunch    :@{h}%uahit8@{n} (@{h}%$[(uahit8*100)/total]\@{n}\%)   \
             Shred          :@{h}%slhit8@{n} (@{h}%$[(slhit8*100)/total]\@{n}\%)   \
;;             Crater         :@{h}%puhit8@{n} (@{h}%$[(puhit8*100)/total]\@{n}\%)   \
             Jab            :@{h}%crhit8@{n} (@{h}%$[(crhit8*100)/total]\@{n}\%)   \
             Stomp-kick     :@{h}%mahit8@{n} (@{h}%$[(mahit8*100)/total]\@{n}\%)%;\
	/echo -p Kick           :@{h}%uahit7@{n} (@{h}%$[(uahit7*100)/total]\@{n}\%)   \
             Incise         :@{h}%slhit7@{n} (@{h}%$[(slhit7*100)/total]\@{n}\%)   \
;;             Bore           :@{h}%puhit7@{n} (@{h}%$[(puhit7*100)/total]\@{n}\%)   \
             Thrust         :@{h}%crhit7@{n} (@{h}%$[(crhit7*100)/total]\@{n}\%)   \
             Elbow-smash    :@{h}%mahit7@{n} (@{h}%$[(mahit7*100)/total]\@{n}\%)%;\
	/echo -p Boot           :@{h}%uahit6@{n} (@{h}%$[(uahit6*100)/total]\@{n}\%)   \
             Tear           :@{h}%slhit6@{n} (@{h}%$[(slhit6*100)/total]\@{n}\%)   \
;;             Sink           :@{h}%puhit6@{n} (@{h}%$[(puhit6*100)/total]\@{n}\%)   \
             Stroke         :@{h}%crhit6@{n} (@{h}%$[(crhit6*100)/total]\@{n}\%)   \
             Elbow          :@{h}%mahit6@{n} (@{h}%$[(mahit6*100)/total]\@{n}\%)%;\
	/echo -p Lightly strike :@{h}%uahit5@{n} (@{h}%$[(uahit5*100)/total]\@{n}\%)   \
             Cut            :@{h}%slhit5@{n} (@{h}%$[(slhit5*100)/total]\@{n}\%)   \
;;             Puncture       :@{h}%puhit5@{n} (@{h}%$[(puhit5*100)/total]\@{n}\%)   \
             Thump          :@{h}%crhit5@{n} (@{h}%$[(crhit5*100)/total]\@{n}\%)   \
             Knee           :@{h}%mahit5@{n} (@{h}%$[(mahit5*100)/total]\@{n}\%)%;\
	/echo -p Bitchslap      :@{h}%uahit4@{n} (@{h}%$[(uahit4*100)/total]\@{n}\%)   \
             Lightly cut    :@{h}%slhit4@{n} (@{h}%$[(slhit4*100)/total]\@{n}\%)   \
;;             Pierce         :@{h}%puhit4@{n} (@{h}%$[(puhit4*100)/total]\@{n}\%)   \
             Bump           :@{h}%crhit4@{n} (@{h}%$[(crhit4*100)/total]\@{n}\%)   \
             Toe-kick       :@{h}%mahit4@{n} (@{h}%$[(mahit4*100)/total]\@{n}\%)%;\
	/echo -p Smack          :@{h}%uahit3@{n} (@{h}%$[(uahit3*100)/total]\@{n}\%)   \
             Gash           :@{h}%slhit3@{n} (@{h}%$[(slhit3*100)/total]\@{n}\%)   \
;;            Slightly pierce:@{h}%puhit3@{n} (@{h}%$[(puhit3*100)/total]\@{n}\%)   \
             Butt           :@{h}%crhit3@{n} (@{h}%$[(crhit3*100)/total]\@{n}\%)   \
             Grasp          :@{h}%mahit3@{n} (@{h}%$[(mahit3*100)/total]\@{n}\%)%;\
	/echo -p Spank          :@{h}%uahit2@{n} (@{h}%$[(uahit2*100)/total]\@{n}\%)   \
             Solidly slash  :@{h}%slhit2@{n} (@{h}%$[(slhit2*100)/total]\@{n}\%)   \
;;             Scratch        :@{h}%puhit2@{n} (@{h}%$[(puhit2*100)/total]\@{n}\%)   \
             Scratch        :@{h}%crhit2@{n} (@{h}%$[(crhit2*100)/total]\@{n}\%)   \
             Step on        :@{h}%mahit2@{n} (@{h}%$[(mahit2*100)/total]\@{n}\%)%;\
	/echo -p Pat            :@{h}%uahit1@{n} (@{h}%$[(uahit1*100)/total]\@{n}\%)   \
             Barely graze   :@{h}%slhit1@{n} (@{h}%$[(slhit1*100)/total]\@{n}\%)   \
;;             Barely scratch :@{h}%puhit1@{n} (@{h}%$[(puhit1*100)/total]\@{n}\%)   \
             Lightly jostle :@{h}%crhit1@{n} (@{h}%$[(crhit1*100)/total]\@{n}\%)   \
             Tickle         :@{h}%mahit1@{n} (@{h}%$[(mahit1*100)/total]\@{n}\%)%;\
    /echo ........................................%;\
	/echo -p @{h}%total \($[(100*total)/((total+miss+hitpar+hitdod))]\%\)@{n} hits scored.%;\
	/echo -p @{h}%miss \($[(100*miss)/((total+miss+hitpar+hitdod))]\%\)@{n}  hits missed.%;\
	/echo -p @{h}%hitpar \($[(100*hitpar)/((total+miss+hitpar+hitdod))]\%\)@{n} hits parried.%;\
	/echo -p @{h}%hitdod \($[(100*hitdod)/((total+miss+hitpar+hitdod))]\%\)@{n} hits dodged.%;\

/def -i nollaa_hitstats=\
 /set uahit1=0%;\
 /set uahit2=0%;\
 /set uahit3=0%;\
 /set uahit4=0%;\
 /set uahit5=0%;\
 /set uahit6=0%;\
 /set uahit7=0%;\
 /set uahit8=0%;\
 /set uahit9=0%;\
 /set uahit10=0%;\
 /set uahit11=0%;\
 /set uahit12=0%;\
 /set uahit13=0%;\
 /set uahit14=0%;\
 /set uahit15=0%;\
 /set uahit16=0%;\
 /set uahit17=0%;\
 /set uahit18=0%;\
 /set uahit19=0%;\
 /set uahit20=0%;\
 /set uahit21=0%;\
 /set uahit22=0%;\
 /set uahit23=0%;\
 /set uahit24=0%;\
 /set uahit25=0%;\
 /set uahit26=0%;\
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
