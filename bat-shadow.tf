; Shadow race triggers
/loaded bat-shadow.tf

; Focus
/def -mglob -t"You finish focusing ..." focusdone = @party report Shadow focus success!%;@party report
/def -mglob -t"Your concentration fails and nothing happens." focusfail = /echo -aB (Tinyfugue) Focus Failed!
/def -mglob -t"You start focusing in the shifting of your essence." focusstarted = /repeat -15 1 /echo -aB (TinyFugue) Focus in 2 hb!
/def -mglob -t"Your body is unable to handle all of the influx of magical energy." focusfluxed = /echo -aB (TinyFugue) Fluxed out!

;; Too illuminated
/def -F -t"You feel exhausted, being here in the light." too_much_light = /echo -aB (TinyFugue) No ticks, too much light!

; Gags
/def -ag -mglob -t"You feel that * has a new level." shadowlevelgag
/def -ag -mglob -t"You feel that * is younger now." shadowyouthgag
/def -ag -mglob -t"You feel that * is older now." shadowoldergag
/def -ag -mglob -t"You feel that * is in great pain." shadowpaingag
/def -ag -mglob -t"You feel that * goes unconscious." shadowuncgag
/def -ag -mglob -t"You feel that * is satiated." shadowsatiategag
