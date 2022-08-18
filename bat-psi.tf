; Psionicist guild misc spells wrapper trigs
; NOTE: prolly needs bat-mage for the blasts

/loaded bat-psi.tf
/def ms =/set targettype=off%;/set spell=mindseize%;/do_spell %{*}

/def med=/set targettype=none%;/set skill=meditation%;/do_skill%;@party say (Starting meditation)%;@tell status meditating
/def fs =/set targettype=prot%;/set spell=force_shield%;/do_spell %{*}
/def md =/set targettype=prot%;/set spell=mind_development%;/do_spell %{*}
/def psh=/set targettype=none%;/set spell=psionic_shield%;/do_spell %{*}
/def mg =/set targettype=misc%;/set spell=mental_glance%;/do_spell %{*}
/def lv =/set targettype=prot%;/set spell=levitation%;/do_spell %{*}
/def ms =/set targettype=off%;/set spell=mindseize%;/do_spell %{*}
/def psd =/set targettype=none%;/set spell=psionic_shield%;/do_spell


/def -t'You fail to reach the state of inner harmony.' newmed = /med
/def -t'Something disturbs you and you cannot concentrate any longer.' done_meditating = @party say (Meditation complete)%;@tell status clear
/def -t'You don\'t feel to be in harmony with yourself.' med_unavail = @party say (Unable to meditate yet)%;@tell status clear

/bind § = /ms .

/createprot -t0 -n"Pshd" -w"You utter the magic words \'niihek atierapip aj niiramaan aaffaj\'" -u"Psionic waves surge through your body and mind!" -d"The psionic shield vanishes." -p"Psionic Shield"

/def -F -p6 -aCgreen -t'You gain considerable knowledge of how the mind works.' gainpsi1
/def -F -p6 -aCyellow -t'You gain useful knowledge of how the mind works.' gainpsi2
/def -F -p6 -aCred -t'You gained no new knowledge from such a pitiful monster.' gainpsi3


