
;The ship shudders as it plows into the side of *
;The ship shudders as it plows into the side of Curious Rose, splintering its hull.
;Nella tells you 'We missed tha *
;Nella tells you 'Tha ship 'as been shielded.'
;Nella tells you 'The ship's protective shield drops.'

;You swing your hands in a pattern of disruption while muttering 'aquar dminop'
;Something weird happens just as your spell is about to take effect, and it simply drains away.

;You swing your hands in a pattern of disruption while muttering 'shatter aquar sphorq'
;The magi on board the Curious Rose managed to counter your spell!

;You swing your hands in a pattern of disruption while muttering 'pinoe vinoe minoe aquar'
;The magi on board the Curious Rose managed to counter your spell!

;You swing your hands in a pattern of disruption while muttering 'lnarel nox aquar'
;The magi on board the Curious Rose managed to counter your spell!



;;;;;;;;;; Class Identification

/DEF -mregexp -t"^The ([A-Z]+) Boat " ship_c1_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C1)@{n} %{PR}

/DEF -mregexp -t"^The ([A-Z]+) (Sloop|Ferry|Lugger|Cutter|Cog|Curraugh|Ketch|Brig) " ship_c2_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C2)@{n} %{PR}

/DEF -mregexp -t"^The ([A-Z]+) (Schooner|Clipper|Swiftship|Brigantine|Corvette|Knorr|Caravel|Balinger) " ship_c3_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C3)@{n} %{PR}

/DEF -mregexp -t"^The ([A-Z]+) (Frigate|Merchantman|Whaler|Carrack|Crayer|Buza|Barque|Nef) " ship_c4_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C4)@{n} %{PR}

/DEF -mregexp -t"^The ([A-Z]+) (Galleon|Galleass|Man-of-war|Privateer|Indiaman|Viking Longship|Bireme|Dromond) " ship_c5_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C5)@{n} %{PR}

/DEF -mregexp -t"^The ([A-Z]+) (War Galleon|Destroyer|Juggernaut|Corsair|Dreadnought|Viking Warship|Trireme|Drakkar) " ship_c6_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C6)@{n} %{PR}

;;;;;;;;; Emerald Disc Identification

/DEF -mregexp -F -i -t"^This tiny disc is little more than a" ship_disc1_sub = \
	/ECHO -p @{BCwhite}Disc 1@{n}

/DEF -mregexp -F -i -t"^This disc is really a tiny ring" ship_disc2_sub = \
	/ECHO -p @{BCwhite}Disc 2@{n}

/DEF -mregexp -F -i -t"^This disc is really a very small ring" ship_disc3_sub = \
	/ECHO -p @{BCwhite}Disc 3@{n}

/DEF -mregexp -F -i -t"^This disc is really a small ring" ship_disc4_sub = \
	/ECHO -p @{BCwhite}Disc 4@{n}

/DEF -mregexp -F -i -t"^This disc is really a fair-sized ring" ship_disc5_sub = \
	/ECHO -p @{BCwhite}Disc 5@{n}

/DEF -mregexp -F -i -t"^This disc is really a fairly large ring" ship_disc6_sub = \
	/ECHO -p @{BCwhite}Disc 6@{n}

/DEF -mregexp -F -i -t"^This disc is really a large ring" ship_disc7_sub = \
	/ECHO -p @{BCwhite}Disc 7@{n}

/DEF -mregexp -F -i -t"^This disc is really a very large ring" ship_disc8_sub = \
	/ECHO -p @{BCwhite}Disc 9@{n}

/DEF -mregexp -F -i -t"^This disc is really a huge ring" ship_disc9_sub = \
	/ECHO -p @{BCwhite}Disc 9@{n}

/DEF -mregexp -F -i -t"^This disc is really a massive ring" ship_disc10_sub = \
	/ECHO -p @{BCwhite}Disc 10@{n}


;
; AutoCruise by Hair
;
/DEF -i -ag -h"send {autocruise}*" ship_auto_cruise = \
	/IF (regmatch("^([0-9]*)x([0-9]*)y$", %{-1} ) ) \
		/SET ship_autocruise=1 %; \
		/SET ac_flag=1 %; \
		/SET ac_destx=%{P1} %; \
		/SET ac_desty=%{P2} %; \
		/SEND @whereami %; \
	/ELSE /ECHO -aCbgyellow,Cblack *** Usage:  autocruise 123x123y *** %; \
	/ENDIF

