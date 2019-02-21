/set lasttick=0:00
/set counthb=0
/set damage_type=null
/set ceredone=_
/set eqsetstatus=INT
/set camptimer=CAMP
/set shelterstatus=_______
;;/set offensive_target=null

;; Set statusbar and the correct padding
;; First remove all the "default" clutter
#/status_rm @world
#/status_rm @active
#/status_rm @mail
#/status_rm @read
;; Then define what we want to see
/status_add -c "[" ceredone:1
/status_add -Aceredone -s0 "]" padding1:1
/status_add -Apadding1 -s0 "[" eqsetstatus:3
/status_add -Aeqsetstatus -s0 "]" padding2:1
/status_add -Apadding2 -s0 "[" damtype:12
/status_add -Adamtype -s0 "]" padding3:1
/status_add -Apadding3 -s0 "(" lasttick:4
/status_add -Alasttick -s0 "/" counthb:2
/status_add -Acounthb -s0 ")" padding4:1
/status_add -Apadding4 -s0 "[" camptimer:4
/status_add -Acamptimer -s0 "]" padding5:1
/status_add -Apadding5 -s0 shelterstatus:20
/status_add -Ashelterstatus @log
/clock on

;; Converts seconds into minutes and seconds, very useful
/def -i formattime=\
 /set tmptime=%1%;\
 /set tmpmin=$[trunc(tmptime/60)]%;\
 /set tmpsek=$[trunc(tmptime-(tmpmin*60))]%;\
 /if ({tmpsek}<10) /set tmpsek=0%{tmpsek}%;/endif%;\
 /_echo %{tmpmin}:%{tmpsek}


;; Heartbeat dunk dunk counter, requires stethoscope
/def -ag -mregexp -t'^Dunk dunk' status_hb_event = /set counthb=$[{counthb}+1]

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

;; Ceremony status
/def -F -i -mglob -t"You perform the ceremony." ceredonestatus=/set ceredone=C
/def -F -i -mglob -t"You start chanting." cereoffstatus=/set ceredone=_
/def -F -i -mglob -t"You start concentrating." cereoffstatus2=/set ceredone=_


;;;;;;;;;;;;;;;;;;
;; Shelter time ;;
;;;;;;;;;;;;;;;;;;

/undef shelt_is_up
/undef shelter_is_down
/def -mglob -t"This location is now surrounded in a shimmering blue forcefield." shelt_is_up = /set sheltertimer=$[time()]%;\
   /set shelterstatus=SHELTER
/def -mglob -t"The shimmering blue forcefield vanishes." shelter_is_down = /let shelttime=$[time()-sheltertimer]%;\
   /let fshelttime=$(/formattime %shelttime)%;\
   /echo -aB (TinyFugue) Shelter DOWN, timer: %fshelttime%;\
   /set shelterstatus=_______


;;;;;;;;;;;;;;;
;; Camp time ;;
;;;;;;;;;;;;;;;
; Camping can cooldown in 4:30 - 6:30, using an average of 5:30 here


;; First undef camp trigger from hilite
/undef campdone
/undef campready1
/undef campready2
/undef campready3
;; Define timer
/def -aB -mglob -t"You awaken from your short rest, and feel slightly better." campdone =\
/set camptimer=0:00%;\
/set time_camp=$[time()]%;\
/set camp_ready_time=$[time()+330]%;\
/repeat -n -1 330 /update_camp_time

;; Define function to actually update the status timer, I have no idea why it has to be like this
/def update_camp_time=/if (camptimer !~ "CAMP") /set camptimer=$(/formattime $[{camp_ready_time}-time()])%;/endif

/def -mglob -t"You stretch yourself and consider camping." campready1 = /set camptimer=CAMP%;\
   /let camptime=$[time()-time_camp]%;/let camtime=$(/formattime %camptime)%;/echo -aB Camp ready: %{camtime} 
/def -mglob -t"You feel a bit tired."                      campready2 = /set camptimer=CAMP%;\
   /let camptime=$[time()-time_camp]%;/let camtime=$(/formattime %camptime)%;/echo -aB Camp ready: %{camtime} 
/def -mglob -t"You feel like camping a little."            campready3 = /set camptimer=CAMP%;\
   /let camptime=$[time()-time_camp]%;/let camtime=$(/formattime %camptime)%;/echo -aB Camp ready: %{camtime} 


;; Start tick counter, update value every second
/repeat -1 i /set lasttick=$(/formattime $[time()-{time_this_tick}])
