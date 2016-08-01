;; Barbarian triggers
;;
;; Mostly unmaintained, but some small changes and upkeep by
;; Drifter (2000-2005), with lots of help from Zithromax teh babr eldre

;; theyse requires are disabled, you need to load bat-generic and protter manually BEFORE this file.
;; eg: "/LOAD bat-generic.tf" and "/LOAD protter.tf" or just put em in your .tfrc file
;;
;;/require -q bat-generic.tf
;;/require -q protter.tf
/set hp_report on
/set camp ready

;; Barb repu
;; Coded by Thiamin so kudos goes to him
/def -ag -mregexp -i -t'^\[([X]*)([@]*)([#]*)([:]*)([.]*)\]$' poikelot=\
/set kymppitonnit=%P1%;/set tonnit=%P2%;/set satkut=%P3%;/set kympit=%P4%;/set ykkoset=%P5%;\
/set pisteet=$[10000*strlen(kymppitonnit)+1000*strlen(tonnit)+100*strlen(satkut)+10*strlen(kympit)+strlen(ykkoset)]%;\
/set stringi=$[strcat(kymppitonnit,tonnit,satkut,kympit,ykkoset)]%;\
/echo  [%stringi] (%pisteet points)

;; Loot and other generic skillwrappers, they REQUIRE the bat-generic.tf
/def tc=/set skill=torch_creation%;/set targettype=none%;/do_skill
/def fb=/set skill=fire_building%;/set targettype=none%;/do_skill
/def cp=/set skill=camping%;/set targettype=none%;/do_skill
/def ht=/set skill=hunting%;/set targettype=none%;/do_skill
/def fi=/set skill=fishing%;/set targettype=none%;/do_skill
/def -mglob -t"You awaken from your short rest, and feel slightly better." campdone = @party report (done camping)%;/set camp=no
/def -mglob -t"You stretch yourself and consider camping." campready1 = @party report (can camp)%;/set camp=ready
/def -mglob -t"You feel a bit tired." campready2 = @party report (can camp)%;/set camp=ready
/def -mglob -t"You feel like camping a little." campready3 = @party report (can camp)%;/set camp=ready
/def -mglob -t"You don't quite feel like camping at the moment." campnotready = @party report (camp not yet ready)
/def -mglob -t"You fail to start the fire." firefail = /fb
/def -mglob -t"Unfortunately you were unable to create a torch successfully." torchfail = /tc
/def -mglob -t"You fail to go into a frenzy." frenzyfail = /fr

;; Offensive skills
;;
;; Skill-stacking is disabled because barbs dont need it.
;; Otherwise they would exhaust their eps too soon.

;; Bcry
/def bc=/set skill=battlecry%;/set targettype=off%;/do_skill %{*}%;@emote Bcry -> %{*};target %{*}

;; Bash
/stack bash off_skill_stack
/def bsh=/set skill=bash%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

;; Kick
/stack kick off_skill_stack
/def kk=/set skill=kick%;/set skill_rounds=2%;/set targettype=off%;/do_skill %{*}

;; Pound
/stack pound off_skill_stack
/def pnd=/set skill=pound%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

;; Cleave
/stack cleave off_skill_stack
/def clv=/set skill=cleave%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}

;; Other non-offensive skillwrappers
/def cda=/set targettype=off%;/set skill=combat_damage_analysis%;/do_skill %{*}
/def ll=/set skill=lure%;/set skill_rounds=random%;/set targettype=off%;/do_skill %{*}
/def er=/set skill=enrage%;/set targettype=self%;/do_skill
/def fi=/set skill=fishing%;/set targettype=none%;/do_skill
/def fr=/set skill=frenzy%;/set targettype=self%;/do_skill

;; Barb prot skillwrappers
/def phys=/set skill=pain_threshold%;/set targettype=self%;/do_skill
/def pois=/set skill=toxic_immunity%;/set targettype=self%;/do_skill
/def cold=/set skill=cold_tolerance%;/set targettype=self%;/do_skill
/def fire=/set skill=fire_walking%;/set targettype=self%;/do_skill

;; protter stuff, you need my protter.tf to get theyse to work, otherwise THEY WILL GENERATE AN ERROR
;; If you dont need em, comment those out.
;;
;; (Sorry about the crappy enrage trig)

/def -mglob -aB -F -t'You begin to concentrate on pain threshold.' pthr_up=\
 /let timenow=$[time()]%;\
 /set prots=$(/addprot Pthrsh_%{timenow}_1_0_%You %prots)%;\
 @party report (Pain Threshold up)

