
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

/loaded bat-sailor.tf

/require textutil.tf

;;;;;;;;;;;;; Ship combat and misc stuff

/DEF -F -i -p9 -P0Crgb340 -t"There is a faint, orange glow" tradlane_lite =
/DEF -F -mregexp -p9 -i -aBCgreen -t"^The ship (creaks loudly|shudders|buckles) as it plows into the side of" ship_hit_lite =
/DEF -F -p9 -i -aBCred -t"The hull * as * rams into the ship with a *" ship_got_rammed_lite =
/DEF -F -p9 -i -aBCyellow -t"* tells you \'We were almost hit by tha * (Cap\'n|Sir)!\'" ship_almost_got_rammed_lite =
/DEF -F -p9 -i -aBCbgred,Cyellow -t"The ship buckles as it plows into the side of * tearing long*" ship_really_hurt_lite =
/DEF -F -p9 -i -aBCbgred,Cyellow -t"The hull buckles dangerously as * rams into the ship*" ship_really_hurt_lite2 =
/DEF -F -p9 -i -aBCcyan -t"* tells you 'We missed tha*" ship_miss_lite =


/DEF -ag -h"send {autoram}*" ship_auto_ram = \
	/SET ram_target=%{-1} %; \
	/SEND @combat ram %{-1} %; \
	/DEF -p10 -F -i -aBCcyan -t"* tells you \'We missed tha*" ship_ram_miss = \
		/SEND @combat ram %%{ram_target} %; \
	/DEF -F -mregexp -i -t"^The ship (creaks loudly|shudders|buckles) as it plows into the side of" ship_ram_hit = \
		/SEND @combat ram %%{ram_target}

;; This also works, but i generally just use ramming instead
/DEF -ag -h"send {autocannon}*" ship_auto_cannon = \
	/SET cannon_target=%{2} %; \
	/SET cannon_ammo=%{3} %; \
	/IF (%{cannon_ammo} =~ "") \
		/SET cannon_ammo=standard %; \
	/ENDIF %; \
	/SEND @combat cannon %{cannon_target} %{cannon_ammo} %; \
	/ECHO -aCbgyellow,Cblack *** Firing on %{cannon_target} with %{cannon_ammo} %; \
	/DEF -F -i -t"There is a \*boom\* and the deck vibrates slightly." ship_cannon_fired = \
		/REPEAT -2.5 1 /SEND @combat cannon %%{cannon_target} %%{cannon_ammo} %%; \
		/ECHO -aCbgyellow,Cblack *** Firing on %%{cannon_target} with %%{cannon_ammo} %; \
	/DEF -F -i -t"* tells you \'Tha cannon misfired! Twas\'nae any effect!\'" ship_cannon_misfired = \
		/SEND @combat cannon %%{cannon_target} %%{cannon_ammo} %%; \
		/ECHO -aCbgyellow,Cblack *** Firing on %%{cannon_target} with %%{cannon_ammo}

/DEF -ag -h"send {cammo}*" ship_set_ammo = \
	/IF /TEST $[%{-1} !~ ""] %; \
		/THEN /SET cannon_ammo=%{-1} %; \
		/ECHO -aCbgyellow,Cblack *** Cannon ammo set to %{-1} *** %; \
	/ELSE \
		/SEND @combat supplies short %; \
	/ENDIF


;;;;;;;;;; Class Identification

/DEF -mregexp -t"^(The|the) ([A-Z]+) Boat " ship_c1_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C1)@{n} %{PR}

/DEF -mregexp -t"^(The|the) ([A-Z]+) (Sloop|Ferry|Lugger|Cutter|Cog|Curraugh|Ketch|Brig) " ship_c2_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C2)@{n} %{PR}

/DEF -mregexp -t"^(The|the) ([A-Z]+) (Schooner|Clipper|Swiftship|Brigantine|Corvette|Knorr|Caravel|Balinger) " ship_c3_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C3)@{n} %{PR}

/DEF -mregexp -t"^(The|the) ([A-Z]+) (Frigate|Merchantman|Whaler|Carrack|Crayer|Buza|Barque|Nef) " ship_c4_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C4)@{n} %{PR}

/DEF -mregexp -t"^(The|the) ([A-Z]+) (Galleon|Galleass|Man-of-war|Privateer|Indiaman|Viking Longship|Bireme|Dromond) " ship_c5_sub = \
	/SUBSTITUTE -p %{P0}@{BCwhite}(C5)@{n} %{PR}

/DEF -mregexp -t"^(The|the) ([A-Z]+) (War Galleon|Destroyer|Juggernaut|Corsair|Dreadnought|Viking Warship|Trireme|Drakkar) " ship_c6_sub = \
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



;; This bit is sorta experimental, along with the ship move stuff below
/SET fix_toggle=0

/DEF -ag -h"send {autofix}" ship_auto_fix = \
	/SEND @@ship repair %; \
        /DEF -mregexp -F -t"([A-Za-z]+) tells you \'Tha crew are patchin\' up tha ([a-z]+) now, (Cap\'n|Sir).\'" repair_more = \
                /SET fix_toggle=1 %%; \
		/REPEAT -1 1 /ECHO %{fix_toggle} %; \
        /DEF -F -t"* tells you \'All repairs finish\'d, (Cap\'n|Sir)!" repair_done = \
                /SET fix_toggle=0

/SET ship_move=view
/SET ship_toggle=on
/SET ship_combat=on

