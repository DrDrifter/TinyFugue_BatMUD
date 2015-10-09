;;/require -q bat-generic.tf
/def stars    =/set targettype=tele%;/set skill=stargazing%;/do_skill .
/def locmem   =/set targettype=tele%;/set skill=location_memory%;/do_skill remember %{*}
/def locforget=/set targettype=tele%;/set skill=location_memory%;/do_skill forget %{*}
/def dim      =/set targettype=none%;/set spell=dimension_door%;/do_spell .
/def twie     =/set targettype=none%;/set spell=teleport_with_error%;/do_spell
/def sum      =/set targettype=tele%;/set spell=summon%;/do_spell %{*}
/def weye     =/set targettype=tele%;/set spell=wizard_eye%;/do_spell %{*}
/def tele     =/set targettype=none%;/set spell=teleport_without_error%;/do_spell
/def hw       =/set targettype=tele%;/set spell=heavy_weight%;/do_spell %{*}
/def ban      =/set targettype=tele%;/set spell=banish%;/do_spell %{*}
/def rel      =/set targettype=tele%;/set spell=relocate%;/do_spell %{*}
/def go       =/set targettype=tele%;/set spell=go%;/do_spell %{*}
/def cannon   =/set targettype=tele%;/set spell=mobile_cannon%;/do_spell %{*}
/def row      =/set targettype=none%;/set spell=rune_of_warding%;/do_spell .

;; Wandu stuff
/def wcannon  =/set targettype=none%;@vortex create slingshot vortex at %{1} to %{2}
/def wdim     =/set targettype=none%;@vortex create planar gate at %{*}
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
