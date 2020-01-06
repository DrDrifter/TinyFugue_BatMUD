;; Hair's Sword of Wonders Trig.
;; All credit goes to Hair
/loaded bat-sow.tf

/DEF -ag -h"send {sow}*" sow_tuner = \
	/IF (strlen(%{-1}) < 3) \
		/sow_display_help %; \
	/ELSE \
		/LET _sowType=$[substr(%{-1}, 0, 3)] %; \
		/LET _sowType=$[tolower(%{_sowType})] %; \
		/DEF -mregexp -n1 -F -p999 -ag -t"^^made of red crystal and the pommel is an octagonal ([a-z ]*) gemstone\\.$$" sow_get_current_type = \
			/IF (%%{P1} =~ "disgusting green") /LET _sowCurrent=1 %%; \
			/ELSEIF (%%{P1} =~ "crystal clear") /LET _sowCurrent=2 %%; \
			/ELSEIF (%%{P1} =~ "coal black") /LET _sowCurrent=3 %%; \
			/ELSEIF (%%{P1} =~ "sparkling yellow") /LET _sowCurrent=4 %%; \
			/ELSEIF (%%{P1} =~ "midnight black") /LET _sowCurrent=5 %%; \
			/ELSEIF (%%{P1} =~ "cold blue") /LET _sowCurrent=6  %%; \
			/ELSEIF (%%{P1} =~ "brilliant red") /LET _sowCurrent=7 %%; \
			/ELSEIF (%%{P1} =~ "shiny silver") /LET _sowCurrent=8 %%; \
			/ELSEIF (%%{P1} =~ "dull grey") /LET _sowCurrent=9 %%; \
			/ENDIF %%; \
			/sow_do_change %{_sowType} %%{_sowCurrent} %; \
		/SEND @grep 'made of red crystal and the pommel is an octagonal' look at sword of wonders %; \
	/ENDIF 

/DEF sow_display_help = \
	/ECHO -p @{BCyellow}[SOW]@{n}@{BCwhite}: sow <type>@{n} %; \
	/ECHO -p @{BCyellow}[SOW]@{n}@{BCwhite}: <type> can be the first 3 letters of the damage type wanted.@{n} %; \
	/ECHO -p @{BCyellow}[SOW]@{n}@{BCwhite}: Valid types are: acid, psionic, asphyxiation, electric, poison,@{n} %; \
	/ECHO -p @{BCyellow}[SOW]@{n}@{BCwhite}: cold, fire, mana, physical@{n}

/DEF sow_do_change = \
	/IF (%{1} =~ "aci") /LET _sowType=1 %; \
	/ELSEIF (%{1} =~ "psi") /LET _sowType=2 %; \
	/ELSEIF (%{1} =~ "asp") /LET _sowType=3 %; \
	/ELSEIF (%{1} =~ "ele") /LET _sowType=4 %; \
	/ELSEIF (%{1} =~ "poi") /LET _sowType=5 %; \
	/ELSEIF (%{1} =~ "col") /LET _sowType=6 %; \
	/ELSEIF (%{1} =~ "fir") /LET _sowType=7 %; \
	/ELSEIF (%{1} =~ "man") /LET _sowType=8 %; \
	/ELSEIF (%{1} =~ "phy") /LET _sowType=9 %; \
	/ELSE \
		/sow_display_help %; \
		/BREAK %; \
	/ENDIF %; \
	/LET _sowCurrent=%{2} %; \
	/LET _sowDiff=$[%{_sowCurrent}-%{_sowType}] %; \
	/IF (%{_sowDiff} > 4) \
		/LET _sowDirection=left %; \
		/LET _sowTurns=$[9-%{_sowDiff}] %; \
		/LET _static=0 %; \
	/ELSEIF (%{_sowDiff} > 0 & %{_sowDiff} < 5) \
		/LET _sowDirection=right %; \
		/LET _sowTurns=%{_sowDiff} %; \
		/LET _static=0 %; \
	/ELSEIF (%{_sowDiff} < -4) \
		/LET _sowDirection=right %; \
		/LET _sowTurns=$[abs(9+%{_sowDiff})] %; \
		/LET _static=0 %; \
	/ELSEIF (%{_sowDiff} < 0 & %{_sowDiff} > -5) \
		/LET _sowDirection=left %; \
		/LET _sowTurns=$[abs(%{_sowDiff})] %; \
		/LET _static=0 %; \
	/ELSEIF (%{_sowDiff} == 0) \
		/LET _static=1 %; \
	/ENDIF %; \
	/IF (%{_static} == 1) \
		/SEND turn pommel left %; \
		/SEND turn pommel right %; \
	/ELSE \
		/SEND %{_sowTurns} turn pommel %{_sowDirection} %; \
	/ENDIF

/DEF -mregexp -F -p10 -t"^made of red crystal and the pommel is an octagonal ([a-z ]*) gemstone\.$" sow_type_sub = \
	/IF (%{P1} =~ "disgusting green") \
		/SUBSTITUTE -p %* @{BCgreen}(Acid)@{n} %; \
	/ELSEIF (%{P1} =~ "crystal clear") \
		/SUBSTITUTE -p %* @{Ccyan}(Psionic)@{n} %; \
	/ELSEIF (%{P1} =~ "coal black") \
		/SUBSTITUTE -p %* @{BCmagenta}(Asphyxiation)@{n} %; \
	/ELSEIF (%{P1} =~ "sparkling yellow") \
		/SUBSTITUTE -p %* @{BCcyan}(Electric)@{n} %; \
	/ELSEIF (%{P1} =~ "midnight black") \
		/SUBSTITUTE -p %* @{Cgreen}(Poison)@{n} %; \
	/ELSEIF (%{P1} =~ "cold blue") \
		/SUBSTITUTE -p %* @{BCblue}(Cold)@{n} %; \
	/ELSEIF (%{P1} =~ "brilliant red") \
		/SUBSTITUTE -p %* @{BCred}(Fire)@{n} %; \
	/ELSEIF (%{P1} =~ "shiny silver") \
		/SUBSTITUTE -p %* @{BCyellow}(Mana)@{n} %; \
	/ELSEIF (%{P1} =~ "dull grey") \
		/SUBSTITUTE -p %* @{BCwhite}(Physical)@{n} %; \
	/ENDIF %; \
