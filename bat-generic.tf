;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;       Scripts and triggers for use with all guilds in BatMUD               ;;
;;                     Jenny@batmud.org 1999                                  ;;
;;                                                                            ;;
;;     Modified and some parts recoded by drifter@bat.org 2001-2011           ;;
;;                   last update 18.02.2011                                   ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;; Command you can use given by this file:                                    ;;
;; [] are require inputs, <> are optional, () shows default                   ;;
;; /tick [(on)|off] <(emote)|party> ->toggle ticks                            ;;
;; /rounds [(on)|off] <emote|(party)> ->toggle spell round reports            ;;
;; /follow [target]                                                           ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;; Everything else is just generic stuff which is called from                 ;;
;; other individual guild files.                                              ;;
;; Works as follows:                                                          ;;
;; Skills:                                                                    ;;
;; /def [trigname]=/set skill=[skill_name]%;/set skilltype=[off|none]%;\      ;;
;; /do_skill %{*} ->Redoes skilltype off and repeat                           ;;
;; Spells:                                                                    ;;
;; /def [trigname]=/set spell=[spell_name]%;/set targettype=[off|heal|tele]%;\;;
;; /do_spell %{*} ->Redoes targettype off                                     ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Generic settings, modify to your own comfort
;
/set histsize=2000
/set maildelay=0
/set snarf=on
;;/set keypad=on

; Binding movement dirs to numpad
/def key_nkp1 = sw
/def key_nkp2 = s
/def key_nkp3 = se
/def key_nkp4 = w
/def key_nkp5 = look
/def key_nkp6 = e
/def key_nkp7 = nw
/def key_nkp8 = n
/def key_nkp9 = ne

;; Hp reporting (added 10.12.2005)
/def report=\
   /if (({1}=~"on") & ({2}=~"emote"))\
      /set report_mode=on%;\
      /set report_type=emote%;\
      /echo -aB (Tinyfugue) Hp will be now emoted.%;\
   /elseif (({1}=~"on") & ({2}=~"party"))\
      /set report_mode=on%;\
      /set report_type=party%;\
      /echo -aB (TinyFugue) Hp will now be reported to party%;\
   /elseif (({1}=~"on") & ({2}!~""))\
      /echo -aB (TinyFugue) Usage: /report (on|off) [party|emote]%;\
   /elseif (({1}=~"on") & ({2}=~""))\
      /set report_mode=on%;\
      /set report_type=party%;\
      /echo -aB (TinyFugue) Hp will now be reported to party%;\
   /elseif (({1}=~"off"))\
      /set report_mode=off%;\
      /set report_type=off%;\
      /echo -aB (TinyFugue) Hp reporting off%;\
   /else%;\
      /echo -aB (TinyFugue) Usage: /report (on|off) [party|emote]%;\
   /endif   

