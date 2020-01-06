;;
;; Drifter's mods:
;; Tuned so that it wouldn't take the most often casted spells
;; by players (remove scar, etc) so that much less "crap" would
;; populate the spellcaster.txt
;;
/loaded bat-spells.tf

/require -q stack_queue.tf

;; define our populating function
/def ispell=\
  /push %{1} spell_words_list%;\
  /push %{2} spell_names_list

;; Empty lists
/set spell_words_list=
/set spell_names_list=

;;;;;;;;;;;;;;;;;;;;;;
;; Start populating ;;
;;;;;;;;;;;;;;;;;;;;;;

;;Acid arrow
/ispell fzz_zur_semen acid_arrow
;;Acid blast
/ispell fzz_mar_nak_grttzt acid_blast
;;Acid rain
/ispell fzz_zur_semen_gnatlnamauch acid_rain
;;Acid ray
/ispell fzz_mar_nak_semen acid_ray
;;Acid storm
/ispell fzz_zur_semen_gnatlnamauch acid_storm
;;Acid wind
/ispell fzz_zur_sanc acid_wind
;;Acquisition
/ispell mesmr_pulrl_metism acquisition
;;All-seeing eye
;;Amnesia
/ispell siwwis_uurthg amnesia
;;Aneurysm
/ispell yugzhrr_paf aneurysm
;;Anti magic field
;;Aura detection
;/ispell fooohh_haaahhh_booooloooooh aura_detection
;;Aura of hate
;;Awareness
;;Banish
/ispell havia_kauhistus_pois banish
;;Banish demons
;;Bastardly balm
;;Blade of fire
;;Blast lightning
/ispell zot_zur_semen blast_lightning
;;Blast vacuum
/ispell ghht_mar_nak_grttzt blast_vacuum
;;Bless armament
;;Blessing of tarmalen
;/ispell nilaehz_arzocupne blessing_of_tarmalen
;;Blurred image
/ispell ziiiuuuuns_wiz blurred_image
;;Call pigeon
;;Cash flow
;;Cause critical wounds
/ispell rhuuuumm_angotz_klekltz cause_critical_wounds
;;Cause light wounds
/ispell tosi_pieni_neula cause_light_wounds
;;Cause serious wounds
/ispell rhuuuumm_angotz_amprltz cause_serious_wounds
;;Chain lightning
/ispell zot_zur_semen_gnatlnamauch chain_lightning
;;Chaos bolt
/ispell ghht_zur_semen chaos_bolt
;;Chaotic warp
;;Charge staff
;/ispell #_!( charge_staff
;;Chill touch
/ispell cah_zur_fehh chill_touch
;;Clairvoyance
;;Cold ray
/ispell cah_mar_nak_grttzt cold_ray
;;Cone of cold
/ispell cah_zur_semen_gnatlnamauch cone_of_cold
;;Corrosion shield
/ispell sulphiraidzik_hydrochloodriz_gidz_zuf corrosion_shield
;;Create air armour
;;Create food
;;Create money
;;Create mud
;;Credit check
;;Cure critical wounds
/ispell judicandus_mangenic cure_critical_wounds
;;Cure light wounds
/ispell judicandus_mercuree cure_light_wounds
;;Cure player
;;Cure serious wounds
;;Curse
/ispell oli_isa-sammakko,_aiti-sammakko_j curse
;;Curse of ogre
/ispell rtsstr_uurthg curse_of_ogre
;;Curse of tarmalen
;;Damn armament
;;Darkfire
/ispell cah_zur_semen darkfire
;;Darkness
;;Deaths door
;;Detect alignment
;;Detect poison
;;Dimension door
;;Disease
/ispell noccon_uurthg disease
;;Dispel evil
;;Dispel good
/ispell whoosy_banzziii_pal_eeeiizz_dooneb dispel_good
;;Dispel magical protection
;;Displacement
;;Disruption
/ispell fzz_zur_fehh disruption
;;Drain pool
;;Drying wind
/ispell hooooooooooowwwwwwwwwwwlllllllllllllll drying_wind
;;Earth power
/ispell %_!^ earth_power
;;Earth skin
/ispell %_!( earth_skin
;;Earthquake
/ispell % earthquake
;;Electric field
/ispell Ziiiiiiiiit_Ziiit_Ziiiit electric_field
;;Electrocution
/ispell zot_mar_nak_grttzt electrocution
;;Energy channeling
;;Energy drain
/ispell yugfzhrrr_suuck_suuuuuck_suuuuuuuuuuck energy_drain
;;Entropy
/ispell vaka_vanha_vainamoinen entropy
;;Ether boundary
;;Feather weight
;;Feeblemind
/ispell nitin_uurthg feeblemind
;;Feather weight
;/ispell suomen_hoyhen feather_weight
;;Field of fear
/ispell wheeeaaaaaa_oooooo field_of_fear
;;Fire blast
/ispell fah_zur_semen fire_blast
;;Fireball
/ispell zing_yulygul_bugh fireball
;;Firebolt
/ispell fah_zur_sanc firebolt
;;Flame arrow
/ispell fah_zur_fehh flame_arrow
;;Flame fists
;;Flaming ice
/ispell cah_zur_sanc flaming_ice
;;Flex shield
/ispell ^_!) flex_shield
;;Flip
/ispell jammpa_humppa_ryydy_mopsi flip
;;Floating
;;Floating disc
;/ispell rex_car_bus_xzar floating_disc
;;Floating letters
;;Force absorption
/ispell ztonez_des_deckers force_absorption
;;Force dome
/ispell xulu_tango_charlie force_dome
;;Force shield
;;Forget
;;Forked lightning
/ispell zot_mar_nak_semen forked_lightning
;;Frost insulation
/ispell skaki_barictos_yetz_fiil frost_insulation
;;Gem fire
/ispell &_^ gem_fire
;;Go
;/ispell flzeeeziiiiying_nyyyaaa go
;;Golden arrow
/ispell gtzt_mar_nak_grttzt golden_arrow
;;Good berry
;;Guardian angel
;;Hailstorm
/ispell cah_mar_nak_grttzt_gnatlnamauch hailstorm
;;Half heal
/ispell pzzzar_paf half_heal
;;Harm body
/ispell PAF_PAF_PAF! harm_body
;;Haste
;;Heal all
;;Heal body
/ispell ZAP_ZAP_ZAP! heal_body
;;Heal self
/ispell judicandus_littleee heal_self
;;Heat reduction
;;Heavy weight
/ispell tonnikalaa heavy_weight
;;Hemorrhage
/ispell yugzhrr hemorrhage
;;Hoar frost
;;Holy cross
;;Holy hand
;;Holy way
;;Icebolt
/ispell cah_mar_nak_semen icebolt
;;Identify
;;Immortality
;;Imprisonment
/ispell imprickening_zang_gah imprisonment
;;Infravision
;/ispell demoni_on_pomoni infravision
;;Invisibility
/ispell ....._...._..._..__.____.! invisibility
;;Iron will
;;Killing cloud
/ispell krkx_mar_nak_grttzt_gnatlnamauch killing_cloud
;;Last rites
;;Lava blast
/ispell fah_mar_nak_grttzt lava_blast
;;Lava storm
/ispell fah_mar_nak_grttzt_gnatlnamauch lava_storm
;;Laying on hands
;;Lessen poison
;;Levin bolt
/ispell gtzt_zur_semen levin_bolt
;;Life link
;/ispell Corporem_Connecticut_Corporee life_link
;;Light
;;Lightning bolt
/ispell zot_zur_sanc lightning_bolt
;;Lightning storm
/ispell zot_mar_nak_grttzt_gnatlnamauch lightning_storm
;;Magic dispersion
/ispell meke_tul_magic magic_dispersion
;;Magic eruption
/ispell gtzt_mar_nak_grttzt_gnatlnamauch magic_eruption
;;Magic missile
/ispell gtzt_zur_fehh magic_missile
;;Magic wave
/ispell gtzt_zur_semen_gnatlnamauch magic_wave
;;Major heal
;;Major party heal
;;Make scar
/ispell viiltaja_jaska make_scar
;;Mana drain
;;Mana shield
;;Mellon collie
;/ispell Zmasching_Pupkins's_infanitsadnnes mellon_collie
;;Mental glance
;;Mental watch
;/ispell kakakaaa__tsooon mental_watch
;;Meteor blast
/ispell fah_mar_nak_semen meteor_blast
;;Meteor swarm
/ispell fah_zur_semen_gnatlnamauch meteor_swarm
;;Mind blast
/ispell omm_zur_fehh mind_blast
;;Mind development
;/ispell Annatheer_graaweizta mind_development
;;Mind disruption
/ispell omm_mar_nak_semen mind_disruption
;;Mind store
;;Minor heal
/ispell judicandus_pzarcumus minor_heal
;;Minor party heal
;;Mirror image
;;Mobile cannon
;;Money is power
;;Money over matter
;;Moon sense
;;Natural renewal
;;Neutralize field
/ispell null,_nill,_noll,_nutin neutralize_field
;;New body
;;Paralyze
/ispell vorek_ky_taree paralyze
;;Pestilence
;;Phaze shift
;;Poison
/ispell saugaiii poison
;;Poison blast
/ispell krkx_zur_sanc poison_blast
;;Poison spray
/ispell krkx_zur_semen_gnatlnamauch poison_spray
;;Power blast
/ispell krkx_mar_nak_semen power_blast
;;Preserve corpse
;;Protect armour
;;Protect item
;;Protect weapon
;;Protection from evil
;;Protection from good
/ispell Good_is_dumb protection_from_good
;;Psi blast
/ispell omm_zur_semen psiblast
;;Psibolt
/ispell omm_zur_sanc psibolt
;;Psionic shield
/ispell niihek_atierapip_aj_niiramaan_aaffaj psionic_shield
;;Psychic crush
/ispell tora_tora_tora psychic_crush
;;Psychic purge
;;Psychic sanctuary
;;Psychic shout
/ispell omm_zur_semen_gnatlnamauch psychic_shout
;;Psychic storm
/ispell omm_mar_nak_grttzt_gnatlnamauch psychic_storm
;;Quicksilver
/ispell jumpiiz_laika_wabbitzz quicksilver
;;Rain
;;Raise dead
;;Regeneration
/ispell nilaehz_temnahecne regeneration
;;Reincarnation
;;Relocate
;/ispell hypin_pompin_luokses_juoksen relocate
;;Remote banking
;;Remove poison
;/ispell judicandus_saugaiii remove_poison
;;Remove scar
;/ispell lkzaz_zueei_enz_orn remove_scar
;;Replenish energy
;/ispell !*_% replenish_energy
;;Resist disintegrate
;;Resist dispel
;;Resist entropy
;;Resist gaseous form
;;Restore
;;Resurrect
;;Runic heal
/ispell !*_* runic_heal
;;Satiate person
;/ispell Creo_Herbamus_Satisfus satiate_person
;;See invisible
/ispell $%&@_#*%@*@#_$&*@# see_invisible
;;See magic
;;See the light
/ispell ogyawaelbirroh see_the_light
;;Sex change
;;Shadow leap
;;Shapechange
;;Shelter
/ispell withing_thang_walz shelter
;;Shield of faith
;;Shield of protection
/ispell nsiiznau shield_of_protection
;;Shocking grasp
/ispell zot_zur_fehh shocking_grasp
;;Soul hold
;;Soul shield
;;Speed
/ispell xeddex_duumof speed
;;Spellteaching
;;Star light
/ispell !(_!! star_light
;;Strangulation
/ispell ghht_mar_nak_semen strangulation
;;Suffocation
/ispell ghht_zur_sanc suffocation
;;Summon
;/ispell gwwaaajj summon
;;Summon blade
;/ispell ahieppa_weaapytama_nyttemmin summon_blade
;;Summon carnal spores
/ispell krkx_mar_nak_grttzt summon_carnal_spores
;;Summon greater spores
/ispell gtzt_mar_nak_semen summon_greater_spores
;;Summon lesser spores
/ispell gtzt_zur_sanc summon_lesser_spores
;;Suppress magic
/ispell taikoja_ma_inhoan supress_magic
;;Teleport with error
;;Teleport without error
;/ispell xafe_ayz_xckgandhuzqarr teleport_without_error
;;Terror
;;There not there
;;Thorn spray
/ispell krkx_zur_fehh thorn_spray
;;Tiger claw
;;Tiger mask
;;Toxic dilution
/ispell morri_nam_pantoloosa toxic_dilution
;;Transfer mana
;;Transmute self
;;Travel
;;True heal
;;True party heal
;;Turn demons
;;Turn undead
;;Uncontrollable hideous laughter
;;Unholy matrimony
;;Unpain
/ispell harnaxan_temnahecne unpain
;;Unstable mutation
;;Unstun
/ispell Paxus unstun
;;Vacuum ball
/ispell ghht_zur_semen_gnatlnamauch vacuum_ball
;;Vacuum globe
/ispell ghht_mar_nak_grttzt_gnatlnamauch vacuum_globe
;;Vacuumbolt
/ispell ghht_zur_fehh vacuumbolt
;;Venom strike
/ispell krkx_zur_semen venom_strike
;;Vine mantle
/ispell ""_!# vine_mantle
;;Water walking
;/ispell Jeeeeeeeeeeeesuuuuuuuus water_walking
;;Wilderness location
;;Wither
/ispell xeddex_uurthg wither
;;Wither flesh
;;Wizard eye
;;Word of recall
