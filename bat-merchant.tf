;;
;;
;;

/loaded __TFLIB__/bat-merchant.tf

/require bat-generic.tf

/set axe_status=wielded
/set hammer_status=wielded
/set saw_status=unwielded
/set tunnel=north
;@remove saw%;
;@put saw in bp%;
;@wield hammer%;
;@wield axe%;

;; Generic wield/unwield status triggers
/def -t"You wield stout dwarven mining axe*" axe_wield = /set axe_status=wielded
/def -t"You remove stout dwarven mining axe*" axe_unwield = /set axe_status=unwielded

;; Material hilites
/def -F -aB -mglob -t'*of {cobalt|copper|electrum|iron|platinum|tungsten}*' lite_metals
/def -F -aB -mglob -t'*{cobalt|copper|electrum|iron|platinum|tungsten} ore*' lite_metals_2
/def -F -aB -mglob -t'*of {amethyst|bloodstone|olivine|onyx|quartz}*' lite_gems
/def -F -aB -mglob -t'*{amethyst|bloodstone|olivine|onyx|quartz} ore*' lite_gems_2
/def -F -aB -mglob -t'*of {granite|stone}*' lite_stones
/def -F -aB -mglob -t'*{granite|stone} is*' lite_stones_2
/def -F -aB -mglob -t'*of {crystal|obsidian}*' lite_glass
/def -F -aB -mglob -t'*{ebony|mallorn}*' lite_trees

;; Secondary materials and other useful ones
/def -F -aB -aCyellow -mglob -t'*of {adamantium|batium|durandium|kryptonite|lead|mithril|molybdenum|nullium|palladium|silicon|silver|starmetal|tadmium|tin|titanium|zhentorium}*' lite_alloy_metals
/def -F -aB -aCyellow -mglob -t'*{adamantium|batium|durandium|kryptonite|lead|mithril|molybdenum|nullium|palladium|silicon|silver|starmetal|tadmium|tin|titanium|tormium|zhentorium} ore*' lite_alloy_metals_2

;; Spells
/def cm=/set spell=create_money%;/set targettype=none%;/do_spell
/def fd=/set spell=floating_disc%;/set targettype=none%;/do_spell
/def fw=/set spell=feather_weight%;/set targettype=prot%;/do_spell %{*}
/def id=/set spell=identify%;/set targettype=prot%;/do_spell %{*}
/def lol=/set spell=lift_of_load%;/set targettype=assist%;/do_spell %{*}
/def mip=/set spell=money_is_power%;/set targettype=assist%;/do_spell %{1}
/def pa=/set spell=protect_armour%;/set targettype=prot%;/do_spell %{*}
/def pc=/set spell=preserve_corpse%;/set targettype=other%;/do_spell corpse
/def pi=/set spell=protect_item%;/set targettype=prot%;/do_spell %{*}
/def pw=/set spell=protect_weapon%;/set targettype=prot%;/do_spell %{*}
/def rs=/set spell=remove_scar%;/set targettype=assist%;/do_spell %{1}
/def sp=/set spell=satiate_person%;/set targettype=assist%;/do_spell %{1}

;; Skills
/def al=/set skill=alloying%;/set targettype=mining%;/do_skill %{*}
/def am=/if (axe_status=~"wielded") @remove axe%;/set axe_status=unwielded%;/endif%;/set skill=amalgamate%;/set targettype=mining%;/do_skill %{*}
/def ap=/set skill=appraise%;/set targettype=prot%;/do_skill %{*}
/def cn=/if (axe_status =~ "wielded") @remove axe%;@get saw from bp%;@wield saw%;/set saw_status=wielded%;/endif%;/set skill=cannibalize%;/set targettype=prot%;/do_skill %{*}
/def eol=/set skill=eye_of_loraen%;/set targettype=self%;/do_skill %{*}
/def ex=/set skill=exchange_money%;/set targettype=coins%;/do_skill %{1}%;@drop %{1}
/def gc=/set skill=gem_cutting%;/set targettype=mining%;/do_skill %{*}
/def lb=/set skill=labeling%;/set targettype=prot%;/do_skill %{*}
/def lj=/set skill=lumberjacking%;/set targettype=tree%;/do_skill %{*}
/def mc=/set skill=mineral_cutting%;/set targettype=mining%;/do_skill %{*}
/def mmg=/set skill=make_mount_gear%;/set targettype=mining%;/do_skill %{*}
/def mn=/set skill=mining%;/set targettype=mining%;/if (axe_status =~ "unwielded") @wield axe%;/endif%;/do_skill %{1}
/def mr=/set skill=make_reagent%;/set targettype=mining%;/if (axe_status =~ "wielded") @remove axe%;/endif%;/do_skill %{*}
/def ra=/set skill=repair_armour%;/set targettype=prot%;/do_skill %{*}
/def rf=/if (axe_status=~"wielded") @remove axe%;/endif%;/set skill=refining%;/set targettype=mining%;/do_skill %{*}
/def ri=/set skill=repair_item%;/set targettype=prot%;/do_skill %{*}
/def rw=/set skill=repair_weapon%;/set targettype=prot%;/do_skill %{*}
/def surg=/set skill=plastic_surgery%;/set targettype=assist%;/if (axe_status =~ "wielded") @remove axe%;/endif%;/do_skill %{*}
/def shaft=/set skill=carpentry%;/set targettype=tree%;/do_skill build supports use %{1}