;;                                                                            ;;
;; Tick reporting                                                             ;;
;; Reports increases in any of hp sp or ep depending on whether the variables ;;
;; {hp_report}, {sp_report}, {ep_report} and {tick_mode} are equal to on.     ;;
;; Set hp|sp|ep_report in guild files, tick_mode toggled with /tick           ;;
;;                                                                            ;;
;
; Update 15.3.04: I commented out, since most people use short score nowadays
;
;/def -F -p11 -i -t"[Hh]p: * (*) [Ss]p: * (*) [Ee]p: * (*)" status=\
;   /set hpold=%{hp}%;/set hp=%{2}%;/set hpmax=$[substr({3},1,-1)]%;\
;   /set spold=%{sp}%;/set sp=%{5}%;/set spmax=$[substr({6},1,-1)]%;\
;   /set epold=%{ep}%;/set ep=%{8}%;/set epmax=$[substr({9},1,-1)]%;\
;   /if ({hp_report}=~"on")/set hp_tick=$(/process_tick hp)%;/endif%;\
;   /if ({sp_report}=~"on")/set sp_tick=$(/process_tick sp)%;/endif%;\
;   /if ({ep_report}=~"on")/set ep_tick=$(/process_tick ep)%;/endif%;\
;   /if (({sp_tick}!~"") | ({ep_tick}!~""))\
;     /set tickreport=ticks%;\
;     /set time_last_tick=%{time_this_tick}%;\
;     /set time_this_tick=$[time()]%;\
;     /set time_tick=in $(/format_time $[{time_this_tick}-{time_last_tick}])%;\
;   /elseif ({hp_tick}!~"")\
;     /set tickreport=heals%;\
;     /set time_tick=%;\
;   /endif%;\
;   /if ({tick_mode}=~"on")\
;     /if (({hp_tick}!~"") | ({sp_tick}!~"") | ({ep_tick}!~""))\
;     @%{tick_inform} %{tickreport}$[{hp_tick}?pad({hp_tick},(strlen({hp_tick})+1)):strcat()]$[{sp_tick}?pad({sp_tick},(strlen({sp_tick})+1)):strcat()]$[{ep_tick}?pad({ep_tick},(strlen({ep_tick})+1)):strcat()] %{time_tick}%;\
;     /endif%;\
;   /endif
;/def process_tick=\
;   /let tick=$[$(/eval /_echo %%{%{*}})-$(/eval /_echo %%{%{*}old})] %{*},%;\
;   /if ({tick}<=0)/let tick=%;\
;   /else /let tick=$[strcat(($(/eval /_echo %%{%{*}})-$(/eval /_echo %%{%{*}old})),{*}," (",(($(/eval /_echo %%{%{*}})*100)/$(/eval /_echo %%{%{*}max})),"%)")]%;\
;   /endif%;\
;   /_echo  %{tick}
;; Toggle tick reporting
;/def tick=\
;   /if (({1}=~"on") & ({2}=~"emote"))\
;     /set tick_mode=on%;\
;     /set tick_inform=emote%;\
;     /echo -aB (Tinyfugue) ticks will now be emoted.%;\
;   /elseif (({1}=~"on") & ({2}=~"party"))\
;     /set tick_mode=on%;\
;     /set tick_inform=party say%;\
;     /echo -aB (Tinyfugue) ticks will now be reported to party%;\
;   /elseif (({1}=~"on") & ({2}!~""))\
;     /echo -aB (Tinyfugue) ticks can be either toggled to emote or party%;\
;   /elseif (({1}=~"on") & ({2}=~""))\
;     /set tick_mode=on%;\
;     /set tick_inform=emote%;\
;     /echo -aB (Tinyfugue) ticks will now be emoted (default)%;\
;   /elseif ({1}=~"off")\
;     /set tick_mode=off%;\
;     /echo -aB (Tinyfugue) ticks will no longer be reported.%;\
;   /else%;\
;     /echo -aB (Tinyfugue) ticks can be toggled either on or off.%;\
;   /endif
;; Format time
;; Converts the output from $[time()] into days, hours, minutes and seconds.
/def format_time =\
   /let input_time=%{1}%;\
   /let time_day=$[{input_time}/86400]d%;\
   /let time_hr=$[({input_time}-({time_day}*86400))/3600]h%;\
   /let time_min=$[({input_time}-({time_hr}*3600)-({time_day}*86400))/60]m%;\
   /let time_sec=$[{input_time}-({time_min}*60)-({time_hr}*3600)-({time_day}*86400)]s%;\
   /echo $[{time_day}?strcat({time_day},{time_hr}?" ":""):""]$[{time_hr}?strcat({time_hr},{time_min}?" ":""):""]$[{time_min}?strcat({time_min},{time_sec}?" ":""):""]$[{time_sec}?{time_sec}:""]
;;                                                                            ;;
;; End tick trigger                                                           ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;; Script to use skills at specificed target or default (specified by ".")    ;;
;;                                                                            ;;
;; Call this script with /def [trigger_name]=/set skill=[skill_name]%;\       ;;
;; /set rounds=[num|random]%;/do_skill%{*}                                    ;;
;;                                                                            ;;
;; Do skill (send skill command to world)                                     ;;
/def do_skill=\
 /if ({start_flag}=~"started")\
      /if ({executing_skill} =~ {skill} )\
          /echo -aB (Tinyfugue) All ready executing same skill%;\
	  /break%;\
      /endif%;\
 /endif%;\
   /set skill_input=tinyfugue%;\
   /set rounds=%{skill_rounds}%;\
   /set round_count=0%;\
   /set start_flag=start%;\
   /if ({*}=~".")/set %{targettype}_target=%;\
   /elseif ({*}=/"[1-3]")/set %{targettype}_target=$(/eval /_echo %%{tank%{1}})%;\
   /elseif ({*}=/"[4-6]")/set %{targettype}_target=$(/eval /_echo %%{midd%{1}})%;\
   /elseif ({*}=/"[7-9]")/set %{targettype}_target=$(/eval /_echo %%{back%{1}})%;\
   /elseif ({*}!~"")/set %{targettype}_target=%{*}%;\
   /endif%;\
   /if ($(/eval /_echo %%{%{targettype}_target})!~"")\
     @use %{skill} at $(/eval /_echo %%{%{targettype}_target})%;\
