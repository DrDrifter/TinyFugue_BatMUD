/loaded bat-navs.tf
;;/require -q bat-generic.tf


/def putaway = @gagoutput put HuuliHerpesHarppu in bp;wear removeditem;wear gorget

/def stars    =/set targettype=none%;/set skill=stargazing%;/do_skill
/def locmem   =/set targettype=tele%;/set skill=location_memory%;/do_skill remember %{*}
/def locforget=/set targettype=tele%;/set skill=location_memory%;/do_skill forget %{*}
/def dim      =/set targettype=none%;/set spell=dimension_door%;@telewear%;/do_spell%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def twie     =/set targettype=none%;/set spell=teleport_with_error%;@telewear%;/do_spell%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def sum      =/set targettype=tele%;/set spell=summon%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def weye     =/set targettype=tele%;/set spell=wizard_eye%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def tele     =/set targettype=none%;/set spell=teleport_without_error%;@telewear%;/do_spell%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def hw       =/set targettype=tele%;/set spell=heavy_weight%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def ban      =/set targettype=tele%;/set spell=banish%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def rel      =/set targettype=tele%;/set spell=relocate%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def go       =/set targettype=tele%;/set spell=go%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def gos      =/set targettype=tele%;/set spell=goto_ship%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def cannon   =/set targettype=tele%;/set spell=mobile_cannon%;@telewear%;/do_spell %{*}%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway
/def row      =/set targettype=none%;/set spell=rune_of_warding%;@telewear%;/do_spell%;/def -n1 -mglob -t"You are done with the chant." navs_tempr01 = /putaway

;; Wandu stuff
/def vs       =@vortex support
/def wcannon  =/set targettype=none%;@vortex create slingshot vortex at %{1} to %{2}
/def wdim     =/set targettype=none%;@vortex create planar gate at %{*}
/def wgate    =/set targettype=none%;@vortex create planar gate at %{*}
/def wrelo    =/set targettype=none%;@vortex create escape velocity at %{*}
/def wsum     =/set targettype=none%;@vortex create dimensional vacuum at %{*}

/def -F -i -mglob -t'You create an invisible, electric web before the dimensional rift.' rowup = @party report (rune of warding active)
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
