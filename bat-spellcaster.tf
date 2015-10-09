/require -q bat-spells.tf
/require -q bat-party.tf
/require -q textutil.tf
;; Change this to any existing file that you want to save things to
/set spellfile= ~/lib/spellcaster.txt

;; Main caster trig
/def -F -p9 -mregexp -t"( waves [a-z]* index finger while uttering| rolls [a-z]* eyes wildly and exclaims| frantically waves [a-z]* hands and yells| gets an evil gleam in [a-z]* eyes and chants| booms in sinister voice| flaps arms and utters the magic words| fills up [a-z]* cheeks with air and exhales| rubs wax in [a-z]* feet and chants| traces fiery [a-z ]* runes [A-Za-z ]*[A-Za-z]+| rubs her eyes with sand and whispers| rapidly swallows a dozen iron nails and mumbles| utters the magic words| claps [a-z]* hands and whispers| claps [a-z]* hands and says| taps [a-z]* foot three times and utters the words)" spell_caster=\
   /set the_spell_caster=$[replace(" ","_",{PL})]%;\
   /set spell_words=$[substr(replace(" ", "_",{PR}),2,-1)]%;\
   /unset the_spell_name%;\
   /def get_spell_name= /echo $[strcat("%{",$(/search_spell_name %{spell_words_list}),"}")]%;\
   /set the_spell_name=$(/get_spell_name %{spell_names_list})%;\
   /if ((!(regmatch({the_spell_caster}, {party_members}))) & ({the_spell_name}!~""))\
;   @party say $[replace("_"," ",{the_spell_caster})] cast $[replace ("_"," ",{the_spell_name})]%;\
;   /echo $[replace("_"," ",{the_spell_caster})] cast $[replace ("_"," ",{the_spell_name})]%;\
     /if ({loaded_spell_name}!~{the_spell_caster})\
       /set loaded_spell_name=%{the_spell_caster}%;\
       /set caster_spell_list=$(/readfile %{spellfile} %| /fgrep %{the_spell_caster})%;\
       /set caster_spell_list=$(/rest %{caster_spell_list})%;\
     /endif%;\
     /let globmatch_spell_name=*%{the_spell_name}*%;\
     /if ({caster_spell_list}!/{globmatch_spell_name})\
       /set caster_spell_list=%{caster_spell_list} %{the_spell_name}%;\
       /readfile %{spellfile} %| /fgrep -v %{the_spell_caster} %| /writefile %{spellfile}%;\
       /_echo %{the_spell_caster} %{caster_spell_list} %| /writefile -a %{spellfile}%;\
     /endif%;\
   /endif

/def spq=\
   /if ({1}!~"")\
     /def -n1 -p99 -ag -mregexp -t"( is in excellent shape| is in good shape| is slightly hurt| is noticeably hurt| is not in good shape| is in bad shape| is in very bad shape| is near death)" get_spq_target=/set spq_target=$$[replace(" ","_",{PL})]%%;/spq_report%;\
     @scan %{*}%;\
   /endif
/def spq_report=\
       @party say reading database...%;\
     /let spq_target_spells=$(/readfile %{spellfile} %| /fgrep %{spq_target})%;\
     /let spq_target_spells=$(/rest %{spq_target_spells})%;\
     /if ({spq_target_spells}!~"")\
       @party say \[ $[replace("_"," ",{spq_target})] \] might cast $[replace("_"," ",(replace(" ",", ",{spq_target_spells})))]%;\
     /else \
       @party say no record of \[ $[replace("_"," ",{spq_target})] \] in database.%;\
     /endif

/def -i search_spell_name=\
   /set spell_words_count=1%;\
   /while ({#})\
     /if ({1}=~{spell_words})\
       /_echo %{spell_words_count}%;\
     /else \
       /set spell_words_count=$[{spell_words_count}+1]%;\
     /endif%;\
     /shift%;\
   /done

;;Mudpit stuff
;;/def -F -p9 -t"* traces transparent watery runes on the ground *" cast_create_mud= @party say %{1} cast create mud
;;/def -F -p9 -t"* turns the ground beneath {*} into mud." made_mud_pit= @party say %{1} tries to put %{L3} into mudpit!
;;/def -F -p9 -t"* falls down, arms flailing, helplessly into the mudpit." target_in_pit= @party say %{1} is pitted!
;;/def -F -p9 -t"* climbs out of the mudpit." climbs_out_of_mud=@party say %{1} is out of mudpit!

;; Detect auras
;/def -F -p9 -t"You detect *" detected_auras=\
;   @party say %{assist_target} has %{-2}
