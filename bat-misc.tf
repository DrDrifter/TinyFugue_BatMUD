;; Skie
/def -mglob -t"You BLEED and suffer." skie_special = @emote bleeding like a teenage working girl :'(

;; Henry stuff
/def -mglob -t'Henry waves his hand over * and says \'BEGONE!\'' henry_banish = @party say Henry banished %{1}!

;; Soth special
/def -mglob -t'* is overwhelmed with pain as Lord Soth casts a Death spell on *' soth_death = @party say [ %{1} ] is now DEATH target!

;; Jane
/def -mglob -t'Jane the Goddess snaps her fingers and * is consumed by bright white light.' jane_banished = @party say Jane banished [ %{1} ] 

;; Valentina

;;Your actions make you feel as a disgrace to your race.
;;You feel ashamed by the seed of evil in your actions.

;; She is protected from your attacks.

/def -mglob -t'You can feel your blood boiling as Valentina casts her spell at you!' valentina_bblood_up = @party report Burning blood ON!
/def -mglob -t'The effects of \'Burning blood\' wear off.' valentina_bblood_down = @party report Burning blood down

/def -mglob -t'He is surrounded by a blazing field of cleansing fire.' rasael_protected_field_fire = @party report WARNING: NO FIRE to RASAEL/TOBIAS
/def -mglob -t'She is surrounded by a blazing field of cleansing fire.' isabel_protected_field_fire = /echo WARNING: NO FIRE to ISABEL

/def -mglob -t'He is surrounded by a freezing field.' rasael_protected_field_cold = @party report WARNING: NO COLD to RASAEL/TOBIAS
/def -mglob -t'She is surrounded by a freezing field.' isabel_protected_field_cold = /echo WARNING: NO COLD to ISABEL

/def -mglob -t'He is surrounded by a crackling electric field.' rasael_protected_field_elec = /echo WARNING: NO ELEC to RASAEL/TOBIAS
/def -mglob -t'She is surrounded by a crackling electric field.' isabel_protected_field_elec = /echo WARNING: NO ELEC to ISABEL

/def -mglob -t'A humming aura of holy power protects Rasael.' rasael_protected_mana = @party report WARNING: NO MANA to RASAEL
/def -mglob -t'A humming aura of holy power protects Isabel.' isabel_protected_mana = /echo WARNING: NO MANA to ISABEL
/def -mglob -t'A humming aura of holy power protects Tobias.' tobias_protected_mana = @party report WARNING: NO MANA to TOBIAS

/def -mglob -t'A toxic aura of holy power protects Rasael.' rasael_protected_poison = @party report WARNING: NO POISON to RASAEL
/def -mglob -t'A toxic aura of holy power protects Isabel.' isabel_protected_poison = /echo WARNING: NO POISON to ISABEL
/def -mglob -t'A toxic aura of holy power protects Tobias.' tobias_protected_poison = @party report WARNING: NO POISON to TOBIAS

/def -mglob -t'A shocking aura of holy power protects Isabel.' isabel_protected_elec = /echo WARNING: NO ELEC to ISABEL
/def -mglob -t'A shocking aura of holy power protects Rasael.' rasael_protected_elec = /echo WARNING: NO ELEC to RASAEL
/def -mglob -t'A shocking aura of holy power protects Tobias.' tobias_protected_elec = @party report WARNING: NO ELEC to TOBIAS

/def -mglob -t'A choking aura of holy power protects Isabel.' isabel_protected_asph = /echo WARNING: NO ASPH to ISABEL
/def -mglob -t'A choking aura of holy power protects Rasael.' rasael_protected_asph = @party report WARNING: NO ASPH to RASAEL
/def -mglob -t'A choking aura of holy power protects Tobias.' tobias_protected_asph = @party report WARNING: NO ASPH to TOBIAS

/def -mglob -t'A caustic aura of holy power protects Isabel.' isabel_protected_acid = /echo -aB WARNING: NO ACID to ISABEL
/def -mglob -t'A caustic aura of holy power protects Rasael.' rasael_protected_acid = /echo -aB WARNING: NO ACID to RASAEL
/def -mglob -t'A caustic aura of holy power protects Tobias.' tobias_protected_acid = /echo -aB report WARNING: NO ACID to TOBIAS

/def -mglob -t'A burning aura of holy power protects Isabel.' isabel_protected_fire = /echo -aB WARNING: NO FIRE to ISABEL
/def -mglob -t'A burning aura of holy power protects Rasael.' rasael_protected_fire = /echo -aB WARNING: NO FIRE to RASAEL
/def -mglob -t'A burning aura of holy power protects Tobias.' tobias_protected_fire = /echo -aB WARNING: NO FIRE to TOBIAS

/def -mglob -t'A chilling aura of holy power protects Isabel.' isabel_protected_cold = /echo -aB WARNING: NO COLD to ISABEL
/def -mglob -t'A chilling aura of holy power protects Rasael.' rasael_protected_cold = /echo -aB WARNING: NO COLD to RASAEL
/def -mglob -t'A chilling aura of holy power protects Tobias.' tobias_protected_cold = /echo -aB WARNING: NO COLD to TOBIAS

;; Define command:
;; command ll 'll' is a command-alias to 'grep -q 'is protected|is surrounded|protects' look at isabel;grep -q 'is protected|is surrounded|protects' look at tobias;grep -q 'is protected|is surrounded|protects' look at rasael'.
;;/def -mglob -t'\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\**' rounds_isabel = @ll

/def -mglob -t'The thick white haze subsides.' haze_lifted = @party report Haze lifted!

;;Gatekeeper raises Sword of Clouds to the heights and mutters some magic words.
;;White magic enfolds Lammas's body and in a blink of eye he is turned into a
;;glass statue.
;;PUFF! Glaced Lammas vanishes into thin air.
;;Glaced Lammas has moved to a new environment.

;;Baal-naygash raises its massive claw and recites an utterly low-pitched chant.

;Moonrind
/def -mglob -t'The very ground you are standing on begins to tremble.' moonrind_fissure_coming = /echo -aB WARNING: SPECIAL COMING
/def -mglob -t'Some green vines are growing out of the fissures, feeling for something to grab! Better avoid them, now!' moonrind_fissue_NOW = /echo -aB *** WARNING: jump left/right NOW ***
;; command ll grep 'Reverse damage' show effects
/def -mglob -t'\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\**' rounds_moonrind = @ll
/def -mregexp -t'^Moonrind tells you \'Raugh\!' moonrind_riddle = @party report MOONRIND RIDDLE!%;@quote 'tell last 1' party say
; You feel the flow of abjurative magic towards Moonrind!

;Moonrind grabs Lammas with one of his branches! After a rather one-sided struggle, Moonrind lets out a mad laughter, and stuffs Lammas into the large hole in his side - the one
;resembling a mouth. With an enormous *gulp*, Lammas gets swallowed.

