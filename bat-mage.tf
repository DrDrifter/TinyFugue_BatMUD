;; BatMUD
;; Triggers for use with mage guild
;; Also incorporates psionic offensive spells
;; Jenny@bat.org 1998
;;
;; Modified and maintained by Drifter since 1999->?
;; No changelog but meddled with lotsa stuff
;;
;; Needs this file to run spell casting triggers
/require -q bat-generic.tf
/require -q bat-analysis.tf
/require -q bat-status.tf
/require -q bat-essencecount.tf
;; This is the tick reporting mode, spell points only
/set sp_report=on
;; Auto caster
;; To use this type /set auto_cast on
;; This casts of avoid ambush messages, if you doing get message, doesn't cast
;; If you wish to use this, put your damtypes here
/set auto_type=off
/set damtype1=asphyxiation
/set damtype2=electricity
/set damtype3=acid
/set damtype4=fire
/set damtype5=cold
;/set damtype6=mana
;/set damtype7=poison

;; Ambush trig
/def -F -p9 -mregexp -t"(Your small size avoids a nasty ambush.|Your marvelous intellect avoids a nasty ambush.|Your keen senses note a disturbance seconds before the ambush!|Your knowledge about [A-Za-z'\- ]* tactics allows you to evade the ambush.|You superb intelligence enables you to avoid the ambush.|Your marvelous intellect avoids a nasty ambush.|Your keen senses note a disturbance seconds before the ambush!|The skilled leadership of [A-Za-z]+ saves you from ambush!)" auto_caster =\
   /if ({auto_cast}=~"on")\
;; Triggered to cast best spell, if you don't have that, change
;; to something you do
     /ex%;\
   /endif
;;
;; Triggers to automatically change damtype in auto_cast mode
/def -F -mglob -p19 -t"* writhes in agony." dam_writhe_agony=/change_damtype
/def -F -mglob -p19 -t"* grunts from the pain." dam_grunt_pain=/change_damtype
/def -F -mglob -p19 -t"* shudders from the force of the attack." dam_shudder=/change_damtype
/def -F -mglob -p19 -t"* shrugs off the attack." dam_shrug=/change_damtype
/def -F -mglob -p19 -t"* winces a little from the pain." dam_winces=/change_damtype
;;
;; Auto change damtype, make sure they are defined in the list above
/def change_damtype=\
   /if ({auto_cast}=~"on" & {auto_type}=~"on")\
     /if ({spells}=~$(/eval /_echo %%{%{damtype1}}))/dam %{damtype2}%;/ex%;\
     /elseif ({spells}=~$(/eval /_echo %%{%{damtype2}}))/dam %{damtype3}%;/ex%;\
     /elseif ({spells}=~$(/eval /_echo %%{%{damtype3}}))/dam %{damtype4}%;/ex%;\
     /elseif ({spells}=~$(/eval /_echo %%{%{damtype4}}))/dam %{damtype5}%;/ex%;\
     /elseif ({spells}=~$(/eval /_echo %%{%{damtype5}}))/dam %{damtype1}%;/ex%;\
     /endif%;\
   /endif
;;
;; Auto cast cheaper spell when sp are low
/def -F -p9 -t"You do not have enough spell points to cast the spell." low_sp=\
;;   /if ({auto_cast}=~"on")@party say low on sp%;\
   /if ({auto_cast}=~"on")%;\
     /if ({sp}>100)/vg .%;\
     /elseif ({sp}>55)/gd .%;\
     /elseif ({sp}>31)/av .%;\
     /elseif ({sp}>17)/pr .%;\
     /else @party say out of sp%;\
     /endif%;\
   /endif
;;
;; Dead recognition trig, might want to change damtype to 1st?
/def -F -p5 -aCred -mregexp -t"(\
moves on to happier hunting grounds.|\
staggers for a moment|\
dies in a massive fit of convulsions.|\
You get bad vibrations as|\
dies in a massive pool of blood.|\
stops existing in this reality.|\
loses the privilege to live.|\
gets an acute case of iron-poisoning.|\
A large hole replaces|\
You hear the horrendous death-cry of the|\
is dogfood.|\
A large cavity replaces|\
skull splits wide open|\
entrails spill all over the place|\
suddenly stops breathing and jerks a couple of times\
)" monster_is_dead= save
;;
;; Heal self
;; /def -F -p12 -t"You clap your hands and whisper 'judicandus littleee'" hs=\
;; This part of the trig won't work if you aren't running bat-generic.tf
;;   /if ({hp}<{hpmax})\
;;     cast heal self%;\
;;     /set spell=heal self%;\
;;   /endif
;;
;; Select your damtype
;; /dam [acid|asphyxiation|cold|electricity|fire|magical|poison|psionic]
/def dam=\
     /if (regmatch("acid|asphyxiation|cold|electricity|fire|magical|poison|psi", {1}))\
     /set spells=$(/eval /_echo %%{%{1}})%;\
     /echo -aB (Tinyfugue) damtype is now $[toupper({1})]%;\
     /set damtype=%{1}%;\
   /else \
     /echo -aB TF info: valid damage types are acid, asphyxiation, \
     cold, electricity, fire, magical and poison.%;\
   /endif
