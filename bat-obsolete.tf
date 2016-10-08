
;; BAT-GENERIC.TF


;; Hp reporting (added 10.12.2005)
;; Update 28.7.2016: Commented out since this is not in use
;;/def report=\
;;   /if (({1}=~"on") & ({2}=~"emote"))\
;;      /set report_mode=on%;\
;;      /set report_type=emote%;\
;;      /echo -aB (Tinyfugue) Hp will be now emoted.%;\
;;   /elseif (({1}=~"on") & ({2}=~"party"))\
;;      /set report_mode=on%;\
;;      /set report_type=party%;\
;;      /echo -aB (TinyFugue) Hp will now be reported to party%;\
;;   /elseif (({1}=~"on") & ({2}!~""))\
;;      /echo -aB (TinyFugue) Usage: /report (on|off) [party|emote]%;\
;;   /elseif (({1}=~"on") & ({2}=~""))\
;;      /set report_mode=on%;\
;;      /set report_type=party%;\
;;      /echo -aB (TinyFugue) Hp will now be reported to party%;\
;;   /elseif (({1}=~"off"))\
;;      /set report_mode=off%;\
;;      /set report_type=off%;\
;;      /echo -aB (TinyFugue) Hp reporting off%;\
;;   /else%;\
;;      /echo -aB (TinyFugue) Usage: /report (on|off) [party|emote]%;\
;;   /endif


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

;;                                                                            ;;
;; Report shape                                                               ;;
;; Add your favourite corpse disposal methods to end of                       ;;
;; victim_is_dead                                                             ;;
;/def make_report_shape=\
;     /def -F -p9 -mregexp -t"^$[strcat(toupper(substr({*}, 0, 1)), substr({*}, 1))] is" report_shape=/if ({shape}!~{PR})/set shape=%%{PR}%%;/echo -aB -p (TF info) %%{PR}%%;/endif%;\
;     /def -F -p5 -mregexp -t"$[strcat(toupper(substr({*}, 0, 1)), substr({*}, 1))] is DEAD, R.I.P." victim_is_dead=/set skill_rounds=DONE%%;save
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














;BAT-HILITE.TF

;;
;; Tank timers
;;
;/set herb_timer=0

;/def -F -mglob -t'You eat a green mistletoe*' mistletoe_eaten = /set herb_timer=$[time()]%;/repeat -420 1 /echo -aB (TF Info): Herb ready
;/def -F -mglob -t'You eat yarrow flower*' yarrow_eaten = /set herb_timer=$[time()]%;/repeat -420 1 /echo -aB (TF Info): Herb ready
;/def -F -mglob -t'You eat burdock leaf*' burdock_eaten = /set herb_timer=$[time()]%;/repeat -420 1 /echo -aB (TF Info): Herb ready

;/def herbs= \
;       /if (herb_timer != 0)\
;               /let lastherbtime=$[time()-herb_timer]%;\
;               /let flastherb=$(/formattime %lastherbtime)%;\
;       /else \
;               /let flastherb=0:00%;\
;       /endif%;\
;       /echo -aB (TF Info): Breath: [%draco_breath]  Herb: [%flastherb]

;; Draco race breath
/set draco_breath=ready
/def -mglob -t"You drift off into a deep daydream*" draconian_breath_ready = /set draco_breath_time=$[time()-draco_breath_timer]%;\
   /let fdraco_breath_time=$(/formattime %draco_breath_time)%;\
   /echo -aB (TF Info): Draconian breath available (%fdraco_breath_time)%;\
   /set draco_breath=ready
/def -mglob -t"Your innate power to breathe gas has restored." draconian_breath_ready2 = /set draco_breath_time=$[time()-draco_breath_timer]%;\
   /let fdraco_breath_time=$(/formattime %draco_breath_time)%;\
   /echo -aB (TF Info): Draconian breath available (%fdraco_breath_time)%;\
   /set draco_breath=ready
/def -mglob -t"You hit * with your blaze of magical fire." draconian_breath_used = /set draco_breath=charging%;/set draco_breath_timer=$[time()]
/def -mglob -t"Your innate ability has not restored itself." draconian_breath_not_ready = /set draco_breath=charging

