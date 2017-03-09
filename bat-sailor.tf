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
