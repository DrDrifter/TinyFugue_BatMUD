;;;;;;;;;;;;;;;;;
;; bat-walk.tf ;;
;;;;;;;;;;;;;;;;;
;; Walk
;; Copyright Jenny 1998
/def walk=\
   /if (regmatch("[news]", {*}))\
     /set walk_dir=%{*}%; %{walk_dir}%;\
     /set move_count=2%;\
   /endif%;\
   /def -F -p99 -n1 -mregexp -t"^([[A-Za-z ]+]*) \\\\([nw,n,ne,w,e,sw,s,se,u,d,enter]+\\\\).$$" terrain= /set terrain_type=%%{P1}%%;\
   /def -F -p99 -mregexp -t"^([[A-Za-z ]+]*) \\\\\\\\([nw,n,ne,w,e,sw,s,se,u,d,enter,path,portal]+\\\\\\\\).$$$" terrain_walk= /let terrain_checked_type=%%%{P1}%%%; /if ({terrain_type}!~{terrain_checked_type}) /undef terrain_walk%%%; /undef end_walk%%%; @map%%%; /elseif ({terrain_type}=~{terrain_checked_type}) /set move_count=$$$[{move_count}+1]%%%; /if ({move_count}<31) %%%{walk_dir}%%%; /else /undef terrain_walk%%%; /undef end_walk%%%; map%%%; /endif%%%; /endif%%;\
   /def -F -p99 -n1 -t"You can't go that way!" end_walk= /undef terrain_walk%;\
   %{walk_dir}
