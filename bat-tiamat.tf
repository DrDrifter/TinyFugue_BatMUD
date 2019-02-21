;;---Aura Detection reporter for spell and belt---

;;I filed a bug report to Tarken about the belt not obeying cutter, so until
;;then the belt trigger doesnt work.


;;Gag these if you want:

;;Injala says 'Hello my brave hero!'
;;Injala continues 'As you know you posses a powerful artifact. And I show
;;myself for you cause I think you
;;are worth of knowing the true power of this belt... Whenever you doubt
;;which spells affect you. You should
;;'chant alajni alajni' and you shall know. You shall never say this to
;;anyone else. This our secret. Good and
;;evil can use this. Good luck brave one!


/def ad=\
	  /set awarenesstarget=%{1} %;\
	  cast aura detection at %{1} %;

/def adb=\
	  /set awarenesstarget=I %;\
	    wear replacing golden belt %;\
            chant alajni alajni %;\
            wear replacing pilu %;

/def -F -p1000 -mregexp -t'^You detect ([0-9a-zA-Z, ]+)' detectedaura=\
	  /set missingprots=$[strcat({awarenesstarget}," needs:")] %;\
	  /set othermissingprots=$[strcat({awarenesstarget}," needs:")] %;\
	  /set detectedprots=%{P1} %;\
	  /if (strstr({detectedprots},"Armour of aether")<0) \
	  	/set missingprots=$[strcat({missingprots}," aoa")] %;\
	  /endif %;\
	 /if (strstr({detectedprots},"Repulsor aura")<0) \
	 	/set missingprots=$[strcat({missingprots}," gmana")] %;\
	 /endif %;\
	 /if (strstr({detectedprots},"Frost shield")<0) \
	 	/set missingprots=$[strcat({missingprots}," gcold")] %;\
         /endif %;\
         /if (strstr({detectedprots},"Flame shield")<0) \
	        /set missingprots=$[strcat({missingprots}," gfire")] %;\
	 /endif %;\
	 /if (strstr({detectedprots},"Aura of wind")<0) \
	        /set missingprots=$[strcat({missingprots}," gasphyx")] %;\
	 /endif %;\
	 /if (strstr({detectedprots},"Acid shield")<0) \
	        /set missingprots=$[strcat({missingprots}," gacid")] %;\
	 /endif %;\
	/if (strstr({detectedprots},"Shield of detoxification")<0) \
                /set missingprots=$[strcat({missingprots}," gpoison")] %;\
        /endif %;\
        /if (strstr({detectedprots},"Lightning shield")<0) \
                /set missingprots=$[strcat({missingprots}," gelec")] %;\
	/endif %;\
;	/if (strstr({detectedprots},"Psionic phalanx")<0) \
;	        /set missingprots=$[strcat({missingprots}," gpsi")] %;\
;	/endif %;\
	/if (strstr({detectedprots},"Force shield")<0) \
	        /set missingprots=$[strcat({missingprots}," fs")] %;\
	/endif %;\
;	/if (strstr({detectedprots},"Enhanced awareness")<0) \
;	        /set missingprots=$[strcat({missingprots}," awa")] %;\
;	/endif %;\
	/if (strstr({detectedprots},"Unstun")<0) \
	        /set othermissingprots=$[strcat({othermissingprots}," us")] %;\
	/endif %;\
	/if (strstr({detectedprots},"Unpain")<0) \
	        /set othermissingprots=$[strcat({othermissingprots}," unp")] %;\
	/endif %;\
	/if (strstr({detectedprots},"Flex shield")<0) \
	        /set othermissingprots=$[strcat({othermissingprots}," flex")] %;\
	/endif %;\
	/if (strstr({detectedprots},"Earth skin")<0) \
	        /set othermissingprots=$[strcat({othermissingprots}," eskin")] %;\
	/endif %;\
	/if (strstr({detectedprots},"Vine mantle")<0) \
	       /set othermissingprots=$[strcat({othermissingprots}," mantle")] %;\
	/endif %;\
	/if (strstr({detectedprots},"Aura of hate")<0) \
	       /set othermissingprots=$[strcat({othermissingprots}," aoh")] %;\
	/endif %;\
	/if (strstr({detectedprots},"Protection from evil")<0) \
	       /set othermissingprots=$[strcat({othermissingprots}," pfe")] %;\
	/endif %;\
