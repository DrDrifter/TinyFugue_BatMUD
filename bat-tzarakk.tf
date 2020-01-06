;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                    ;;
;; BatMUD LoC:Tzarakk stuffs                                          ;;
;;                                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/loaded bat-tzarakk.tf
/require -q bat-generic.tf
;/require -q protter.tf
/set hp_report on

/stack kick off_skill_stack
/def kk=/set targettype=off%;/set skill=kick%;/set skill_rounds=2%;/do_skill %{*}

/stack charge off_skill_stack
/def charge=/set targettype=off%;/set skill=charge%;/set skill_rounds=random%;/do_skill %{*}

/stack trample off_skill_stack
/def trample=/set targettype=off%;/set skill=trample%;/set skill_ rounds=2%;/do_skill %{*}

/stack rampage off_skill_stack
/def rampage=/set targettype=off%;/set skill=rampage%;/set skill_rounds=random%;/do_skill %{*}


/def spawn=/set targettype=prot%;/set skill=chaotic spawn%;/do_skill %{*}
/createprot -t2 -n"Spawn" -w"You fall in pain. Gods! THE PAIN!" -u"The pain increases as your body starts to push out organs and limbs that should" -d"The extra organs retract back into your body." -p"Chaotic Spawn"
/def -t"You feel like the pulse of chaos inside you is slowing down!" swarm_soon_down = @party say [Chaotic swarm] needs to reload!
/def -t"You huff, and you puff.. but nothing happens." spawnfail = /spawn .

/stack clawed_strike off_skill_stack
/def claw=/set targettype=off%;/set skill=clawed_strike%;/set skill_rounds=random%;/do_skill %{*}

;/def -mregexp -t"You blow a kiss of death at ([A-Za-z- ]+)." kissdone = kill %P

/stack cure_light_wounds heal_spell_stack
/def clw=\
   /set spell=cure_light_wounds%;/set targettype=heal%;/do_spell %{*}


;; ceremony
/set ceremony_status off
/def uc=\
   /if ({ceremony_status}=~"off")\
     /set skill=ceremony%;\
     /set targettype=none%;\
     /do_skill%;\
   /else \
     /echo -aB (Tinyfugue): ceremony already catered for.%;\
   /endif
/def -F -p15 -t"You perform the ceremony." ceremony_on=\
   /set ceremony_status=on
/def -F -p15 -t"You start chanting." ceremony_off= /set ceremony_status=off

/def cp=@dismount%;/set targettype=none%;/set skill=camping%;/do_skill%;@party say (camping)

/def gdark = /set spell=greater_darkness%;/set targettype=none%;/do_spell

/def steed = /set spell=steed_of_tzarakk%;/set targettype=none%;/do_spell
/def -t"Rethar appears in a violent burst of chaos." steedsummoned = @mount steed

/def key_f2 = /steed
/def key_f3 = /cp
/def key_f4 = /clw me
/def key_f9 = /spawn .
/def key_f10 = /claw .
/def key_f11 = /charge .
/def key_f12 = /uc

/def -t"You awaken from your short rest, and feel slightly better." campdone = @mount steed%;@party report (done camping)
/def -t"You stretch yourself and consider about camping." campready1 = @party report (can camp)
/def -t"You feel a bit tired." campready2 = @party report (can camp)
/def -t"You feel like camping a little." campready3 = @party report (can camp)

/def -aCbgcyan -t"You are knocked off your mount!" knockdown = @party say <ARGH! Kicked off of my mount!>
/def -aCbgcyan -t"Your mount throws you!" knockdown2 = @party say <ARGH! Kicked off of my mount!>
/def -aCbgcyan -t"Your mount glows with power" steedimprove = @party report <Mount rep!>
/def -aCbgcyan -t"You feel the chaos pulse inside you!" spawnimprove = @party report <Spawn rep!>
/def -aCbgcyan -t"Your darkness spell dissolves." darkoff = @party report <Darkness off!>
;;/def -t"You are now off your mount." mountbehind = @party report <ARGH! Mount was left behind!>
