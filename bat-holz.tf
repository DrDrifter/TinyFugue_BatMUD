;;
;; Triggers for Kerbholz if you have done holz_quest
;;
;; Note: under development, this is basically just a placeholder file
;;
/loaded bat-holz.tf

/def -mregexp -t"As you point your Kerbholz at ([A-Z][A-z \,\'\.\-]+), a (weak white|green|yellow|cyan|blue|magenta|red|bright green|bright yellow|bright cyan|bright blue|bright magenta|bright red|bright white) magic ring forms around (his|her|its) neck." \
   holz_pointed = \
   /set holzed_mob=%{P1}%;\
   /set holzed_colour=%{P2}%;\
   /echo (Tinyfugue) Mob: [%holzed_mob] Colour: [%holzed_colour]





;; br_white
;; br_red
;; br_magenta
;; br_blue
;; br_cyan
;; br_yellow
;; br_green
;; red
;; magenta
;; blue
;; cyan
;; yellow
;; green
;; white
