; Shadow race triggers
/loaded bat-shadow.tf

; Focus
/def -F -t"You finish focusing ..." focusdone = @party report Shadow focus success!%;@party report
/def -F -t"Your concentration fails and nothing happens." focusfail = /echo -aB (Tinyfugue) Focus Failed!
/def -F -t"You start focusing in the shifting of your essence." focusstarted = /repeat -15 1 /echo -aB (TinyFugue) Focus in 2 hb!

;; Too illuminated
/def -F -t"You feel exhausted, being here in the light." too_much_light = /echo -aB (TinyFugue) No ticks, too much light!

; Gags
/def -ag -mglob -t"You feel that * has a new level." shadowlevelgag
/def -ag -mglob -t"You feel that * is younger now." shadowyouthgag
/def -ag -mglob -t"You feel that * is older now." shadowoldergag
/def -ag -mglob -t"You feel that * is in great pain." shadowpaingag
/def -ag -mglob -t"You feel that * goes unconscious." shadowuncgag
/def -ag -mglob -t"You feel that * is satiated." shadowsatiategag