;	/if (strstr({detectedprots},"Glory of destruction")<0) \
;	       /set othermissingprots=$[strcat({othermissingprots}," GoD")] %;\
;	/endif %;\
	/reportmissingprots %;

/def reportmissingprots=\
	    party report %{missingprots} %;\
	    party report %{othermissingprots} %;

;;---End Aura detection---

;;---Mage blaster---
;;shoots (should) the correct type with f1
;;

/def -mregexp -t'^(Hrr\.\.\.It is cold here.*)' tiamatcoldroom = /substitute -p @{BCwhite}COLD ROOM: @{BCcyan}%{P1}@{n}%;/set currentroom=COLD
/def -mregexp -t'^(Gray moor ruined by deadly acid rain.*)' tiamatacidroom = /substitute -p @{BCwhite}ACID ROOM: @{BCgreen}%{P1}@{n}%;/set currentroom=ACID
/def -mregexp -t'^(A room filled with fire.*)' tiamatfireroom = /substitute -p @{BCwhite}FIRE ROOM: @{BCred}%{P1}@{n}%;/set currentroom=FIRE
/def -mregexp -t'^(A place full of lightning and thunder.*)' tiamatelecroom = /substitute -p @{BCwhite}ELEC ROOM: @{BCyellow}%{P1}@{n}%;/set currentroom=ELEC

/def tiamatblaster = /if ({currentroom}=~"COLD") /if ({reverseblasting}) @fi%;/else @co%;/endif%;\
	                /elseif ({currentroom}=~"FIRE") /if ({reverseblasting}) @co%;/else @fi%;/endif%;\
	                /elseif ({currentroom}=~"ACID") /if ({reverseblasting}) @el%;/else @ac%;/endif%;\
	                /elseif ({currentroom}=~"ELEC") /if ({reverseblasting}) @ac%;/else @el%;/endif%;\
		     /endif

/def tiamatareablaster = /if ({currentroom}=~"COLD") /if ({reverseblasting}) @cast lava storm%;/else @cast hailstorm%;/endif%;\
				/elseif ({currentroom}=~"FIRE") /if ({reverseblasting}) @cast hailstorm%;/else @cast lava storm%;/endif%;\
				/elseif ({currentroom}=~"ACID") /if ({reverseblasting}) @cast lightning storm%;/else @cast acid storm%;/endif%;\
				/elseif ({currentroom}=~"ELEC") /if ({reverseblasting}) @cast acid storm%;/else @cast lightning storm%;/endif%;\
			 /endif
/def key_f11 = /tiamatblaster
/def key_f9 = /tiamatareablaster
                                                                                    
/def -p9999 -F -mregexp -t'^You die\.$' tiamatkills = /echo Died in: %{currentroom} ROOM!%;@party say Died in: %{currentroom} ROOM!
/def -F -mregexp -t'^Dunk dunk$' eldunko2 = /substitute -p @{Cyellow}-=[ @{Ccyan}dunk dunk @{Cyellow}]=-@{n}
/def tiamatswitchblasts = /set reverseblasting=$[({reverseblasting} ? 0 : 1)]%;/echo -aCyellow * REVERSE BLASTING TOGGLED, NOW $[({reverseblasting} ? "ON" : "OFF")] ! *
/def -F -p1 -mregexp -t'^([A-z ]+) ([[{(<])(party|report)([})>]|]): ([A-z ]+): ([-A-Za-z0-9צהײִ&\'\:\(\)\?<>.,!_ ]+)' tiamatpartyline=\
	/substitute -p @{Cmagenta}%{P5} %{P2}%{P3}%{P4}: %{P6}@{n}%;
