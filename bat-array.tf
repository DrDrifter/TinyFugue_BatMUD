/loaded bat-array.tf

;
; A tinyfugue module for creating global arrays.
;

; /make_array name
;     Creates a new array with the given name. Array names can consist of letters
;     and numbers and are case sensitive. Underscores in array names are allowed,
;     but strongly discouraged. Returns a reference to the new array.
;     Note: All arrays are 'global', meaning that array names are not unique to
;     any module or scope, and and two different arrays cannot have the same name.
;
; /make_array name [index1..indexN] subname
; /make_array arref subname
;     Creates a new sub-array with the given name to an existing array.
;     The parent array can be given by its reference value, or by the name
;     of the root array and and any number of indexes to existing sub-arrays.
;     Returns a reference to the new array.
;
; /add_array name [index1..indexN]
; /add_array arref
;     Adds a new sub-array to the end of an existing array or sub-array. This
;     is similar to /make_array, except that the index of the array is
;     automatically set to the next available number (the highest used number
;     + 1). Array indexes start at 1. Returns a reference to the new array.
;
; /get_array name
; /get_array arref subname|index
; /get_array name [index1..indexN] subname|index
;     Returns a reference to an existing array or sub-array with the given name
;     or index.
;
; /set_array_val arref index value
; /set_array_val name [index1..indexN] index value
;     Sets the value of an array entry at the given index. The index can be a
;     string or a number.
;
; /add_array_val arref value
; /add_array_val name [index1..indexN] value
;     Adds a new array entry to the end of an existing array or sub-array. This
;     is similar to /set_array_val, except that the index of the entry is
;     automatically set to the next available number (the highest used number + 1).
;     Array indexes start at 1.
;
; /get_array_val arref index
; /get_array_val name [index1..indexN] index
;     Gets the value of an array entry at the given index. The index can be a
;     string or a number.
;
; /get_array_count arref
; /get_array_count name [index1..indexN]
;     Returns the highest index number used in an array or sub-array. This is
;     not necessarily the same as the number of entries in the array, since
;     it does not include indexes that are not numbers, and index numbers may
;     also be skipped when set manually.
;
; /copy_array arref1 arref2
;     Copies an array
;
; /purge_array name
;     Removes the array with the given name.
;
; /dump_array arref
;     Outputs the value of the array and all sub-arrays.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   EXAMPLE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; To create the following array:
; 
;     "areas": [
;         "diggas": [
;             "continent": "laen",
;             "x": 289,
;             "y": 474,
;         ],
;         "soy": [
;             "continent": "deso",
;             "x": 166,
;             "y": 356,
;         ],
;         "cashareas": [
;             1: "drawbridge",
;             2: "two_towers",
;         ]
;     ]
; 
; Either of the following forms can be used:
; 
; /make_array areas
; /make_array areas diggas
; /set_array_val areas diggas continent laen
; /set_array_val areas diggas x 289
; /set_array_val areas diggas y 474
; /make_array areas soy
; /set_array_val areas soy continent deso
; /set_array_val areas soy x 166
; /set_array_val areas soy y 356
; /make_array areas cashareas
; /add_array_val areas cashareas drawbridge
; /add_array_val areas cashareas two_towers
; 
;     --or--
; 
; /test arealist := make_array("areas")
; /test area := make_array(arealist, "diggas")
; /test set_array_val(area, "continent", "laen")
; /test set_array_val(area, "x", 289)
; /test set_array_val(area, "y", 474)
; /test area := make_array(arealist, "soy")
; /test set_array_val(area, "continent", "deso")
; /test set_array_val(area, "x", 166)
; /test set_array_val(area, "y", 356)
; /test cash_areas := make_array(arealist, "cashareas")
; /test add_array_val(cash_areas, "drawbridge")
; /test add_array_val(cash_areas, "two_towers")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; /make_array name
; /make_array arref subname|index
; /make_array name [index1..indexN] subname|index
/def -i make_array = \
    /let arref=$[_to_arref({*})]%;\
    /let arcnt=$[_to_arcnt({-L1})]%;\
    /let index=%L1%;\
    /if (arref =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return ""%;\
    /endif%;\
    /if ({#} > 1) \
        /let count=%;\
        /test count := %arcnt%;\
        /if (index > count) \
            /test %arcnt := index%;\
        /endif%;\
    /endif%;\
    /result arref


; /add_array arref
; /add_array name [index1..indexN]
/def -i add_array = \
    /let arcnt=$[_to_arcnt({*})]%;\
    /if (arcnt =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return ""%;\
    /endif%;\
    /let index=%;\
    /test index := 1 + %arcnt%;\
    /test %arcnt := index%;\
    /let arref=$[_to_arref({*}, index)]%;\
    /result arref


; /get_array name
; /get_array arref subname|index
; /get_array name [index1..indexN] subname|index
/def -i get_array = \
    /let arref=$[_to_arref({*})]%;\
    /if (arref =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return ""%;\
    /endif%;\
    /result arref


; /set_array_val arref index value
; /set_array_val name [index1..indexN] index value
/def -i set_array_val = \
    /let arref=$[_to_arref({-L1})]%;\
    /let arcnt=$[_to_arcnt({-L2})]%;\
    /let index=%L2%;\
    /let value=%L1%;\
    /if (arref =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return ""%;\
    /endif%;\
    /test %arref := value%;\
    /let count=%;\
    /test count := %arcnt%;\
    /if (index > count) \
        /test %arcnt := index%;\
    /endif


; /add_array_val arref value
; /add_array_val name [index1..indexN] value
/def -i add_array_val = \
    /let arcnt=$[_to_arcnt({-L1})]%;\
    /let value=%L1%;\
    /if (arcnt =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return ""%;\
    /endif%;\
    /let index=%;\
    /test index := 1 + %arcnt%;\
    /test %arcnt := index%;\
    /let arref=$[_to_arref({-L1}, index)]%;\
    /test %arref := value%;\
    /result arref


; /get_array_val arref index
; /get_array_val name [index1..indexN] index
/def -i get_array_val = \
    /let arref=$[_to_arref({*})]%;\
    /if (arref =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return ""%;\
    /endif%;\
    /result %arref


; /get_array_count arref
; /get_array_count name [index1..indexN]
/def -i get_array_count = \
    /let arcnt=$[_to_arcnt({*})]%;\
    /if (arcnt =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return ""%;\
    /endif%;\
    /result 0 + %arcnt


; /copy_array arref1 arref2
/def -i copy_array = \
    /let arrfrom=$[_to_arref({1})]%;\
    /let arrto=$[_to_arref({2})]%;\
    /if (arrfrom =~ "" | arrto =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return%;\
    /endif%;\
    /quote -S /_copy_array1 %arrfrom %arrto `/listvar -s -mglob %{arrfrom}_*%;\
    /test arrfrom := _to_arcnt(arrfrom)%;\
    /test arrto := _to_arcnt(arrto)%;\
    /if /test {%arrfrom} !~ ""%; /then \
        /_copy_array1 %arrfrom %arrto %arrfrom%;\
    /endif%;\
    /quote -S /_copy_array1 %arrfrom %arrto `/listvar -s -mglob %{arrfrom}_*

/def -i _copy_array1 = \
    /let arrfrom=%{1}%;\
    /let arrto=%{2}%;\
    /let var=%{-2}%;\
    /let s=%;\
    /test s := replace("%{arrfrom}", "%{arrto}", var)%;\
    /test %{s} := %var


; /purge_array name
/def -i purge_array = \
    /if ({#} == 1) \
        /quote -S /unset `/listvar -mglob -s _ARRAY_%1_* %;\
        /quote -S /unset `/listvar -mglob -s _ARCNT_%1_* %;\
    /unset _ARCNT_%1%;\
    /else \
        /echo %0: Invalid number of arguments (%*)%;\
    /endif


; /dump_array name
; /dump_array arref subname|index
; /dump_array name [index1..indexN] subname|index
/def -i dump_array = \
    /let arref=$[_to_arref({*})]%;\
    /if (arref =~ "") \
        /echo %0: Bad argument (%*)%;\
        /return ""%;\
    /endif%;\
    /listvar -g %{arref}*


; Helper methods
/def -i _arr_is_valid = \
    /let arref=%{*}%;\
    /if (regmatch("^[A-Za-z0-9_]*$", arref) != 0) \
        /result arref%;\
    else \
        /result ""%;\
    /endif

/def -i _to_arref = \
    /let arref=%;\
    /if ({*} =~ "") \
        /return ""%;\
    /else \
        /if (substr({1}, 0, 7) =~ "_ARRAY_") \
            /test arref := replace(" ", "_", {*})%;\
        /else \
            /test arref := strcat("_ARRAY_", replace(" ", "_", {*}))%;\
        /endif%;\
        /result _arr_is_valid(arref)%;\
    /endif

/def -i _to_arcnt = \
    /let arref=%;\
    /test arref := _to_arref({*})%;\
    /if (arref =~ "") \
        /return ""%;\
    /else \
        /result strcat("_ARCNT_", substr(arref, 7))%;\
    /endif
