/require textutil.tf
/set countfile=~/tf-lib/magecount.txt
/set ctype=fire
/set reset=false

/def -F -p5 -mregexp -t"^You feel your skills in handling elemental forces improve\." essence_reset = /set reset=true
/def -F -p5 -mregexp -t"^You watch with self-pride as your electrocution hits .+\." electrocuition_count_up = /addone elec
/def -F -p5 -mregexp -t"^You watch with self-pride as your acid blast hits .+\." acid_blast_count_up = /addone acid
/def -F -p5 -mregexp -t"^You watch with self-pride as your blast vacuum hits .+\." blast_vacuum_count_up = /addone asph
/def -F -p5 -mregexp -t"^You watch with self-pride as your golden arrow hits .+\." golden_arrow_count_up= /addone mana
/def -F -p5 -mregexp -t"^You watch with self-pride as your summon carnal spores hits .+\." summon_carnal_spores_count_up = /addone pois
/def -F -p5 -mregexp -t"^You watch with self-pride as your cold ray hits .+\." cold_ray_count_up = /addone cold
/def -F -p5 -mregexp -t"^You watch with self-pride as your lava blast hits .+\." lava_blast_count_up_ = /addone fire
/def -F -p5 -mregexp -t"^You hit .+ with your lightning storm\." lightning_storm_count_up = /addone elec%;/addone elec
/def -F -p5 -mregexp -t"^You hit .+ with your acid storm\." acid_storm_count_up = /addone acid%;/addone acid
/def -F -p5 -mregexp -t"^You hit .+ with your vacuum globe\." vacuum_globe_count_up = /addone asph%;/addone asph
/def -F -p5 -mregexp -t"^You hit .+ with your magic disruption\." magic_disruption_count_up = /addone mana%;/addone mana
/def -F -p5 -mregexp -t"^You hit .+ with your killing cloud\." killing_cloud_count_up = /addone pois%;/addone pois
/def -F -p5 -mregexp -t"^You hit .+ with your hailstorm\." hailstorm_count_up = /addone cold%;/addone cold
/def -F -p5 -mregexp -t"^You hit .+ with your lava storm\." lava_storm_count_up = /addone fire%;/addone fire

/def -i chomp=\
 /let count=%2%;\
 /_echo %count

/def addone=\
 /set ctype=%1%;\
 /if (%ctype=~"") \
   /echo -aB TF Info: Error%;\
 /elseif (%ctype=~"elec") \
   /set elecblast=$[%elecblast+1]%;\
   /if (%reset=~"true") /set elecblast=0%;/endif%;/set reset=false%;\
 /elseif (%ctype=~"acid") \
   /set acidblast=$[%acidblast+1]%;\
   /if (%reset=~"true") /set acidblast=0%;/endif%;/set reset=false%;\
 /elseif (%ctype=~"asph") \
   /set asphblast=$[%asphblast+1]%;\
   /if (%reset=~"true") /set asphblast=0%;/endif%;/set reset=false%;\
 /elseif (%ctype=~"mana") \
   /set manablast=$[%manablast+1]%;\
   /if (%reset=~"true") /set manablast=0%;/endif%;/set reset=false%;\
 /elseif (%ctype=~"pois") \
   /set poisblast=$[%poisblast+1]%;\
   /if (%reset=~"true") /set poisblast=0%;/endif%;/set reset=false%;\
 /elseif (%ctype=~"cold") \
   /set coldblast=$[%coldblast+1]%;\
   /if (%reset=~"true") /set coldblast=0%;/endif%;/set reset=false%;\
 /elseif (%ctype=~"fire") \
   /set fireblast=$[%fireblast+1]%;\
   /if (%reset=~"true") /set fireblast=0%;/endif%;/set reset=false%;\
 /endif

/def esset=\
 /writenew%;\
 /readcount%;\
/echo ,-----------------------------%;\
/echo | Elec: %elecblast    %;\
/echo | Acid: %acidblast    %;\
/echo | Asph: %asphblast    %;\
/echo | Mana: %manablast    %;\
/echo | Pois: %poisblast    %;\
/echo | Cold: %coldblast    %;\
/echo | Fire: %fireblast    %;\
/echo `-----------------------------

/def writenew =\
 /echo elec %elecblast%|/writefile %countfile%;\
 /echo acid %acidblast%|/writefile -a %countfile%;\
 /echo asph %asphblast%|/writefile -a %countfile%;\
 /echo mana %manablast%|/writefile -a %countfile%;\
 /echo pois %poisblast%|/writefile -a %countfile%;\
 /echo cold %coldblast%|/writefile -a %countfile%;\
 /echo fire %fireblast%|/writefile -a %countfile

/def readcount =\
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
 /if (%eleccount=~"") /let eleccount=0%;/endif%;\
 /if (%acidcount=~"") /let acidcount=0%;/endif%;\
 /if (%asphcount=~"") /let asphcount=0%;/endif%;\
 /if (%manacount=~"") /let manacount=0%;/endif%;\
 /if (%poiscount=~"") /let poiscount=0%;/endif%;\
 /if (%coldcount=~"") /let coldcount=0%;/endif%;\
 /if (%firecount=~"") /let firecount=0%;/endif%;\
 /set elecblast=%eleccount%;\
 /set acidblast=%acidcount%;\
 /set asphblast=%asphcount%;\
 /set manablast=%manacount%;\
 /set poisblast=%poiscount%;\
 /set coldblast=%coldcount%;\
 /set fireblast=%firecount

/repeat -0:5 i /writenew

/readcount
