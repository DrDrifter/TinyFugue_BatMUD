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
   /def -F -p99 -n1 -mregexp -t"^([A-Za-z ]*)\[?[0-9,]*\]? \\\\([nw,n,ne,w,e,sw,s,se,u,d,enter]+\\\\).$$" terrain= /set terrain_type=%%{P1}%%;\
   /def -F -p99 -mregexp -t"^([A-Za-z ]*)\[?[0-9,]*\]? \\\\\\\\([nw,n,ne,w,e,sw,s,se,u,d,enter,path,portal]+\\\\\\\\).$$$" terrain_walk= /let terrain_checked_type=%%%{P1}%%%; /if ({terrain_type}!~{terrain_checked_type}) /undef terrain_walk%%%; /undef end_walk%%%; @map%%%; /elseif ({terrain_type}=~{terrain_checked_type}) /set move_count=$$$[{move_count}+1]%%%; /if ({move_count}<31) %%%{walk_dir}%%%; /else /undef terrain_walk%%%; /undef end_walk%%%; map%%%; /endif%%%; /endif%%;\
   /def -F -p99 -n1 -t"You can't go that way!" end_walk= /undef terrain_walk%;\
   %{walk_dir}

;; Defined paths
;;Laenor
/def castello-oakvale=@3 s;5 w;7 nw;3 n;11 w
/def castello-raven=@3 s;20 sw;5 sw;5 s;se;e;e;n;n;ne;nw;nw;ne;n;n;nw;n
/def castello-sc=@8 s;5 se;5 e;8 se;8 e;9 se;4 e;5 se;10 e
/def castello-wrebie=@8 s;travel se;travel se;travel e;travel e;6 s;se;8 s;5 se;4 s;2 se;2 s;11 se;3 e;4 se;3 e;ne;2 e;3 se;4 e;2 se;11 s
/def sc-castello=@10 w;5 nw;4 w;9 nw;8 w;8 nw;5 w;5 nw;8 n
/def sc-ranger=@4 e;6 s;se;8 s;5 se;4 s;2 se;2 s;11 se;20 sw;17 sw;7 w;3 sw;2 w
/def sc-amazon=@4 e;travel s;8 s;5 sw;8 w;12 sw;4 w;12 sw;3 s;3 sw;14 s;sw;8 s;se;12 s;5 sw;20 s;20 s;20 s;2 s;7 sw
/def sc-mist=@4 e;6 s;se;8 s;5 se;4 s;2 se;2 s;11 se;3 e;4 se;3 e;ne;2 e;3 se;4 e;4 se;9 e;3 ne;4 e;4 ne;20 e;3 e;12 se;20 s;10 s;se;10 s;sw;s
/def sc-wrebie=@4 e;6 s;se;8 s;5 se;4 s;2 se;2 s;11 se;3 e;4 se;ne;2 e;3 se;4 e;4 se;2 sw;7 s
/def ranger-sc=@2 e;3 ne;7 e;17 ne;20 ne;11 nw;2 n;2 nw;4 n;5 nw;8 n;nw;6 n;4 w
/def amazon-sc=@7 ne;20 n;20 n;20 n;2 n;travel w;4 w
/def mist-sc=@n;ne;10 n;nw;10 n;20 n;12 nw;3 w;20 w;4 sw;4 w;3 sw;9 w;4 nw;4 w;3 nw;2 w;sw;3 w;4 nw;3 w;11 nw;2 n;2 nw;4 n;5 nw;8 n;nw;6 n;4 w
/def raven-castello=@s;se;s;s;sw;se;se;sw;s;s;w;nw;w;5 ne;20 ne;5 n;3 n
/def raven-digger=@s;se;2 s;sw;2 se;sw;2 s;2 w;nw;4 w;4 sw;2 se;e
/def digger-raven=@w;2 nw;4 ne;4 e;se;2 e;2 n;ne;2 nw;ne;2 n;nw;n
/def digger-cave=@path;se;5 s;2 e;u;e;u;e;cave
/def cave-digger=@out;w;d;w;d;2 w;5 n;nw;out
/def digger-nforest=@w;9 nw;20 w;13 w
/def nforest-digger=@13 e;20 e;9 se;e
/def oakvale-castello=@11 e;3 s;7 se;5 e;3 n
/def castello-pluras=@8 s;travel se;travel se;11 e;travel s;travel nw;travel w;20 w;2 w;2 nw;2 w
/def castello-barb=@20 s;20 s;20 s;13 sw;w
/def barb-castello=@e;13 ne;20 n;20 n;20 n
/def castello-sailor=@8 s;5 se;5 e;8 se;8 e;9 se;4 e;2 ne;2 n;ne;2 n;2 w;sw;list
/def sailor-castello=@ne;2 e;2 s;sw;2 s;2 sw;4 w;9 nw;8 w;8 nw;5 w;5 nw;8 n
/def castello-mist=@8 s;travel se;travel se;11 e;6 s;se;8 s;5 se;4 s;2 se;2 s;11 se;3 e;4 se;3 e;ne;2 e;3 se;4 e;4 se;9 e;3 ne;4 e;4 ne;20 e;3 e;12 se;20 s;10 s;se;10 s;sw;s
/def mist-castello=@n;ne;10 n;nw;10 n;20 n;12 nw;3 w;20 w;4 sw;4 w;3 sw;9 w;4 nw;4 w;3 nw;2 w;sw;3 w;4 nw;3 w;11 nw;2 n;2 nw;4 n;5 nw;8 n;nw;6 n;11 w;travel w;4 w;9 nw; 8 w;8 nw;5 w
/def wrebie-sc=@7n;2 ne;4 nw;4 w;3 nw;2 w;sw;3 w;4 nw;3 w;11 nw;2 n;2 nw;4 n;5 nw;8 n;nw;6 n;4 w
/def wrebie-castello=@11 n;travel nw;travel w;travel w;travel w;travel w 42;2 ne;e;3 n
/def church-clock=@20 e;20 e;18 e;10 n;4 nw;2 n;2 e

