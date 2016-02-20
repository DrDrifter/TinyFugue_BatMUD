/require textutil.tf
/set countfile=~/tf-lib/magecount.txt

/def -F -p5 -t"You watch with self-pride as your electrocution hits *" electrocuition_count_up = /addone elec
/def -F -p5 -t"You watch with self-pride as your acid blast hits *" acid_blast_count_up = /addone acid
/def -F -p5 -t"You watch with self-pride as your blast vacuum hits *" blast_vacuum_count_up = /addone asph
/def -F -p5 -t"You watch with self-pride as your golden arrow hits *" golden_arrow_count_up= /addone mana
/def -F -p5 -t"You watch with self-pride as your summon carnal spores hits *" summon_carnal_spores_count_up = /addone pois
/def -F -p5 -t"You watch with self-pride as your cold ray hits *" cold_ray_count_up = /addone cold
/def -F -p5 -t"You watch with self-pride as your lava blast hits *" lava_blast_count_up_ = /addone fire

/def -i chomp=\
 /let count=%2%;\
 /_echo %count

/def addone=\
 /let type=%1%;\
 /let addedcount=%%{%{type}}%;\
 /let addedcount=$[$(/eval /_echo %addedcount)]%;\
;; /let addedcount=%addedcount%;\
 /echo %addedcount

/def esset=\
 /let eleccount=$(/readfile %countfile%| /egrep ^elec [0-9]+ )%;\
 /let acidcount=$(/readfile %countfile%| /egrep ^acid [0-9]+ )%;\
 /let asphcount=$(/readfile %countfile%| /egrep ^asph [0-9]+ )%;\
 /let manacount=$(/readfile %countfile%| /egrep ^mana [0-9]+ )%;\
 /let eleccount=$(/chomp %eleccount)%;\
 /let acidcount=$(/chomp %acidcount)%;\
 /let asphcount=$(/chomp %asphcount)%;\
 /let manacount=$(/chomp %manacount)%;\
 /set elecblast=%eleccount%;\
 /set acidblast=%acidcount%;\
 /set asphblast=%asphcount%;\
 /set manablast=%manacount%;\
/echo .---------------------------------.%;\
/echo | Elec: %elecblast    %;\
/echo | Acid: %acidblast    %;\
/echo | Asph: %asphblast    %;\
/echo | Mana: %manablast    


/esset
