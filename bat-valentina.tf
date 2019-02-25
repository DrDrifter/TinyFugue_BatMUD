;; Valentina
/def -mglob -t'Your actions make you feel as a disgrace to your race.' valentina_checktarget1 = @cast info%;/echo -aB ^^^ CHECK TARGET ^^^
/def -mglob -t'You feel ashamed by the seed of evil in your actions.' valentina_checktarget2 = @cast info%;/echo -aB ^^^ CHECK TARGET ^^^

/def -mglob -t'You can feel your blood boiling as Valentina casts her spell at you!' valentina_bblood_up = @party report Burning blood ON!
/def -mglob -t'The effects of \'Burning blood\' wear off.' valentina_bblood_down = @party report Burning blood down

;; Razael/Tobias/Isael

/def -ag -mglob -t'He is protected from your attacks.' rasael_protected_personal = /echo -aB * PERSONAL PROT !!! PERSONAL PROT !!! PERSONAL PROT !!!
/def -ag -mglob -t'She is protected from your attacks.' isabel_protected_personal = /echo -aB * PERSONAL PROT !!! PERSONAL PROT !!! PERSONAL PROT !!!

/def -ag -mglob -t'He is surrounded by a blazing field of cleansing fire.' rasael_protected_field_fire = /echo -aB WARNING: NO FIRE to RASAEL/TOBIAS
/def -ag -mglob -t'She is surrounded by a blazing field of cleansing fire.' isabel_protected_field_fire = /echo -aB WARNING: NO FIRE to ISABEL

/def -ag -mglob -t'He is surrounded by a freezing field.' rasael_protected_field_cold = /echo -aB WARNING: NO COLD to RASAEL/TOBIAS
/def -ag -mglob -t'She is surrounded by a freezing field.' isabel_protected_field_cold = /echo -aB WARNING: NO COLD to ISABEL

/def -ag -mglob -t'He is surrounded by a crackling electric field.' rasael_protected_field_elec = /echo -aB WARNING: NO ELEC to RASAEL/TOBIAS
/def -ag -mglob -t'She is surrounded by a crackling electric field.' isabel_protected_field_elec = /echo -aB WARNING: NO ELEC to ISABEL

/def -ag -mglob -t'A humming aura of holy power protects Rasael.' rasael_protected_mana = /echo -aB WARNING: NO MANA to RASAEL
/def -ag -mglob -t'A humming aura of holy power protects Isabel.' isabel_protected_mana = /echo -aB WARNING: NO MANA to ISABEL
/def -ag -mglob -t'A humming aura of holy power protects Tobias.' tobias_protected_mana = /echo -aB WARNING: NO MANA to TOBIAS

/def -ag -mglob -t'A toxic aura of holy power protects Rasael.' rasael_protected_poison = /echo -aB WARNING: NO POISON to RASAEL
/def -ag -mglob -t'A toxic aura of holy power protects Isabel.' isabel_protected_poison = /echo -aB WARNING: NO POISON to ISABEL
/def -ag -mglob -t'A toxic aura of holy power protects Tobias.' tobias_protected_poison = /echo -aB WARNING: NO POISON to TOBIAS

/def -ag -mglob -t'A shocking aura of holy power protects Isabel.' isabel_protected_elec = /echo -aB WARNING: NO ELEC to ISABEL
/def -ag -mglob -t'A shocking aura of holy power protects Rasael.' rasael_protected_elec = /echo -aB WARNING: NO ELEC to RASAEL
/def -ag -mglob -t'A shocking aura of holy power protects Tobias.' tobias_protected_elec = /echo -aB WARNING: NO ELEC to TOBIAS

/def -ag -mglob -t'A choking aura of holy power protects Isabel.' isabel_protected_asph = /echo -aB WARNING: NO ASPH to ISABEL
/def -ag -mglob -t'A choking aura of holy power protects Rasael.' rasael_protected_asph = /echo -aB WARNING: NO ASPH to RASAEL
/def -ag -mglob -t'A choking aura of holy power protects Tobias.' tobias_protected_asph = /echo -aB WARNING: NO ASPH to TOBIAS

/def -ag -mglob -t'A caustic aura of holy power protects Isabel.' isabel_protected_acid = /echo -aB WARNING: NO ACID to ISABEL
/def -ag -mglob -t'A caustic aura of holy power protects Rasael.' rasael_protected_acid = /echo -aB WARNING: NO ACID to RASAEL
/def -ag -mglob -t'A caustic aura of holy power protects Tobias.' tobias_protected_acid = /echo -aB WARNING: NO ACID to TOBIAS

/def -ag -mglob -t'A burning aura of holy power protects Isabel.' isabel_protected_fire = /echo -aB WARNING: NO FIRE to ISABEL
/def -ag -mglob -t'A burning aura of holy power protects Rasael.' rasael_protected_fire = /echo -aB WARNING: NO FIRE to RASAEL
/def -ag -mglob -t'A burning aura of holy power protects Tobias.' tobias_protected_fire = /echo -aB WARNING: NO FIRE to TOBIAS

/def -ag -mglob -t'A chilling aura of holy power protects Isabel.' isabel_protected_cold = /echo -aB WARNING: NO COLD to ISABEL
/def -ag -mglob -t'A chilling aura of holy power protects Rasael.' rasael_protected_cold = /echo -aB WARNING: NO COLD to RASAEL
/def -ag -mglob -t'A chilling aura of holy power protects Tobias.' tobias_protected_cold = /echo -aB WARNING: NO COLD to TOBIAS

/def -mglob -t'^Cherub, a High Angel, blazing with divine flames of purity' cherub1 = @party report SHOOT COLD TO CHERUB
/def -mglob -t'^Cherub, a High Angel, enclosed in a crackling field of electricity' cherub2 = @party report SHOOT MANA TO CHERUB
/def -mglob -t'^Cherub, a High Angel, surrounded by a field of circulatin rocks and gravel' cherub3 = @party report SHOOT ACID TO CHERUB
/def -mglob -t'^Cherub, a High Angel, surrounded by a field of circulating gravel and rocks' cherub4 = @party report SHOOT ACID TO CHERUB
/def -mglob -t'^Cherub, a High Angel, encapsulated by a vacillating layer water' cherub5 = @party report SHOOT FIRE TO CHERUB
/def -mglob -t'^Cherub, a High Angel, encapsulated by a vacillating layer of freezing watef' cherub6 = @party report SHOOT FIRE TO CHERUB
;; Define command:
;; command ll 'll' is a command-alias to 'grep -q 'is protected|is surrounded|protects' look at isabel;grep -q 'is protected|is surrounded|protects' look at tobias;grep -q 'is protected|is surrounded|protects' look at rasael'.
;;/def -mglob -t'\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\**' rounds_isabel = @ll

/def -mglob -t'The thick white haze subsides.' haze_lifted = @party report Haze lifted!

;; Gatekeeper
;;Gatekeeper raises Sword of Clouds to the heights and mutters some magic words.
;;White magic enfolds <playername>'s body and in a blink of eye he is turned into a
;;glass statue.
/def -mglob -t'PUFF! Glaced * vanishes into thin air.' partymember_glaced = /echo -aB WARNING: PARTYMEMBER GLACED!