;;
;; Table of spells
;; Psionic
/set psi=mind_blast psibolt psi_blast mind_disruption psychic_crush psychic_shout psychic_storm
/eval /set off_spell_stack=%{off_spell_stack}|mind_blast|psibolt|psi_blast|mind_disruption|psychic_crush|psychic_shout|psyhcic_storm
;; Acid
/set acid=disruption acid_wind acid_arrow acid_ray acid_blast acid_rain acid_storm
/eval /set off_spell_stack=%{off_spell_stack}|disruption|acid_wind|acid_arrow|acid_ray|acid_blast|acid_rain|acid_storm
;; Asphyxiation
/set asphyxiation=vacuumbolt suffocation chaos_bolt strangulation blast_vacuum vacuum_ball vacuum_globe
/eval /set off_spell_stack=%{off_spell_stack}|vacuumbolt|suffocation|chaos_bolt|strangulation|blast_vacuum|vacuum_ball|vacuum_globe
;; Cold
/set cold=chill_touch flaming_ice darkfire icebolt cold_ray cone_of_cold hailstorm
/eval /set off_spell_stack=%{off_spell_stack}|chill_touch|flaming_ice|darkfire|icebolt|cold_ray|cone_of_cold|hailstorm
;; Electricity
/set electricity=shocking_grasp lightning_bolt blast_lightning forked_lightning electrocution chain_lightning lightning_storm
/eval /set off_spell_stack=%{off_spell_stack}|shocking_grasp|lightning_bolt|blast_lightning|forked_lightning|electrocution|chain_lightning|lightning_storm
;; Fire
/set fire=flame_arrow firebolt fire_blast meteor_blast lava_blast meteor_swarm lava_storm
/eval /set off_spell_stack=%{off_spell_stack}|flame_arrow|firebolt|fire_blast|meteor_blast|lava_blast|meteor_swarm|lava_storm
;; Magical
/set magical=magic_missile summon_lesser_spores levin_bolt summon_greater_spores golden_arrow magic_wave magic_eruption
/eval /set off_spell_stack=%{off_spell_stack}|magic_missile|summon_lesser_spores|levin_bolt|summon_greater_spores|golden_arrow|magic_wave|magic_eruption
;; Poison
/set poison=thorn_spray poison_blast venom_strike power_blast summon_carnal_spores poison_spray killing_cloud
/eval /set off_spell_stack=%{off_spell_stack}|thorn_spray|poison_blast|venom_strike|power_blast|summon_carnal_spores|poison_spray|killing_cloud
;;
;; Get the spell name and cast it
/def get_spell=\
   /set spell=$(/nth %{spell_number} %{spells})%;\
   /set targettype=off%;/do_spell %{*}
;;
;; Your input trigs....based on spell performance
;; Poor
/def pr=/set spell_number=1%;/set spell_rounds=1%;/get_spell %{*}
;; Average
/def av=/set spell_number=2%;/set spell_rounds=2%;/get_spell %{*}
;; Good
/def gd=/set spell_number=3%;/set spell_rounds=3%;/get_spell %{*}
;; Very good
/def vg=/set spell_number=4%;/set spell_rounds=3%;/get_spell %{*}
;; Excellent
/def ex=/set spell_number=5%;/set spell_rounds=4%;/get_spell %{*}
;; Good area
/def ga=/set spell_number=6%;/set spell_rounds=4%;/get_spell %{*}
;; Excellent area
/def ea=/set spell_number=7%;/set spell_rounds=6%;/get_spell %{*}

;;
;; Hi-lites
/def -F -mglob -aB -t'Surge of power from your staff adds to the power of the spell.' staff_power1

;; bind f-keys to damtypes
/def key_f2 = /dam asphyxiation%;@eqset wear asph%;/set eqsetstatus=INT
/def key_f3 = /dam electricity%;@eqset wear elec%;/set eqsetstatus=INT
/def key_f4 = /dam acid%;@eqset wear acid%;/set eqsetstatus=INT
/def key_f5 = /dam fire%;@eqset wear fire%;/set eqsetstatus=INT
/def key_f6 = /dam cold%;@eqset wear cold%;/set eqsetstatus=INT
/def key_f17 = @eqset wear spr%;/set eqsetstatus=SPR
/def key_f18 = @eqset wear prot%;/set eqsetstatus=WIS

