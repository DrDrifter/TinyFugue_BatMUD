/set lasttick=0
/set damage_type=null
/set offensive_target=null

#/status_rm @world
#/status_rm @active
#/status_rm @mail
#/status_rm @read
/status_add -c @more:8
/status_add -A@more "[" damtype:12
#/status_add -Adamtype padding:79
/status_add -Adamtype "]" padding:2
/status_add -Apadding "(" lasttick:4
/status_add -Alasttick " sec )" padding2:10
/status_add -Apadding2 @log
/clock on

# HP:459/459 SP:1449/1469 [-20] EP:285/285

/def -p20 -mregexp -t'^HP:-?[0-9]+/[0-9]+ SP:-?[0-9]+/-?[0-9]+ \[\+([0-9]+)\] EP:-?[0-9]+/-?[0-9]+' status_tick_event =\
/let last_tick_amount=%{P1}%;\
/if (last_tick_amount>30) \
  /set time_last_tick=%{time_this_tick}%;\
  /set time_this_tick=$[time()]%;\
  /set time_tick=in $(/formattime $[{time_this_tick}-{time_last_tick}])%;\
  /echo -aB tick event, gain: %{last_tick_amount} last: %{time_tick}%;\
/endif

/repeat -1 i /set lasttick=$(/formattime $[time()-{time_this_tick}])
