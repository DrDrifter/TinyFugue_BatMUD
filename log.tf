/def -i set_logfile=/eval /set logfilename=$[ftime("%Y-%m-%d.log",time())]
/def -i logmove=/set_logfile%;/eval /log -g -i /home/pi/logs/%logfilename%;/eval /echo %logfilename
/def -i set_day = /set daynumber=$[ftime("%d",time())]
/set_day
/logmove
