;;
;; Bat-party.tf
;;
;; Changes members names to numbers
;; Updated 15.3.2004 by Drifter
;;
/loaded bat-party.tf

;;/def -F -p29 -aCwhite -t"* [\\[{]party[\\]}]: *" lite_party_channel

;; Had slight problems with heals and prots going to default, so
;; so commented the unset part out for now
;;/def -F -p19 -t",-----------------------------------------------------------------------------." party_start=/unset tank1%;/unset tank2%;/unset tank3%;/unset midd1%;/unset midd2%;/unset midd3%;/unset back1%;/unset back2%;/unset back3
/def -F -p19 -t"^\\|\\*[\\?123].[\\?123]   [A-Z]*" idle_party_members=\
   /let row=$[substr({1},2,1)]%;\
   /let column=$[substr({1},4,1)]%;\
   /if ({row}!~"?")\
     /if ({row}==1)/set tank%{column}=%{2}%;/endif%;\
     /if ({row}==2)/set midd%{column}=%{2}%;/endif%;\
     /if ({row}==3)/set back%{column}=%{2}%;/endif%;\
     /set party_members=%{tank1} %{tank2} %{tank3} %{midd1} %{midd2} %{midd3} %{back1} %{back2} %{back3}%;\
   /elseif ({row}=~"?")\
     /set party_members=%{party_members} %{3}%;\
   /endif

/def -F -p19 -t"| [\\?123].[\\?123]   [A-Z]*" party_members=\
   /let row=$[substr({2},0,1)]%;\
   /let column=$[substr({2},2,1)]%;\
   /if ({row}!~"?")\
     /if ({row}==1)/set tank%{column}=%{3}%;/endif%;\
     /if ({row}==2)/set midd%{column}=%{3}%;/endif%;\
     /if ({row}==3)/set back%{column}=%{3}%;/endif%;\
   /set party_members=%{tank1} %{tank2} %{tank3} %{midd1} %{midd2} %{midd3} %{back1} %{back2} %{back3}%;\
   /elseif ({row}=~"?")\
       /set party_members=%{party_members} %{3}%;\
   /endif
