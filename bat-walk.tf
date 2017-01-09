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

;; Defined paths
/def castello-sc=@8 s;5 se;5 e;8 se;8 e;9 se;4 e;5 se;10 e
/def sc-castello=@10 w;5 nw;4 w;9 nw;8 w;8 nw;5 w;5 nw;8 n
/def sc-ranger=@4 e;6 s;se;8 s;5 se;4 s;2 se;2 s;11 se;20 sw;17 sw;7 w;3 sw;2 w
/def ranger-sc=@2 e;3 ne;7 e;17 ne;20 ne;11 nw;2 n;2 nw;4 n;5 nw;8 n;nw;6 n;4 w
/def castello-raven=@3 s;20 sw;5 sw;5 s;se;e;e;n;n;ne;nw;nw;ne;n;n;nw;n
/def raven-castello=@s;se;s;s;sw;se;se;sw;s;s;w;nw;w;5 ne;20 ne;5 n;3 n
/def raven-digger=@s;se;2 s;sw;2 se;sw;2 s;2 w;nw;4 w;4 sw;2 se;e
/def digger-raven=@w;2 nw;4 ne;4 e;se;2 e;2 n;ne;2 nw;ne;2 n;nw;n
/def digger-cave=@path;se;5 s;2 e;u;e;u;e;cave
/def cave-digger=@out;w;d;w;d;2 w;5 n;nw;out
/def digger-nforest=@w;9 nw;20 w;13 w
/def nforest-digger=@13 e;20 e;8 se;e