/def doepeer=\
	 /def -Fp2 -aCred -mregexp -t'Incarnation of Tiamat' peertargetseen =\
		 /let str=%%{*} %%;/substitute -p %%{str} @{BCwhite}is %%{peerdir} !!@{n} %;\
		 /def -F -ag -p2 -mregexp -t'^You peer (north|east|west|south)' peerdiri=\
		      /set peeramount=$$[{peeramount}+1] %%;\
		      /set peerdir=%%{P1} %%;\
		      /if ({peeramount}>3) \
			    /purge peerdiri %%;\
		            /purge peertargetseen %%;\
		      /endif %;\
		   /set peeramount=0 %;\
		   pe
                        
;;---End Mage blaster---

;; tells what was last room seen before death    
;; needs mage blaster trig to get room type
;; tells what was last seen room before death    
/def tiamatkilled=\
	  tell alorn I died in %{tiamatroomtype} room %;\
          party say Died in %{tiamatroomtype} room

;;---fixdirs for 3rd incarnation---
;; This command is important, bind it to a function key!
;; /def key_f3 = /reversedirs
;; /def key_f4 = /fixdirs

/def reversedirs=\
	  command e west;party follow %;\
	  command w east;party follow %;\
	  command n south;party follow %;\
	  command s north;party follow
        
/def fixdirs=\
	  uncommand e %;\
	  uncommand w %;\
	  uncommand n %;\
	  uncommand s

;;---Lites---
/def -F -ag -mregexp -t'^(The dial on the globe changes to )' tiamatglobe1=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB Globe exploding soon!

/def -F -ag -mregexp -t'^(The dial on the globe that ([A-Za-z]+) is carrying changes to )' tiamatglobe2=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB If you have one, throw globe away!!!
 
/def -F -aCgreen -mregexp -t'End of the passage' foundmazeend

/def -F -aCred -mregexp -t'^Tiamat flies above and suddenly dives toward you and STOMPS to the ground' tiamatstomp=\
	  cla %;\
	    /doepeer

/def -F -aCred -mregexp -t'^Tiamat gives ([A-Za-z]+) a heavy boulder' tiamatboulder

/def -F -aCgreen -mregexp -t'^Tiamat leaves (north|east|west|south)' tiamatleft
/def -F -aCgreen -mregexp -t'^Krokodiili leaves (north|east|west|south)' krokoleft
/def -F -aCgreen -mregexp -t'^Krokodiili rides out (north|east|west|south)' krokoleft2

/def -F -mregexp -t'^(Tiamat roars \'God damn you were a sucky leader ([A-Za-z]+), lets see if ([A-Za-z]+) is any better)' tiamatleaderchange=\
	  /echo -aB %{P2} is new leader!!!!
              
/def -F -ag -mregexp -t'^(Tiamat roars \'Here, Hold this!\')' tiamatgaveglobe=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB Throw globe away !!!
    
/def -F -aCred -mregexp -t'^Tiamat suddenly drops something' tiamatdropglobe
    
/def -F -ag -mregexp -t'^(You feel like a coward)' tiamatcoward=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB Turn wimpy off !!!
    
/def -F -ag -mregexp -t'^(Drifter looks disturbed for a moment)' tiamatcastagain=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB Cast again !!!!
        
/def -F -ag -mregexp -t'^(You tackle Tiamat to the ground)' tiamatskillagain=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB Skill again !!!!

/def -F -p9999 -P0h -mregexp -t'Incarnation of Tiamat' tiamathere

/def -F -ag -mregexp -t'(([A-Za-z]+) slows down a lot, struck by lag)' tiamatlags=\
	  /echo %{P1} %;\
	    /echo -aB %{P1} lagged !!!
    
/def -F -ag -mregexp -t'^(Tiamat drains all the lightnings to herself)' tiamatelecchange=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB Roomtype changed, recast!! %;\
	      blook
  
/def -F -ag -mregexp -t'^(Tiamat looks up and the colours return to the room)' tiamatacidchange=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB Roomtype changed, recast!! %;\
	      blook
      
/def -F -ag -mregexp -t'^(Tiamat puffs a hot flame and the room warms up)' tiamatcoldchange=\
	  /echo -p @{Cred}%{P1}@{n} %;\
	    /echo -aB Roomtype changed, recast!! %;\
	      blook

/def -F -ag -mregexp -t'^Channel bat is now on.' tiamatturnedbaton =\
	/echo -aB Turning bat off %;\
	@rep
