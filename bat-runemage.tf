;;
;; Runemage spell research trigger
;;
;; Notice that robotting is _illegal_
;; "help robotting"
;;
;; e.g. When I use this I keep watching the output, and I'm at the keyboard
;;
;; You might want to change the path to the perl file
;; (and check that it's executable)
;;
;; Also I strongly suggest to atleast read the perl file contents
;;
/loaded bat-runemage.tf
/require -q bat-generic.tf

/def researchr =\
/set runespell=$(/quote -S /echo !/home/drifter/runemage.pl)%;\
/echo -aB -p Researching: %{runespell}%;\
chant %{runespell}

/def timer =\
/quote -S /echo !/home/drifter/countrunes.pl

/def breakr =\
zz%;\
/echo -aB -p Researching: %{runespell}, runespell research stopped

/def resumer =\
/echo -aB -p Researching: %{runespell}, resuming research%;\
chant %{runespell}

/def -t"The air flashes for a second, but nothing happens." castdone = /researchr
/def -t"Your voice wavers and fails, so does your spell." castfail = chant %{runespell}
