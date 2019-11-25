;barbirepu
/loaded bat-barbrep.tf
/def -ag -mregexp -i -t'^\[([X]*)([@]*)([#]*)([:]*)([.]*)\]$' poikelot=\
/set kymppitonnit=%P1%;/set tonnit=%P2%;/set satkut=%P3%;/set kympit=%P4%;/set ykkoset=%P5%;\
/set pisteet=\
$[10000*strlen(kymppitonnit)+1000*strlen(tonnit)+100*strlen(satkut)+10*strlen(kympit)+strlen(ykkoset)]%;\
/set stringi=$[strcat(kymppitonnit,tonnit,satkut,kympit,ykkoset)]%;\
/echo  [%stringi] (%pisteet points)
