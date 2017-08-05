/require textutil.tf
/set countfile=~/tf-lib/magecount.txt
/set type=fire
/set reset=false

/def -F -p5 -mregexp -t"^You feel your skills in handling elemental forces improve\." essence_reset = /set reset=true
/def -F -p5 -mregexp -t"^You watch with self-pride as your electrocution hits .+\." electrocuition_count_up = /addone elec
/def -F -p5 -mregexp -t"^You watch with self-pride as your acid blast hits .+\." acid_blast_count_up = /addone acid
/def -F -p5 -mregexp -t"^You watch with self-pride as your blast vacuum hits .+\." blast_vacuum_count_up = /addone asph
/def -F -p5 -mregexp -t"^You watch with self-pride as your golden arrow hits .+\." golden_arrow_count_up= /addone mana
/def -F -p5 -mregexp -t"^You watch with self-pride as your summon carnal spores hits .+\." summon_carnal_spores_count_up = /addone pois
/def -F -p5 -mregexp -t"^You watch with self-pride as your cold ray hits .+\." cold_ray_count_up = /addone cold
/def -F -p5 -mregexp -t"^You watch with self-pride as your lava blast hits .+\." lava_blast_count_up_ = /addone fire

/def -i chomp=\
 /let count=%2%;\
 /_echo %count

/def addone=\
 /set type=%1%;\
 /if (%type=~"") \
   /echo -aB TF Info: Error%;\
 /elseif (%type=~"elec") \
   /set elecblast=$[%elecblast+1]%;\
   /if (%reset=~"true") /set elecblast=0%;/endif%;/set reset=false%;\
 /elseif (%type=~"acid") \
   /set acidblast=$[%acidblast+1]%;\
   /if (%reset=~"true") /set acidblast=0%;/endif%;/set reset=false%;\
 /elseif (%type=~"asph") \
   /set asphblast=$[%asphblast+1]%;\
   /if (%reset=~"true") /set asphblast=0%;/endif%;/set reset=false%;\
 /elseif (%type=~"mana") \
   /set manablast=$[%manablast+1]%;\
   /if (%reset=~"true") /set manablast=0%;/endif%;/set reset=false%;\
 /elseif (%type=~"pois") \
   /set poisblast=$[%poisblast+1]%;\
   /if (%reset=~"true") /set poisblast=0%;/endif%;/set reset=false%;\
 /elseif (%type=~"cold") \
   /set coldblast=$[%coldblast+1]%;\
   /if (%reset=~"true") /set coldblast=0%;/endif%;/set reset=false%;\
 /elseif (%type=~"fire") \
   /set fireblast=$[%fireblast+1]%;\
   /if (%reset=~"true") /set fireblast=0%;/endif%;/set reset=false%;\
 /endif

/def esset=\
 /writenew%;\
 /let eleccount=$(/readfile %countfile%| /egrep ^elec [0-9]+ )%;\
 /let acidcount=$(/readfile %countfile%| /egrep ^acid [0-9]+ )%;\
 /let asphcount=$(/readfile %countfile%| /egrep ^asph [0-9]+ )%;\
 /let manacount=$(/readfile %countfile%| /egrep ^mana [0-9]+ )%;\
 /let poiscount=$(/readfile %countfile%| /egrep ^pois [0-9]+ )%;\
 /let coldcount=$(/readfile %countfile%| /egrep ^cold [0-9]+ )%;\
 /let firecount=$(/readfile %countfile%| /egrep ^fire [0-9]+ )%;\
 /let eleccount=$(/chomp %eleccount)%;\
 /let acidcount=$(/chomp %acidcount)%;\
 /let asphcount=$(/chomp %asphcount)%;\
 /let manacount=$(/chomp %manacount)%;\
 /let poiscount=$(/chomp %poiscount)%;\
 /let coldcount=$(/chomp %coldcount)%;\
 /let firecount=$(/chomp %firecount)%;\
 /if (%eleccount=~"") /let eleccount=0%;\
 /if (%acidcount=~"") /let acidcount=0%;\
 /if (%asphcount=~"") /let asphcount=0%;\
 /if (%manacount=~"") /let manacount=0%;\
 /if (%poiscount=~"") /let poiscount=0%;\
 /if (%coldcount=~"") /let coldcount=0%;\
 /if (%firecount=~"") /let firecount=0%;\
 /set elecblast=%eleccount%;\
 /set acidblast=%acidcount%;\
 /set asphblast=%asphcount%;\
 /set manablast=%manacount%;\
 /set poisblast=%poiscount%;\
 /set coldblast=%coldcount%;\
 /set fireblast=%firecount%;\
/echo .---------------------------------.%;\
/echo | Elec: %elecblast    %;\
/echo | Acid: %acidblast    %;\
/echo | Asph: %asphblast    %;\
/echo | Mana: %manablast    %;\
/echo | Pois: %poisblast    %;\
/echo | Cold: %coldblast    %;\
/echo | Fire: %fireblast    

/def writenew =\
 /echo elec %elecblast%|/writefile %countfile%;\
 /echo acid %acidblast%|/writefile -a %countfile%;\
 /echo asph %asphblast%|/writefile -a %countfile%;\
 /echo mana %manablast%|/writefile -a %countfile%;\
 /echo pois %poisblast%|/writefile -a %countfile%;\
 /echo cold %coldblast%|/writefile -a %countfile%;\
 /echo fire %fireblast%|/writefile -a %countfile

/esset

/repeat -0:5 i /writenew
