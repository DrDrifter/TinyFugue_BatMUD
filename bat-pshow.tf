/require items.tf

/purge pcolour

/set showHeaders=1
/set hideEmptyRows=1

/def sp =\
/def -ag -F -1 -t',-----------------------------------------------------------------------------.' partyStart = \
/set partyPlaceNames=0 0 0 0 0 0 0 0 0%%;\
/set partyStatus=0 0 0 0 0 0 0 0 0%%;\
/set partyHps=0 0 0 0 0 0 0 0 0%%;\
/set partyMaxHps=0 0 0 0 0 0 0 0 0%%;\
/set partySps=0 0 0 0 0 0 0 0 0%%;\
/set partyMaxSps=0 0 0 0 0 0 0 0 0%;\
/def -ag -F -mregexp -t'^\\|([\\* ])([1-3\\?])\\.([1-3\\?])   ([A-z]*)[ ]+(ldr|fol|rest|form|dead|mbr|ld)[ ]+([\\-]*[0-9]+)\\([ ]*([\\-]*[0-9]+)\\)[ ]*([\\-]*[0-9]+)\\([ ]*([\\-]*[0-9]+)\\)' pplacer = \
/if ({P1}=~"*") /let status=idle%%{P5}%%;/else /let status=%%{P5}%%;/endif%%;\
/if ({P2}!~"?")\
/let pos=$$[(({P2}-1)*3)+{P3}]%%;\
/set partyPlaceNames=$$(/replaceitem %%pos %%P4 %%partyPlaceNames)%%;\
/set partyHps=$$(/replaceitem %%pos %%P6 %%partyHps)%%;\
/set partyMaxHps=$$(/replaceitem %%pos %%P7 %%partyMaxHps)%%;\
/set partySps=$$(/replaceitem %%pos %%P8 %%partySps)%%;\
/set partyMaxSps=$$(/replaceitem %%pos %%P9 %%partyMaxSps)%%;\
/set partyStatus=$$(/replaceitem %%pos %%status %%partyStatus)%%;\
/else\
/set partyPlaceNames=$$(/additem %%P4 %%partyPlaceNames)%%; \
/set partyHps=$$(/additem %%P6 %%partyHps)%%; \
/set partyMaxHps=$$(/additem %%P7 %%partyMaxHps)%%; \
/set partySps=$$(/additem %%P8 %%partySps)%%; \
/set partyMaxSps=$$(/additem %%P9 %%partyMaxSps)%%; \
/set partyStatus=$$(/additem %%status %%partyStatus)%%; \
/endif%; \
/def -ag -F -1 -t'`-----------------------------------------------------------------------------\\'' partyEnd = \
/if ({showHeaders}==1) \
/echo - -+--------Front Row--------+--------Second Row-------+--------Third Row--------%%; \
/endif%%; \
/let i=3%%; \
/while (i>0) \
/let partyLine=%%{i}|%%; \
/let j=0%%; \
/while (j<3) \
/let pos=$$[i+(j*3)]%%; \
/let playerName=$$(/nth %%pos %%partyPlaceNames)%%; \
/if ({playerName}=~"0") \
/let partyLine=$$[strcat({partyLine}, "                    -----")]%%; \
/else \
/let playerHp=$$(/nth %%pos %%partyHps)%%; \
/let playerMaxHp=$$(/nth %%pos %%partyMaxHps)%%; \
/let playerSp=$$(/nth %%pos %%partySps)%%; \
/let playerMaxSp=$$(/nth %%pos %%partyMaxSps)%%; \
/let playerStatus=$$(/nth %%pos %%partyStatus)%%; \
/if (playerStatus=~"ldr") \
/let playerColour=@{BCgreen}%%; \
/else /if (playerStatus=~"idleldr") \
/let playerColour=@{uBCgreen}%%; \
/else /if (playerStatus=~"idlefol") \
/let playerColour=@{uCcyan}%%; \
/else /if (playerStatus=~"idlembr") \
/let playerColour=@{uCcyan}%%; \
/else \
/let playerColour=@{Ccyan}%%; \
/endif%%;/endif%%;/endif%%;/endif%%; \
/let playerName=$$[substr({playerName},0,5)]%%; \
/let cellItem=$$[party_format({playerHp},{playerMaxHp})]@{n}(@{Cwhite}$$[pad({playerMaxHp},4)]@{n})$$[party_format({playerSp},{playerMaxSp})]@{n}(@{Cwhite}$$[pad({playerMaxSp},4)]@{n})%%{playerColour}$$[pad({playerName},5)]@{n}%%; \
/let partyLine=%%{partyLine}%%{cellItem}%%; \
/endif%%; \
/if (j!=2) /let partyLine=%%{partyLine}|%%;/endif%%; \
/let j=$$[j+1]%%; \
/done%%; \
/if ({partyLine} !/ "[1-3]|                    -----|                    -----|                    -----" | hideEmptyRows==0 ) \
/echo -p - %%partyLine%%; \
/endif%%; \
/let i=$$[i-1]%%; \
/done%%; \
/if ({showHeaders}==1) \
/echo - -+-------------------------+-------------------------+-------------------------%%; \
/endif%%; \
/let len=$$(/length %%partyPlaceNames)%%; \
/if ({len}>9) \
/let i=10%%; \
/let count=1%%; \
/let partyLine=U|%%; \
/while (i<={len}) \
/let playerHp=$$(/nth %%i %%partyHps)%%; \
/let playerMaxHp=$$(/nth %%i %%partyMaxHps)%%; \
/let playerSp=$$(/nth %%i %%partySps)%%; \
/let playerMaxSp=$$(/nth %%i %%partyMaxSps)%%; \
/let playerStatus=$$(/nth %%i %%partyStatus)%%; \
/let playerName=$$(/nth %%i %%partyPlaceNames)%%; \
/let playerName=$$[substr({playerName},0,5)]%%; \
/if (playerStatus=~"ldr") \
/let playerColour=@{BCgreen}%%; \
/else /if (playerStatus=~"idleldr") \
/let playerColour=@{uBCgreen}%%; \
/else /if (playerStatus=~"idlefol") \
/let playerColour=@{uCcyan}%%; \
/else /if (playerStatus=~"idlembr") \
/let playerColour=@{uCcyan}%%; \
/else /if (playerStatus=~"ld") \
/let playerColour=@{uCyellow}%%; \
/else \
/let playerColour=@{Ccyan}%%; \
/endif%%;/endif%%;/endif%%;/endif%%;/endif%%; \
/let playerName=$$[substr({playerName},0,5)]%%; \
/let cellItem=@{$$(/percolor %%playerHp %%playerMaxHp)}$$[pad({playerHp},4)]@{n}(@{BCwhite}$$[pad({playerMaxHp},4)]@{n})@{$$(/percolor %%playerSp %%playerMaxSp)}$$[pad({playerSp},4)]@{n}(@{BCwhite}$$[pad({playerMaxSp},4)]@{n})%%{playerColour}$$[pad({playerName},5)]@{n}%%; \
/let partyLine=%%{partyLine}%%{cellItem}%%; \
/let i=$$[{i}+1]%%; \
/let count=$$[{count}+1]%%; \
/if ({count}>=3) \
/let count=1%%;\
/echo -p - %%partyLine%%;\
/let partyLine=U|%%;\
/else\
/let partyLine=%%{partyLine}|%%;\
/endif%%;\
/done%%;\
/if ({count}>1) /echo -p - %%partyLine%%;/endif%%;\
/endif%%;\
/purge pplacer%;\
@party status short
/def -i party_format =\
/return \
({1}>{2}?strcat("@{Cmagenta}",pad({1},4),"@{n}")\
:({1}=={2}?strcat("@{Cgreen}",pad({1},4),"@{n}")\
:(({2}-{1})<200?strcat("@{Ccyan}",pad({1},4),"@{n}")\
:({1}>({2}/4)?strcat("@{Cyellow}",pad({1},4),"@{n}")\
:({1}>=0)?strcat("@{Cred}",pad({1},4),"@{n}")\
:strcat("@{BCred}",pad({1},4),"@{n}")\
))))

