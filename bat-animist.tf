;;
;; Load this file AFTER bat-hilite.tf
;;
/loaded bat-animist.tf

;;
;; Options
;;

;; Default mount action can be "mount" or "ride"
;; This affects what happens after you get summoned etc.
/set mount_action=mount

;; Off skills
/stack animist_strike off_skill_stack
/def as=/set targettype=off%;/set skill_rounds=random%;/set skill=animist_strike%;/do_skill %{*}
/stack battery off_skill_stack
/def batt=/set targettype=off%;/set skill_rounds=random%;/set skill=battery%;/do_skill %{*}
/stack incite_animal_soul off_skill_stack
/def ias=/set targettype=off%;/set skill_rounds=random%;/set skill=incite_animal_soul%;/do_skill %{*}
/stack assault off_skill_stack
/def ass=/set targettype=off%;/set skill_rounds=random%;/set skill=assault%;/do_skill %{*}
/def ssp=/set targettype=off%;/set skill_rounds=random%;/set skill=soulsplitter%;/do_skill %{*}

;; Other skills
/if (mount_action =~ "mount") /set camp_action=@dismount%;/endif
/def cp=/set targettype=none%;/set skill=camping%;%{camp_action}%;@sleep
/def sc=/set targettype=soul%;/set skill=soul_channel%;/do_skill %{*}
/def tc=/set targettype=off%;/set skill totem_challenge%;@remove empyrean%;@wield totem%;/do_skill %{*}

;; Redo skills
/def -F -t"You fail your skill attempt. Better luck next time." soul_heal_fail= /sc
/def -F -t"You try to sneak close enough, but fail." totem_fail = /tc 
/def -F -t"You concentrate intensely, perhaps too much so, since you fail to act in time." soulsplitter_fail = /ssp

;; Totem wield after success
/def -F -mglob -t"You sneak close to *, suddenly charge and swing your * onto its head!*" totem_done = @wield empyrean
/def -F -mglob -t"You frantically try to grab a weapon, but cannot get a grip in time." switch_weapon_failed = @wield empyrean

;;
;; Spells
;;
/def aa=/set targettype=prot%;/set spell=animal_aspect%;/do_spell %{*}
/def asl=/set targettype=mount%;/set spell=animal_soul_link%;/do_spell %{*}
/def cas=/set targettype=none%;/set spell=conjure_animal_soul%;/do_spell
/stack cure_serious_wounds heal_spell_stack
/def csw=/set targettype=heal%;/set spell=cure_serious_wounds%;/do_spell %{*}
/def esw=/set targettype=prot%;/set spell=elemental_soul_ward%;/do_spell %{1} on %{2}
/def js=/set targettype=none%;/set spell=join_soul%;/do_spell
/def ras=/set targettype=none%;/set spell=recall_animal_soul%;/do_spell
/def ss=/set targettype=none%;/set spell=separate_soul%;/do_spell
/def scho=/set targettype=none%;/set spell=soul_chorus%;/do_spell

;; Mount movement stuff
/def -F -p9 -mglob -t"You are knocked off your mount!" off_my_mount = @party report (Knocked off!);@lead my spirit
/def -F -p9 -mglob -t"Your mount throws you!" off_my_mount_2 = @party report (Knocked off!);@lead my spirit
/def -F -p9 -mglob -t"* spirit slowly appears, answering your call." mount_summoned = @%{mount_action} my spirit
/def -F -p9 -mglob -t"You call for a spirit mount. *" mount_summoned2 = @%{mount_action} my spirit
/def -F -p9 -mglob -t"Your mount is teleported with you." mount_summoned3 = @%{mount_action} my spirit
/def -mglob -t"You awaken from your short rest, and feel slightly better." campdone = @party report (done camping);@%{mount_action} my spirit

