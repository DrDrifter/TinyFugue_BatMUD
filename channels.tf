;; Original source (Woocca)
;; http://users.aalto.fi/~ejarnfor/trigu/channels.tf

/require -q at_quit.tf
/require -q history_saver.tf
/loaded channels.tf

;; Get rid of a lot of spam
/def -ag -h'BGTRIG' bgtrig_gag

/def addchannel = \
	/if (%{1} =/ "*\+") /let channelsay= say%;\
	/endif%;\
;;	/histsize -w$[textencode(%{1})] 500%;\
	/test addworld("$[textencode(%{1})]","","","","","","","e")%;\
	/def -aGg -h'CONNECT' -n1 addchannel_gagconnect%;\
	/connect -lb $[textencode(%{1})]%;\
	/def -mregexp -ag -t"^[A-Z][A-Za-z \'-]{0,20} [\[\{\<\(]$[escape("+",%{1})][]\}\>\)]\: " channelgrab_$[textencode(%{1})] = /echo -w$[textencode(%{1})] -p @{BCwhite}[$$[ftime("%%H:%%M")]]@{n} %%*%;\
	/def -mregexp -ag -t'^[\{\(\[\<]$[escape("+",%{1})][\]\}\)\>]\: ' channelgrab2_$[textencode(%{1})] = /echo -w$[textencode(%{1})] -p @{BCwhite}[$$[ftime("%%H:%%M")]]@{n} %%*%;\
	/echo -w$[textencode(%{1})] -aGBCwhite === Channel [%{1}] ===%;\
	/quote -S /echo -w$[textencode(%{1})] -p - '"saved_history-w$[textencode(%{1})].log"%;\
	/def -h'SEND *' -w$[textencode(%{1})] channelsend_$[textencode(%{1})] = /if (strlen(%%*) > 0) /send -wbatmud -h %{1}%{channelsay} %%*%%;\
							/endif%%;\
							/test prompt("%{1}> ")%;\
	/at 00:00:00 /echo -w$[textencode(%{1})] -aBCwhite == Date now $$[ftime("%%d.%%m.%%Y")] ==%%;/at 00:00:00 /echo -w$[textencode(%{1})] -aBCwhite == Date now $$[ftime("%%d.%%m.%%Y")] ==%;\
	/set channel_$[textencode(%{1})]_atpid=%?%;\
	/quit_add /history_save -w$[textencode(%{1})] 200

/def rmchannel = \
	/undef channelgrab_$[textencode(%{1})]%;\
	/undef channelgrab2_$[textencode(%{1})]%;\
	/undef channelsend_$[textencode(%{1})]%;\
	/kill %{channel_$[textencode(%{1}]_atpid}%;\
	/history_save -w$[textencode(%{1})] 200%;\
	/quit_remove /history_save -w$[textencode(%{1})] 200%;\
	/unworld $[textencode(%{1})]

/def key_nkp* = /fg ->
/def key_nkp/ = /fg -<

