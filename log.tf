/def -i set_logfile=/eval /set logfilename=$[ftime("%Y-%m-%d-%s.log",time())]
/def -i logmove=/set_logfile%;/eval /log -g /home/pi/build/logs/%logfilename%;/log -i /home/pi/build/logs/%logfilename%;/eval /echo %logfilename
;;/def -i set_day = /set daynumber=$[ftime("%d",time())]
;;/set_day
/logmove