;;     /if ({targettype}=~"off")/make_report_shape %{off_target}%;/endif%;\
     /echo -aB -p (Tinyfugue) @{Cwhite}%{skill}@{n} started at @{Cwhite}$(/eval /_echo %%{%{targettype}_target})@{n}%;\
   /else \
     @use %{skill}%;\
     /if ({targettype}=~"none") /echo -aB -p (Tinyfugue) @{Cwhite}%{skill}@{n} started%;\
     /else \
     /echo -aB -p (Tinyfugue) @{Cwhite}%{skill}@{n} started at default%;\
     /endif%;\
 /endif

;; Skill start                                                                ;;
/def -F -aB -p12 -aCwhite -t"You start concentrating on the skill." start_skill=\
   /set start_flag=started%;\
   /if ({skill_input}=~"tinyfugue")\
     /edit -c100 redo_skills%;\
     /set executing_skill=%{skill}%;\
   /else \
     /edit -c0 redo_skills%;\
   /endif%;\
   /repeat -3 1 /set skill_input=manual
;; Redo offensive skills                                                      ;;
;; will automatically redo offensive skills.                                  ;;
;; these are defined in the "skill_stack" which is created or                 ;;
;; added to in files for each guild                                           ;;
/def stack=/set %{2}=$(/eval /_echo %%{%{2}})|%{1}
/set redo_skill_stack=$[strcat(substr({off_skill_stack},1),{repeat_skill_stack})]
;; Create skill stack by defining it as itself                                ;;
;; and your extra skills                                                      ;;
;; /stack <skill_name> off_skill_stack                                        ;;
;; Trigger to redo skill on seeing you use it                                 ;;
/def -F -c0 -aB -p20 -mregexp -t"(You lose your concentration and cannot do the skill.|You are prepared to do the skill.|You are no longer stunned.)" redo_skills=\
   /set start_flag=done%;\
   /set executing_skill=none%;\
   /if ({off_skill_stack}!~"")\
   /set redo_skill_stack=$[strcat(substr({off_skill_stack},1),{repeat_skill_stack})]%;\
   /elseif ({off_skill_stack}=~"")\
   /set redo_skill_stack=$[substr({repeat_skill_stack},1)]%;\
   /endif%;\
  /if (({redo_skill_stack}!~"") & (regmatch({redo_skill_stack},{skill})))\
    /set start_flag=start%;\
    /do_skill%;\
  /endif
;;                                                                            ;;
;; Battle rounds (monitors skill progress)                                    ;;
;; /def -t'\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*\\*' battle_rounds=\
;; Notice: at 18.2.2011 I noted that the rounds separator has changed:
;; ********************** Round 1 **********************
;; as opposed to the previous:
;; *****************************************************
;; So I made it to work with both:
;;
;; Note, note note: as of 10.07.2013 this is disabled, as you can set all the  same functionalities with builtin command "set"
;;
;;/def -mregexp -t'^(\\*{10,})(.*)' battle_rounds=\
;;   /if ({report_mode}=~"on")\
;;      /if ({report_type}=~"party")\
;;         @party report%;\
;;      /elseif ({report_type}=~"emote")\
;;         @report%;\
;;      /endif%;\
;;   /endif%;\
;;   /if ({start_flag}=~"start")\
;;     /echo -aB -p (Tinyfugue) starting @{Cwhite}%{skill}@{n}%;\
;;   /elseif ({skill_rounds}=~"random")\
;;     /set round_count=$[{round_count}+1]%;\
;;     /echo -aB -p (Tinyfugue) Concentrating on @{Cwhite}$[replace("_"," ",{skill})]@{n} for @{Cwhite}%{round_count}@{n} rounds%;\
;;   /elseif ({skill_rounds}=~"DONE")\
;;   /elseif ({skill_rounds}>0)\
;;     /echo -aB -p (Tinyfugue) @{Cwhite}$[replace("_"," ",{skill})]@{n} in @{Cwhite}%{rounds}@{n} rounds%;\
;;     /set rounds=$[{rounds}-1]%;\
;;   /elseif ({rounds}==0)\
;;     /echo -aB -p (Tinyfugue) @{Cwhite}%{skill}@{n} this round%;\
;;   /endif%;\

