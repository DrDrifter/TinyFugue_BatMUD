;;
;; To use the channels triggers, you must add the following to .tfrc:
;; /addworld chans
;; /load bat-testchans.tf
;; only then will this (and the other chans files) work
;; Note: you must add these before you define any other world, so that the hook is defined
;; before you make a connection to other "worlds"

/def -p1 -mglob -wchans -hCONNECT chanshook = \
    /load bat-chans.tf
