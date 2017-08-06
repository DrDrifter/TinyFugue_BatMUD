;;;;;;;;;;;;;;;;;
;; bat-walk.tf ;;
;;;;;;;;;;;;;;;;;
;; Walk
;; Copyright Jenny 1998
;; Updates by Drifter 2002->
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
;;Laenor
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
/def nforest-digger=@13 e;20 e;9 se;e
/def castello-oakvale=@3 s;5 w;7 nw;3 n;11 w
/def oakvale-castello=@11 e;3 s;7 se;5 e;3 n
/def castello-pluras=@8 s;travel se;travel se;11 e;travel s;travel nw;travel w;20 w;2 w;2 nw;2 w
/def castello-barb=@20 s;20 s;20 s;13 sw;w
/def barb-castello=@e;13 ne;20 n;20 n;20 n
/def castello-sailor=@8 s;5 se;5 e;8 se;8 e;9 se;4 e;2 ne;2 n;ne;2 n;2 w;sw;list
/def sailor-castello=@ne;2 e;2 s;sw;2 s;2 sw;4 w;9 nw;8 w;8 nw;5 w;5 nw;8 n

;; Deso
/def caly-deso=@travel se;travel se;10 e
/def deso-caly=@10 w;travel w;travel n
/def caly-barb=@10 e;4 se;12 e;2 se
/def barb-caly=@2 nw;12 w;4 nw;10 w
/def caly-liberator=@travel sw;travel nw;2 se;20 s;4 s;8 sw;s
/def liberator-caly=@3 w;travel sw;travel e
/def caly-soy=@11 sw;20 w;w;9 sw;10 w;3 sw;11 w;14 sw;9 w;2 sw;11 w;2 sw;16 w;20 s;9 s
/def soy-caly=@20 n;9 n;16 e;2 ne;11 e;2 ne;9 e;14 ne;11 e;3 ne;10 e;9 ne;e;20 e;11 ne
/def caly-village=@20 w;5 nw;2 n;4 ne
/def village-caly=@4 sw;2 s;5 se;20 e

;; Furn
/def furn-brantis=@20 s;5 s;travel s;travel sw;nw
/def furn-darkwood=@20 s;16 s;9 sw;20 s;5 sw;11 s
/def darkwood-furn=@11 n;5 ne;20 n;9 ne;16 n;20 n
/def furn-kutanakor=@20 s;5 s;travel s;11 sw;2 s;7 sw;6 s;3 sw;20 s;2 se;20 s;2 e;7 se
/def kutanakor-furn=@9 nw;20 n;2 nw;18 n;3 ne;6 n;7 ne;2 n;11 ne;travel e;3 sw;5 nw;5 n
/def furn-perins=@20 s;16 s;9 sw;20 s;8 se;7 e;8 se;5 e;6 se;19 e;9 se;11 e;6 ne;12 e;5 s
/def peris-furn=@5 n;12 w;6 sw;11 w;9 nw;19 w;6 nw;5 w;8 nw;7 w;8 nw;20 n;9 ne;16 n;20 n

;; Roth
/def skeep-roth=@travel s;travel s;4 s;15 se;15 e;20 se;20 e;5 se;S;SW;S;SW;W;nw;2 n
/def roth-skeep=@2 s;se;E;NE;N;NE;N;n;travel nw;travel n;travel nw

;; Luce
/def luce-lore=@s;travel s;n;n
/def lore-luce=@travel n;n
/def lore-anthill=@2 w;nw;3 w;4 sw;2 s;8 sw;2 w;2 nw;6 w;4 nw;w;2 sw;2 w;sw;20 w;7 w;3 nw;4 w;6 nw;7 ne;3 n
