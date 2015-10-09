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

;; Bashing hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BARBARICALLY BASH " cr_att26=/set crhit26=$[crhit26+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou CRUELLY CUFF " cr_att25=/set crhit25=$[crhit25+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY BEAT " cr_att24=/set crhit24=$[crhit24+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou REALLY WHACK " cr_att23=/set crhit23=$[crhit23+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely strike " cr_att22=/set crhit22=$[crhit22+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely sock " cr_att21=/set crhit21=$[crhit21+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou horribly thrust " cr_att20=/set crhit20=$[crhit20+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou badly smash " cr_att19=/set crhit19=$[crhit19+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly beat " cr_att18=/set crhit18=$[crhit18+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou smash " cr_att17=/set crhit17=$[crhit17+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou beat " cr_att16=/set crhit16=$[crhit16+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou whack " cr_att15=/set crhit15=$[crhit15+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou flail " cr_att14=/set crhit14=$[crhit14+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou knock " cr_att13=/set crhit13=$[crhit13+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cuff " cr_att12=/set crhit12=$[crhit12+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou sock " cr_att11=/set crhit11=$[crhit11+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou strike " cr_att10=/set crhit10=$[crhit10+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bash " cr_att9=/set crhit9=$[crhit9+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou jab " cr_att8=/set crhit8=$[crhit8+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou thrust " cr_att7=/set crhit7=$[crhit7+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou stroke " cr_att6=/set crhit6=$[crhit6+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou thump " cr_att5=/set crhit5=$[crhit5+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bump " cr_att4=/set crhit4=$[crhit4+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou butt " cr_att3=/set crhit3=$[crhit3+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou jostle " cr_att2 =/set crhit2=$[crhit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou lightly jostle " cr_att1 =/set crhit1=$[crhit1+1]
;; Cutting hits (slash)
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou CRUELLY DISMEMBER " sl_att26=/set slhit26=$[slhit26+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou DISMEMBER " sl_att25=/set slhit25=$[slhit25+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BARBARICALLY REND " sl_att24=/set slhit24=$[slhit24+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou CRUELLY REND " sl_att23=/set slhit23=$[slhit23+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou SAVAGELY SHRED " sl_att22=/set slhit22=$[slhit22+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY TEAR " sl_att21=/set slhit21=$[slhit21+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely rip " sl_att20=/set slhit20=$[slhit20+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou quickly cut " sl_att19=/set slhit19=$[slhit19+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou uncontrollably slash " sl_att18=/set slhit18=$[slhit18+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly slash " sl_att17=/set slhit17=$[slhit17+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou rive " sl_att16=/set slhit16=$[slhit16+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely shave " sl_att15=/set slhit15=$[slhit15+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly tatter " sl_att14=/set slhit14=$[slhit14+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slit " sl_att13=/set slhit13=$[slhit13+1]
/def -Fp5 -mregexp -i -t"^([A-z] ]+)?[Yy]ou incisively tear " sl_att12=/set slhit12=$[slhit12+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou incisively cut " sl_att11=/set slhit11=$[slhit11+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slash " sl_att10=/set slhit10=$[slhit10+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou horribly shred " sl_att9=/set slhit9=$[slhit9+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou shred " sl_att8=/set slhit8=$[slhit8+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou incise " sl_att7=/set slhit7=$[slhit7+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou tear " sl_att6=/set slhit6=$[slhit6+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cut " sl_att5=/set slhit5=$[slhit5+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou lightly cut " sl_att4=/set slhit4=$[slhit4+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou gash " sl_att3=/set slhit3=$[slhit3+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou solidly slash " sl_att2 =/set slhit2=$[slhit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou barely graze " sl_att1 =/set slhit1=$[slhit1+1]
;; Stabbing hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BARBARICALLY PIERCE " pu_att26=/set puhit26=$[puhit26+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY BORE " pu_att25=/set puhit25=$[puhit25+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou CRUELLY RIDDLE " pu_att24=/set puhit24=$[puhit24+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou REALLY DRILL " pu_att23=/set puhit23=$[puhit23+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou uncontrollably dig through " pu_att22=/set puhit22=$[puhit22+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely shaft " pu_att21=/set puhit21=$[puhit21+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly crater " pu_att20=/set puhit20=$[puhit20+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou powerfully pierce " pu_att19=/set puhit19=$[puhit19+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou powerfully perforate " pu_att18=/set puhit18=$[puhit18+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou drill " pu_att17=/set puhit17=$[puhit17+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou chasm " pu_att16=/set puhit16=$[puhit16+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou dig through " pu_att15=/set puhit15=$[puhit15+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou dig into " pu_att14=/set puhit14=$[puhit14+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou riddle " pu_att13=/set puhit13=$[puhit13+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou really poke " pu_att12=/set puhit12=$[puhit12+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou gorge " pu_att11=/set puhit11=$[puhit11+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou shaft " pu_att10=/set puhit10=$[puhit10+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cavitate " pu_att9=/set puhit9=$[puhit9+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou crater " pu_att8=/set puhit8=$[puhit8+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bore " pu_att7=/set puhit7=$[puhit7+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou sink " pu_att6=/set puhit6=$[puhit6+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou puncture " pu_att5=/set puhit5=$[puhit5+1]
/def -Fp5 -mregexp -i -t"^([A-z] ]+)?[Yy]ou pierce " pu_att4=/set puhit4=$[puhit4+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slightly pierce " pu_att3 =/set puhit3=$[puhit3+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou scratch " pu_att2=/set puhit2=$[puhit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou barely scratch " pu_att1=/set puhit1=$[puhit1+1]
;; unarmed / Tail hits?
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou ankle-stomp " ua_att9=/set uahit9=$[uahit9+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou badly kick " ua_att12=/set uahit12=$[uahit12+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BARBARICALLY BEAT " ua_att26=/set uahit26=$[uahit26+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bitchslap " ua_att4=/set uahit4=$[uahit4+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bodyslam " ua_att22=/set uahit22=$[uahit22+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou boot " ua_att6=/set uahit6=$[uahit6+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY BOOT " ua_att25=/set uahit25=$[uahit25+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly headbutt " ua_att18=/set uahit18=$[uahit18+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou dragon-punch " ua_att19=/set uahit19=$[uahit19+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou headbutt " ua_att17=/set uahit17=$[uahit17+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou jump-kick " ua_att13=/set uahit13=$[uahit13+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou kick " ua_att7=/set uahit7=$[uahit7+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou kidneypunch " ua_att15=/set uahit15=$[uahit15+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou knee-kick " ua_att11=/set uahit11=$[uahit11+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou lightly strike " ua_att5=/set uahit5=$[uahit5+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou pat " ua_att1=/set uahit1=$[uahit1+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou REALLY SMASH " ua_att24=/set uahit24=$[uahit24+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou roundhouse " ua_att21=/set uahit21=$[uahit21+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou run into " ua_att23=/set uahit23=$[uahit23+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely triple-kick " ua_att20=/set uahit20=$[uahit20+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou smack " ua_att3=/set uahit3=$[uahit3+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou spank " ua_att2=/set uahit2=$[uahit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou spin-kick " ua_att16=/set uahit16=$[uahit16+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou stomp " ua_att10=/set uahit10=$[uahit10+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou suckerpunch " ua_att8=/set uahit8=$[uahit8+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou uppercut " ua_att14=/set uahit14=$[uahit14+1]

/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile pierce." pu_dodges =/set hitdod=$[hitdod+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully parries your pierce." pu_parries =/set hitpar=$[hitpar+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile slash." sl_dodges =/set hitdod=$[hitdod+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile bash." cr_dodges =/set hitdod=$[hitdod+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully parries your slash." sl_parries =/set hitpar=$[hitpar+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully parries your bash." cr_parries =/set hitpar=$[hitpar+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully parries your bludgeon" ua_parries=/set hitpar=$[hitpar+1]
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile bludgeon" ua_dodges=/set hitdod=$[hitdod+1]


/def -aBCblack -i -t"You miss *" missi=/set miss=$[miss+1]
/def -i -h'SEND hitstats' hittelot=\
;;	/set total=$[slhit1+slhit2+slhit3+slhit4+slhit5+slhit6+slhit7+slhit8+slhit9+slhit10+slhit11+slhit12+slhit13+slhit14+slhit15+slhit16+slhit17+slhit18+slhit19+slhit20+slhit21+slhit22+slhit23+crhit1+crhit2+crhit3+crhit4+crhit5+crhit6+crhit7+crhit8+crhit9+crhit10+crhit11+crhit12+crhit13+crhit14+crhit15+crhit16+crhit17+crhit18+crhit19+crhit20+crhit21+crhit22+crhit23+puhit1+puhit2+puhit3+puhit4+puhit5+puhit6+puhit7+puhit8+puhit9+puhit10+puhit11+puhit12+puhit13+puhit14+puhit15+puhit16+puhit17+puhit18+puhit19+puhit20+puhit21+puhit22+puhit23]%;\
;;	/set total=$[uahit1+uahit2+uahit3+uahit4+uahit5+uahit6+uahit7+uahit8+uahit9+uahit10+uahit11+uahit12+uahit13+uahit14+uahit15+uahit16+uahit17+uahit18+uahit19+uahit20+uahit21+uahit22+uahit23+uahit24+uahit25+uahit26+crhit1+crhit2+crhit3+crhit4+crhit5+crhit6+crhit7+crhit8+crhit9+crhit10+crhit11+crhit12+crhit13+crhit14+crhit15+crhit16+crhit17+crhit18+crhit19+crhit20+crhit21+crhit22+crhit23+crhit24+crhit25+crhit26+puhit1+puhit2+puhit3+puhit4+puhit5+puhit6+puhit7+puhit8+puhit9+puhit10+puhit11+puhit12+puhit13+puhit14+puhit15+puhit16+puhit17+puhit18+puhit19+puhit20+puhit21+puhit22+puhit23+puhit24+puhit24+puhit26]%;\
	/set total=$[uahit1+uahit2+uahit3+uahit4+uahit5+uahit6+uahit7+uahit8+uahit9+uahit10+uahit11+uahit12+uahit13+uahit14+uahit15+uahit16+uahit17+uahit18+uahit19+uahit20+uahit21+uahit22+uahit23+uahit24+uahit25+uahit26+slhit1+slhit2+slhit3+slhit4+slhit5+slhit6+slhit7+slhit8+slhit9+slhit10+slhit11+slhit12+slhit13+slhit14+slhit15+slhit16+slhit17+slhit18+slhit19+slhit20+slhit21+slhit22+slhit23+slhit24+slhit25+slhit26+puhit1+puhit2+puhit3+puhit4+puhit5+puhit6+puhit7+puhit8+puhit9+puhit10+puhit11+puhit12+puhit13+puhit14+puhit15+puhit16+puhit17+puhit18+puhit19+puhit20+puhit21+puhit22+puhit23+puhit24+puhit24+puhit26]%;\
	/echo -ah Hits scored%;\
	/echo .......................................%;\
	/echo -p BARBARIC. BEAT :@{h}%uahit26@{n} (@{h}%$[(uahit26*100)/total]\@{n}\%)   \
             CRUEL.DISMEMBER:@{h}%slhit26@{n} (@{h}%$[(slhit26*100)/total]\@{n}\%)   \
             BARBARIC.PIERCE:@{h}%puhit26@{n} (@{h}%$[(puhit26*100)/total]\@{n}\%)%;\
	/echo -p BRUTALLY BOOT  :@{h}%uahit25@{n} (@{h}%$[(uahit25*100)/total]\@{n}\%)   \
             DISMEMBER      :@{h}%slhit25@{n} (@{h}%$[(slhit25*100)/total]\@{n}\%)   \
             BRUTALLY BORE  :@{h}%puhit25@{n} (@{h}%$[(puhit25*100)/total]\@{n}\%)%;\
	/echo -p REALLY SMASH   :@{h}%uahit24@{n} (@{h}%$[(uahit24*100)/total]\@{n}\%)   \
             BARBARICAL.REND:@{h}%slhit24@{n} (@{h}%$[(slhit24*100)/total]\@{n}\%)   \
             CRUELLY RIDDLE :@{h}%puhit24@{n} (@{h}%$[(puhit24*100)/total]\@{n}\%)%;\
	/echo -p Run into       :@{h}%uahit23@{n} (@{h}%$[(uahit23*100)/total]\@{n}\%)   \
             CRUELLY REND   :@{h}%slhit23@{n} (@{h}%$[(slhit23*100)/total]\@{n}\%)   \
             REALLY DRILL   :@{h}%puhit23@{n} (@{h}%$[(puhit23*100)/total]\@{n}\%)%;\
	/echo -p Bodyslam       :@{h}%uahit22@{n} (@{h}%$[(uahit22*100)/total]\@{n}\%)   \
             SAVAGELY SHRED :@{h}%slhit22@{n} (@{h}%$[(slhit22*100)/total]\@{n}\%)   \
             Unc.dig through:@{h}%puhit22@{n} (@{h}%$[(puhit22*100)/total]\@{n}\%)%;\
	/echo -p Roundhouse     :@{h}%uahit21@{n} (@{h}%$[(uahit21*100)/total]\@{n}\%)   \
             BRUTALLY TEAR  :@{h}%slhit21@{n} (@{h}%$[(slhit21*100)/total]\@{n}\%)   \
             Savagely shaft :@{h}%puhit21@{n} (@{h}%$[(puhit21*100)/total]\@{n}\%)%;\
	/echo -p Svg triple-kick:@{h}%uahit20@{n} (@{h}%$[(uahit20*100)/total]\@{n}\%)   \
             Savagely rip   :@{h}%slhit20@{n} (@{h}%$[(slhit20*100)/total]\@{n}\%)   \
             Cruelly crater :@{h}%puhit20@{n} (@{h}%$[(puhit20*100)/total]\@{n}\%)%;\
	/echo -p Dragon-punch   :@{h}%uahit19@{n} (@{h}%$[(uahit19*100)/total]\@{n}\%)   \
             Quickly cut    :@{h}%slhit19@{n} (@{h}%$[(slhit19*100)/total]\@{n}\%)   \
             Power.pierce   :@{h}%puhit19@{n} (@{h}%$[(puhit19*100)/total]\@{n}\%)%;\
	/echo -p Cruel. headbutt:@{h}%uahit18@{n} (@{h}%$[(uahit18*100)/total]\@{n}\%)   \
             Uncontrol.slash:@{h}%slhit18@{n} (@{h}%$[(slhit18*100)/total]\@{n}\%)   \
             Power.perforate:@{h}%puhit18@{n} (@{h}%$[(puhit18*100)/total]\@{n}\%)%;\
	/echo -p headbutt       :@{h}%uahit17@{n} (@{h}%$[(uahit17*100)/total]\@{n}\%)   \
             Cruelly slash  :@{h}%slhit17@{n} (@{h}%$[(slhit17*100)/total]\@{n}\%)   \
             Drill          :@{h}%puhit17@{n} (@{h}%$[(puhit17*100)/total]\@{n}\%)%;\
	/echo -p Spin-kick      :@{h}%uahit16@{n} (@{h}%$[(uahit16*100)/total]\@{n}\%)   \
             Rive           :@{h}%slhit16@{n} (@{h}%$[(slhit16*100)/total]\@{n}\%)   \
             Chasm   	    :@{h}%puhit16@{n} (@{h}%$[(puhit16*100)/total]\@{n}\%)%;\
	/echo -p Kidneypunch    :@{h}%uahit15@{n} (@{h}%$[(uahit15*100)/total]\@{n}\%)   \
             Savagely shave :@{h}%slhit15@{n} (@{h}%$[(slhit15*100)/total]\@{n}\%)   \
             Dig through    :@{h}%puhit15@{n} (@{h}%$[(puhit15*100)/total]\@{n}\%)%;\
	/echo -p Uppercut       :@{h}%uahit14@{n} (@{h}%$[(uahit14*100)/total]\@{n}\%)   \
             Cruelly tatter :@{h}%slhit14@{n} (@{h}%$[(slhit14*100)/total]\@{n}\%)   \
             Dig into       :@{h}%puhit14@{n} (@{h}%$[(puhit14*100)/total]\@{n}\%)%;\
	/echo -p Jump-kick      :@{h}%uahit13@{n} (@{h}%$[(uahit13*100)/total]\@{n}\%)   \
             Slit           :@{h}%slhit13@{n} (@{h}%$[(slhit13*100)/total]\@{n}\%)   \
             Riddle  	    :@{h}%puhit13@{n} (@{h}%$[(puhit13*100)/total]\@{n}\%)%;\
	/echo -p Badly kick     :@{h}%uahit12@{n} (@{h}%$[(uahit12*100)/total]\@{n}\%)   \
             Inc. slash     :@{h}%slhit12@{n} (@{h}%$[(slhit12*100)/total]\@{n}\%)   \
             Really poke    :@{h}%puhit12@{n} (@{h}%$[(puhit12*100)/total]\@{n}\%)%;\
	/echo -p Knee-kick      :@{h}%uahit11@{n} (@{h}%$[(uahit11*100)/total]\@{n}\%)   \
             Inc. cut       :@{h}%slhit11@{n} (@{h}%$[(slhit11*100)/total]\@{n}\%)   \
             Gorge          :@{h}%puhit11@{n} (@{h}%$[(puhit11*100)/total]\@{n}\%)%;\
	/echo -p Stomp          :@{h}%uahit10@{n} (@{h}%$[(uahit10*100)/total]\@{n}\%)   \
             Slash          :@{h}%slhit10@{n} (@{h}%$[(slhit10*100)/total]\@{n}\%)   \
             Shaft  	    :@{h}%puhit10@{n} (@{h}%$[(puhit10*100)/total]\@{n}\%)%;\
	/echo -p Ankle-stomp    :@{h}%uahit9@{n} (@{h}%$[(uahit9*100)/total]\@{n}\%)   \
             Horribly shred :@{h}%slhit9@{n} (@{h}%$[(slhit9*100)/total]\@{n}\%)   \
             Cavitate  	    :@{h}%puhit9@{n} (@{h}%$[(puhit9*100)/total]\@{n}\%)%;\
	/echo -p Suckerpunch    :@{h}%uahit8@{n} (@{h}%$[(uahit8*100)/total]\@{n}\%)   \
             Shred          :@{h}%slhit8@{n} (@{h}%$[(slhit8*100)/total]\@{n}\%)   \
             Crater	    :@{h}%puhit8@{n} (@{h}%$[(puhit8*100)/total]\@{n}\%)%;\
	/echo -p Kick           :@{h}%uahit7@{n} (@{h}%$[(uahit7*100)/total]\@{n}\%)   \
             Incise         :@{h}%slhit7@{n} (@{h}%$[(slhit7*100)/total]\@{n}\%)   \
             Bore           :@{h}%puhit7@{n} (@{h}%$[(puhit7*100)/total]\@{n}\%)%;\
	/echo -p Boot           :@{h}%uahit6@{n} (@{h}%$[(uahit6*100)/total]\@{n}\%)   \
             Tear           :@{h}%slhit6@{n} (@{h}%$[(slhit6*100)/total]\@{n}\%)   \
             Sink           :@{h}%puhit6@{n} (@{h}%$[(puhit6*100)/total]\@{n}\%)%;\
	/echo -p Lightly strike :@{h}%uahit5@{n} (@{h}%$[(uahit5*100)/total]\@{n}\%)   \
             Cut            :@{h}%slhit5@{n} (@{h}%$[(slhit5*100)/total]\@{n}\%)   \
             Puncture       :@{h}%puhit5@{n} (@{h}%$[(puhit5*100)/total]\@{n}\%)%;\
	/echo -p Bitchslap      :@{h}%uahit4@{n} (@{h}%$[(uahit4*100)/total]\@{n}\%)   \
             Lightly cut    :@{h}%slhit4@{n} (@{h}%$[(slhit4*100)/total]\@{n}\%)   \
             Pierce	    :@{h}%puhit4@{n} (@{h}%$[(puhit4*100)/total]\@{n}\%)%;\
	/echo -p Smack          :@{h}%uahit3@{n} (@{h}%$[(uahit3*100)/total]\@{n}\%)   \
             Gash           :@{h}%slhit3@{n} (@{h}%$[(slhit3*100)/total]\@{n}\%)   \
             Slightly pierce:@{h}%puhit3@{n} (@{h}%$[(puhit3*100)/total]\@{n}\%)%;\
	/echo -p Spank          :@{h}%uahit2@{n} (@{h}%$[(uahit2*100)/total]\@{n}\%)   \
             Solidly slash  :@{h}%slhit2@{n} (@{h}%$[(slhit2*100)/total]\@{n}\%)   \
             Scratch        :@{h}%puhit2@{n} (@{h}%$[(puhit2*100)/total]\@{n}\%)%;\
	/echo -p Pat            :@{h}%uahit1@{n} (@{h}%$[(uahit1*100)/total]\@{n}\%)   \
             Barely graze   :@{h}%slhit1@{n} (@{h}%$[(slhit1*100)/total]\@{n}\%)   \
             Barely scratch :@{h}%puhit1@{n} (@{h}%$[(puhit1*100)/total]\@{n}\%)%;\
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
 /set hitdod=0%;\
 /set hitpar=0%;\
 /set miss=0

/nollaa_hitstats

