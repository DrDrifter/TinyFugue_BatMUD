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

/loaded bat-conju.tf
/require -q bat-generic.tf

;; minor conjuprots (old)
/def fabs  = /set targettype=prot%;/set spell=force_absorption%;/do_spell %{*}
/def acid  = /set targettype=prot%;/set spell=corrosion_shield%;/do_spell %{*}
/def asph  = /set targettype=prot%;/set spell=ether_boundary%;/do_spell %{*}
/def cold  = /set targettype=prot%;/set spell=frost_insulation%;/do_spell %{*}
/def elec  = /set targettype=prot%;/set spell=energy_channeling%;/do_spell %{*}
/def fire  = /set targettype=prot%;/set spell=heat_reduction%;/do_spell %{*}
/def mana  = /set targettype=prot%;/set spell=magic_dispersion%;/do_spell %{*}
/def pois  = /set targettype=prot%;/set spell=toxic_dilution%;/do_spell %{*}
/def psio  = /set targettype=prot%;/set spell=psychic_sanctuary%;/do_spell %{*}

;; major conjuprots (old)
/def aoa   = /set targettype=prot%;/set spell=armour_of_aether%;/do_spell %{*}%;@pregfill
/def gacid = /set targettype=prot%;/set spell=acid_shield%;/do_spell %{*}%;@pregfill
/def gasph = /set targettype=prot%;/set spell=aura_of_wind%;/do_spell %{*}%;@pregfill
/def gcold = /set targettype=prot%;/set spell=frost_shield%;/do_spell %{*}%;@pregfill
/def gelec = /set targettype=prot%;/set spell=lightning_shield%;/do_spell %{*}%;@pregfill
/def gfire = /set targettype=prot%;/set spell=flame_shield%;/do_spell %{*}%;@pregfill
/def gmana = /set targettype=prot%;/set spell=repulsor_aura%;/do_spell %{*}%;@pregfill
/def gpois = /set targettype=prot%;/set spell=shield_of_detoxification%;/do_spell %{*}%;@pregfill
/def gpsio = /set targettype=prot%;/set spell=psionic_phalanx%;/do_spell %{*}

;; minor conjuprots (new)
/def -ag -h"send {fabs}*" conju_fab = /set targettype=prot%;/set spell=force_absorption%;/do_spell %{2} %{3}
/def -ag -h"send {acid}*" conju_aci = /set targettype=prot%;/set spell=corrosion_shield%;/do_spell %{2} %{3}
/def -ag -h"send {asph}*" conju_asp = /set targettype=prot%;/set spell=ether_boundary%;/do_spell %{2} %{3}
/def -ag -h"send {cold}*" conju_col = /set targettype=prot%;/set spell=frost_insulation%;/do_spell %{2} %{3}
/def -ag -h"send {elec}*" conju_ele = /set targettype=prot%;/set spell=energy_channeling%;/do_spell %{2} %{3}
/def -ag -h"send {fire}*" conju_fir = /set targettype=prot%;/set spell=heat_reduction%;/do_spell %{2} %{3}
/def -ag -h"send {mana}*" conju_man = /set targettype=prot%;/set spell=magic_dispersion%;/do_spell %{2} %{3}
/def -ag -h"send {pois}*" conju_poi = /set targettype=prot%;/set spell=toxic_dilution%;/do_spell %{2} %{3}
/def -ag -h"send {psio}*" conju_psi = /set targettype=prot%;/set spell=psychic_sanctuary%;/do_spell %{2} %{3}

;; major conjuprots (new)
/def -ag -h"send {aoa}*" conju_aoa = /set targettype=prot%;/set spell=armour_of_aether%;/do_spell %{2} %{3}%;@pregfill
/def -ag -h"send {gacid}*" conju_gac = /set targettype=prot%;/set spell=acid_shield%;/do_spell %{2} %{3}%;@pregfill
/def -ag -h"send {gasph}*" conju_gas = /set targettype=prot%;/set spell=aura_of_wind%;/do_spell %{2} %{3}%;@pregfill
/def -ag -h"send {gcold}*" conju_gco = /set targettype=prot%;/set spell=frost_shield%;/do_spell %{2} %{3}%;@pregfill
/def -ag -h"send {gelec}*" conju_gel = /set targettype=prot%;/set spell=lightning_shield%;/do_spell %{2} %{3}%;@pregfill
/def -ag -h"send {gfire}*" conju_gfi = /set targettype=prot%;/set spell=flame_shield%;/do_spell %{2} %{3}%;@pregfill
/def -ag -h"send {gmana}*" conju_gma = /set targettype=prot%;/set spell=repulsor_aura%;/do_spell %{2} %{3}%;@pregfill
/def -ag -h"send {gpois}*" conju_gpo = /set targettype=prot%;/set spell=shield_of_detoxification%;/do_spell %{2} %{3}%;@pregfill
/def -ag -h"send {gpsio}*" conju_gps = /set targettype=prot%;/set spell=psionic_phalanx%;/do_spell %{2} %{3}%;@pregfill

;; other conjuprots
/def blur = /set targettype=prot%;/set spell=blurred_image%;/do_spell %{*}
/def disp = /set targettype=prot%;/set spell=displacement%;/do_spell %{*}
/def iw   = /set targettype=help%;/set spell=iron_will%;/do_spell %{*}
/def sop  = /set targettype=prot%;/set spell=shield_of_protection%;/do_spell %{*}
/def mb   = /set targettype=none%;/set spell=mana_barrier%;/do_spell

;; other stuffs
/def ad  = /set targettype=info%;/set spell=aura_detection%;/do_spell %{*}
/def amf = /set targettype=none%;/set spell=anti_magic_field%;/do_spell
/def ce  = /set targettype=misc%;/set spell=conjure_element%;/do_spell %{*}%;@pregfill
/def cf  = /set targettype=food%;/set spell=create_food%;/do_spell %{*}
/def cle = /set targettype=misc%;/set spell=conjure_lesser_element%;/do_spell %{*}%;@pregfill
/def da  = /set targettype=none%;/set spell=greater_darkness%;/do_spell
/def dmp = /set targettype=prot%;/set spell=dispel_magical_protection%;/do_spell %{*}
/def id  = /set targettype=info%;/set spell=identify%;/do_spell %{*}
/def iv  = /set targettype=help%;/set spell=infravision%;/do_spell %{*}
/def nf  = /set targettype=none%;/set spell=neutralize_field%;/do_spell
/def qs  = /set targettype=help%;/set spell=quicksilver%;/do_spell %{*}
/def rc  = /set targettype=help%;/set spell=remove_curse%;/do_spell %{*}
/def re  = /set targettype=help%;/set spell=resist_entropy%;/do_spell %{*}
/def rst = /set targettype=help%;/set spell=restore%;/do_spell %{*}
/def si  = /set targettype=help%;/set spell=see_invisible%;/do_spell %{*}
/def sl  = /set targettype=none%;/set spell=shelter%;/do_spell
/def sm  = /set targettype=help%;/set spell=see_magic%;/do_spell %{*}
/def ww  = /set targettype=help%;/set spell=water_walking%;/do_spell %{*}

;; Special ,)
/def sticky = /set targettype=help%;/set spell=resist_dispel%;/do_spell %{*}

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
/def -F -p15 -t"You start concentrating." ceremony_off_2= /set ceremony_status=off

;; Keybind ceremony to f12
;/bind ^[[24~ = /uc
/def key_f12 = /uc
