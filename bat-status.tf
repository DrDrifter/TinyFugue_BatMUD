/set lasttick=0
/set counthb=0
/set damage_type=null
/set ceredone=_
/set eqsetstatus=INT
;;/set offensive_target=null

#/status_rm @world
#/status_rm @active
#/status_rm @mail
#/status_rm @read
/status_add -c "[" ceredone:1
/status_add -Aceredone "]" padding1:1
/status_add -Apadding1 "[" eqsetstatus:3
/status_add -Aeqsetstatus "]" padding2:1
/status_add -Apadding2 "[" damtype:12
/status_add -Adamtype "]" padding3:1
/status_add -Apadding3 "(" lasttick:4
/status_add -Alasttick "/" counthb:2
/status_add -Acounthb ")" padding4:10
/status_add -Apadding4 @log
/clock on

;; My old prompt or something
;; HP:459/459 SP:1449/1469 [-20] EP:285/285
;;/def -p20 -mregexp -t'^HP:-?[0-9]+/[0-9]+ SP:-?[0-9]+/-?[0-9]+ \[\+([0-9]+)\] EP:-?[0-9]+/-?[0-9]+' status_tick_event =\

;;hp: 431 (431) [] sp: 1963 (1963) [] 
;;^hp: -?[0-9]+ \([0-9]+\) \[[\-+0-9]*\] sp: -?[0-9]+ \(-?[0-9]+\) \[\+([0-9]+)\] ep: -?[0-9]+ \(-?[0-9]+\) \[[\-+0-9]*\] cash: [0-9]+ \[[\-+0-9]*\] exp: [0-9]+ \[[\-+0-9]*\]
/def -p20 -mregexp -t'^hp: -?[0-9]+ \([0-9]+\) \[[\-+0-9]*\] sp: -?[0-9]+ \(-?[0-9]+\) \[\+([0-9]+)\] ep: -?[0-9]+ \(-?[0-9]+\) \[[\-+0-9]*\] cash: [0-9]+ \[[+\-0-9]*\] exp: [0-9]+ \[[+\-0-9]*\]' status_tick_event =\
/let last_tick_amount=%{P1}%;\
/if (last_tick_amount>30 & last_tick_amount<240) \
  /set time_last_tick=%{time_this_tick}%;\
  /set time_this_tick=$[time()]%;\
  /set time_tick=in $(/formattime $[{time_this_tick}-{time_last_tick}])%;\
  /echo -aB tick event, gain: %{last_tick_amount} last: %{time_tick} hb: %{counthb}%;\
  /set counthb=0%;\
/endif

;; Heartbeat dunk dunk counter
/def -ag -mregexp -t'^Dunk dunk' status_hb_event = /set counthb=$[{counthb}+1]%;\

/repeat -1 i /set lasttick=$(/formattime $[time()-{time_this_tick}])

/def -F -i -mglob -t"You perform the ceremony." ceredonestatus=/set ceredone=C
/def -F -i -mglob -t"You start chanting." cereoffstatus=/set ceredone=_
/def -mglob -t"*Drifter spr set on." castmodestatus_spr=/set eqsetstatus=SPR
/def -mglob -t"*Drifter wis set on." castmodestatus_wis=/set eqsetstatus=WIS
/def -mglob -t"*Drifter int set on." castmodestatus_int=/set eqsetstatus=INT

