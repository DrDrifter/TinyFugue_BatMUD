;; (c) 2006:
;;    Eerikki Aula (era@batmud)
;; 
;; Highly under the works, but feel free to use if you find this
;; development trigset useful.

/require -q lisp.tf

; Change this line to proper dir where you have the qsort
/load trigs/qsort.tf

;todo: different outputs, lites perhaps, perhaps sorting by
;      refinement status, whatnot. Or maybe this won't progress
;      any further, you never kwow.

; The command to check force with
/def checkforge = \
  /let _forge=%* %;\
  /if ({*} =~ "") /let _forge=forge %;/endif %;\
  /def -1 -p999 -aCyellow -mregexp -t'^There are ([0-9]+) minerals in it:' forgestart = \
    /forgeminerals %;\
  look at %_forge %;%;%;%;%;%;%;

/def forgeminerals = \
  /def -ag -p999 -mregexp -t'^ ([a-z]+) [[]([*]?[a-z]+)[/]([0-9]+)(k?g)[]] +([a-z]+) [[]([*]?[a-z]+)[/]([0-9]+)(k?g)[]]' materialrow_2 = \
    /let __weight=%%P3 %%;\
    /if ({P4} =~ "kg") /let __weight=$$[{__weight}*1000] %%;/endif %%;\
    /add_mineral $$[replace(" ","_",{P1})] %%P2 %%__weight %%;\
    /let __weight=%%P7 %%;\
    /if ({P8} =~ "kg") /let __weight=$$[{__weight}*1000] %%;/endif %%;\
    /add_mineral $$[replace(" ","_",{P5})] %%P6 %%__weight %;\
  /def -ag -p998 -mregexp -t'^ ([a-z ]+) [[]([*]?[a-z]+)[/]([0-9]+)(k?g)[]] *$$' materialrow_1 = \
    /let __weight=%%P3 %%;\
    /if ({P4} =~ "kg") /let __weight=$$[{__weight}*1000] %%;/endif %%;\
    /add_mineral $$[replace(" ","_",{P1})] %%P2 %%__weight %;\
  /def -1 -p99 -mglob -t'It looks very heavy.' heavyforge = \
    /forgereport %%;\
    /undef materialrow_1 %%;\
    /undef materialrow_2

/def add_mineral = \
  /let _weight=%3 %;\
  /let _mat=%1 %;\
  /if ({_weight} =~ "") /echo PANIC! (%*) %;/endif %;\
  /if (substr({2},0,1) =~ "*") \
    /let _refined=ref %;\
    /let _quality=$[substr({2},1)] %;\
  /else \
    /let _refined=raw %;\
    /let _quality=%2 %;\
  /endif %;\
;  /echo add_mineral (%*) [%_mat %_refined %_quality %_weight/%3] %;\
;
; First occasion, add to list of minerals in forge
  /if (expr(strcat("mineral_",{_mat})) !~ "X") \
    /catvar mineral_exists %{_mat} %;\
    /mark_x mineral_%{_mat} %;\
  /endif %;\
;
; First mineral of this refinement
  /if (expr(strcat("mineral_",{_refined},"_",{_mat},"_",{_quality})) !~ "X") \
    /catvar mineral_exists_%{_refined}_%{_mat} %{_quality} %;\
    /mark_x mineral_%{_refined}_%{_mat}_%{_quality} %;\
  /endif %;\
;
; The actual valuestorage
  /addvar mineral_weight_%{_refined}_%{_mat}_%{_quality} %{_weight}

; Print the results in a nice format (version 1)
/def forgereport = \
  /echo >      material : total raw / total refined %;\
  /let _minerals=$(/qsort strcmp %mineral_exists) %;\
  /while ({_minerals} !~ "") \
    /let _mat=$(/car %_minerals) %;\
    /let _minerals=$(/cdr %_minerals) %;\
    /let _rawmats=$(/qsort strcmp $[expr(strcat("mineral_exists_raw_",{_mat}))]) %;\
    /let _rawweight=0 %;\
    /while ({_rawmats} !~ "") \
      /let _quality=$(/car %_rawmats) %;\
      /let _rawmats=$(/cdr %_rawmats) %;\
      /let _rawweight=$[{_rawweight}+expr(strcat("mineral_weight_raw_",{_mat},"_",{_quality}))] %;\
    /done %;\
    /let _refmats=$(/qsort strcmp $[expr(strcat("mineral_exists_ref_",{_mat}))]) %;\
    /let _refweight=0 %;\
    /while ({_refmats} !~ "") \
      /let _quality=$(/car %_refmats) %;\
      /let _refmats=$(/cdr %_refmats) %;\
      /let _refweight=$[{_refweight}+expr(strcat("mineral_weight_ref_",{_mat},"_",{_quality}))] %;\
    /done %;\
    /echo >$[pad({_mat},15,":",1,{_rawweight},9,"g / ",3,{_refweight},8,"g",1)] %;\
  /done %;\
;  /listvar mineral_* %;\
  /quote -S /unset `/listvar -mglob -s mineral_*

;Helper funcs, no checking yet, tobe added perhaps
/def catvar = /set %1=%2 $[expr({1})] %;\
;  /echo catvar (%*)[$[expr({1})]]

/def addvar = /set %1=$[expr({1}) + {2}]

/def mark_x = /set %1=X
