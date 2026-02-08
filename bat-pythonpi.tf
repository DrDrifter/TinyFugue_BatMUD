;; Wrapper script for python hp/sp display
;; Example shell call to script:
;; /home/pi/build/python/batmud.py <hp> <hpmax> <sp> <spmax>

/loaded bat-pythonpi.tf

/set pyfile=/home/pi/build/python/batmud.py

;; This regexp maches my short score and calls async quote for the python script to light up leds
/def -F -mregexp -t"^hp:\s(-?[0-9]+)\s\(([0-9]+)\)\s\[[\-+0-9]*\]\ssp:\s(-?[0-9]+)\s\((-?[0-9]+)\)\s\[[\-+0-9]*\]\sep:\s-?[0-9]+\s\([0-9]+\)\s\[[\-+0-9]*\]\scash:\s[0-9]+\s\[[+\-0-9]*\]\sexp:\s[0-9]+\s\[[+\-0-9]*\]$" sc_capture = \
	/let hp=%P1%; \
	/let maxhp=%P2%; \
	/let sp=%P3%; \
	/let maxsp=%P4%; \
	/quote !%{pyfile} %{hp} %{maxhp} %{sp} %{maxsp}

;Some examples of system calls
;;/SYS %{ARSCRIPTFILE} %{ARDBFILE} "%{_sql}"
;;/LET _result=$(/QUOTE -S /ECHO !bash %{BEHORUN} %{_line})