/def percolor =\
/if ({2}!=0)\
/let tmpvar=$[({1}*100)/{2}]%;\
/else\
/if ({1}>=0)\
/let tmpvar=100%;\
/else\
/let tmpvar=0%;\
/endif%;\
/endif%;\
/if (tmpvar>80)\
/_echo Cwhite%;\
/elseif (tmpvar>60)\
/_echo Cyellow%;\
/elseif (tmpvar>40)\
/_echo Cgreen%;\
/elseif (tmpvar>20)\
/_echo Cmagenta%;\
/else\
/_echo Cred%;\
/endif

;1234567890123456789012345678901234567890123456789012345678901234567890123456789
;,------------------------------- ----------------------------- -----------------------------.
;| |          FRONT ROW          |         SECOND ROW          |          THIRD ROW          |
;+-+-----------------------------+-----------------------------+-----------------------------+
;|3| 1746(1781)  32(  32) Chizra | 1045(1045) 105(1164) Walor  |                      ------ |
;|2| 1485(1737)-234(  69) Druff  |  705( 561) 191(1272) Cola   |  773( 773) 658(1417) Kawasa |
;|1| 1835(1917)  18(  18) Ksahn  |  998( 984) 282(1227) Brock  |  830( 830) 455(1155) Desos  |
;+-+-----------------------------+-----------------------------+-----------------------------+
;| Not following:                | 1101(1101) 804(1211) Spid   |                             |
;'-------------------------------+-----------------------------+-----------------------------'