;; bind quickblastkeys
;; Depending on your keyboard settings you might want to tweak this
/def key_f9  = /ea .
/def key_f10 = /ex
/def key_f11 = /ex .
/bind § = /dg .

/def as =/set targettype=misc%;/set spell=air_shield%;/do_spell %{*}
/def caa=/set targettype=foo%; /set spell=create_air_armour%;/do_spell %{*}
/def dg =/set targettype=off%; /set spell=degenerate_person%;/do_spell %{*}
/def dm =/set targettype=off%; /set spell=disrupt_magic%;/do_spell %{*}
/def ev =/set targettype=misc%;/set spell=enhance_vision%;/do_spell %{*}
/def fd =/set targettype=disc%;/set spell=floating_disc%;/do_spell my disc
/def fle=/set targettype=numb%;/set spell=floating_letters%;/do_spell %{*}
/def fl =/set targettype=misc%;/set spell=floating%;/do_spell %{*}
/def fw =/set targettype=item%;/set spell=feather_weight%;/do_spell %{*}
/def gw =/set targettype=off%; /set spell=touch_of_glacial_winds%;/do_spell %{*}
/def hp =/set targettype=none%;/set spell=holding_pattern%;/do_spell
/def hs =/set targettype=none%;/set spell=heal_self%;/do_spell
/def inv=/set targettype=misc%;/set spell=invisibility%;/do_spell %{*}
/def lb =/set targettype=lock%;/set spell=lock_biter%;/do_spell %{*}
/def nof=/set targettype=none%;/set spell=noxious_fumes%;/do_spell
/def mi =/set targettype=misc%;/set spell=mirror_image%;/do_spell %{*}
/def ml =/set targettype=misc%;/set spell=magnetic_levitation%;/do_spell %{*}
/def mns=/set targettype=none%;/set spell=moon_sense%;/do_spell
/def pb =/set targettype=off%; /set spell=prismatic_burst%;/do_spell %{*}%;@party report Arcane Unicorn RaInBoW Fart -> %1
/def rd =/set targettype=misc%;/set spell=resist_disintegrate%;/do_spell %{*}
/def sa =/set targettype=none%;/set spell=ship_armour%;/do_spell
/def sf =/set targettype=misc%;/set spell=searing_fervor%;/do_spell %{*}
/def uhl=/set targettype=misc%;/set spell=uncontrollable_hideous_laughter%;/do_spell %{*}
/def twei=/set targettype=none%;/set spell=teleport_with_error%;/do_spell
/def sum=/set targettype=tele%;/set spell=summon%;/do_spell %{*}
/def weye=/set targettype=tele%;/set spell=wizard_eye%;/do_spell %{*}
/def rel=/set targettype=tele%;/set spell=relocate%;/do_spell %{*}
/def tele=/set targettype=none%;/set spell=teleport_without_error%;/do_spell

/def -F -mglob -t"Your disc wavers dangerously." discgoingdown = @party report (Disc going down)
/def -F -mglob -t'Your floating disc suddenly disappears.' discwentdown = @party report (Disc went poof!)
/def -F -mglob -t"* appears weakened!" degenewentin = @party report (Degenerate person hits!)
  
/def -aB -t"You masterfully channel the elemental powers." plaque_blast = @party report *** Plaque blast! ***

; cold
; Your icy whirlwind of magic numbs Scientist to the bone.

;asph
; You feel an inner warmth as you notice * starting to choke.

;elec
; The electricity JOLTS through the * worn by *!

; Default to primary type
/dam asphyxiation

;; Put reagent pouch and maul to pocket
/REPEAT -10 1 /SEND @put pew in pocket
/REPEAT -10 1 /SEND @put mahtileka in pocket

;;
;; NB: FOR THIS TO WORK NEED protter.tf
;;
; Mage prots
/createprot -t2 -n"MB" -w"You utter the magic words \'Ouch ouch ow oww!\'" -u"A glimmering white barrier surrounds you!" -d"The white barrier surrounding you sparkles and bursts into thousands of tiny stars!" -p"Mana Barrier"
/createprot -t2 -n"HP" -w"You roll your eyes and chant \'niotalucaje erutamerp!\'" -u"You enter a trance, ready to unleash your powers." -d"You can\'t concentrate anymore, the trance ends." -p"Holding Pattern"
;;/createprot -t2 -n"Nf" -w"You sweat murky green liquid and utter \'krkx murk arrsunt\'" -u"You squirm and struggle to keep composure as your glands start swell violently from the foul liquid gushing into them. With a burning sensation your skin begins releasing deadly gases." -d"The fumes dissipate from around you leaving only few moisty green sparkles on the ground." -p"Noxious Fumes"