;;Reset skills
/def -F -p20 -t'You begin searching for a proper place to rest.' used_camping=/set skill_rounds=DONE%;/set start_flag=done%;/set skill_input=manual
/def -F -p20 -t'You break your skill attempt.' cast_stop=/set skill_rounds=DONE%;/set start_flag=done
/def -F -p20 -t'You decide to change the skill to new one.' cast_stop2=/set skill_rounds=DONE%;/set start_flag=done%;/set skill_input=manual
/def -F -p20 -t'Your movement prevents you from doing the skill.' movement=/set skill_rounds=DONE%;/set start_flag=done
/def -F -p20 -t'You are not doing anything at the moment.' use_stop=/set skill_rounds=DONE%;/set start_flag=done
;; Spells, works in same way as skills trigger
;; except you can specify targets based on offensive or
;; defensive spells
;;
;; Call this script with /def <triggername>=/set spell=<spell>%;\
;; /set targettype=<off|def|heal|etc.>%;/set spell_rounds=<num>%;/do_spell %{*}
/def do_spell=\
   /set spell_input=tinyfugue%;\
   /if ({*}=~".")/set %{targettype}_target=%;\
   /elseif ({*}=/"[1-3]")/set %{targettype}_target=$(/eval /_echo %%{tank%{1}})%;\
   /elseif ({*}=/"[4-6]")/set %{targettype}_target=$(/eval /_echo %%{midd%{1}})%;\
   /elseif ({*}=/"[7-9]")/set %{targettype}_target=$(/eval /_echo %%{back%{1}})%;\
   /elseif ({*}!~"")/set %{targettype}_target=%{*}%;\
   /endif%;\
   /if ($(/eval /_echo %%{%{targettype}_target})!~"")\
     @cast %{spell} at $(/eval /_echo %%{%{targettype}_target})%;\
;; Is this needed? debug later perhaps
;;     /if ({targettype}=~"off")/make_report_shape %{off_target}%;/endif%;\
     /if ({targettype}!~"prot") /echo -aB -p (Tinyfugue) Casting @{Cwhite}$[replace("_"," ",{spell})]@{n} at @{Cwhite}$(/eval /_echo %%{%{targettype}_target})@{n}%;/endif%;\
     /if ({targettype}=~"prot" & {prot_target} !~"") @party report $[replace("_"," ",{spell})] -> %{prot_target}%;/endif%;\
   /else \
     @cast %{spell}%;\
     /if ({targettype}=~"none") /echo -aB -p (Tinyfugue) @{Cwhite}%{spell}@{n} started%;\
       /else \
       /echo -aB -p (Tinyfugue) @{Cwhite}%{spell}@{n} started at default%;\
     /endif%;\
   /endif
;; Start spell
;; Determine where the spell input came from, if it wasn't from
;; tinyfugue the auto recast trigger is turned off
/def -F -p9 -aB -aCwhite -t'You start chanting.' start_spell=\
   /if ({spell_input}=~"tinyfugue")\
     /edit -c100 recast_spells%;\
   /else \
     /edit -c0 recast_spells%;\
   /endif%;\
   /set spell_input=manual
;; Spell rounds
;; Can report spell rounds to wherever you choose
;; Toggle spell rounds inform
/def rounds=\
   /if (({1}=~"on") & ({2}=~"emote"))\
     /set spell_report=on%;\
     /set spell_inform=emote%;\
     /echo -aB TF info: offensive spell rounds will now be emoted.%;\
   /elseif (({1}=~"on") & ({2}=~"party"))\
     /set spell_report=on%;\
     /set spell_inform=party say%;\
     /echo -aB TF info: offensive spell rounds will now be reported to party%;\
   /elseif (({1}=~"on") & ({2}!~""))\
     /echo -aB TF info: spell rounds can be either toggled to emote or party%;\
   /elseif (({1}=~"on") & ({2}=~""))\
     /set spell_report=on%;\
     /set spell_inform=party say%;\
     /echo -aB TF info: offensive spell rounds will now be reported to party (default)%;\
   /elseif ({1}=~"off")\
     /set spell_report=off%;\
     /echo -aB TF info: spell rounds will no longer be reported.%;\
   /else \
     /echo -aB TF info: spell rounds can be toggled either on or off.%;\
   /endif

