;; Crimson guild
/loaded bat-crimson.tf
/require -q bat-generic.tf
/set hp_report on

;; Push
;; _N.B._ the trigger /push is defined in the file stack_queue.tf
/stack push off_skill_stack
/def psh=/set skill=push%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

;; Bash
/stack bash off_skill_stack
/def bash=/set skill=bash%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

;; Battlecry (isn't stacked)
/def bc=/set skill=battlecry%;/set targettype=off%;/do_skill %{*}

;; Kick
/stack kick off_skill_stack
/def kk=/set skill=kick%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

;; Slash
/stack slash off_skill_stack
/def sl=/set skill=slash%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

;; Pound
/stack pound off_skill_stack
/def pnd=/set skill=pound%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

;; Cleave
/stack cleave off_skill_stack
/def clv=/set skill=cleave%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

;; Stab
/stack stab off_skill_stack
/def stb=/set skill=stab%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

;; Impale
/stack impale off_skill_stack
/def imp=/set skill=impale%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

;;Stuns!
/def -F -p15 -t"You are no longer stunned." stun_off= @party say no longer stunned
/def -F -p15 -mregexp -t"You STUN ([A-Z][a-z ]*)." stun= @party say %P1 is stunned!
/def -F -p15 -t"...WHO breaks the stun quickly off with intense concentration." stun_break= @party say or was....
