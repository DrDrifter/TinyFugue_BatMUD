;; (c) 2004:
;;    Eerikki Aula (era@batmud)
/loaded bat-pouch.tf

; Reagent pouch trigs
; Shows the reagent amounts in nice formatted lines (with spells too)
/def -mregexp -t'^The (pouch|belt) contains:$' reagentpouch = \
  /unset _reagamount%;\
  /def -p1002 -mregexp -t'^(One|Two|Three|Four|Five|Six|Seven|Eight|Nine|[0-9]+) +([a-z ()]+[^ ]) *[(]([0-9]+) power, ([0-9]+) standard, ([0-9]+) poor[)]$$' reagentsinpouch = \
; Poor reagent alert
    /if ({P5} > 0) \
      /repeat -1 1 /echo -aCred POORS: %%* %%;\
    /endif %%;\
    /if ({_reagamount} =~ "") /set _reagamount=$$[strlen({P1})]%%;/endif%%;\
;
; Total amount of reagents (convert to numeric)
    /let _reagtotal=%%P1 %%;\
    /let _reagtotal=$$[replace("One",1,{_reagtotal})] %%;\
    /let _reagtotal=$$[replace("Two",2,{_reagtotal})] %%;\
    /let _reagtotal=$$[replace("Three",3,{_reagtotal})] %%;\
    /let _reagtotal=$$[replace("Four",4,{_reagtotal})] %%;\
    /let _reagtotal=$$[replace("Five",5,{_reagtotal})] %%;\
    /let _reagtotal=$$[replace("Six",6,{_reagtotal})] %%;\
    /let _reagtotal=$$[replace("Seven",7,{_reagtotal})] %%;\
    /let _reagtotal=$$[replace("Eight",8,{_reagtotal})] %%;\
    /let _reagtotal=$$[replace("Nine",9,{_reagtotal})] %%;\
    /let _reag=%%{P2}%%;\
;
; Show long reagent-names in more compact form
    /let _reag=$$[replace(" (empty)","",{_reag})]%%;\
    /let _reag=$$[replace("grey fur triangle","fur triangle",{_reag})]%%;\
    /let _reag=$$[replace("clusters of t","t",{_reag})]%%;\
    /let _reag=$$[replace("handfuls of onyx gravel","onyx gravel",{_reag})]%%;\
    /let _reag=$$[replace("small pieces of e","e",{_reag})]%%;\
    /let _reag=$$[replace("tiny platinum hammer","platinum hammer",{_reag})]%%;\
    /let _reag=$$[replace("small highsteel disc","highsteel disc",{_reag})]%%;\
    /let _reag=$$[replace("tiny amethyst","amethyst",{_reag})]%%;\
    /let _reag=$$[replace("pairs of interlocked bloodstone","bloodstone",{_reag})]%%;\
    /let _reag=$$[replace("handfuls of olivine powder","olivine powders",{_reag})]%%;\
    /let _reag=$$[replace("silvery bark chip","bark chip",{_reag})]%%;\
    /let _len=$$[strlen({_reag})]%%;\
    /if (substr({_reag},{len}-1) !~ "s") /let _reag=%%{_reag}s%%;/endif%%;\
    /let _reaspell=[@{B}$$[expr(replace(" ","_",{_reag}))]@{n}]%%;\
;
; Replace line with more formatted version
    /substitute -p @{n}\
@{B}$$[pad({_reagtotal},{_reagamount})]@{n} \
$$[substr(strcat({_reag}," .............................."),0,19)] (\
@{B}$$[pad({P3},{_reagamount})]@{n} power, \
@{B}$$[pad({P4},{_reagamount})]@{n} standard) \
%%_reaspell%;\
;
; Trig to clear variables and (now useless) reagent trig
  /def -p100 -F -1 -mglob -t'It looks *.' reagentpouchend = \
    /undef reagentsinpouch%%;\
;    /unset _reaspell%%;\
    /unset _reagamount

    
;Bind each regent to spell
/set stone_cubes=acid shield
/set olivine_powders=acid blast
/set bloodstone_rings=acid storm
/set tiny_leather_bags=aura of wind
/set bronze_marbles=blast vacuum
/set small_brass_fans=vacuum globe
/set steel_arrowheads=cold ray
/set fur_triangles=frost shield
/set onyx_gravels=hailstorm
/set small_glass_cones=flame shield
/set granite_spheres=lava blast
/set blue_cobalt_cups=lava storm
/set electrum_wires=electrocution
/set small_iron_rods=lightning shield
/set tungsten_wires=lightning storm
/set copper_rods=golden arrow
/set platinum_hammers=magic eruption
/set quartz_prisms=repulsor aura
/set highsteel_discs=armour of aether
/set ebony_tubes=killing cloud
/set amethyst_crystals=shield of detoxifiction
/set bark_chips=summon carnal spores