/def -F -p12 -mregexp -t"^([A-Za-z ]+): ([#]+)$" spell_round=\
     /set spell_round_name=$[tolower(replace(" ", "_", {P1}))]%;\
     /set spell_rounds=$[strlen({P2})]%;\
     /set spell_report_stack=$[strcat(substr({off_spell_stack},1),"|wither_flesh")]%;\
   /if ((regmatch({spell_report_stack},{spell})) & ({spell}=~{spell_round_name}) & ({spell_report}=~"on"))\
   @%{spell_inform} $[replace("_"," ",{spell})] -> %{spell_rounds}%;\
   /endif

/def -F -p9 -aB -t'You skillfully cast the spell with haste.' quick_1=\
   /if ((regmatch({spell_report_stack},{spell})) & ({spell_rounds}>1) & ({spell_report}=~"on") & ({spell_round_name}=~{spell}))\
     @%{spell_inform} $[replace("_"," ",{spell})] -> $[{spell_rounds}-1]%;\
     /set spell_rounds=$[{spell_rounds}-1]%;\
   /endif

/def -F -p9 -aB -t'You skillfully cast the spell with greater haste.' quick_2=\
   /if ((regmatch({spell_report_stack},{spell})) & ({spell_rounds}>2) & ({spell_report}=~"on") & ({spell_round_name}=~{spell}))\
     @%{spell_inform} $[replace("_"," ",{spell})] -> $[{spell_rounds}-2]%;\
     /set spell_rounds=$[{spell_rounds}-2]%;\
   /endif

/def -F -p9 -aB -t'You feel some power hasten your casting.' quick_3=\
   /if ((regmatch({spell_report_stack},{spell})) & ({spell_rounds}>1) & ({spell_report}=~"on") & ({spell_round_name}=~{spell}))\
     @%{spell_inform} $[replace("_"," ",{spell})] in -> $[{spell_rounds}-1]%;\
     /set spell_rounds=$[{spell_rounds}-1]%;\
   /endif

/def -F -p9 -aB -t'You feel unearthly power hasten your casting.' quick_4=\
   /if ((regmatch({spell_report_stack},{spell})) & ({spell_rounds}>1) & ({spell_report}=~"on") & ({spell_round_name}=~{spell}))\
     @%{spell_inform} $[replace("_"," ",{spell})] in -> $[{spell_rounds}-2]%;\
     /set spell_rounds=$[{spell_rounds}-1]%;\
   /endif

/def -F -p9 -aB -t'You feel godly power hasten your casting.' quick_5=\
   /if ((regmatch({spell_report_stack},{spell})) & ({spell_rounds}>1) & ({spell_report}=~"on") & ({spell_round_name}=~{spell}))\
     @%{spell_inform} $[replace("_"," ",{spell})] in -> $[{spell_rounds}-1]%;\
     /set spell_rounds=$[{spell_rounds}-1]%;\
   /endif

/def -F -p9 -aB -t'Your heavy burden slows down your casting.' burden

;;Auto recast spell
/def -F -c0 -p20 -mregexp -t"(You are done with the chant.|You lose your concentration and cannot cast the spell.)" recast_spells=\
     /set recast_spell_stack=$[strcat("{", substr({off_spell_stack},1), {heal_spell_stack},"}")]%;\
     /if ({spell}=/{recast_spell_stack})\
       /do_spell%;\
     /endif

;; Reset spells
;;/def -F -p15 -mglob -t"* is not wounded." no_heal_needed = zz

;; Commented this out, casters might need to chain offensive spells
;; /def -F -p15 -t"Cast * at what?" no_spell_target=zz

;; Follow command (requires fast connection)
/def follow=\
   /let tmp_target=$[strcat(toupper(substr({*}, 0, 1)), substr({*}, 1))]%;\
   /def -F -mregexp -p7 -t"^%{tmp_target} leaves ([a-z]+)\\\\.$$" do_follow= %%{P1}

;; Find mob in database
/def xmob=\
   /quote -S /echo !~/lib/findmob.pl \'%{*}\'

/def pmob=\
   /quote -0 : !~/lib/findmob.pl \'%{*}\'

;; Just some debug stuff
/def debug=\
   /echo -aB -p (Debug) skill=%{skill} spell=%{spell} executing_skill=%{executing_skill} start_flag=%{start_flag} targettype=%{targettype} %{targettype}_target=%%{%{targettype}_target}