;; Deso
/def anim-deso=@13 e;4 ne;20 e;20 e;6 se;3 e;16 se;2 s;11 se;19 e
/def caly-deso=@travel se;travel se;10 e
/def tarachia-deso=@3 e;20 e;14 ne;20 e;20 e
/def tarma-deso=@6 n;9 ne;4 n;6 ne;4 n;6 ne;8 e;3 ne;9 s;16 se;5 s;9 se;5 e;2 se;10 s;15 se;5 s;travel se;10 e
/def templar-deso=@n;nw;W;SW;W;W;NW;W;sw;W;sw;W;sw;W;sw;W;NW;W;w;travel se;travel se;10 e
/def tinmen-deso=@6 s;6 se;2 s;11 se;19 e
/def deso-anim=@19 w;11 nw;2 n;16 nw;3 w;6 nw;20 w;20 w;4 sw;13 w
/def deso-caly=@10 w;travel w;travel n
/def deso-tarma=@10 w;travel w;5 n;15 nw;10 n;2 nw;5 w;9 nw; 5 n;16 nw;9 n;3 sw;8 w;6 sw;4 s;6 sw;4 s;9 sw;6 s
/def deso-tarachia=@20 w;20 w;14 sw;20 w;3 w
/def deso-templar=@10 w;travel w;travel n;15 se;10 e;7 se;E;SE;E;ne;E;ne;E;ne;E;ne;E;SE;E;E;NE;E;SE;s
/def deso-tinmen=@19 w;11 nw;2 n;6 nw;6 n
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
/def darkwood-twisted=@3 nw;5 w;travel w;11 sw;S;SW;S;SW;S;SW;W;SW;2 nw
/def darkwood-kutanakor=@5 w;3 nw;7 w;20 w;11 sw;2 s;7 sw;6 s;3 sw;5 s;13 s;2 se;20 s;9 se
/def kutanakor-darkwood=@9 nw;20 n;2 nw;13 n;5 n;3 ne;6 n;7 ne;2 n;11 ne;20 e;7 e;3 se;5 e
/def twisted-darwood=@2 se;NE;E;NE;N;NE;N;NE;2 n;travel ne;20 e;12 e;3 se
/def perins-orthanc=@5 n;10 e;15 se;11 s;16 se;8 s;3 w

