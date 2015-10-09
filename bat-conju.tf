;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                         ;;
;; BatMUD conjurer trig stuff by drifter@bat.org, based on Jenny's trigs   ;;
;;                                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                         ;;
;; First of all, I've only tried this with mage/conju, but the trigset     ;;
;; "should" work with any conju type, since jenny's base trigset is made   ;;
;; to be very flexible and customizeable.                                  ;;
;;                                                                         ;;
;; Note that I haven't included all spells here, like create air armour    ;;
;; etc, and reagent management and spell stats are in different trigs.     ;;
;;                                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/require -q /home/drifter/lib/tf-lib/bat-generic.tf

;; conjuprots
/def aoa   = /set targettype=prot%;/set spell=armour_of_aether%;/do_spell %{*}
/def fabs  = /set targettype=prot%;/set spell=force_absorption%;/do_spell %{*}
/def acid  = /set targettype=prot%;/set spell=corrosion_shield%;/do_spell %{*}
/def acid2 = /set targettype=prot%;/set spell=acid_shield%;/do_spell %{*}
/def asph  = /set targettype=prot%;/set spell=ether_boundary%;/do_spell %{*}
/def asph2 = /set targettype=prot%;/set spell=aura_of_wind%;/do_spell %{*}
/def cold  = /set targettype=prot%;/set spell=frost_insulation%;/do_spell %{*}
/def cold2 = /set targettype=prot%;/set spell=frost_shield%;/do_spell %{*}
/def elec  = /set targettype=prot%;/set spell=energy_channeling%;/do_spell %{*}
/def elec2 = /set targettype=prot%;/set spell=lightning_shield%;/do_spell %{*}
/def fire  = /set targettype=prot%;/set spell=heat_reduction%;/do_spell %{*}
/def fire2 = /set targettype=prot%;/set spell=flame_shield%;/do_spell %{*}
/def mana  = /set targettype=prot%;/set spell=magic_dispersion%;/do_spell %{*}
/def mana2 = /set targettype=prot%;/set spell=repulsor_aura%;/do_spell %{*}
/def pois  = /set targettype=prot%;/set spell=toxic_dilution%;/do_spell %{*}
/def pois2 = /set targettype=prot%;/set spell=shield_of_detoxification%;/do_spell %{*}
/def psio  = /set targettype=prot%;/set spell=psychic_sanctuary%;/do_spell %{*}
/def psio2 = /set targettype=prot%;/set spell=psionic_phalanx%;/do_spell %{*}

;; other conjuprots
/def blur = /set targettype=prot%;/set spell=blurred_image%;/do_spell %{*}
/def disp = /set targettype=prot%;/set spell=displacement%;/do_spell %{*}
/def iw   = /set targettype=prot%;/set spell=iron_will%;/do_spell %{*}
/def sop  = /set targettype=prot%;/set spell=shield_of_protection%;/do_spell %{*}
/def mb   = /set targettype=none%;/set spell=mana_barrier%;/do_spell

;; other stuffs
/def ad  = /set targettype=info%;/set spell=aura_detection%;/do_spell %{*}
/def amf = /set targettype=none%;/set spell=anti_magic_field%;/do_spell
/def cf  = /set targettype=misc%;/set spell=create_food%;/do_spell .
/def dmp = /set targettype=prot%;/set spell=dispel_magical_protection%;/do_spell %{*}
/def id  = /set targettype=info%;/set spell=identify%;/do_spell %{*}
/def iv  = /set targettype=prot%;/set spell=infravision%;/do_spell %{*}
/def nf  = /set targettype=misc%;/set spell=neutralize_field%;/do_spell .
/def qs  = /set targettype=prot%;/set spell=quicksilver%;/do_spell %{*}
/def re  = /set targettype=prot%;/set spell=resist_entropy%;/do_spell %{*}
/def si  = /set targettype=prot%;/set spell=see_invisible%;/do_spell %{*}
/def sl  = /set targettype=misc%;/set spell=shelter%;/do_spell .
/def sm  = /set targettype=prot%;/set spell=see_magic%;/do_spell %{*}
/def ww  = /set targettype=prot%;/set spell=water_walking%;/do_spell %{*}

;; Special ,)
/def sticky = /set targettype=prot%;/set spell=resist_dispel%;/do_spell %{*}

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

;; Keybind ceremony to f12
;/bind ^[[24~ = /uc
/def key_f12 = /uc
