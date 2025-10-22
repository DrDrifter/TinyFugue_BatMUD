;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;       Scripts and triggers for use with all guilds in BatMUD               ;;
;;                     Jenny@batmud.org 1999                                  ;;
;;                                                                            ;;
;;     Modified and some parts recoded by drifter@bat.org 2001-2020           ;;
;;                   last update 22.04.2020                                   ;;
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
/loaded bat-generic.tf
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

;; Format time
;; Converts the output from $[time()] into days, hours, minutes and seconds.
/def format_time =\
   /let input_time=%{1}%;\
   /let time_day=$[{input_time}/86400]d%;\
   /let time_hr=$[({input_time}-({time_day}*86400))/3600]h%;\
   /let time_min=$[({input_time}-({time_hr}*3600)-({time_day}*86400))/60]m%;\
   /let time_sec=$[{input_time}-({time_min}*60)-({time_hr}*3600)-({time_day}*86400)]s%;\
   /echo $[{time_day}?strcat({time_day},{time_hr}?" ":""):""]$[{time_hr}?strcat({time_hr},{time_min}?" ":""):""]$[{time_min}?strcat({time_min},{time_sec}?" ":""):""]$[{time_sec}?{time_sec}:""]

;; Format floating numbers
;; rounds floating numbers to wanted amount of decimals
;; Input: Ffloat (eg. 56.3542123), <number_of_desired_decimals>
/def floatd = \
   /let v1=%1%;\
   /let v2=%2%;\
   /let v3=$[trunc(v1)]%;\
   /let v1=$[trunc((v1-v3)*(pow(10,v2)))]%;\
   /let v1=$[strcat(strrep("0",v2-strlen(v1)),v1)]%;\
   /if (v2==0) /return "%{v3}"%;/endif%;\
   /if (%{v1}<0) \
      /let v3=$[abs(v3)]%;\
      /let v1=$[abs(v1)]%;\
      /return "-%{v3}.%{v1}"%;\
   /endif%;\
   /return "%{v3}.%{v1}"

;; Roundf will round up to the nearest full decimal using floatd
/def roundf = \
   /let v1=$[%*+0.5]%;\
   /return $[floatd(v1)]

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
      /if ({executing} =~ {skill} )\
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
     /set executing=%{skill}%;\
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
   /set executing=none%;\
   /if ({off_skill_stack}!~"")\
   /set redo_skill_stack=$[strcat(substr({off_skill_stack},1),{repeat_skill_stack})]%;\
   /elseif ({off_skill_stack}=~"")\
   /set redo_skill_stack=$[substr({repeat_skill_stack},1)]%;\
   /endif%;\
  /if (({redo_skill_stack}!~"") & (regmatch({redo_skill_stack},{skill})))\
    /set start_flag=start%;\
    /do_skill%;\
  /endif

;;Reset skills
/def -F -p20 -t'You begin searching for a proper place to rest.' used_camping=/set skill_rounds=DONE%;/set start_flag=done%;/set skill_input=manual
/def -F -p20 -t'You break your skill attempt.' cast_stop_1=/set skill_rounds=DONE%;/set start_flag=done%;/set executing=none
/def -F -p20 -t'You interrupt the spell.' cast_stop_2=/set start_flag=done%;/set executing=none
/def -F -p20 -t'You decide to change the skill to new one.' cast_stop2=/set skill_rounds=DONE%;/set start_flag=done%;/set skill_input=manual
/def -F -p20 -t'Your movement prevents you from *' movement=/set skill_rounds=DONE%;/set start_flag=done%;/set executing=none
/def -F -p20 -t'You are not doing anything at the moment.' use_stop=/set skill_rounds=DONE%;/set start_flag=done%;/set executing=none
/def -F -p20 -t'You interrupt the spell.' cast_stop3=/set spell_rounds=DONE%;/set start_flag=done%;/set executing=none
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
     /if ({targettype}!~"prot") /echo -aB -p (Tinyfugue) Casting @{Cwhite}$[replace("_"," ",{spell})]@{n} at @{Cwhite}$(/eval /_echo %%{%{targettype}_target})@{n}%;/endif%;\
     /if ({targettype}=~"prot" & {prot_target} !~"") @party report $[replace("_"," ",{spell})] -> %{prot_target}%;/endif%;\
   /else \
     /if ({targettype}=~"heal" & {start_flag}=~"started" & {executing}=~{spell}) \
       /echo -aB (TinyFugue) Already casting heal, updating heal target%;\
     /else \
       @cast %{spell}%;\
     /endif%;\
     /if ({targettype}=~"none") /echo -aB -p (Tinyfugue) @{Cwhite}%{spell}@{n} started%;\
       /else \
       /echo -aB -p (Tinyfugue) @{Cwhite}%{spell}@{n} started at default%;\
     /endif%;\
   /endif
;; Start spell
;; Determine where the spell input came from, if it wasn't from
;; tinyfugue the auto recast trigger is turned off
/def -F -p9 -aB -aCwhite -t'You start chanting.' start_spell=\
   /set start_flag=started%;\
   /set executing=%{spell}%;\
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
     /set start_flag=done%;\
     /set executing=none%;\
     /if ({spell}=/{recast_spell_stack})\
       /do_spell%;\
       @regfill%;\
     /endif

;; Reset spells
;;/def -F -p15 -mglob -t"* is not wounded." no_heal_needed = zz

;; Commented this out, casters might need to chain offensive spells
;; /def -F -p15 -t"Cast * at what?" no_spell_target=zz

;; Follow command (requires fast connection)
/def follow=\
   /let tmp_target=$[strcat(toupper(substr({*}, 0, 1)), substr({*}, 1))]%;\
   /def -F -mregexp -p7 -t"^%{tmp_target} leaves ([a-z]+)\\\\.$$" do_follow= %%{P1}

;; Find mob in database - this calls for an external script to be executed
/def fmob=/quote -S /echo -aB (TF info): !/home/pi/build/findmob.pl %{*}

;; Just some debug stuff
/def debug=\
   /echo -aB -p (Debug) skill=%{skill} spell=%{spell} executing=%{executing} start_flag=%{start_flag} targettype=%{targettype} %{targettype}_target=%%{%{targettype}_target}
