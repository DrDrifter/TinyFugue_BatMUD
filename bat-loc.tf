;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                    ;;
;; BatMUD Lord of Chaos stuffs                                        ;;
;; Very out of date (perhaps), but I might consider LoC guild soon... ;;
;;                                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/require -q bat-generic.tf
;/require -q protter.tf
/set hp_report on

/def bof=/set targettype=none%;/set spell=blade_of_fire%;/do_spell
/def dr=/set targettype=none%;/set skill=destructive_rage%;/do_skill
/def sb=/set targettype=none%;/set spell=summon_blade%;/do_spell

/stack bloodlust off_skill_stack
/def bl=/set targettype=off%;/set skill=bloodlust%;/set skill_rounds=random%;/do_skill %{*}

/stack overbear off_skill_stack
/def ob=/set targettype=off%;/set skill=overbear%;/set skill_rounds=2%;/do_skill %{*}

/stack vampiric_blow off_skill_stack
/def vb=/set targettype=off%;/set skill=vampiric_blow%;/set skill_rounds=random%;/do_skill %{*}

;/createprot -t2 -n"BoF" -w"You utter the magic words \'dsaflk aslfoir\'" -u"As your chant finishes, a red-hot flame rages from your steel blade." -d"The flames surrounding your chaos blade subside." -p"Blade of Fire"
;/createprot -t2 -n"DR" -w"A veiled darkness descends over your eyes.  Sounds are oddly distorted, and" -u"can think of nothing  but wreaking havoc on all that stands before you." -d"exhausted.  You can no longer ignore the consequences of your past actions." -p"Destructive Rage"

/def -mglob -t"* is DEAD, R.I.P." ripped = lord_chaos blood corpse

/stack cure_light_wounds heal_spell_stack
/def clw=\
   /set spell=cure_light_wounds%;/set targettype=heal%;/do_spell %{*}

/bind ^[[21~ = /clw me
/bind ^[[23~ = /bl
/bind ^[[24~ = /bl .
