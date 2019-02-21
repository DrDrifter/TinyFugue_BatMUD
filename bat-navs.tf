;;/require -q bat-generic.tf



/def stars    =/set targettype=none%;/set skill=stargazing%;/do_skill
/def locmem   =/set targettype=tele%;/set skill=location_memory%;/do_skill remember %{*}
/def locforget=/set targettype=tele%;/set skill=location_memory%;/do_skill forget %{*}
/def dim      =/set targettype=none%;/set spell=dimension_door%;@telewear%;/do_spell
/def twie     =/set targettype=none%;/set spell=teleport_with_error%;@telewear%;/do_spell
/def sum      =/set targettype=tele%;/set spell=summon%;@telewear%;/do_spell %{*}
/def weye     =/set targettype=tele%;/set spell=wizard_eye%;@telewear%;/do_spell %{*}
/def tele     =/set targettype=none%;/set spell=teleport_without_error%;@telewear%;/do_spell
/def hw       =/set targettype=tele%;/set spell=heavy_weight%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You cast the spell successfully." navs_tempr01 = /putaway
/def ban      =/set targettype=tele%;/set spell=banish%;@telewear%;/do_spell %{*}
/def rel      =/set targettype=tele%;/set spell=relocate%;@telewear%;/do_spell %{*}
/def go       =/set targettype=tele%;/set spell=go%;@telewear%;/do_spell %{*}
/def gos      =/set targettype=tele%;/set spell=goto_ship%;@telewear%;/do_spell %{*}
/def cannon   =/set targettype=tele%;/set spell=mobile_cannon%;@telewear%;/do_spell %{*}
/def row      =/set targettype=none%;/set spell=rune_of_warding%;@telewear%;/do_spell

;; Wandu stuff
/def vs       =@vortex support
/def wcannon  =/set targettype=none%;@vortex create slingshot vortex at %{1} to %{2}
/def wdim     =/set targettype=none%;@vortex create planar gate at %{*}
/def wgate    =/set targettype=none%;@vortex create planar gate at %{*}
/def wrelo    =/set targettype=none%;@vortex create escape velocity at %{*}
/def wsum     =/set targettype=none%;@vortex create dimensional vacuum at %{*}

/def -F -i -mglob -t'You create an invisible, electric web before the dimensional rift.' rowup = @party report (rune of warding active)%;put HuuliHerpesHarppu in bp;wear removeditem
/def -F -i -mglob -t'The web-like distortion vanishes into thin air.' rowdown = @party report (rune of warding off, here come the slovenian warheros!)

;;
;; Locations in memory
/def -F -p5 -mregexp -t"Remembered locations \\([0-9]+\\):" memed_locations=\
   /set location_list=%{PR}%;\
   /repeat -3 1 /undef memed_locations2%;\
   /def -F -p5 -mregexp -t"^ ([A-Za-z, ]+)" memed_locations2=/set location_list=%%{location_list}%%{*}
/def loclist=\
   /if ({location_list}=~"")\
     /set skill=location_memory%;/set targettype=list%;/do_skill list%;\
   /else \
     @party say %{location_list}%;\
   /endif

;; Special item handling
/def -F -mglob -t"You remove bracelets made of sky-blue glass beads labeled as HyppyKuppa."    navs_remali01 = \
@alias removeditem hyppykuppa
/def -F -mglob -t"You remove bracelets made of sky-blue glass beads labeled as RunkkuKahleet." navs_remali02 = \
@alias removeditem runkkukahleet
/def -F -mglob -t"You remove Ward Nadab's rippling lava bands."                                navs_remali03 = \
@alias removeditem rippling lava bands
/def -F -mglob -t"You are unable to find a suitable dimensional rift here." navs_nosummon01 = /putaway
/def -F -mglob -t"A turbulence in the time-space continuum prevents you."   navs_nosummon02 = /putaway
/def -F -mglob -t"You sense your surroundings distorting and then snap."    navs_teledone   = /putaway
/def -F -mglob -t"* is already heavy weighted!"                             navs_hwfail01   = /putaway
/def -F -mglob -t"You cannot summon that!"                                  navs_sumfail01  = /putaway
/def -F -mglob -t"Summon who?"                                              navs_sumfail02  = /putaway
/def -F -mglob -t"You can not teleport someone from another realm with this spell." navs_sumfail03 = /putaway
/def -F -mglob -t"Cast relocate at what?"                                   navs_relofail01 = /putaway
/def -F -mglob -t"You must be in the same realm as your target for this spell." navs_relofail02 = /putaway
/def -F -mglob -t"You cannot relocate yourself there."                      navs_relofail03 = /putaway
/def -F -mglob -t"You draw door frames in the air and utter \'prtolala offf pwerrrr\'" navs_dimdoor01 = /putaway
/def -F -mglob -t"You frantically wave your hands and yell \'gwwaaajj\'"    navs_summon01   = /putaway
/def -F -mglob -t"You hop on both legs, flap your arms and chant \'buuuummbzdiiiiiibummm\'"   navs_cannon01 = /putaway
/def -F -mglob -t"You call forth the water spirits by chanting \'etheria aquariq pohjanmaa\'" navs_gotoship01 = /putaway
/def -F -mglob -t"You utter the magic words \'havia kauhistus pois\'"       navs_banish01 = /putaway
/def -F -mglob -t"Cast banish at what?"                                     navs_banish02 = /putaway
/def -F -mglob -t"You hop on both legs, flap your arms and chant \'flzeeeziiiiying nyyyaaa\'" navs_godone01 = /putaway
/def putaway = @gagoutput put HuuliHerpesHarppu in bp;wear removeditem
