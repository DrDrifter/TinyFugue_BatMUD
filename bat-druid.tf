;;
;; Druid guild wrapper trigs
;;

/loaded bat-druid.tf
/require -q bat-generic.tf

; offspells
/def cm=/set spell=create_mud%;/set targettype=off%;/set spell_rounds=3%;/do_spell %{*}
/def sl=/set spell=star_light%;/set targettype=off%;/set spell_rounds=4%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|star_light
/def gf=/set spell=gem_fire%;/set targettype=off%;/set spell_rounds=3%;/do_spell %{1} use gem
/eval /set off_spell_stack=%{off_spell_stack}|gem_fire
/def hf=/set spell=hoar_frost%;/set targettype=off%;/set spell_rounds=5%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|hoar_frost
/def wf=/set spell=wither_flesh%;/set targettype=off%;/set spell_rounds=6%;/do_spell %{*}
/def eq=/set spell=earthquake%;/set targettype=off%;/set spell_rounds=5%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|earthquake
/def ss=/set spell=summon_storm%;/set targettype=off%;/set spell_rounds=5%;/do_spell %{*}
/eval /set off_spell_stack=%{off_spell_stack}|summon_storm

; prots
/def es=/set spell=earth_skin%;/set targettype=prot%;/do_spell %{*}
/def ep=/set spell=earth_power%;/set targettype=prot%;/do_spell %{*}
/def rg=/set spell=regeneration%;/set targettype=prot%;/do_spell %{*}
/def iv=/set spell=infravision%;/set targettype=prot%;/do_spell %{1}
/def fs=/set spell=flex_shield%;/set targettype=prot%;/do_spell %{*}
/def si=/set spell=see_invisible%;/set targettype=prot%;/do_spell %{*}
/def vm=/set spell=vine_mantle%;/set targettype=prot%;/do_spell %{*}
/def eb=/set spell=earth_blood%;/set targettype=prot%;/do_spell %{*}

; other stuff
/def ad=/set spell=aura_detection%;/set targettype=assist%;/do_spell %{*}
/def bw=/set spell=blessed_warmth%;/set targettype=none%;/do_spell
/def cs=/set spell=charge_staff%;/set targettype=druid%;/do_spell amount %{1}
/def cpi=/set spell=call_pigeon%;/set targettype=item%;/do_spell %{*}
/def dp=/set spell=drain_pool%;/set targettype=druid%;/do_spell amount %{1}
/def dw=/set spell=drying_wind%;/set targettype=none%;/do_spell
/def gb=/set spell=good_berry%;/set targettype=none%;/do_spell
/def gow=/set spell=gust_of_wind%;/set targettype=none%;/do_spell
/def gw=/set spell=gust_of_wind%;/set targettype=none%;/do_spell
/def iv=/set spell=infravision%;/set targettype=assist%;/do_spell %{1}
/def re=/set spell=replenish_energy%;/set targettype=assist%;/do_spell %{1} amount %{2}
/def reinc=/set spell=reincarnation%;/set targettype=assist%;/do_spell %{1}
/def rh=/set spell=runic_heal%;/set targettype=heal%;/do_spell %{*}
/def rst=/set spell=restore%;/set targettype=assist%;/do_spell %{1}
/def sha=/set spell=shapechange%;/set targettype=self%;/do_spell %{1}
/def tax=/set spell=inquiry_to_ahm%;/set targettype=assist%;/do_spell %{1}
/def tm=/set spell=transfer_mana%;/set targettype=assist%;/do_spell %{1} amount %{2}
/def wl=/set spell=wilderness_location%;/set targettype=assist%;/do_spell player %{1}

/def fb=/set skill=fire_building%;/set targettype=none%;/do_skill
/def camp=/set skill=camping%;/set targettype=none%;\
/do_skill
;remove glove,glove 2,glove 3,glove 4%;\
;wear object%;\


;/def -t"You awaken from your short rest, and feel slightly better." campdone = @party say (done camping)%;remove object
/def -t"You awaken from your short rest, and feel slightly better." campdone = @party say (done camping)
/def -t"You stretch yourself and consider about camping." campready1 = @party say (can camp)
/def -t"You feel a bit tired." campready2 = @party say (can camp)
/def -t"You feel like camping a little." campready3 = @party say (can camp)
