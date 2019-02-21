;; Skie
/def -mglob -t"You BLEED and suffer." skie_special = @say bleeding :'(

;; Baal
/def -t"Baal-naygash raises its massive claw and recites an utterly low-pitched chant." baal_special = @party report BAAL SPECIAL COMING, MOVE MOVE!

;; Henry stuff
/def -mglob -t'Henry waves his hand over * and says \'BEGONE!\'' henry_banish = @party report Henry banished %{1}!

;; Soth special
/def -mglob -t'* is overwhelmed with pain as Lord Soth casts a Death spell on *' soth_death = @party report [ %{1} ] is now DEATH target!

;; Jane
/def -mglob -t'Jane the Goddess snaps her fingers and * is consumed by bright white light.' jane_banished = @party report Jane banished [ %{1} ] 

;; Megasaur
/def -t'Megasaurlets out a fearful \*ROAR\*' megasaur_roared = @party report Watch out! Pekka Sauri tahtoo eduskuntaan!

;; Rotahunt
/def -mglob -t"Rotahunt grabs * and tosses * into his lovely iron maiden!" rotathrow = @party report HÄLÄRM! Rotahunt iron maidened %{1}

;; Tyra banish
/def -mglob -t"Tyranicus waves his hand at * and says 'Begone'" tyrathrow = @party report HÄLÄRM! Tyra banished %{6}


;Moonrind
/def -ab -mglob -t'The very ground you are standing on begins to tremble.' moonrind_fissure_coming = /echo -aB WARNING: SPECIAL COMING
/def -mglob -t'Some green vines are growing out of the fissures, feeling for something to grab! Better avoid them, now!' moonrind_fissue_NOW = /echo -aB *** WARNING: jump left/right NOW ***
;; command ll grep 'Reverse damage' show effects
/def -mglob -t'\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\**' rounds_moonrind = @ll
/def -mregexp -t'^Moonrind tells you \'Raugh\!' moonrind_riddle = @party report MOONRIND RIDDLE!%;@quote 'tell last 1' party say
; You feel the flow of abjurative magic towards Moonrind!

;Moonrind grabs Lammas with one of his branches! After a rather one-sided struggle, Moonrind lets out a mad laughter, and stuffs Lammas into the large hole in his side - the one
;resembling a mouth. With an enormous *gulp*, Lammas gets swallowed.

;; Kizar
/def -F -mregexp -t"^You trip over something and stumble.  Did a skeletal arm just grab you" kizar_message = @party report STUCK