;; Soul stuff
/def -F -p9 -t"Your soul has returned to you on its own." soul_returned = @party report (My soul has returned)
/def -F -p9 -t"You manage to separate one soul fragment, better destroy it quickly!" soulsplitter_done1 = @target shattered soul
/def -F -p9 -t"You perform your attack almost perfectly, and manage to separate two fragments, better destroy them quickly!" soulsplitter_done2 = @target shattered soul
/def -F -p9 -t"You perform the attack PERFECTLY, and manage to separate three fragments, better destroy them quickly!" soulsplitter_done3 = @target shattered soul

;; f-key defines
/def key_f5 = /batt .
/def key_f6 = /ssp .
/def key_f7 = /as .

;; Elemental soul ward - Phys
/createprot -t0 -n"EPhysS" -w"You touch your talisman and whisper \'Beware the big bad troll!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny grey force field, which shimmers and fades out of sight." -d"You feel the protection from physical damage on your soul companion expire." -p"Elemental Soul Ward: Phys"
/createprot -t0 -n"EPhysM" -w"You touch your talisman and whisper \'Beware the big bad troll!\'" -u"You point at your animal soul mount and you feel and see energy flowing from your talisman. The animal soul mount is covered by a shiny grey force field, which shimmers and fades out of sight." -d"You feel the protection from physical damage on your mount expire." -p"Elemental Soul Ward: Phys"
;You touch your talisman and whisper 'Beware the big bad troll!' (Elemental Soul Ward: Phys)
;You point at your animal soul mount and you feel and see energy flowing from your talisman. The animal soul mount is covered by a shiny grey force field,
;    which shimmers and fades out of sight.
;Didan touches his talisman and whispers 'Beware the big bad troll!'

;; Cold
/createprot -t0 -n"ECold" -w"You touch your talisman and whisper \'Beware the icy penguin!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny blue force field, which shimmers and fades out of sight." -d"You feel the protection from cold damage on your soul companion expire." -p"Elemental Soul Ward: Cold"
;; Fire
/createprot -t0 -n"EFire" -w"You touch your talisman and whisper \'Beware the fiery phoenix!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny red force field, which shimmers and fades out of sight." -d"You feel the protection from fire damage on your soul companion expire." -p"Elemental Soul Ward: Fire"
;; Asph
/createprot -t0 -n"EAsph" -w"You touch your talisman and whisper \'Beware the strangling vine!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny brown force field, which shimmers and fades out of sight." -d"You feel the protection from asphyxiation damage on your soul companion expire." -p"Elemental Soul Ward: Asph"
;; Acid
/createprot -t0 -n"EAcid" -w"You touch your talisman and whisper \'Beware the acrid pudding!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny clear force field, which shimmers and fades out of sight." -d"You feel the protection from acid damage on your soul companion expire." -p"Elemental Soul Ward: Acid"
;; Magical
/createprot -t0 -n"EMagi" -w"You touch your talisman and whisper \'Beware the mighty magician!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny white force field, which shimmers and fades out of sight." -d"You feel the protection from magical damage on your soul companion expire." -p"Elemental Soul Ward: Magi"
;; Electricity
/createprot -t0 -n"EElec" -w"You touch your talisman and whisper \'Beware the electric eel!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny yellow force field, which shimmers and fades out of sight." -d"You feel the protection from electricity damage on your soul companion expire." -p"Elemental Soul Ward: Elec"
;; Poison
/createprot -t0 -n"EPois" -w"You touch your talisman and whisper \'Beware the poisonous basilisk!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny green force field, which shimmers and fades out of sight." -d"You feel the protection from poison damage on your soul companion expire." -p"Elemental Soul Ward: Pois"
;; Psionic
/createprot -t0 -n"EPsio" -w"You touch your talisman and whisper \'Beware the psychic leech!\'" -u"You point at your soul companion and you feel and see energy flowing from your talisman. The soul companion is covered by a shiny cyan force field, which shimmers and fades out of sight." -d"You feel the protection from psionic damage on your soul companion expire." -p"Elemental Soul Ward: Psio"





; Elk spirit slowly appears, answering your call.
