;; Courtesy of Hair

/def array_help = \
	/ECHO -aCyellow [TF]: /array_init -a"arrayname" -e(size of array) %; \
	/ECHO -aCyellow [TF]: /array_add -a"arrayname" -s"string to add" -i(arrayindex) %; \
	/ECHO -aCyellow [TF]: /array_del -a"arrayname" -e(number of elements to delete) -i (arrayindex)

/def array_init = \
   /if (!getopts("a:e#", "")) \
      /eval /echo -p % @{BCwhite}/array_init: inits array a to be an e size array.@{n}%;\
        /eval /echo -p % @{BCred}Usage: /array_add -a(string) -s(string) -i(integer)@{n}%;\
       /return -1%;\
    /endif%;\
   /let arrayname %{opt_a}%;\
   /if (!arrayname) \
      /echo -e /array_add: array name unspecified.%;\
      /return -1%;\
   /endf%;\
   /let elementstoinit %{opt_e}%;\
   /if (!elementstoinit) \
      /echo -e /array_add: array size unspecified.%;\
      /return -1%;\
   /endf%;\
   /if (elementstoinit==0) \
      /set %{arrayname} 0%;\
   /else \
        /for i 1 elementstoinit /set @{arrayname}_%{i} 0%;\
        /eval /set %{arrayname} %{elementstoinit}%;\
    /endif


/def array_add = \
   /if (!getopts("a:s:i#", "")) \
      /eval /echo -p % @{BCwhite}/array_add: adds string s to array a with index i as the last element.@{n}%;\
        /eval /echo -p % @{BCred}Usage: /array_add -a(string) -s(string) -i(integer)@{n}%;\
       /return -1%;\
    /endif%;\
   /let arrayname %{opt_a}%;\
   /if (!arrayname) \
      /echo -e /array_add: array name unspecified!%;\
      /return -1%;\
   /endf%;\
   /let strtoadd %{opt_s}%;\
   /if (!strtoadd) \
      /echo -e /array_add: element to add unspecified!%;\
      /return -1%;\
   /endf%;\
   /let index %{opt_i}%;\
   /if (!index) \
      /echo -e /array_add:  array index unspecified!%;\
      /return -1%;\
   /endf%;\
   /eval /let newindex $[index+1]%;\
   /array_set %{arrayname}_%{newindex} %{strtoadd}%;\
   /return %{newindex}


/def array_del = \
   /if (!getopts("a:e#i#", "")) \
      /eval /echo -p % @{BCwhite}/array_del: deletes the last e elements from array a with index i.@{n}%;\
        /eval /echo -p % @{BCred}Usage: /array_add -a(string) -e(integer) -i(integer)@{n}%;\
       /return -1%;\
   /endif%;\
   /let arrayname %{opt_a}%;\
   /if (!arrayname) \
      /echo -e array_del: array name unspecified.%;\
      /return -1%;\
   /endf%;\
   /let numelements %{opt_e}%;\
   /if (!numelements) \
      /echo -e /array_del: number of elements to delete unspecified.%;\
      /return -1%;\
   /endf%;\
   /let index %{opt_i}%;\
   /if (!numelements) \
      /echo -e /array_del: array index unspecified.%;\
      /return -1%;\
   /endf%;\
   /if (numelements > index) \
      /for i 1 index /unset %{arrayname}_%{i}%;\
      /echo -e /array_del: warning: number of elements specified exceeds the array upper bound.%;\
      /unset %{arrayname}%;\
      /if (isvar(arrayname)) \
         /echo -e /array_del: failed to destroy array.%;\
         /return -1%;\
      /endif%;\
      /return 0%;\
   /else \
      /for i 1 numelements /unset %{arrayname}_%{i}%;\
      /eval /set %{arrayname} $[index-numelements]%;\
      /eval /return $[index-numelements]%;\
   /endif
  
/def array_pop = \
   /if (!getopts("a:i#", "")) \
      /eval /echo -p % @{BCwhite}/array_pop: pops the top element from array a with index i.@{n}%;\
        /eval /echo -p % @{BCred}Usage: /array_add -a(string) -e(integer) -i(integer)@{n}%;\
       /return -1%;\
   /endif%;\
   /let arrayname %{opt_a}%;\
   /if (!arrayname) \
      /echo -e array_pop: array name unspecified.%;\
      /return -1%;\
   /endf%;\
   /let index %{opt_i}%;\
   /if (!index) \
      /echo -e /array_pop: array index unspecified.%;\
      /return -1%;\
   /endf%;\
   /let element_to_pop %{array}_%{index}%;\
   /eval /set returnval $[/pop %{element_to_pop}]%;\
   /eval /return %{returnval}
  
/def pop = /return %*

/def array_push = \
   /if (!getopts("a:i#e:", "")) \
      /eval /echo -p % @{BCwhite}/array_pop: pushes element e to array a with index i.@{n}%;\
        /eval /echo -p % @{BCred}Usage: /array_add -a(string) -e(integer) -i(integer)@{n}%;\
       /return -1%;\
   /endif%;\
   /let arrayname %{opt_a}%;\
   /if (!arrayname) \
      /echo -e array_push: array name unspecified.%;\
      /return -1%;\
   /endf%;\
   /let index %{opt_i}%;\
   /if (!index) \
      /echo -e /array_push: array index unspecified.%;\
      /return -1%;\
   /endf%;\
   /let element %{opt_i}%;\
   /if (!element) \
      /echo -e /array_push: array element unspecified.%;\
      /return -1%;\
   /endf%;\
   /eval /array_set %{array} $[index+1]%;\
   /eval /array_set %{array}_$[index+1] %{element}

/def array_set = /eval /set %{P1} %{P2}