;; Roth
/def skeep-barb=@9 s;4 sw;19 s;6 se;8 ne;13 e;20 ne;5 ne;11 e;13 ne;8 e;6 ne;6 e;6 ne;17 e;se;e;se;e;ne;e;ne;8 e;3 se;e;2 ne;e;6 ne;7 e;2 ne
/def skeep-beast=@3 ne;4 e;travel n;20 n;14 nw;10 n;20 nw;w;3 nw;n;20 w;5 w;16 sw;16 s;5 sw;20 w;5 sw;20 w;5 sw;w;18 nw
/def skeep-katvil=@3 ne;4 e;6 n;7 ne;6 s
/def skeep-roth=@travel s;travel s;4 s;15 se;15 e;20 se;20 e;5 se;13 s;12 sw;6 s;12 sw;9 w;nw;2 n
/def skeep-snowdevils=@3 ne;4 e;6 n;10 ne;5 e;13 ne;8 e;6 s;3 w
/def skeep-study=@3 ne;4 e;travel n;20 n;14 nw;10 n;20 nw;w;3 nw;n;20 w;5 w;5 nw;11 n
/def roth-skeep=@2 s;se;9e;12 ne;6 n;12 ne;13 n;n;travel nw;travel n;travel nw
/def barb-skeep=@2 sw;7 w;6 sw;w;2 sw;2 w;3 nw;8 w;sw;w;sw;w;nw;w;nw;17 w;6 sw;6 w;6 sw;8 w;13 sw;11 w;5 sw;20 sw;13 w;8 sw;6 nw;19 n;4 ne;9 n
/def beast-skeep=@18 se;e;5 ne;20 e;5 ne;20 e;5 ne;16 n;16 ne;20 e;5 e;s;5 se;e;18 se;travel s;travel sw;nw;3 w;3 sw
/def katvil-skeep=@6 n;7 sw;6 s;4 w;3 sw
/def snow-roth=@3 e;6 n;travel w;nw;3 w;3 sw;travel s;travel s;4 s;15 se;15 e;20 se;20 e;5 se;S;SW;S;SW;W;nw;2 n

;; Luce
/def luce-lore=@s;travel s;n;n
/def lore-luce=@travel n;n
/def lore-anthill=@2 w;nw;3 w;4 sw;2 s;8 sw;2 w;2 nw;6 w;4 nw;w;2 sw;2 w;sw;20 w;7 w;3 nw;4 w;6 nw;7 ne;3 n
/def lore-barb=@2 w;nw;3 w;4 sw;2 s;8 sw;2 w;2 nw;6 w;4 nw;2 n;ne
/def lore-zebells=@2 w;nw;3 w;4 sw;2 s;5 sw;5 se;2 s;6 se;s;se;s;5 se;3 s;5 se;s;se;6 se;e;2 s;2 se;3 s;se;s
/def barb-lore=@sw;2 s;4 se;6 e;2 se;2 e;8 ne;2 n;4 ne;3 e;se;2 e
/def anthill-lore=@3 s;7 sw;6 se;4 e;3 se;7 e;20 e;ne;2 e;2 ne;e;4 se;6 e;2 se;2 e;8 ne;2 n;4 ne;3 e;se;2 e
/def zebells-lore=@n;nw;3 n;2 nw;2 n;w;6 nw;nw;n;5 nw;3 n;5 nw;n;nw;n;6 nw;2 n;5 nw;5 ne;2 n;4 ne;3 e;se;2 e
