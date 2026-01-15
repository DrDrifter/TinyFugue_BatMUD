; Don't use those buggy incomplete triggers..
; rm -rf the rest and ftp the best!!!!!!!!!!!
; But seriously these triggers are for the professional mudder not a noobie
; who doesnt know his fabs from his nads..
; Use at your own risk! 
; No fault, loss or damage can be blamed on the coder (well thats me covered:)
; Any problems contact me at player.spid@bat.org
; Check out my web page (finger me on batmud for address (if I'm online))

/require textutil.tf

; Path of where prot average times are stored.
/set protavgfile=~/protavg.times

; Your characters name.
/set You=Drifter

; Converts seconds into minutes and seconds.
/def -i formattime = \
  /set tmptime=%1%; \
  /set tmpmin=$[tmptime/60]%; \
  /set tmpsek=$[tmptime-(tmpmin*60)]%; \
  /if ({tmpsek}<10) /set tmpsek=0%{tmpsek}%; /endif%; \
  /_echo %{tmpmin}:%{tmpsek}
 
; Finds a prot in the list and returns its info else returns 0.
/def -i findprot = \
  /let search=%1%; \
  /while (shift(), {#}) \
    /let sname=$[substr({1}, 0, strstr({1},"_"))]%; \
    /if (search=~sname) /let result=%1%; /break /endif%; \
  /done%; \
  /_echo %{result-0}

; Replace a prot in a list to the passed in new value if it is found.
/def -i replaceprot = \
  /let newline=%1%; \
  /let search=$[substr({1}, 0, strstr({1},"_"))]%; \
  /while (shift(), {#}) \
    /let sname=$[substr({1}, 0, strstr({1},"_"))]%; \
    /let result=$[ (search=~sname) ? strcat(result, " ", newline) : strcat(result, " ", {1}) ]%; \
  /done%; \
  /_echo %result

; Adds a new prot to the list.
/def -i addprot = \
  /_echo $[{-1}=~"" ? {1} : strcat({-1}, " ", {1})]

; Removes a prot if it is found.
/def -i removeprot = \
  /let search=%1%;\
  /while (shift(), {#})\
    /let sname=$[substr({1}, 0, strstr({1},"_"))]%;\
    /if (search!~sname)\
      /let result=%result %1%;\
    /else\
      /shift%;\
      /let result=%result %*%;\
      /break%;\
    /endif%;\
  /done%;\
  /_echo %result

; Calculates the average of a list of seconds.
/def -i avg=\
  /let num=$[{#}-1]%;\
  /while (shift(), {#})\
    /let total=$[total+{1}]%;\
  /done%;\
  /if (total)\
    /let avgtotal=$[{total} / {num}]%;\
    /let avgtotal=$[avgtotal+mod(total, num)]%;\
  /else\
    /let avgtotal=0%;\
  /endif%;\
  /_echo %avgtotal

; Reads in a list of prot average times for a given player and prot and calls avg then returns result.
/def -i load_avg =\
  /let protline=$(/readfile %protavgfile%| /fgrep %1 %2)%;\
  /let protline=$(/rest %protline)%;\
  /let result=$(/avg %protline)%;\
  /_echo %result

; Saves a new time to the prot average times file.
/def -i save_avg =\
  /if ({#}==3)\
    /let protline=$(/readfile %protavgfile%| /fgrep %1 %2)%;\
    /if (protline=~"")\
      /let protline=$[strcat({1}, " ", {2}, " ", {3})]%;\
    /else\
      /let protline=$[strcat(protline, " ", {3})]%;\
    /endif%;\
    /readfile %protavgfile%| /fgrep -v %{1} %{2} %| /writefile %protavgfile%;\
    /echo %protline%|/writefile -a %protavgfile%;\
  /endif

/def -i set_avg =\
  /if ({#}==3)\
    /readfile %protavgfile%| /fgrep -v %{1} %{2} %| /writefile %protavgfile%;\
    /echo %1 %2 %3%|/writefile -a %protavgfile%;\
  /endif

/def createprot =\
  /if (!getopts("w:p:n:u:d:t:sc", "0")) /break%; /endif%;\
  /def -F -i -ag -t'%{opt_w}' %{opt_n}_aux_up =\
    /echo -p - %%* (@{Cyellow}%{opt_p}@{n})%%;\
    /set pcaster=$$[({1}!~"You") ? {1} : {You}]%%;\
    /set pspell=%opt_n%%;\
    /set pname=%opt_p%;\
  /if (!opt_c)\
    /def -F -i -aBCblue -t'%{opt_u}' %{opt_n}_up =\
      /let timenow=$$[time()]%%;\
      /let protline=$$(/findprot %opt_n %%prots)%%;\
      /if (protline=~"0")\
        /set prots=$$(/addprot %{opt_n}_%%{timenow}_1_0_%%{pcaster} %%prots)%%;\
        @party say ( %opt_p UP ) (Casted by %%pcaster)%%;\
        /if (%opt_t==3) /protwarn %%timenow %%pcaster %opt_n%%; /endif%%; \
      /else \
        /let protline=$$[replace("_", " ", {protline})]%%; \
        /let stacked=$$[ %opt_s ? $$(/nth 3 %%protline)+1 : 1 ]%%; \
        /if (stacked>1) \
          @party say ( %opt_p UP ) (%%stacked stacked) (Casted by %%pcaster)%%; \
        /else \
          @party say ( %opt_p UP ) (Casted by %%pcaster)%%; \
          /if (%opt_t>2) /protwarn %%timenow %%pcaster %opt_n%%; /endif%%; \
        /endif%%; \
        /set prots=$$(/replaceprot %{opt_n}_%%{timenow}_%%{stacked}_0_%%{pcaster} %%prots)%%; \
      /endif%; \
  /endif%; \
  /def -F  -i -aBCmagenta -t'%{opt_d}' %{opt_n}_down = \
    /let protline=$$(/findprot %opt_n %%prots)%%; \
    /if (protline=~"0") \
      @party say < %opt_p DOWN >%%; \
    /else \
      /let timenow=$$[time()]%%; \
      /let protline=$$[replace("_", " ", {protline})]%%; \
      /let time=$$(/nth 2 %%protline)%%; \
      /let stacked=$$(/nth 3 %%protline)%%; \
      /let type=$$(/nth 4 %%protline)%%; \
      /let protter=$$(/nth 5 %%protline)%%; \
      /let plap=$$[ (type==2) ? "< Sticky %opt_p DOWN >" : "< %opt_p DOWN >" ]%%; \
      /if (%opt_s & stacked>1) \
        /let stacked=$$[stacked-1]%%; \
        /let plap=$$[strcat(plap, " (", stacked, " stacked)")]%%; \
        /set prots=$$(/replaceprot %{opt_n}_%%{time}_%%{stacked}_%%{type}_%%{protter} %%prots)%%; \
      /else \
        /let time=$$[timenow-time]%%; \
        /let prottime=$$(/formattime %%time)%%; \
        /let plap=$$[strcat(plap, " [", prottime,"]") ]%%; \
        /let avg=$$(/load_avg %%protter %opt_n)%%; \
        /set prots=$$(/removeprot %opt_n %%prots)%%; \
        /let avgtime=$$(/formattime %%avg)%%; \
        /let plap=$$[ avg ? strcat(plap, " ", protter, "'s average is: (", avgtime, ")") : plap]%%; \
        /if (%opt_t==1 | %opt_t==3) \
          /if (time>avg) /set_avg %%protter %opt_n %%time%%; /endif%%;  \
        /elseif (%opt_t==2 | %opt_t==4) \
          /save_avg %%protter %opt_n %%time%%; \
        /endif%%; \
      /endif%%; \
      p' %%plap%%; \
    /endif

; Checks prot it still up and if so sends warning message of length of prot. 
/def -i protwarn_aux = \
  /let protline=$(/findprot %1 %prots)%; \
  /if (protline!~"0") \
    /let protline=$[replace("_", " ", {protline})]%; \
    /if ({2}==$(/nth 2 %protline)) \
      /let time=$[time()-{2}]%; \
      /let time=$(/formattime %time)%; \
      /let avg=$(/formattime %4)%; \
      p' [ %1 been up (%time), %{3}'s avg (%avg) ]%; \
    /endif%; \
  /endif

/def  protwarn = \
  /let avg=$(/load_avg %2 %3)%; \
  /if (avg) \
    /let warntime=$[avg - 20]%; \
    /if (warntime<30) /let warntime=$[avg - avg / 6]%; /endif%; \
    /repeat -%warntime 1 /protwarn_aux %pspell %1 %pcaster %avg%; \
  /endif

/def -F -i -t'You sense a powerful protective aura around you.' conjprot_up = \
  /let timenow=$[time()]%; \
  /set prots=$(/removeprot %pspell %prots)%; \
  /set prots=$(/addprot %{pspell}_%{timenow}_1_1_%{pcaster} %prots)%; \
  /protwarn %timenow %pcaster %pspell%; \
  @party say ( %pname UP ) (Casted by %pcaster)

/def -F -i -t'You sense an extra powerful protective aura around you.' stickyconjprot_up = \
  /let timenow=$[time()]%; \
  /set pname=Sticky %pname%; \
  /set prots=$(/removeprot %pspell %prots)%; \
  /set prots=$(/addprot %{pspell}_%{timenow}_1_2_%{pcaster} %prots)%; \
  /protwarn %timenow %pcaster %pspell%; \
  @party say ( %pname UP ) (Casted by %pcaster)

; Removez removes normal fabs etc, blur, displacement, force shield. (Iw? No triggered anyway)
/def -i -t'You feel much more vulnerable.' removez =\
  /if (removez_timer==0) \
    /set removez_timer=1%; \
    /repeat -0:00:15 1 /set removez_timer=0%; \
    @party say < Removezzzzzarmour - All conjurer prots DOWN >%; \
  /endif%; \
  /let loops=$(/length %prots)%; \
  /let count=1%; \
  /while (count<=loops) \
    /let protline=$(/nth %count %prots)%; \
    /let protline=$[replace("_", " ", {protline})]%; \
    /let isconj=$(/nth 4 %protline)%; \
    /if (isconj==1) \
      /let sname=$(/first %protline)%; \
      /set prots=$(/removeprot %sname %prots)%; \
    /else \
      /let count=$[count+1]%; \
    /endif%; \
  /done

/def -i -t'You die.' im_dead = \
  /set prots=$(/removeprot Flex %prots)%; \
  /set prots=$(/removeprot Invs %prots)

/def -i check = \
  /let timenow=$[time()]%; \
  /let loops=$(/length %prots)%; \
  /let count=1%; \
  /while (count<=loops) \
    /let protline=$(/nth %count %prots)%; \
    /let protline=$[replace("_", " ", {protline})]%; \
    /let sname=$(/first %protline)%; \
    /let prottime=$(/nth 2 %protline)%; \
    /let prottime=$(/formattime $[timenow-prottime])%; \
    /let stacked=$(/nth 3 %protline)%; \
    /let type=$(/nth 4 %protline)%; \
    /let protter=$(/last %protline)%; \
    /if (type<2) \
      /let result=$[ (stacked>1) ? strcat(result, " ", sname,":(", stacked, "|", prottime, ")") : strcat(result, " ", sname,":(", prottime, ")")]%; \
    /else \
      /let result=$[strcat(result, " ", sname,":{" , prottime, "}")]%; \
    /endif%; \
    /let count=$[count+1]%; \
  /done%; \
  /if ({1}=~"") \
    /echo -aCyellow %{result-No prots on me}%; \
  /elseif ({1}=~"p") \
    @party say %{result-No prots on me}%; \
  /else \
    tell %1 %{result-No prots on me}%; \
  /endif

/def -F -t'* bops you on the nose.' = /check %1

; Here add the prots. Note you need universal messages for the chant def, so it works for 
; you/his/her/its etc.. For conj prots such as fabs the -u"" message doesnt matter as its 
; hardcoded as there is one message for all of them (so leave it blank)..
; -c means its a conjprot so has "You sense*" for the up message. (so make -u"")
; -s means its stackable such has earth skin and infravision.
; -t sets the averaging function, 0 = none, 1 = use only best time, 2 normal, 3 best with warning, 4 normal with warning 
; warning = when -20s left or  1/8th of time left of average.
; note all -c prots have -t4 option enabled.



; Suplementary prots under testing, depends highly on your terminal settings etc
/createprot -t2 -n"PfE" -w"{*} * to the heighs while holding {*} {*} close and {utter|utters} \'sanctus Exzordus\'" -u"you are surrounded by protective holy aura." -d"You suddenly feel more vulnerable to evil." -p"Protection from Evil"
/createprot -t2 -n"Ss" -w"{*} * \'sanctus  angeliq\'" -u"You spiritually reach out for your soul, protecting it with holy force." -d"Your soul feels suddenly more vulnerable." -p"Soul shield"

/createprot -t2 -n"Bot" -w"{*} {utter|utters} the magic words \'nilaehz arzocupne\'" -u"You feel strong - like you could carry whole flat world at your back!" -d"You feel weaker." -p"Blessing of Tarmalen"
/createprot -t2 -n"Unp" -w"{*} {utter|utters} the magic words \'harnaxan temnahecne\'" -u"You feel your will getting stronger." -d"You feel your will returning normal." -p"Unpain"
/createprot -t4 -n"Hw" -w"{*} rapidly {swallows|swallow} a dozen iron nails and {mumble|mumbles} \'tonnikalaa\'" -u"You suddenly feel magically heavier." -d"You feel lighter, but it doesn\'t seem to affect your weight!" -p"Heavy Weight"
/createprot -t2 -s -n"Eski" -w"{*} {trace|traces} fiery blue runes on the ground with {ypur|his|her|its} Staff of Druids \'% ! (\'" -u"You feel your skin harden." -d"Your skin feels softer." -p"Earth Skin"
/createprot -t2 -n"Epow" -w"{*} {trace|traces} fiery blue runes on the ground with {your|his|her|its} Staff of Druids \'% !^\'" -u"You feel your strength changing. You flex you muscles experimentally." -d"The runic sigla \'% !^\' fade away.. leaving you feeling strange." -p"Earth Power"
/createprot -t2 -n"Vman" -w"VmanCHANT" -u"Vines entangle your body." -d"The vines around your body shrink." -p"Vine Mantle"
/createprot -t4 -w"{*} {utter|utters} the magic words \'Pahuus on pehmoille\'" -n"Pfe" -u"A white holy aura surrounds you." -d"You no longer have a white aura around you." -p"Protection from Evil"
/createprot -t4 -n"Pfg" -w"PfgCHANT" -u"A vile black aura surrounds you." -d"You no longer have a vile black aura around you." -p"Protection from Good"
/createprot -t3 -n"Flex" -w"{*} {trace|traces} fiery blue runes in the air \'^ !)\'" -u"You sense a flex shield covering your body like a second skin." -d"Your flex shield wobbles, PINGs and vanishes." -p"Flex Shield"
/createprot -t4 -n"Fshd" -w"{*} {are|is} surrounded by blue waves as you hear the words \'thoiiiiiisss" -u"{*} forms a shield of force around you." -d"Your armour feels thinner." -p"Force Shield"
/createprot -t2 -s -n"Sinv" -w"{*} {rub|rubs} {your|his|her|its} eyes with sand and {whisper|whispers} \'\$\%&@ #\*\%@\*@#\ \$&\*@#\'" -u"You feel you can see more than ever." -d"Your vision is less sensitive now." -p"See Invisible"
/createprot -t2 -n"Invs" -w"{*} {utter|utters} the magic words \'..... .... ... ..  .    .!\'" -u"You suddenly can\'t see yourself." -d"You turn visible." -p"Invisibility"
/createprot -t2 -s -n"Infr" -w"{*} {rub|rubs} {your|his|her|its} eyes with sand and {whisper|whispers} \'demoni on pomoni\'" -u"You have infravision." -d"Everything no longer seems so red." -p"Infravision"
/createprot -n"SoP" -w"* \'nsiiznau\'" -u"You feel a slight tingle." -d"You feel more vulnerable now." -p"Shield of Protection"
/createprot -c -n"Fab" -w"{*} {utter|utters} the magic words \'ztonez des deckers\'" -u"" -d"A skin brown flash momentarily surrounds you and then vanishes." -p"Force Absorption"
/createprot -c -n"Fire" -w"{*} {utter|utters} the magic words \'hot hot not zeis daimons\'" -u"" -d"A burning red flash momentarily surrounds you and then vanishes." -p"Heat Reduction"
/createprot -c -n"Cold" -w"{*} {utter|utters} the magic words \'skaki barictos yetz fiil\'" -u"" -d"A cold white flash momentarily surrounds you and then vanishes." -p"Frost Insulation"
/createprot -c -n"Pois" -w"{*} {utter|utters} the magic words \'morri nam pantoloosa\'" -u"" -d"A green flash momentarily surrounds you and then vanishes." -p"Toxic Dilution"
/createprot -c -n"Magi" -w"{*} {utter|utters} the magic words \'meke tul magic\'" -u"" -d"A golden flash momentarily surrounds you and then vanishes." -p"Magic Dispersion"
/createprot -c -n"Acid" -w"{*} {utter|utters} the magic words \'sulphiraidzik hydrochloodriz gidz zuf\'" -u"" -d"A disgusting yellow flash momentarily surrounds you and then vanishes." -p"Corrosion Shield"
/createprot -c -n"Elec" -w"{*} {utter|utters} the magic words \'kablaaaammmmm bliitz zundfer\'" -u"" -d"A crackling blue flash momentarily surrounds you and then vanishes." -p"Energy Channeling"
/createprot -c -n"Asph" -w"{*} {utter|utters} the magic words \'qor monoliftus\'" -u"" -d"A dull black flash momentarily surrounds you and then vanishes." -p"Ether Boundary"
/createprot -c -n"Psi" -w"{*} {utter|utters} the magic words \'toughen da mind reeez un biis\'" -u"" -d"A transparent flash momentarily surrounds you and then vanishes." -p"Psychic Sanctuary"
/createprot -t0 -n"Ustn" -w"{*} {utter|utters} the magic words \'Paxus\'" -u"* chanting appears to do absolutely nothing." -d"It doesn\'t hurt *" -p"Unstun"
/createprot -t4 -n"SoF" -w"{*} {utter|utters} the magic words \'Grant your worshipper your protection\'" -u"You are surrounded by divine glow!" -d"Your glow disappears*" -p"Shield of Faith"

/def -aB -F -t'You perform the ceremony.' cere_up = \
 /let timenow=$[time()]%; \
 /let protline=$(/findprot Cere %prots)%; \
 /if (protline=~"0") \
   /set prots=$(/addprot Cere_%{timenow}_1_0_%You %prots)%; \
 /endif

/def -aB -F -t'You have an unusual feeling as you cast the spell.' cere_down = \
  /set prots=$(/removeprot Cere %prots)

/def -F -aB -t'You are done with the chant.' donespell = \
  /let protline=$(/findprot Invs %prots)%; \
  /if (protline!~"0") \
    /set prots=$(/removeprot Invs %prots)%; \
  /endif

/def -F -aB -t'You are prepared to do the skill.' doneskill = \
  /let protline=$(/findprot Invs %prots)%; \
  /if (protline!~"0") \
    /set prots=$(/removeprot Invs %prots)%; \
  /endif

;; Other messages
;;/def -p1 -aBCred -t'You cannot leave, you have been AMBUSHED.' ambushed = p' ( Ambushed! )
/def -p1 -t'You feel your anger and hate of the world recede.' auraoff = @party say < Aura of Hate DOWN >
/def -p1 -aCgreen -t'You shiver and suffer from POISON!!' poison = @party say ( Poisoned )
/def -p1 -t'You feel no longer *' iwoff = @party say < Iron Will DOWN >
/def -p1 -mregexp -t'^You feel that (.*) doesn\'t enjoy your presence\\.$' banish= @party say ( Banished by %P1 )
;; /def -p1 -mregexp -t' disappears into thick air\\.' otherbanish=p' < %PL banished >
/def -p1 -t'* disappears into thick air.' otherbanish = @party say < %-L4 banished >
