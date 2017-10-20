;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                     ;
; Modified & currently maintained by Drifter (during 2001-2011)       ;
;                                                                     ;
; Haven't got a decent changelog since I've lost my trigs twice, and  ;
; afterwards I can't remember all the stuffs that I made later on.    ;
; In any case, I added the new conjuprots and some functions for      ;
; those, they "might" still bug a bit when they have a sticky status  ;
; and you're dmp'd. Also people have asked me if it were possible to  ;
; write the active prots to a temp file just in case your connection  ;
; crashes etc, but I've disagreed with this, since some users might   ;
; have a tf shell that doesn't allow file I/O.                        ;
;                                                                     ;
; What it supports:                                                   ;
; - All prots that are castable to another player and have some       ;
;   up and downmessage                                                ;
; - Sticky conjuprots                                                 ;
;                                                                     ;
; What it doesn't support:                                            ;
; - Guild-specific prots (eg. barb prots are in bat-barb.tf)          ;
; - Prots gained through items/potions (theyse might work if the      ;
;   up/downmessage is the same as with the "original" spell.          ;
; - At the moment, stackable prots are disabled                       ;
;                                                                     ;
; I'll try to keep a changelog here of the version changes            ;
;                                                                     ;
; Last modified 20.10.2017                                            ;
;                                                                     ;
;  Current version 1.3.34                                             ;
;  - Added Suppress prot (RVS)                                        ;
;                                                                     ;
; Changes to 1.3.33                                                   ;
; - Added Searing Fervor (Fire mage special)                          ;
;   NB: Commented out! Too much spam                                  ;
;                                                                     ;
; Changes to 1.3.32                                                   ;
; - Added Air Shield (Asph mage special)                              ;
; - Added Camp/sleep prot message queue (not yet implemented)         ;
; - Added Resist disintegrate (as now it has downmessage)             ;
;                                                                     ;
; Changes to 1.3.31                                                   ;
; - Added missing chant words to Soul Shield                          ;
;                                                                     ;
; Changes to 1.3.30                                                   ;
; - Fixed Regeneration spell typo                                     ;
;                                                                     ;
; Changes to 1.3.29                                                   ;
; - Fixed Iron Will from showing as Racial protection                 ;
; - Fixed Protection by Sacrifice timer                               ;
; - Fixed Vine Mantle downmessage                                     ;
;                                                                     ;
; Changes to 1.3.28                                                   ;
; - Added Ghost Vision                                                ;
;                                                                     ;
; Changes to 1.3.27                                                   ;
; - Added Enhanced Awareness                                          ;
; - Fixed typo in Beacon of Enlightenment                             ;
;                                                                     ;
; Changes to 1.3.26                                                   ;
; - Added/fixed resist dispel                                         ;
; - Added minor prot                                                  ;
; - Added Beacon of Enlightenment                                     ;
; - Some bugfixes since I hadn't played in a while                    ;
;                                                                     ;
; Changes to 1.3.25                                                   ;
; - Fixed heavenly prot again. It works now, just misses more chants  ;
; - Altered SS and PfE regexps, they work a lot faster now            ;
;                                                                     ;
; Changes to 1.3.24                                                   ;
; - Fixed heavenly prot (didn't work with some longname relics)       ;
; - Added one SS chant                                                ;
;                                                                     ;
; Changes to 1.3.23                                                   ;
; - Added Aoh up message and timer                                    ;
;                                                                     ;
; Changes to 1.3.22                                                   ;
; - Added 2 new SS chants                                             ;
; - Fixed heavenly prot                                               ;
;                                                                     ;
; Changes to 1.3.21                                                   ;
; - Added new IW up/down message                                      ;
;                                                                     ;
; Changes to 1.3.20                                                   ;
; - Tweaked conjuprot names                                           ;
; - Added SS chant                                                    ;
;                                                                     ;
; Changes to 1.3.19                                                   ;
; - Added Mana shield                                                 ;
; - Added Blurred image & Displacement messages                       ;
;                                                                     ;
; Changes to 1.3.18                                                   ;
; - Added PfE chants                                                  ;
; - Added SS chant                                                    ;
;                                                                     ;
; Changes to 1.3.17                                                   ;
; - Added a few PfE messages                                          ;
;                                                                     ;
; Changes to 1.3.16                                                   ;
; - Added yet more Soul shield  & PfE messages, if it seems to bug    ;
;   check yout cutter setting                                         ;
;                                                                     ;
; Changes to 1.3.15                                                   ;
; - Added a few pfe and ss chants                                     ;
; - Tweaked bug in pbS (its not that important anyways imo)           ;
;                                                                     ;
; Changes to 1.3.14                                                   ;
; - Fixed Fshd caster bug                                             ;
; - Fixed poisoned messages                                           ;
; - Fixed Spider walk caster                                          ;
; - Made arches favour to work                                        ;
; - Fixed some bugs with glob/regexp matching                         ;
; - Added protter clearing after prot is on                           ;
;                                                                     ;
; Changes to 1.3.13                                                   ;
; - Added a few pfe and ss chants (some nun check theyse plzplzplz?)  ;
;                                                                     ;
; Changes to 1.3.12                                                   ;
; - Backtracked a bit with several bugs, mainly in /createprot        ;
; - Minor fix to some prot chant colours                              ;
;                                                                     ;
; Changes to 1.3.11                                                   ;
; - Added forget                                                      ;
; - Tweaked forget a bit                                              ;
; - Fixed some boring bugs                                            ;
;                                                                     ;
; Changes to 1.3.10                                                   ;
; - Made a "hotfix" to stacking spells because of bugs                ;
;   in tf 5.0 (?). If someone wants to debug older version...         ;
; - Changed Spider Touch to drop on death (not 100% sure about this)  ;
; - Added def for reporting (party report/party say) for HCbat        ;
;                                                                     ;
; Changes to 1.3.9                                                    ;
; - Changed behaviour of ceremony trig                                ;
; - Tweaked some minor bugs (whitespaces etc)                         ;
; - Changed "prot" alias to "protx" because of clash with sop         ;
; - Added two PfE chants                                              ;
; - Modified the tweak triggers                                       ;
;                                                                     ;
; Changes to 1.3.8                                                    ;
; - Modified prot_up and prot_aux_up, conjuprots etc will now hilite  ;
;   in blue as well as others, and hopefully normal prots dont bug    ;
;                                                                     ;
; Changes to 1.3.7                                                    ;
; - Added lotsa PfE and SS chants, many thanks to Ealoren!            ;
; - Modified conjuprots to time to average not to best time           ;
; - Modified flex to time to average not to best (winter lead bonus)  ;
; - Changed prot_aux_up macro to higher priority and removed -F       ;
;                                                                     ;
; Changes to 1.3.6                                                    ;
; - Tweaked quickcommands a bit                                       ;
;                                                                     ;
; Changes to 1.3.5                                                    ;
; - Changed some protmessages                                         ;
; - Fixed conjuprot timers                                            ;
; - Added quick commands "prot" and "prp"                             ;
;                                                                     ;
; Changes to 1.3.4                                                    ;
; - Fixed averaging function                                          ;
;                                                                     ;
; Changes to 1.3.3                                                    ;
; - New PfE messages added                                            ;
; - Tweaked prot timers a bit, not sure if they work now              ;
; - New Soul Shield messages added                                    ;
;                                                                     ;
; Changes to 1.3.2                                                    ;
; - New PfE messages added                                            ;
;                                                                     ;
; Changes to 1.3.1                                                    ;
; - Tweaked the timer function a bit since new tf prints              ;
;   a weird string when timenow() is called.                          ;
; - Few new PfE messages, thx to Krokodiili                           ;
;                                                                     ;
; Changes to 1.3                                                      ;
; - Tweaked and reprogrammed part of the generic prot code,           ;
; it enables regular expressions now (!) since nunprots for           ;
; example aren't static. This means:                                  ;
;  * Nunprots fixed                                                   ;
;  * Life link fixed                                                  ;
;  * Displacement and blur joined into one, and fixed                 ;
;                                                                     ;
; Changes to 1.2.1                                                    ;
; - fixed bard melodical embracement                                  ;
;                                                                     ;
; Changes new to 1.2                                                  ;
; - Added tf 5.0 compatibility                                        ;
; - Fixed various bugs with new tf version                            ;
; - Added some guild compat (barb) code to guild specific files       ;
; - Fixed Problem of eskins stacking after RIP (afaik they dissapear) ;
;                                                                     ;
; Changes since 1.12 and 1.11                                         ;
; - Fixed Earth blood                                                 ;
; - tweaking blur/displacement...problem is they both have same       ;
;   downmessage so it'll take some additional coding                  ;
; - Added spider touch up and downmessages                            ;
; - Fixed downtrig in psionic phalanx                                 ;
; - Added words to heavenly prot                                      ;
; - Sorted prots by guild                                             ;
;                                                                     ;
; Changes since 1.1:                                                  ;
;                                                                     ;
; - Changed unstun to not be stackable anymore                        ;
; - Noticed a bug on PfE, hopefully fixed now                         ;
; - Noticed something bugging a bit with disp/blur, checking it)      ;
; - Added rmprots command to remove all prots (if you go ld etc)      ;
;                                                                     ;
; Changes since 1.0:                                                  ;
;                                                                     ;
; - Fixed Earth skin                                                  ;
; - Fixed Tweak bug                                                   ;
; - Fixed Vine mantle stacking bug                                    ;
; - Added vine mantle chant                                           ;
; - (Hopefully finallly) fixed PFE trig                               ;
; - Added PfG chant (it actually works now, thx Susette)              ;
;                                                                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/require textutil.tf
; Path of where prot average times are stored,
; note that if you can't write or don't want to write avg time,
; just use /dev/null on this
/set protavgfile=/home/pi/tf-lib/protavg.times
; Your characters name.
/set You=Me
;Change to "say" if you prefer to report as party say (for hc)
/set output=report
;When we dont know who casts rather print "unknown" than some weirdo
/set pcaster=Unknown
/set matching=glob
/set camping_status=awake

;; Converts seconds into minutes and seconds, very useful
/def -i formattime=\
 /set tmptime=%1%;\
 /set tmpmin=$[trunc(tmptime/60)]%;\
 /set tmpsek=$[trunc(tmptime-(tmpmin*60))]%;\
 /if ({tmpsek}<10) /set tmpsek=0%{tmpsek}%;/endif%;\
 /_echo %{tmpmin}:%{tmpsek}

;; Finds a prot in the list and returns its info else returns 0.
 /def -i findprot=\
  /let search=%1%;\
  /while (shift(), {#})\
  /let sname=$[substr({1}, 0, strstr({1},"_"))]%;\
  /if (search=~sname) /let result=%1%;/break%;/endif%;\
  /done%;\
  /_echo %{result-0}

;; Replace a prot in a list to the passed in new value if it is found.
/def -i replaceprot = \
 /let newline=%1%; \
 /let search=$[substr({1}, 0, strstr({1},"_"))]%; \
 /while (shift(), {#}) \
  /let sname=$[substr({1}, 0, strstr({1},"_"))]%; \
  /let result=$[ (search=~sname) ? strcat(result, " ", newline) : strcat(result, " ", {1}) ]%; \
  /done%; \
  /_echo %result

;; Adds a new prot to the list.
/def -i addprot = \
 /_echo $[{-1}=~"" ? {1} : strcat({-1}, " ", {1})] 

;; Removes a prot if it is found.
/def -i removeprot = \
 /let search=%1%;\ /while (shift(), {#}) \
 /let sname=$[substr({1}, 0, strstr({1},"_"))]%; \
 /if (search!~sname) \ /let result=%result %1%; \
 /else \
  /shift%; \
  /let result=%result %*%;\
  /break%;\
 /endif%;\
 /done%;\
 /_echo %result

; Calculates the average of a list of seconds. 
/def -i avg= \
 /let num=$[{#}-1]%; \
 /while (shift(), {#}) \
  /let ptotal=$[ptotal+{1}]%; \
 /done%; \
 /if (ptotal) \
  /let avgtotal=$[{ptotal} / {num}]%; \
  /let avgtotal=$[avgtotal+mod(ptotal, num)]%; \
 /else \
  /let avgtotal=0%; \
 /endif%; \
 /_echo %avgtotal

; Reads in a list of prot average times for a given player and prot and calls avg then returns result.
/def -i load_avg = \
 /let protline=$(/readfile %protavgfile%| /fgrep %1 %2)%; \
 /let protline=$(/rest %protline)%; \
 /let result=$(/avg %protline)%; \
 /_echo %result

; Saves a new time to the prot average times file.
/def -i save_avg = \
 /if ({#}==3) \
  /let choptime=$[trunc({3})]%;\
  /let protline=$(/readfile %protavgfile%| /fgrep %1 %2)%; \
  /if (protline=~"") \
   /let protline=$[strcat({1}, " ", {2}, " ", {choptime})]%; \
  /else \
   /let protline=$[strcat(protline, " ", {choptime})]%; \
  /endif%; \
  /readfile %protavgfile%| /fgrep -v %{1} %{2} %| /writefile %protavgfile%; \
  /echo %protline%|/writefile -a %protavgfile%; \
 /endif

/def -i set_avg=\
 /if ({#}==3)\
  /let choptime=$[trunc({3})]%;\
  /readfile %protavgfile%| /fgrep -v %{1} %{2} %| /writefile %protavgfile%; \
  /echo %1 %2 %choptime%|/writefile -a %protavgfile%; \
 /endif

;; Separate function for messages when camping
;; This is to check if you are camping/meditating and messages will not go to p channel
/def -i msgprot = \
 /let msg=%1%;\
 /if (camp_status=~"sleeping") \
  /push %msg campmessages%;\
 /else \
  @party %output $msg%;\
 /endif

; Set camping status for messages
/def -F -i -t"You lie down and begin to rest for a while." camp_status_sleeping=/set camp_status=sleeping
/def -F -i -t"You lie down for a short rest, soothed by the lullaby sung by *." camp_status_sleeping=/set camp_status=sleeping
/def -F -i -t"You awaken from your short rest, and feel slightly better." camp_status_ready=/set camp_status=awake

; Prot & spell words wrapper
;
; Note: If protter messes up your spellquote too badly, change the priority value
; here or add -F, since the macro is non-fall thru.

/def createprot=\
; /if (!getopts("w:p:n:u:d:t:sc", "0")) /break%;/endif%;\   /* Old style, non regexp line. */
 /if (!getopts("w:r:p:n:u:d:t:sc", "0")) /break%;/endif%;\
  /if (!opt_r) /set matching=glob%;/else /set matching=regexp%;/endif%;\
  /def -i -p80 -ag -t'%{opt_w}' %{opt_n}_aux_up=\
  /echo -p - %%* (@{Cyellow}%{opt_p}@{n})%%;\
  /set pcaster=$$[({1}!~"You") ? {1} : {You}]%%;\
  /set pspell=%opt_n%%;\
  /set pname=%opt_p%;\
  /if (!opt_c) \
   /def -i -p99 -aBCblue -t'%{opt_u}' %{opt_n}_up=\
   /let timenow=$$[time()]%%; \
   /let protline=$$(/findprot %opt_n %%prots)%%;\
   /if (protline=~"0")\
    /set prots=$$(/addprot %{opt_n}_%%{timenow}_1_0_%%{pcaster} %%prots)%%;\
    @party %output (%opt_p up) (cast by %%pcaster)%%;\
    /if (%opt_t==3) /protwarn %%timenow %%pcaster %opt_n%%; /endif%%;\
    /else \
     /let protline=$$[replace("_"," ",{protline})]%%; \
     /let stacked=$$[ %opt_s ? $$(/nth 3 %%protline)+1 : 1 ]%%; \
     /if (stacked>1) \
      @party %output (%opt_p up) (%%stacked stacked) (cast by %%pcaster)%%; \
     /else \
      @party %output (%opt_p up) (cast by %%pcaster)%%; \
     /if (%opt_t>2) /protwarn %%timenow %%pcaster %opt_n%%; /endif%%; \
     /endif%%; \
     /set prots=$$(/replaceprot %{opt_n}_%%{timenow}_%%{stacked}_0_%%{pcaster} %%prots)%%; \
    /endif%; \
   /endif%; \
   /def -F -aBCmagenta -t'%{opt_d}' %{opt_n}_down = \
   /let protline=$$(/findprot %opt_n %%prots)%%; \
   /if (protline=~"0") \
    @party %output (%opt_p down)%%; \
   /else \
    /let timenow=$$[time()]%%; \
    /let protline=$$[replace("_", " ", {protline})]%%; \
    /let time=$$(/nth 2 %%protline)%%; \
    /let stacked=$$(/nth 3 %%protline)%%; \
    /let type=$$(/nth 4 %%protline)%%; \
    /let protter=$$(/nth 5 %%protline)%%; \
    /let plap=$$[ (type==2) ? "(Sticky %opt_p down)" : "(%opt_p down)" ]%%; \
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
     /let plap=$$[ avg ? strcat(plap, " ", protter, " avg time: (", avgtime, ")") : plap]%%; \
     /if (%opt_t==1 | %opt_t==3) \
      /if (time>avg) /set_avg %%protter %opt_n %%time%%; /endif%%; \
     /elseif (%opt_t==2 | %opt_t==4) \
      /save_avg %%protter %opt_n %%time%%; \
     /endif%%; \
   /endif%%; \
   @party %output %%plap%%; \
;   /set pcaster=Unknown%%; \ # Commented out just for test
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
   @party %output ( %1 dropping soon, now (%time), %{3} avg (%avg) )%; \
   /endif%; \
  /endif

/def protwarn = \
 /let avg=$(/load_avg %2 %3)%;\
 /if (avg) \
  /let warntime=$[avg - 20]%;\
  /if (warntime<30) /let warntime=$[avg - avg / 6]%; /endif%;\
  /repeat -%warntime 1 /protwarn_aux %pspell %1 %pcaster %avg%;\
 /endif

; Upmessages for conjuprots
/def -F -i -aBCblue -t'You sense a powerful protective aura around you.' conjprot_up = \
 /let timenow=$[time()]%;\
 /set prots=$(/removeprot %pspell %prots)%;\
 /set prots=$(/addprot %{pspell}_%{timenow}_1_1_%{pcaster} %prots)%;\
 /protwarn %timenow %pcaster %pspell%;\
 @party %output %pname active (Caster %pcaster)%;\
 /set pcaster=Unknown

/def -F -i -aBCblue -t'You see a * shield fade into existance around you.' conj2prot_up = \
 /let timenow=$[time()]%;\
 /set prots=$(/removeprot %pspell %prots)%;\
 /set prots=$(/addprot %{pspell}_%{timenow}_1_1_%{pcaster} %prots)%;\
 /protwarn %timenow %pcaster %pspell%;\
 @party %output %pname active (Caster %pcaster)%;\
 /set pcaster=Unknown

/def -F -i -aBCblue -t'You sense an extra powerful protective aura around you.' stickyconjprot_up = \
 /let timenow=$[time()]%;\
 /set pname=Sticky %pname%;\
 /set prots=$(/removeprot %pspell %prots)%;\
 /set prots=$(/addprot %{pspell}_%{timenow}_1_2_%{pcaster} %prots)%;\
 /protwarn %timenow %pcaster %pspell%;\
 @party %output %pname active (Caster %pcaster)%;\
 /set pcaster=Unknown


/def -F -i -aBCblue -t'You see an extra * shield fade into existance around you.' stickyconj2prot_up = \
 /let timenow=$[time()]%;\
 /set pname=Sticky %pname%;\
 /set prots=$(/removeprot %pspell %prots)%;\
 /set prots=$(/addprot %{pspell}_%{timenow}_1_2_%{pcaster} %prots)%;\
 /protwarn %timenow %pcaster %pspell%;\
 @party %output %pname active (Caster %pcaster)%;\
 /set pcaster=Unknown

/def -F -i -aBCblue -t'You feel a powerful aura.' disp_blur_up = \
 /let timenow=$[time()]%;\
 /set prots=$(/removeprot %pspell %prots)%;\
 /set prots=$(/addprot %{pspell}_%{timenow}_1_1_%{pcaster} %prots)%;\
 @party %output %pname active (Caster %pcaster)%;\
 /set pcaster=Unknown

; Removez removes normal fabs etc, blur, displacement, force shield.
/def -i -mregexp -t'(You feel much more vulnerable.|You feel unprotected.)' removez =\
 /if (removez_timer==0) \
  /set removez_timer=1%;\
  /repeat -0:00:15 1 /set removez_timer=0%;\
  @party %output (Removezzzzzarmour hit me - All conjprots down)%;\
 /endif%;\
 /let loops=$(/length %prots)%;\
 /let count=1%;\
 /while (count<=loops) \
  /let protline=$(/nth %count %prots)%;\
  /let protline=$[replace("_", " ", {protline})]%;\
  /let isconj=$(/nth 4 %protline)%;\
  /if (isconj==1) \
   /let sname=$(/first %protline)%;\
   /set prots=$(/removeprot %sname %prots)%;\
  /else \
   /let count=$[count+1]%;\
  /endif%; \
 /done

;; Death removes some prots
;; Not sure about Soul shield, someone check it out?
/def -i -t'You die.' im_dead = \
 /set prots=$(/removeprot Flex %prots)%;\
 /set prots=$(/removeprot Invs %prots)%;\
 /set prots=$(/removeprot Eskin %prots)%;\
 /set prots=$(/removeprot STouch %prots)%;\
 /set prots=$(/removeprot PfE %prots)

/def -i check = \
 /let timenow=$[time()]%;\
 /let loops=$(/length %prots)%;\
 /let count=1%;\
 /while (count<=loops) \
  /let protline=$(/nth %count %prots)%;\
  /let protline=$[replace("_", " ", {protline})]%;\
  /let sname=$(/first %protline)%;\
  /let prottime=$(/nth 2 %protline)%;\
  /let prottime=$(/formattime $[timenow-prottime])%;\
  /let stacked=$(/nth 3 %protline)%;\
  /let type=$(/nth 4 %protline)%;\
  /let protter=$(/last %protline)%;\
  /if (type<2)\
   /let result=$[ (stacked>1) ? strcat(result, " ", sname,":(", stacked, "|", prottime, ")") : strcat(result, " ", sname,":(", prottime, ")")]%;\
  /else \
   /let result=$[strcat(result, " ", sname,":{" , prottime, "}")]%;\
  /endif%;\
  /let count=$[count+1]%;\
 /done%; \
 /if ({1}=~"") \
  /echo -aCyellow %{result-No prots on me}%;\
 /elseif ({1}=~"p")\
  @party %output Prots: %{result-No prots on me}%;\
 /else \
  tell %1 %{result-No prots on me}%;\
 /endif

/def -F -t'{*} bops you on the nose.' report1 = /check %1
/def -F -t'* tweaks your nose mischievously.' report2 = /check p

; Here add the prots. Note you need universal messages for the chant, so it works for
; you/his/her/its etc. For conj prots the -u"" message doesn't matter as its
; hardcoded as there is one message for all of them (so leave it blank)..
; -c means its a conjprot so has "You sense*" for the up message. (so make -u""). Also it means it's stickyable.
; -s means its stackable such has earth skin and infravision. At the moment it bugs a bit.
; -t sets the averaging function, 0 = none, 1 = use only best time, 2 normal, 3 best with warning, 4 normal with warning
; warning = when -20s left or 1/8th of time left of average.
; note all -c prots have -t4 option automatically enabled.
; N.B: not working, putting manually -t3!

; Suplementary prots under testing, depends highly on your terminal settings etc

;;;;;;;;;
;; Nun ;;
;;;;;;;;;
/createprot -r1 -t0 -n"PfE" -w"^[A-z]+ (furiously (wave|waves) (your|her) [A-z ]* and (utters|utter)|(stare|stares) intensively at [A-z ]* and (state|states)|(hop|hops) with one leg while praising Las and (utter|utters)|(roll|rolls) (your|her) eyes while rubbing halo and (sing|sings) out|(cut|cuts) the air with [A-z ]*, loudly reciting|(mutter|mutters) the holy words|(rub|rubs) (your|her) [A-z ]* while humbly reciting|(roll|rolls) (her|your) eyes while rubbing halo and (sing|sings) out|(raise|raises) (your|her) [A-z ]* toward the heavens and (recite|recites)|(cherish|cherishes) (your|her) [A-z ]+ and determinedly (chant|chants)|(touch|touches) (your|her) [A-z ]* and quickly (recite|recites)|fuming with celestial force (utter|utters) the words|(praise|praises) the saints and (raise|raises) [A-z ]* while exclaiming|(kiss|kisses) [A-z ]* while chanting|frantically (swing|swings) [A-z ]* and (shriek|shrieks)|(spread|spreads) white glow with (your|her) [A-z ]+ and (exclaim|exclaims)|(squeeze|squeezes) tightly on (your|her) [A-z ]* and (utter|utters)|(mutter|mutters) the magic words|(swing|swings) (your|her) [A-z ]* and humbly (utter|utters)|(wave|waves) [A-z ]* while praising Las and (exclaim|exclaims)|(raise|raises) (your|her) [A-z ]* while muttering|(hold|holds) (your|her) [A-z ]* close and humbly (mutter|mutters)|(kneel|kneels) down squeezing [A-z ]* and (recite|recites)|(raise|raises) [A-z ]* high in the air and (mutter|mutters)|(hold|holds) [A-z ]* tightly and (exclaim|exclaims)|(rub|rubs) [A-z ]* and (utters|utter) with sinister voice|(are|is) surrounded by fuming white aura as (you|she) (mutter|mutters)|(gaze|gazes) to the heights while holding [A-z ]* close and (utter|uttering)) \'sanctus Exzordus\'" -u"([A-z ]* with sheer power as you are surrounded)" -d"^(You suddenly feel more vulnerable to evil.|Your glow fades away and you suddenly feel more vulnerable to evil.)" -p"Protection from Evil"

/createprot -r1 -t2 -n"Ss" -w"^[A-z]+ ((raise|raises) (your|her) [A-z ]* toward the heavens and (recite|recites)|(swing|swings) (your|her) [A-z ]* and humbly (utter|utters)|(cut|cuts) the air with [A-z ]*, loudly reciting|(stare|stares) intensively at [A-z ]* and (state|states)|(hop|hops) with one leg while praising Las and (utter|utters)|furiously (wave|waves) her [A-z ]* and (utter|utters)|(wave|waves) [A-z ]* while praising Las and (exclaim|exclaims)|(touch|touches) her pulsing halo and quickly (recite|recites)|(rub|rubs) [A-z ]* and (utter|utters) with sinister voice|(roll|rolls) (your|her) eyes while rubbing halo and (singing|sings) out|(kneel|kneels) down squeezing [A-z ]* and (recite|recites)|(mutter|mutters) the (holy|magic) words|(hold|holds) (your|her) [A-z ]* close and humbly (mutter|mutters)|(kiss|kisses) [A-z ]* while chanting|(praise|praises) the saints and (raise|raises) [A-z ]* while exclaiming|(squeeze|squeezes) tightly on her [A-z ]* and (utter|utters)|fuming with celestial force (utter|utters) the words|(spread|spreads) white glow with her [A-z ]* and (exclaim|exclaims)|frantically (swing|swings) [A-z ]* and (shriek|shrieks)|(are|is) surrounded by fuming white aura as (you|she) (mutter|mutters)|(gaze|gazes) to the heights while holding [A-z ]* and (utter|uttering)|(hold|holds) [A-z ]* tightly and (exclaim|exclaims)|(cherish|cherishes) (her|your) [A-z ]* and determinedly (chant|chants)|(raise|raises) (your|her) [A-z ]* while muttering) \'sanctus angeliq\'" -u"^([A-z]+ spiritually (reach|reaches) out for your soul, protecting it with holy force.|[A-z]+ (place|places) (your|her) hand over you and blesses your soul in the name of Las.)" -d"^(Your soul feels suddenly more vulnerable.)" -p"Soul shield"

/createprot -r1 -t2 -n"HP" -w"[A-z]+ .* \'sanctus . o O\'" -u"^[A-z]+\'s [A-z ]* (vibrates under magical pressure|flashes uncanny) as you are suddenly" -d"^(Holy particles slow down, rapidly fading away.)" -p"Heavenly prot"

;# Amd's Feather Cross flashes uncanny as you are suddenly surrounded by millions
;#of dazzling white particles dancing enchantedly around your body.

/createprot -t2 -n"MS" -w"{*} * \'nullum driiiks umbah mana\'" -u"You feel your magical power expanding." -d"Your life force seems weaker." -p"Mana Shield"

;;;;;;;;;;;;
;; Spider ;;
;;;;;;;;;;;;
/createprot -t2 -n"SWalk" -w"{*} {weave|weaves} * and {chant|chants} \'Khizanth Arachnidus Walkitus\'" -u"For some reason you want to run on the walls for a little while." -d"The walls don\'t look so inviting anymore." -p"Spider Walk"
/createprot -t2 -n"STouch" -w"{*} * \'Khizanth Arachnidus Diametricus\'" -u"Suddenly you don\'t feel too good. Your blood feels like it is on fire." -d"Your blood does not burn anymore." -p"Spider Touch"

;;;;;;;;;;;;;;
;; Tarmalen ;;
;;;;;;;;;;;;;;
/createprot -t2 -n"Bot" -w"{*} {utter|utters} the magic words \'nilaehz arzocupne\'" -u"You feel strong - like you could carry the whole flat world on your back!" -d"You feel weaker." -p"Blessing of Tarmalen"
/createprot -t0 -n"Unp" -w"{*} {utter|utters} the magic words \'harnaxan temnahecne\'" -u"You feel your will getting stronger." -d"You feel your will returning to normal." -p"Unpain"
/createprot -t0 -n"Us" -w"{*} {utter|utters} the magic words \'Paxus\'" -u"* chanting appears to do absolutely nothing." -d"It doesn\'t hurt *" -p"Unstun"
/createprot -r1 -t0 -n"LLink" -w"^([A-Za-z]+ (utter|utters) the magic words \'Corporem Connecticut Corporee\')" -u"(You feel somehow linked to [A-Za-z]+.|You create a link to [A-Za-z]+.)" -d"(You hear a loud snap like sound!|You remove your link.)" -p"Life link"

;;;;;;;;;;;
;; Druid ;;
;;;;;;;;;;;
; /createprot -t2 -s -n"Eskin" -w"{*} {trace|traces} fiery blue runes on the ground with {your|his|her|its} Staff of Druids \'% !(\'" -u"You feel your skin harden." -d"Your skin feels softer." -p"Earth Skin"
;/createprot -t2 -s -n"Vman" -w"{*} {trace|traces} fiery blue runes on a vine seed with {your|his|her|its} Staff of Druids \'\"\" !#\'" -u"Vines entangle your body." -d"The vines around your body shrink." -p"Vine Mantle" 
/createprot -t2 -n"Eskin" -w"{*} {trace|traces} fiery blue runes on the ground with {your|his|her|its} Staff of Druids \'% !(\'" -u"You feel your skin harden." -d"Your skin feels softer." -p"Earth Skin"
/createprot -t2 -n"Vman" -w"{*} {trace|traces} fiery blue runes on a vine seed with {your|his|her|its} Staff of Druids \'\"\" !#\'" -u"Vines entangle your body." -d"The vines crumble to dust." -p"Vine Mantle" 
/createprot -t2 -n"Epow" -w"{*} {trace|traces} fiery blue runes on the ground with {your|his|her|its} Staff of Druids \'% !^\'" -u"You feel your strength changing. You flex your muscles experimentally." -d"The runic sigla \'% !^\' fade away.. leaving you feeling strange." -p"Earth Power"
/createprot -t2 -n"EBld" -w"{*} {trace|traces} icy blue runes on the ground with {your|his|her|its} Staff of Druids \'!( \*)\'" -u"An icy chill runs through your veins." -d"The runic sigla \'!( *)\' fade away.. leaving you feeling strange." -p"Earth Blood"
/createprot -t0 -n"Flex" -w"{*} {trace|traces} fiery blue runes in the air \'^ !)\'" -u"You sense a flex shield covering your body like a second skin." -d"Your flex shield wobbles, PINGs and vanishes." -p"Flex Shield"
/createprot -t1 -n"Regen" -w"{*} {utter|utters} the magic words \'nilaehz temnahecne\'" -u"You feel your metabolism speed up." -d"You no longer have an active regeneration spell on you." -p"Regeneration"

;;;;;;;;;;;;
;; Priest ;;
;;;;;;;;;;;;
/createprot -t0 -n"Pfg" -w"{*} {utter|utters} the magic words \'Good is dumb\'" -u"A vile black aura surrounds you." -d"You no longer have a vile black aura around you." -p"Protection from Good"
/createprot -t0 -n"AoH" -w"{*} {scream|screams} in rage and {yell|yells} \'Feel your anger and strike with all your hatred. *" -u"You feel burning hatred and rage erupt within you!" -d"You feel your anger and hate of the world recede." -p"Aura of Hate"

;;;;;;;;;
;; Psi ;;
;;;;;;;;;
/createprot -t0 -n"Awar" -w"{*} utters the magic words \'Bewareeeee!\'" -u"You feel more aware of your surroundings." -d"You feel your enhanced awareness subside." -p"Awareness"
/createprot -t4 -n"Fshd" -w"{*} {are|is} surrounded by blue waves as you hear the words \'thoiiiiiisss huuuiahashn\'" -u"{*} forms a shield of force around you." -d"Your armour feels thinner." -p"Force Shield"
;/createprot -t0 -s -n"Mdev" -w"{*} {utter|utters} the magic words \'Annatheer graaweizta\'" -u"You feel your mind developing." -d"Your brain suddenly seems smaller." -p"Mind Development"
/createprot -t0 -n"Mdev" -w"{*} {utter|utters} the magic words \'Annatheer graaweizta\'" -u"You feel your mind developing." -d"Your brain suddenly seems smaller." -p"Mind Development"
/createprot -r1 -t0 -n"BoE" -w"^([A-z]+ (tilt|tilts) (your|his|her|its) head skywards and metaphorically (declare|declares) \'homines, dum docent, discunt\')" -u"^Everything seems clearer under the inspiration of ([A-z]+)\'s magic." -d"^(You feel lost as all beacons of enlightenment around you die out.)" -p"Beacon of Enlightenment"
;; Missing:
;;You tap the power of the blue star with the words 'thoiiiiiisss huuuiahashn'
;;You form a psionic shield of force around your body.

;;;;;;;;;;
;; Bard ;;
;;;;;;;;;;
/createprot -t2 -n"Warez" -w"{*} {sing:|sings:} \'War is TOTAL massacre, sport the war, war SUPPOORT!!!\'" -u"You feel full of battle rage! Victory is CERTAIN!" -d"The effect of war ensemble wears off." -p"War ensemble"
/createprot -t2 -n"Melo" -w"{*} {sing|sings} \'Once there were two knights and maidens *" -u"* wraps you into an embracing melody." -d"The embracing melody subsides, leaving you longing for more." -p"Embracing melody"
/createprot -t2 -n"Afav" -w"{*} {sing:|sings:} \'In the Shadows cast down by the moon, a certain Elven lord he strolls among *" -u"You feel optimistic about your near future!" -d"You no longer have Arches Favour on you. You feel sad." -p"Arches favour"
;; Missing:
;; You embrace yourself with your melody.

;;;;;;;;;;;
;; Conju ;;
;;;;;;;;;;;
/createprot -c -t0 -n"Blur" -w"{*} * \'ziiiuuuuns wiz\'" -u"" -d"You feel less invisible." -p"Blurred image"
/createprot -c -t0 -n"Displacement" -w"{*} * \'diiiiuuunz aaanziz\'" -u"" -d"You feel much less invisible." -p"Displacement"
/createprot -t2 -n"SoP" -w"{*} * \'nsiiznau\'" -u"You feel a slight tingle." -d"You feel more vulnerable now." -p"Shield of Protection" 
/createprot -t4 -n"Ent" -w"{*} {utter|utters} the magic words \'Ourglazz Schmourglazz\'" -u"You feel your life force expanding." -d"You feel your hair is getting grayer." -p"Resist entropy"
/createprot -t4 -n"Sticky" -w"{*} {utter|utters} the magic words \'zicks laai qluu\'" -u"You feel extra sticky for protection." -d"You feel less sticky." -p"Resist dispel"
/createprot -t0 -n"IW" -w"{*} {utter|utters} the magic words \'nostaaaanndiz noszum\'" -u"You feel protected from being stunned." -d"You feel no longer protected from being stunned." -p"Iron Will"
/createprot -t2 -n"AS" -w"{*} {draw|draws} a circle around {your|his|her|its} head with {your|his|her|its} fingertips while uttering \'ghht mar zrrprghh\'" -u"The circle forms an air mask before your face." -d"The air mask before your face vanishes." -p"Air shield"
/createprot -t4 -n"Disint" -w"{*} {utter|utters} the magic words \'bii thee dzname uv tii blaaaz drazon\'" -u"You feel very firm." -d"You feel somewhat weaker." -p"Resist disintegrate"
;;/createprot -t2 -n"SF" -w"{*} {draw|draws} a sphere of fire in the air while uttering \'fah mar nak prztrzz\'" -u"You feel uncomfortable warmth emanate within the bloodstream from your heart, slowly crawling its way through your body and limbs.  An oppressive feeling overcomes you as you can feel your heartbeat surge at the your fingertips.  Your heart must struggle to even out the temperature!" -d"The unnatural warmth evens out and stabilizes back to normal. As your fervor subsides, the exhaustion sets in." -p"Searing fervor"

; - Weak typeprots -
/createprot -c -t0 -n"Acid" -w"{*} {utter|utters} the magic words \'sulphiraidzik hydrochloodriz gidz zuf\'" -u"" -d"A disgusting yellow flash momentarily surrounds you and then vanishes." -p"Corrosion Shield"
/createprot -c -t0 -n"Asph" -w"{*} {utter|utters} the magic words \'qor monoliftus\'" -u"" -d"A dull black flash momentarily surrounds you and then vanishes." -p"Ether Boundary"
/createprot -c -t0 -n"Cold" -w"{*} {utter|utters} the magic words \'skaki barictos yetz fiil\'" -u"" -d"A cold white flash momentarily surrounds you and then vanishes." -p"Frost Insulation"
/createprot -c -t0 -n"Elec" -w"{*} {utter|utters} the magic words \'kablaaaammmmm bliitz zundfer\'" -u"" -d"A crackling blue flash momentarily surrounds you and then vanishes." -p"Energy Channeling"
/createprot -c -t0 -n"Fab" -w"{*} {utter|utters} the magic words \'ztonez des deckers\'" -u"" -d"A skin brown flash momentarily surrounds you and then vanishes." -p"Force Absorption"
/createprot -c -t0 -n"Fire" -w"{*} {utter|utters} the magic words \'hot hot not zeis daimons\'" -u"" -d"A burning red flash momentarily surrounds you and then vanishes." -p"Heat Reduction"
/createprot -c -t0 -n"Magi" -w"{*} {utter|utters} the magic words \'meke tul magic\'" -u"" -d"A golden flash momentarily surrounds you and then vanishes." -p"Magic Dispersion"
/createprot -c -t0 -n"Pois" -w"{*} {utter|utters} the magic words \'morri nam pantoloosa\'" -u"" -d"A green flash momentarily surrounds you and then vanishes." -p"Toxic Dilution"
/createprot -c -t0 -n"Psi" -w"{*} {utter|utters} the magic words \'toughen da mind reeez un biis\'" -u"" -d"A transparent flash momentarily surrounds you and then vanishes." -p"Psychic Sanctuary"
; - Strong typeprots -
/createprot -c -t0 -n"GAcid" -w"{*} {utter|utters} the magic words \'hfizz hfizz nglurglptz\'" -u"" -d"Your bubbling yellow shield fades out." -p"Acid Shield"
/createprot -c -t0 -n"AoA" -w"{*} {utter|utters} the magic words \'fooharribah inaminos cantor\'" -u"You see a crystal clear shield fade into existance around you." -d"Your crystal clear shield fades out." -p"Armour of Aether"
/createprot -c -t0 -n"GAsph" -w"{*} {utter|utters} the magic words \'englobo globo mc\'pop\'" -u"" -d"Your swirling foggy white shield fades out." -p"Aura of Wind"
/createprot -c -t0 -n"GCold" -w"{*} {utter|utters} the magic words \'nbarrimon zfettix roi\'" -u"" -d"Your frosty blue-white shield fades out." -p"Frost Shield"
/createprot -c -t0 -n"GElec" -w"{*} {utter|utters} the magic words \'ohm\'" -u"" -d"Your neon purple shield fades out." -p"Lightning Shield" 
/createprot -c -t0 -n"GFire" -w"{*} {utter|utters} the magic words \'huppa huppa tiki tiki\'" -u"" -d"Your crackling red-orange shield fades out." -p"Flame Shield"
/createprot -c -t0 -n"GMana" -w"{*} {utter|utters} the magic words \'shamarubu incixtes delfo\'" -u"" -d"Your flickering golden shield fades out." -p"Repulsor Aura"
/createprot -c -t0 -n"GPois" -w"{*} {utter|utters} the magic words \'nyiaha llaimay exchekes ployp\'" -u"" -d"Your slimy olive green shield fades out." -p"Shield of Detoxification"
/createprot -c -t0 -n"GPsi" -w"{*} {utter|utters} the magic words \'all for one, gather around me\'" -u"" -d"Your misty pale blue shield fades out." -p"Psionic Phalanx"

;;;;;;;;;;;;;
;; Templar ;;
;;;;;;;;;;;;;
/createprot -t2 -n"SoF" -w"{*} {utter|utters} the magic words \'Grant your worshipper your protection\'" -u"You are surrounded by divine glow!" -d"Your glow disappears*" -p"Shield of Faith"
/createprot -t2 -n"BoF" -w"{*} {utter|utters} the magic words \'Benedic, Faerwon*" -u"You feel your conviction to rid the world of evil grow stronger as you are blessed by the holy power of Faerwon." -d"You can feel the power of Faerwon leaving you." -p"Blessing of Faerwon"
;;You feel your conviction to rid the world of evil grow stronger as you are blessed by the holy power of
;;    Faerwon.
;;You feel your conviction to rid the world of evil grow stronger as you are blessed by the holy power of Faerwon.


;;;;;;;;;;;;;;;;;
;; Folklorists ;;
;;;;;;;;;;;;;;;;;
/createprot -t0 -n"MinP" -w"{*} {consult|consults} {your|his|her|its} guide and {chant|chants} \'parvus munimentum\'" -u"You feel slightly protected." -d"The minor protection fades away." -p"Minor protection"
/createprot -r1 -t0 -n"Racp" -w"^([A-z]+ (consult|consults) (your|his|her|its) guide and (chant|chants) \'genus munimentum\')" -u"^You feel protected from (catfolk|cyclops|drows|dwarves|elves|ents|hobbit|humans|kenders|kobolds|merfolk|ogres|orcs|tinmen|trolls|wolfmen)." -d"^(The racial protection fades away.)" -p"Racial protection"
;; /createprot -r1 -t0 -n"ZooP" -w"^([A-z]+ (consult|consults) (your|his|her|its) guide and (chant|chants) \'\')" -u"^You feel protected from (ants|apes|bats|bears|bees|bugs|cats|cows|dogs|ducks|eels|gnus|oxes|owls|pigeons|pumas|rams|rats|squids|swans|turtles|whales|yaks|zebras)" -d"^(The Zoological protection fades away.)" -p"Zoological protection"
;; /createprot -r1 -t0 -n"CryP" -w"^([A-z]+ )" -u"" -d"" -p"Cryptozoological Protection"
;; /createprot -r1 -t0 -n"KinP" -w"^([A-z]+ )" -u"" -d"" -p"Kinemortological protection"

;; god, roc, fly,
;; rok, doe, air, pig, fox, imp, wasp, beam, hare, hulk, head,
;; fire, lich, goat, blob, worm, mole, seal, wolf, bass, yeti, mule, pony, lion, soul,
;; moth, harp, frog, pike, newt, clam, bull, deer, bird, bush, toad, boar, slug,
;; tree, lamb, wyrm, fish, crab, solar, snail, ghost, camel, guard, fairy, skull, ettin,
;; valar, moose, giant, louse, horse, horde, dryad, water, fiend, slime, robin,
;; devil, cobra, demon, beast, snake, mound, tiger, nymph, shark, hydra, sheep, swarm, eagle,
;; torso, sloth, sylph, smurf, bunny, angel, hound, mouse, pixie, error,
;; gnoll, genie, golem, coder, gnome, dread, slaad, leech, titan, plant, harpy, skunk, satyr,
;; drake, light, sprite, glider, shrimp, spider, zombie, oyster, badger, shadow,
;; jackal, urvile, jumper, donkey, skaven, medusa, goblin, rodent, drider,
;; dragon, treant, wyvern, tomato, maggot, rabbit, lizard, baboon, turkey, marmot,
;; otyugh, sponge, beaver, jaguar, digger, spirit, mantis, insect, mutant,
;; walrus, amoeba, winger, gopher, moomin, ferret, gorgon, urchin, shrike, fungus, daemon,
;; beetle, monkey, raccoon, griffon, spectre, chimera, buffalo, caribou, fraggle, banshee,
;; penguin, rooster, centaur, generic, gorilla, snowman, duergar, dolphin,
;; process, chicken, demigod, anemone, cloaker, gremlin, phantom, aboleth,
;; owlbear, goddess, lemming, pegasus, leopard, mammoth, vulture, default, octopus, efriiti,
;; brownie, panther, giraffe, pudding, lobster, unicorn, vampire, dinosaur, ladybird,
;; half-orc, elephant, bullywug, seahorse, beholder, squirrel, tentacle, gargoyle, starfish,
;; minotaur, planetar, mosquito, tortoise, monolith, mastodon, halfling, mushroom, chipmunk,
;; reindeer, platypus, scorpion, limb_leg, werewolf, dragonne, antelope, half-elf, stingray,
;; beastman, hedgehog, humanoid, basilisk, skeleton, draconian, elemental, limb_hand,
;; archdevil, cavewight, jellyfish, black_man, hobgoblin, thrikhren, alligator, wolverine,
;; cromagnon, limb_head, lizardman, nightmare, displacer, butterfly, porcupine, stonefish,
;; something, landshark, eye_thing, crocodile, snootling, manticore, centipede, salamander,
;; gibberling, catoblepas, sabretooth, lizard man, rhinoceros, zhentorian, fire golem,
;; leprechaun, troglodyte, barsoomian, slime_lord, seamonster, half_giant, tumbleweed,
;; half-fiend, homonculus, mongrelman, jabberwocky, blue_dragon, mind_flayer, stone golem,
;; wind_walker, neanderthal, earth golem, triceratops, grasshopper, blackpudding,
;; swampmonster, doppelganger, rust monster, hippopotamus, wingless_wyrm, brown pudding,
;; headless_pope, hairy_creature, slimy creature, tentacle brain, gelatinous cube,
;; master torturer, chromatic dragon, fish_with_no_eyes, three_headed_hound and baby black pudding. 


;;;;;;;;;;;;;;;;
;; Liberators ;;
;;;;;;;;;;;;;;;;
/createprot -t0 -n"GhV" -w"{*} {roll|rolls} {your|his|her|its} eyes and {whisper|whispers} \'kerubi on pomoni\'" -u"You feel a slight tingle in your eyes and can see more than ever." -d"The ghost vision leaves you." -p"Ghost Vision"

;;;;;;;;;;;;;;
;; Animisit ;;
;;;;;;;;;;;;;;
/createprot -r1 -t0 -n"AA" -w"^([A-z]+ (touch|touches) (your|his|her|its) talisman and (whisper|whispers) to it \'Animal Aspects\')" -u"^You feel the aspect of ([A-z ]+) taking over you! You feel ([A-z ]+)." -d"^(You are no longer spellbound by the animal aspect.)" -p"Animal Aspect"

/createprot -t0 -n"RVS" -w"You deftly pluck a dark orb from the rift vortex. The orb twists and bends as you hold it, gradually solidifying into a lump of stone." -u"As you grasp the vortex stone, it melts into nothing leaving you empty handed! You feel a pulse of energy flow up through your arm, giving you a tingling sensation." -d"You no longer tingle." -p"Rift Vortex Stone"

;;;;;;;;;;;
;; Other ;;
;;;;;;;;;;;
/createprot -t2 -n"Qsilv" -w"{*} {utter|utters} the magic words \'jumpiiz laika wabbitzz\'" -u"You feel more agile." -d"You feel less agile." -p"Quicksilver"
/createprot -t0 -n"Hw" -w"{*} rapidly {swallows|swallow} a dozen iron nails and {mumble|mumbles} \'tonnikalaa\'" -u"You suddenly feel magically heavier." -d"You feel lighter, but it doesn\'t seem to affect your weight!" -p"Heavy Weight"
;/createprot -t0 -s -n"Sinv" -w"{*} {rub|rubs} {your|his|her|its} eyes with sand and {whisper|whispers} \'\$\%&@ #\*\%@\*@#\ \$&\*@#\'" -u"You feel you can see more than ever." -d"Your vision is less sensitive now." -p"See Invisible"
/createprot -t0 -n"Sinv" -w"{*} {rub|rubs} {your|his|her|its} eyes with sand and {whisper|whispers} \'\$\%&@ #\*\%@\*@#\ \$&\*@#\'" -u"You feel you can see more than ever." -d"Your vision is less sensitive now." -p"See Invisible"
/createprot -t0 -n"Invs" -w"{*} {utter|utters} the magic words \'..... .... ... ..  .    .!\'" -u"You suddenly can\'t see yourself." -d"You turn visible." -p"Invisibility"
;/createprot -t0 -s -n"Infr" -w"{*} {rub|rubs} {your|his|her|its} eyes with sand and {whisper|whispers} \'demoni on pomoni\'" -u"You have infravision." -d"Everything no longer seems so red." -p"Infravision"
/createprot -t0 -n"Infr" -w"{*} {rub|rubs} {your|his|her|its} eyes with sand and {whisper|whispers} \'demoni on pomoni\'" -u"You have infravision." -d"Everything no longer seems so red." -p"Infravision"
/createprot -t0 -n"Flo" -w"{*} {bow|bows} {your|his|her|its} head in concentration and {chant|chants} \'rise Rise RISE\'" -u"You feel light, and rise into the air." -d"You slowly descend until your feet are on the ground." -p"Floating"
/createprot -t0 -n"WW" -w"{*} {rub|rubs} wax in {your|his|her|its} feet and {chant|chants} \'Jeeeeeeeeeeeesuuuuuuuus\'" -u"You feel light." -d"You feel heavier." -p"Water walking"
;/createprot -r1 -t2 -n"PbS" -w"^([A-z]+ kneel in front of [A-z]+ and whisper \'With my life I\'ll protect yours\'.|[A-z]+ kneels before you and whispers \'With my life I\'ll protect yours\'.)" -u"^(Soldier\'s vow has been given.|(He|She|It) stands up with a solemn look on (his|her|its) face.)" -d"^(You no longer protect *|[A-z]+ no longer protects you.)" -p"Protection by sacrifice"
/createprot -r1 -t0 -n"PbS" -w"^(You kneel in front of [A-z]+ and whisper \'With my life I\'ll protect yours\'.|[A-z]+ kneels before you and whispers \'With my life I\'ll protect yours\'.)" -u"^(Soldier\'s vow has been given.)" -d"^(You no longer protect *|[A-z]+ no longer protects you.)" -p"Protection by sacrifice"
/createprot -r1 -t0 -n"Images" -w"^([A-z]+ (break|breaks) up a mirror and (chant|chants) \'peilikuvia ja lasinsirpaleita\')" -u"^(Suddenly [a-z0-9]+ images of yourself appear.)" -d"^(All of your images vanish!|You have no more mirror images.)" -p"Mirror Image"

/def -aB -F -t'You perform the ceremony.' cere_up=\
 /let timenow=$[time()]%; \
 /let protline=$(/findprot Cere %prots)%;\
 /if (protline=~"0") \
  /set prots=$(/addprot Cere_%{timenow}_1_0_%You %prots)%;\
 /endif

/def -aB -F -t'You start chanting.' cere_down=\
 /set prots=$(/removeprot Cere %prots)

/def -F -aB -t'You are done with the chant.' donespell=\
 /let protline=$(/findprot Invs %prots)%;\
 /if (protline!~"0")\
  /set prots=$(/removeprot Invs %prots)%;\
 /endif

/def -F -aB -t'You are prepared to do the skill.' doneskill=\
 /let protline=$(/findprot Invs %prots)%; \
 /if (protline!~"0") \
  /set prots=$(/removeprot Invs %prots)%; \
 /endif

;; Other messages

/def -p1 -aCgreen -t'^You shiver and suffer from POISON!!' poison = @party %output (Poisoned)
/def -p1 -t'^You feel the poison leaving your veins!' poisongone = @party %output (Poison cured)
/def -p1 -mregexp -t'^You feel that (.*) doesn\'t enjoy your presence\\.$' banish = @party say (%P1 banished me)
/def -p1 -mregexp -t'^[A-z]+ disappears into thick air.' otherbanish = @party say (%-L4 was banished)
/def -p1 -mregexp -t'^You feel relieved.' suppressoff = @party %output No longer suppressed
/def -p1 -mregexp -t'^You feel rather empty-headed.' forget_on = @party %output I have forget cast on me!
/def -p1 -mregexp -t'^A fog lifts from your mind. You can remember things clearly now.' forget_off = @party %output (Forget [off])
 
/def -i rmprots = \
  /echo -aB TF Info: Prots cleared%;\
  /let loops=$(/length %prots)%;\
  /let count=1%;\
  /while (count <= loops) \
    /let protline=$(/nth %count %prots)%;\
    /let protline=$[replace("_", " ", {protline})]%;\
    /let sname=$(/first %protline)%;\
    /set prots=$(/removeprot %sname %prots)%;\
    /let count=$[count+1]%;\
  /done

; Quick binds to commands
/def -i -h'SEND protx' tarkista=/check
/def -i -h'SEND prp' tarkistap=/check p

; Reflector shield, possible to cast to players?
;{*} utters the magic words 'sakat ikkiak satsjaieh'

; Dragonify (umm, prolly should go to hilites too?)
;{*} utters the magic words 'mun enoni oli rakoni'

;skill drain (not really related to prots, eh?)
;{*} closes his eyes and with a dry, dark voice entones 'nyyjoo happa helleipsis'
