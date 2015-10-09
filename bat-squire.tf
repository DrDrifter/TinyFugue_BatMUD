;;
;; Batmud squire triggers
;;

/stack impale off_skill_stack
/def im=/set skill=impale%;/set targettype=off%;/set skill_rounds=random%;/do_skill %{*}

/stack slash off_skill_stack
/def sl=/set skill=slash%;/set targetype=off%;/set skill_rounds=random%;/do_skill %{*}

/def em=/set skill=evaluate_mount%;/set skill_rounds=3%;/set targettype=mount%;/do_skill %{*}
/def mf=/set skill=make_mount_feed%;/set targettype=feed%;/do_skill %{*}
/def tm=/set skill=tame_mount%;/set skill_rounds=12%;/set targettype=off%;/do_skill %{*}