;; Redo skills
/def -mglob -t'You fail to alloy the substances properly.' alloying_redo = /al
/def -mglob -t'You fail to refine the ore properly.' refining_redo = /rf
/def -mglob -t'You completely fail to amalgamate the material properly.' ama_fail = /am
/def -mglob -t'You successfully amalgamate the*' amalgamage_done = /rf 
/def -mglob -t'You are unable to find a good splitting point.' mineral_cutting_redo = /mc
/def -mglob -t'You fail your attempt to appraise this item.' appraise_redo = /ap
/def -mglob -t'You begin mining the * and you manage to retrieve *.' mining_started = /mn
/def -t'You mine the * deposit and retrieve *' mined = /mn
/def -t'You mine for a long time, but don\'t find anything.' mined2 = /mn
/def -t'A stroke of luck! You uncover a previously hidden vein!' mined3 = /mn
/def -t'You skillfully cut the gem ore into a*' gemcutdone = /gc
/def -t'You study the gem for a bit, but fail to see a good point to start cutting.' gemcutfail = /gc
/def -t'You craft some spell reagents.' reagent_complete = /mr
/def -t'You fail to start the fire.' failed_fire_building = @fb

;; Minecrafting
/def -t'A pile of rubble' tunnel_rubble = @search rubble;ga
/def tdd=/set tunnel=down%;@tunnel dig down
/def tdn=/set tunnel=north%;@tunnel dig north
/def -t'You dig through the rubble and create a new extension to your mine.' tunnel_digged = /if (tunnel =~ "north") @n;tdn%;/else @d;tdd%;/endif

/def -aB -mregexp -t'You finish refining the ([A-z]+) in ([A-z]+).  It is now ([A-z]+).' refining_done = \
/if ({P3} =~ "divine")\
   /echo -aB Material is now: %{P3}%;\
   @get %{P1} from %{P2}%;\
/else \
   /echo -aB Material is now: %{P3}%;\
   /rf%;\
/endif

;; Other hilites
/def -aCyellow -mglob -t"You sold * units of * at the exchange for *" lite_sold_reagents

/def -i -t'The fire flickers as it starts to run out of fuel.' fire_refuel = @refuel
/def -i -t'Flames on the campfire are growing weaker.' fire_refuel2 = @refuel

/def -i -p80 -ag -t'The basic structure is forming up.' chest_build_1 = /echo -p - %* (0 slots)
/def -i -p80 -ag -t'It slightly resembles a chest.' chest_build_2 = /echo -p - %* (0 slots)
/def -i -p80 -ag -t'It is missing a lid.' chest_build_3 = /echo -p - %* (0 slots)
/def -i -p80 -ag -t'It is still quite shaky.' chest_build_4 = /echo -p - %* (0 slots)
/def -i -p80 -ag -t'It looks like a small chest but it could be so much more.' chest_build_5 = /echo -p - %* (1 slots)
/def -i -p80 -ag -t'It does not look quite safe yet.' chest_build_6 = /echo -p - %* (1 slots)
/def -i -p80 -ag -t'The base looks strong now, but the lid is still quite weak.' chest_build_7 = /echo -p - %* (2 slots)
/def -i -p80 -ag -t'The chest is looking much larger.' chest_build_8 = /echo -p - %* (3 slots)
/def -i -p80 -ag -t'The construction looks bigger and bigger.' chest_build_9 = /echo -p - %* (3-4 slots)
/def -i -p80 -ag -t'The structure is now stronger than ever before.' chest_build_10 = /echo -p - %* (3-4 slots)
/def -i -p80 -ag -t'The chest looks big enough to hold out several equipments.' chest_build_11 = /echo -p - %* (6 slots)
/def -i -p80 -ag -t'The extra material has made the chest almost impossible to breach.' chest_build_12 = /echo -p - %* (6 slots)
/def -i -p80 -ag -t'The chest construction looks quite large and safe.' chest_build_13 = /echo -p - %* (7 slots)
/def -i -p80 -ag -t'The extra material in support-structure guarantees quality.' chest_build_14 = /echo -p - %* (7-8 slots)
/def -i -p80 -ag -t'The chest looks just perfect and there is very little unfinished.' chest_build_15 = /echo -p - %* (8-9 slots)
/def -i -p80 -ag -t'The construction looks very big and sturdy.' chest_build_16 = /echo -p - %* (Max slots)
/def -i -p80 -ag -t'The reinforcement looks totally incomplete.' chest_build_17 = /echo -p - %* (5% reinforced)
/def -i -p80 -ag -t'The reinforcement is still quite weak.' chest_build_18 = /echo -p - %* (10% reinforced)
/def -i -p80 -ag -t'The structure looks much stronger because of the reinforcement.' chest_build_19 = /echo -p - %* (20% reinforced)
/def -i -p80 -ag -t'The reinforcement still lacks quality.' chest_build_20 = /echo -p - %* (35% reinforced)
/def -i -p80 -ag -t'The reinforcement looks fine but it could be improved.' chest_build_21 = /echo -p - %* (55% reinforced)
/def -i -p80 -ag -t'The reinforced chest looks quite sturdy now.' chest_build_22 = /echo -p - %* (70% reinforced)
/def -i -p80 -ag -t'It would be a pain to force through the reinforcements.' chest_build_23 = /echo -p - %* (85% reinforced)
/def -i -p80 -ag -t'Just a final touch and the reinforcement is fully complete.' chest_build_24 = /echo -p - %* (100% reinforced)
