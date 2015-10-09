/require -q ~/lib/tf-lib/bat-generic.tf

/stack bash off_skill_stack
/def bsh=/set skill=bash%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

/stack punch off_skill_stack
/def pu=/set skill=punch%;/set skill_rounds=1%;/set targettype=off%;/do_skill %{*}

/stack kick off_skill_stack
/def kk=/set skill=kick%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

/stack iron_palm off_skill_stack
/def ip=/set skill=iron_palm%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

/def as =/set skill=avalanche_slam%;/set skill_rounds=6%;/set targettype=off%;/do_skill %{*}
/def ek =/set skill=earthquake_kick%;/set skill_rounds=4%;/set targettype=off%;/do_skill %{*}
/def eck=/set skill=elder_cobra_kick%;/set skill_rounds=4%;/set targettype=off%;/do_skill %{*}
/def fbs=/set skill=falling_boulder_strike%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}
/def fts=/set skill=falcon_talon_strike%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}
/def gfk=/set skill=geyser_force_kick%;/set skill_rounds=4%;/set targettype=off%;/do_skill %{*}
/def ltt=/set skill=lions_teeth_throw%;/set skill_rounds=6%;/set targettype=off%;/do_skill %{*}
/def tp =/set skill=tsunami_push%;/set skill_rounds=6%;/set targettype=off%;/do_skill %{*}
/def wcs=/set skill=wave_crest_strike%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}
# Small drider shakes its head back and forth, clearly disoriented.

/def med=/set targettype=none%;/set skill=meditation%;/do_skill%;@party say (Meditating)
/def ki=/set targettype=none%;/set skill=ki%;/do_skill
/def lc=/set targettype=corp%;/set skill=leather_craft%;/do_skill corpse
/def kiai=/set targettype=off%;/set skill_rounds=random%;/set skill=kiai-cry%;/do_skill %{*}
/def kt=/set targettype=none%;/set skill=kata%;/do_skill
/def jl=/set targettype=off%;/set skill_rounds=random%;/set skill=joint_lock%;/do_skill %{*}

/def -F -t"You fail to reach the state of inner harmony." medi_failed = /med
/def -F -t"Something disturbs you and you cannot concentrate any longer." medi_over = @party report (meditation over)
/def acu=/set targettype=assist%;/set skill=acupuncture%;/do_skill %{*}
/def -t"Your fingers become numb from the delicate but strenuous use." acu_used

/def -aB -t"Your fluid motions allows you to move without breaking concentration." fluid_movement = cast info

/def -F -p9 -aBCyellow -aCbggreen -t"Your training is starting to pay off!" monk_skill_training_improve

;"You perform the kata."

;/bind ^[[20~ = /lc
;/bind ^[[21~ = /kk .
;/bind ^[[23~ = /ip .
;/bind ^[[24~ = /kt 
;/def key_f11 = /ip .
;/def key_f12 = /kt