;1234567890123456789012345678901234567890123456789012345678901234567890123456789
;,------------------------+-------------------------+------------------------.
;|         FRONT ROW      |        SECOND ROW       |        THIRD ROW       |
;+------------------------+-------------------------+------------------------+
;1746(1781)  32(  32) Chiz|1045(1045) 105(1164) Walo|                     ----
;1485(1737)-234(  69) Druf| 705( 561) 191(1272) Cola| 773( 773) 658(1417) Kawa
;1835(1917)  18(  18) Ksah| 998( 984) 282(1227) Broc| 830( 830) 455(1155) Deso
; +------------------------+-------------------------+------------------------+
; 1101(1101) 804(1211) Spid|                         |
;1234567890123456789012345678901234567890123456789012345678901234567890123456789
;+---------Front Row--------+--------Second Row-------+--------Third Row-------+
;3|1746(1781)  32(  32) Chiz|1045(1045) 105(1164) Walo|                     ----
;2|1485(1737)-234(  69) Druf| 705( 561) 191(1272) Cola| 773( 773) 658(1417) Kawa
;1|1835(1917)  18(  18) Ksah| 998( 984) 282(1227) Broc| 830( 830) 455(1155) Deso
;+--------------------------+-------------------------+------------------------+
;U 1101(1101) 804(1211) Spid|

;,-----------------------------------------------------------------------------.
;| 1.1   Chizra        fol 1746(1781)   32(  32) 295(414) |  89 |       109204 |
;| 1.2   Druff         fol 1485(1737) -234(  69) 226(429) | 100 |       116464 |
;| 1.3   Ksahn         fol 1835(1917)   18(  18) 410(410) |  70 |        95049 |
;| 2.1   Walor         fol 1045(1045)  105(1164) 503(503) | 100 |       116464 |
;| 2.2   Cola          ldr  705( 561)  191(1272) 251(251) | 100 |       179250 |
;| 2.3   Kawasa        fol  773( 773)  658(1417) 520(520) | 100 |       116429 |
;| 3.1   Spid          fol 1101(1101)  804(1211) 304(304) |  91 |       110464 |
;| 3.2   Brock         fol  998( 984)  282(1227) 299(298) |  86 |       106980 |
;| 3.3   Desos         fol  830( 830)  455(1155) 444(450) | 100 |       116464 |
;`-----------------------------------------------------------------------------'
;1234567890123456789012345678901234567890123456789012345678901234567890123456789
;,-----------------------+------------------------+-----------------------.
;| 1746(1781)   32(  32) | 1485(1737)  -234(  69) | 1835(1917)   18(  18) |
;| Chizra                | Druff                  | Ksahn                 |
;+-----------------------+------------------------+-----------------------+
;| 1045(1045)  105(1164) |  705( 561)   191(1272) |  773( 773)  658(1417) |
;| Walor                 | Cola                   | Kawasa                |
;+-----------------------+------------------------+-----------------------+
;|                       |  998( 984)   282(1227) |  830( 830)  455(1155) |
;|                       | Brock                  | Desos                 |
;+-Not Following --------+------------------------+-----------------------+
;| 1101(1101)  804(1211) |
;| Spid                  |
;+-----------------------+
;,------------------------------+------------------------------+------------------------------.
;| 1746(1781) Chizra   32(  32) | 1485(1737) Druff  -234(  69) | 1835(1917) Ksahn    18(  18) |
;| 1045(1045) Walor   105(1164) |  705( 561) Cola    191(1272) |  773( 773) Kawasa  658(1417) |
;|            ------            |  998( 984) Brock   282(1227) |  830( 830) Desos   455(1155) |
;+------------------------------+------------------------------+------------------------------+
;| 1101(1101) Spid    804(1211) |                              |                              |
;'------------------------------+------------------------------+------------------------------'