/DEF sm = \
        /IF (%{*} !~ "") \
                /SET ship_move=%{*} %; \
                /ECHO -p ship_move is now set to @{Cyellow}%{*}@{n} %; \
        /ELSE \
                /IF (%{ship_toggle}=~"on") \
                        /SET ship_toggle=off %; \
                        /ECHO -p Ship command is now @{Cyellow}OFF@{n}. %; \
                /ELSEIF (%{ship_toggle}=~"off") \
                        /SET ship_toggle=on %; \
                        /ECHO -p Ship command is now @{Cyellow}ON@{n}. %; \
                /ENDIF %; \
        /ENDIF

/SET shipAutoscan=0

/DEF -i -ag -h"send {autoscan}" ship_autoscan = \
	/SET shipAutoscan=1 %; \
	/SEND @ship scan

/DEF -mregexp -F -t"^  ([A-Za-z0-9 '-]*) \[H\:([0-9]*)(.*)?\] \{([a-z0-9]*)( \<aggressive\>)?} \(pirate (.*)\)" ship_scan_name = \
	/IF (%{shipAutoscan} == 1) \
		/ECHO -aBCred SHIP NAME: %{P4} %; \
		/SET ram_target=%{P4} %; \
		/SEND pursue %{ram_target} %; \
	/ENDIF

/DEF -mregexp -F -t"^  ([A-Za-z0-9 '-]*) \{([a-z0-9]*)( \<aggressive\>)?} \(pirate (.*)\)" ship_scan_name2 = \
	/IF (%{shipAutoscan} == 1) \
		/ECHO -aBCred SHIP NAME: %{P2} %; \
		/SET ram_target=%{P2} %; \
		/SEND pursue %{ram_target} %; \
	/ENDIF

/DEF -mregexp -p10 -F -i -t"^([A-Za-z]*) tells you \'Aye aye, (Cap\'n|Sir), layin\' in pursuit now!\'$" ship_pursue = \
/echo -aBCyellow YES %; \
	/IF (%{shipAutoscan} == 1) \
		/REPEAT -2 1 /ship_auto_ram trash %{ram_target} %; \
		/SET shipAutoscan=0 %; \
	/ENDIF

/DEF -i -ag -h"send {com}" automatic_compass = \
	/SET auto_compass=1 %; \
	/SEND compass

/SET ac_dir=NULL

/DEF -mregexp -F -i -t"^The needle is pointing ([a-z]*).$" autocompass_direction = \
	/IF (%{auto_compass} == 1) \
		/IF (%{ac_dir} !~ %{P1}) \
			/SET ac_dir=%{P1} %; \
			/SEND cruise %{P1} %; \
		/ELSE /ECHO -aBCyellow Continuing %{ac_dir}  %; \
		/ENDIF %; \
	/ENDIF

/DEF -mregexp -F -i -t"^The needle seems to have stopped dead.$" ship_range_zero = \
	/IF (%{auto_compass} == 1) \
		/ship_autoscan %; \
	/ENDIF

/DEF -mregexp -F -i -t"^The dial reads\: ([0-9.]*)" get_ship_range = \
	/IF (%{P1} <= 2.6 & %{auto_compass} == 1) \
		/ship_autoscan %; \
	/ENDIF

/DEF -mregexp -p10 -F -i -t"^([A-Za-z]*) tells you \'([A-Za-z0-9 ']*) tis already disabled, (Cap\'n|Sir).\'" ship_clear_variables = \
	/SET auto_compass=0 %; \
	/SET ram_target= %; \
	/SET ac_dir=NULL %; \
	/SET shipAutoscan=0

/DEF -mregexp -p10 -F -t"^([A-Za-z]*) tells you \'We destroy\'d tha ([A-Za-z0-9 ']*)\!\!\!\'" ship_target_destroyed = \
	/ECHO -aCbgyellow,Cblack *** Clearing Auto Compass variables *** %; \
	/ship_clear_variables

/DEF -mregexp -p10 -F -t"^([A-Za-z]*) tells you \'Anchorin\' tha ship, (Cap\'n|Sir)\!\'" ship_secure_clear_ac = \
	/IF (%{auto_compass} == 1) \
		/ECHO -aCbgyellow,Cblack *** Clearing Auto Compass *** %; \
		/SET auto_compass=0 %; \
	/ENDIF

;;; Bead map parsing
/set beadmapfile=~/build/tf-lib/beadmap.txt
/set warn_curly_re=off
/def -ag -F -mregexp -t"^\s\s_\.\-\._\.\-\._\.\-\._\.\-\._\.\-\._\.\-\.\_$" map_start=/echo -ab Map_start%;/set map_echo=1%;/unset map_write
;;/def -F -mregexp -t"^\s\s.\s\s\s(.{17})\s\s." map_line = /if (%{map_echo} == 1) /set map_pattern=$[strcat({map_pattern},"\n",%P1)]%;/endif
/def -F -mregexp -t"^\s\s.\s\s\s(.{17})\s\s." map_line =\
   /if (%{map_echo} == 1)\
      /if (%{map_write} == 1)\
         /echo %P1%|/writefile -a %beadmapfile%;\
      /else \
         /echo %P1%|/writefile %beadmapfile%;\
         /set map_write=1%;\
      /endif%;\
   /endif
/def -ag -F -mregexp -t"^\s\s\-\._\.\-\._\.\-\._\.\-\._\.\-\._\.\-\.\_\.\-$" map_end=\
   /echo -aB Map end%;\
   /unset map_echo%;\
;;   /echo %map_pattern%|/writefile %beadmapfile

/def mapdebug = /quote -S /echo -aB !/home/pi/build/parse_map.pl


