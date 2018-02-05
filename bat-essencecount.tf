/require textutil.tf
/set countfile=~/tf-lib/magecount.txt
/set ctype=fire
/set reset=false
/set asphessu=0
/set elecessu=0
/set acidessu=0
/set fireessu=0
/set coldessu=0
/set manaessu=0
/set poisessu=0

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

/def -aB -t"You feel your skills in handling elemental forces improve." gain_essence =\
/echo -aB ############################%;\
/echo -aB ###### GAINED ESSENCE ######%;\
/echo -aB ############################%;\
/readessut

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
 /let asphessunext=$(/countnext %asphessu)%;\
 /let elecessunext=$(/countnext %elecessu)%;\
 /let acidessunext=$(/countnext %acidessu)%;\
 /let fireessunext=$(/countnext %fireessu)%;\
 /let coldessunext=$(/countnext %coldessu)%;\
 /let manaessunext=$(/countnext %manaessu)%;\
 /let poisessunext=$(/countnext %poisessu)%;\
 /let asphblastfloat=$[%asphblast+0.0]%;\
 /let elecblastfloat=$[%elecblast+0.0]%;\
 /let acidblastfloat=$[%acidblast+0.0]%;\
 /let fireblastfloat=$[%fireblast+0.0]%;\
 /let coldblastfloat=$[%coldblast+0.0]%;\
 /let manablastfloat=$[%manablast+0.0]%;\
 /let poisblastfloat=$[%poisblast+0.0]%;\
 /let asphprc=$[%asphblastfloat/%asphessunext*100]%;\
 /let elecprc=$[%elecblastfloat/%elecessunext*100]%;\
 /let acidprc=$[%acidblastfloat/%acidessunext*100]%;\
 /let fireprc=$[%fireblastfloat/%fireessunext*100]%;\
 /let coldprc=$[%coldblastfloat/%coldessunext*100]%;\
 /let manaprc=$[%manablastfloat/%manaessunext*100]%;\
 /let poisprc=$[%poisblastfloat/%poisessunext*100]%;\
/_echo ,-Essence--count---next--%;\
/_echo | Asph: %asphessu $[pad(%asphblast,5)] / $[pad(%asphessunext,-5)] ($[pad(substr(%asphprc,0,5),3)])% %;\
/_echo | Elec: %elecessu $[pad(%elecblast,5)] / $[pad(%elecessunext,-5)] ($[pad(substr(%elecprc,0,5),3)])% %;\
/_echo | Acid: %acidessu $[pad(%acidblast,5)] / $[pad(%acidessunext,-5)] ($[pad(substr(%acidprc,0,5),3)])% %;\
/_echo | Fire: %fireessu $[pad(%fireblast,5)] / $[pad(%fireessunext,-5)] ($[pad(substr(%fireprc,0,5),3)])% %;\
/_echo | Cold: %coldessu $[pad(%coldblast,5)] / $[pad(%coldessunext,-5)] ($[pad(substr(%coldprc,0,5),3)])% %;\
/_echo | Mana: %manaessu $[pad(%manablast,5)] / $[pad(%manaessunext,-5)] ($[pad(substr(%manaprc,0,5),3)])% %;\
/_echo | Pois: %poisessu $[pad(%poisblast,5)] / $[pad(%poisessunext,-5)] ($[pad(substr(%poisprc,0,5),3)])% %;\
/_echo `-----------------------------

/def writenew =\
 /echo elec %elecblast%|/writefile %countfile%;\
 /echo acid %acidblast%|/writefile -a %countfile%;\
 /echo asph %asphblast%|/writefile -a %countfile%;\
 /echo mana %manablast%|/writefile -a %countfile%;\
 /echo pois %poisblast%|/writefile -a %countfile%;\
 /echo cold %coldblast%|/writefile -a %countfile%;\
 /echo fire %fireblast%|/writefile -a %countfile

/def -ag -p99 -F -mregexp -t"\| Essence of asphyxiation        \|  (\d+) \|" asphessutrig = /set asphessu=%P1
/def -ag -p99 -F -mregexp -t"\| Essence of electricity         \|  (\d+) \|" elecessutrig = /set elecessu=%P1
/def -ag -p99 -F -mregexp -t"\| Essence of corrosion           \|  (\d+) \|" acidessutrig = /set acidessu=%P1
/def -ag -p99 -F -mregexp -t"\| Essence of pyromania           \|  (\d+) \|" fireessutrig = /set fireessu=%P1
/def -ag -p99 -F -mregexp -t"\| Essence of arctic powers       \|  (\d+) \|" coldessutrig = /set coldessu=%P1
/def -ag -p99 -F -mregexp -t"\| Essence of magic lore          \|  (\d+) \|" manaessutrig = /set manaessu=%P1
/def -ag -p99 -F -mregexp -t"\| Essence of toxicology          \|  (\d+) \|" poisessutrig = /set poisessu=%P1

/def readessut =\
 @grep "Essence of" skills

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

/def countnext =\
 /let current=%1%;\
 /if (%current>0 & %current<10) /let next=150%;\
 /elseif (%current>9 & %current<20) /let next= 350%;\
 /elseif (%current>19 & %current<30) /let next=1500%;\
 /elseif (%current>29 & %current<40) /let next=3000%;\
 /elseif (%current>39 & %current<50) /let next=4500%;\
 /elseif (%current>49 & %current<60) /let next=6000%;\
 /elseif (%current>59 & %current<70) /let next=7500%;\
 /elseif (%current>60 & %current<80) /let next=9000%;\
 /elseif (%current>79 & %current<90) /let next=10500%;\
 /elseif (%current>89 & %current<101) /let next=12000%;\
 /endif%;\
 /_echo %next



/repeat -0:5 i /writenew

/readcount

/repeat -3 1 /readessut