/DEF -i -mregexp -ag -t"^You are in (.*) on the continent of ([A-Za-z]*). \(Coordinates\: ([0-9]*)x, ([0-9]*)y\; Global\: ([0-9]*)x, ([0-9]*)y\)$" get_xy_coordinates = \
	/IF (%{ship_autocruise} == 1) \
		/SET ship_xcoord=%{P3} %; \
		/SET ship_ycoord=%{P4} %; \
		/do_auto_cruise %; \
	/ELSE /ECHO %{P0} %; \
	/ENDIF

/DEF -i do_auto_cruise = \
	/SET ship_autocruise=0 %; \
	/LET ac_xdiff=$[%{ac_destx}-%{ship_xcoord}] %; \
	/LET ac_ydiff=$[%{ac_desty}-%{ship_ycoord}] %; \
	/IF (%{ac_xdiff} < 0) /SET ac_xdir=west %; \
	/ELSEIF (%{ac_xdiff} > 0) /SET ac_xdir=east %; \
	/ELSEIF (%{ac_xdiff} == 0) /SET ac_xdir=nil %; \
	/ENDIF %; \
	/IF (%{ac_ydiff} < 0) /SET ac_ydir=north %; \
	/ELSEIF (%{ac_ydiff} > 0) /SET ac_ydir=south %; \
	/ELSEIF (%{ac_ydiff} == 0) /SET ac_ydir=nil %; \
	/ENDIF %; \
	/LET ac_xdiff=$[abs(%{ac_xdiff})] %; \
	/LET ac_ydiff=$[abs(%{ac_ydiff})] %; \
	/IF (%{ac_xdir} =~ "nil") \
		/IF (%{ac_ydir} =~ "nil") \
			/SET ship_autocruise=0 %; \
		/ELSE /SEND @cruise %{ac_ydiff} %{ac_ydir} %; \
		/ENDIF %; \
	/ELSEIF (%{ac_ydir} =~ "nil") \
		/IF (%{ac_xdir} =~ "nil") \
			/SET ship_autocruise=0 %; \
		/ELSE /SEND @cruise %{ac_xdiff} %{ac_xdir} %; \
		/ENDIF %; \
	/ELSEIF (%{ac_xdiff} > %{ac_ydiff}) \
		/SET ship_autocruise=1 %; \
		/SEND @cruise %{ac_ydiff} %{ac_ydir}%{ac_xdir} %; \
	/ELSEIF (%{ac_ydiff} > %{ac_xdiff}) \
		/SET ship_autocruise=1 %; \
		/SEND @cruise %{ac_xdiff} %{ac_ydir}%{ac_xdir} %; \
	/ENDIF

/DEF -i -mregexp -ag -t"(.*) tells you \'We\'ve gon\' as far towards ([a-z]*) as ask\'d, (.*).\'$" continue_autocruise = \
	/IF (%{ship_autocruise} == 1) \
		/SEND @whereami %; \
	/ELSE /ECHO %{P0} %; \
	/ENDIF %; \
	/IF (%{ac_flag} == 1 & %{ship_autocruise} == 0) \
		/ECHO -aCbgyellow,Cblack *** Autocruise Complete *** %; \
		/SET ac_flag=0 %; \
	/ENDIF

/DEF -i -mregexp -t"(.*) whispers to you \'I din\'nae think we\'ll get verra far wit\' tha anchor down.\'$" ac_oops_anchored = \
	/IF (%{ship_autocruise} == 1) \
		/SEND @ship launch %; \
		/SEND @whereami %; \
	/ENDIF

/DEF -i -mregexp -t"(.*) tells you \'We\'ve can\'nae go ena more towards (.*).\'$" ac_terrain_block = \
	/SET ship_autocruise=0 %; \
	/SET ac_flag=0 %; \
	/ECHO -aCbgyellow,Cblack *** Autocruise Aborted.  Cannot clear terrain ***




;;; Bead map parsing
/def -ag -F -mregexp -t"^\s\s_\.\-\._\.\-\._\.\-\._\.\-\._\.\-\._\.\-\.\_$" map_start=\ 
/def -ag -F -mregexp -t"^\s\s.\s\s\s(.{17})" map_line = /echo %P1
/def -ag -F -mregexp -t"^\s\s\-\._\.\-\._\.\-\._\.\-\._\.\-\._\.\-\.\_\.\-$" map_end = /echo -aB%;/undef map_line