/def -mglob -aB -F -t'Your concentration breaks and you feel less protected from physical damage.' pthr_down=\
 /set prots=$(/removeprot Pthrsh %prots)%;\
 @party report (Pain Threshold down)

/def -mglob -aB -F -t'You begin to concentrate on toxic immunity.' timm_up=\
 /let timenow=$[time()]%;\
 /set prots=$(/addprot TImm_%{timenow}_1_0_%You %prots)%;\
 @party report (Toxic Immunity up)

/def -mglob -aB -F -t'Your concentration breaks and you feel less protected from poison.' timm_down=\
 /set prots=$(/removeprot TImm %prots)%;\
 @party report (Toxic Immunity down)

/def -mglob -aB -F -t'You begin to concentrate on cold tolerance.' ctol_up=\
 /let timenow=$[time()]%;\
 /set prots=$(/addprot CTol_%{timenow}_1_0_%You %prots)%;\
 @party report (Cold Tolerance up)

/def -mglob -aB -F -t'Your concentration breaks and you feel less protected from cold.' ctol_down=\
 /set prots=$(/removeprot CTol %prots)%;\
 @party report (Cold Tolerance down)

/def -mglob -aB -F -t'You begin to concentrate on fire walking.' fwalk_up=\
 /let timenow=$[time()]%;\
 /set prots=$(/addprot FWalk_%{timenow}_1_0_%You %prots)%;\
 @party report (Fire Walking up)

/def -mglob -aB -F -t'Your concentration breaks and you feel less protected from fire.' fwalk_down=\
 /set prots=$(/removeprot FWalk %prots)%;\
 @party report (Fire Walking down)

/createprot -r1 -t0 -n"ER" -w"^[A-z]+ (jump|jumps) up and (begin|begins) dancing around the room." -u"(You feel mildly enraged.|You feel your barbarian rage stir up.|You are maddened with rage!|Your blood is boiling with rage!|Holy CRAP! OH what a RUSH!|You are ENRAGED! Your body ACHES for action!|YOU FEEL AS IF YOU WERE GROO HIMSELF!|You feel TOTALLY ENRAGED and ready to KICK ASS!|You tremble uncontrollably and feel completely ENRAGED!|You feel the adrenaline BURST into your veins!)" -d"^(You no longer feel enraged.)" -p"Enrage"
/def -t'You jump up and begin dancing, but you stumble and fall down on your ass. How embarrassing.' enrage_fail = /er

;; Resists
/def -F -p5 -i -ag -mregexp -t" is defenseless against ([A-Za-z]+) damage." resist_0= @party report %{PL} has no %P1 resist
/def -F -p5 -i -ag -mregexp -t" seems to be almost defenseless against ([A-Za-z]+) damage." resist_20 = @party report %{PL} has 20\% %P1 resist
/def -F -p5 -i -ag -mregexp -t" has some resistance against ([A-Za-z]+) damage." resist_40 = @party report %{PL} has 40\% %P1 resist
/def -F -p5 -i -ag -mregexp -t" seems to be moderately resistant against ([A-Za-z]+) damage." resist_60 = @party report %{PL} has 60\% %P1 resist
/def -F -p5 -i -ag -mregexp -t" has good resistance against ([A-Za-z]+) damage." resist_80 = @party report %{PL} has 80\% %P1 resist
/def -F -p5 -i -ag -mregexp -t" seems almost immune against ([A-Za-z]+) damage." resist_100 = @party report %{PL} has 100\% %P1 resist

;; Lure messages
/def -mglob -t'You have trouble but manage to*' lure_one = @party report 1 Round Lure
/def -mglob -t'You valiantly strike back at*' lure_two = @party report 2 Round Lure
/def -mglob -t'You see opportunity and butt the shaft*' lure_three = @party report 3 Round Lure
/def -mglob -t'You go \'GOTCHA\!\'*' lure_four = @party report 4 Round Lure
/def -mglob -t'..And brutally shove your weapon down*' lure_five = @party report 5 Round Lure
/def -mglob -t'But * extreme knowledge in stunned maneuvers' lure_maneuvered = @party report resisted lure!

;; KeyBinds
/def key_f5 = /fb
/def key_f6 = /cp
/def key_f8 = /er

/def key_f9 = /bsh .
/def key_f10 = /kk .
/def key_f11 = /ll .
/def key_f12 = /clv .
