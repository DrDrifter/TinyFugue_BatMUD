
/def -mglob -t"You decide to try a combat maneuver!" strikedone = battle -m strike
/def -mglob -t"Battle over." battledone = cast stop;loot;drop all heart;skin corpse
/def -mglob -t"You finish building a fireplace." fireready = light fireplace
/def -mglob -t"A circle of rocks and the remains of a fire" oldfireplace = refuel; light fireplace
/def -mglob -t"You don't manage to light the firewood." fireagain = light fireplace
/def -mglob -t"You cannot skin this corpse." cantbury = dig grave

/def -mglob -t"Vuruk hands the dart to you*" throwdart = throw dart

/def -mglob -t"You retrieve a * of * from the corpse." meatfound = get meat

/def -mglob -t"Because of the severe damage to your right hand, you are unable to hold on to your mace, making you lose your grip on it and almost drop it!" unwieded = wield mace

# Hunt
/set hunt_animals=\
agile_fisher,_climbing_a_tree\
angry-looking_boar\
black_and_white_raccoon\
brown-coated_forest_rabbit\
brown,_somewhat_large_mole\
brown_elk\
crouching_bobcat\
fallow_deer\
great_bear\
grey-furred_fox\
grey-furred_pine-marten\
grey-furred_squirrel,_hopping_around_between the_trees\
hovering_hummingbird\
medium-sized_timber_wolf\
old_massive_brown_moose\
plump_pheasant_is_cooing_here_to_find_a_mate\
red_fox\
squirrel,_hopping_around_between_the_trees\
tiny_weasel_is_poking_out_from_the_underbrush\
white-furred_mink\
wild_male_turkey_is_patrolling_its_territory\
wild_reindeer

/def -F -mregexp -t"You creep stealthily forward and spy the ([A-z -]+)!" hunt1 = say I have noticed a (%P1) ahead!
/def -F -mregexp -t"Suddenly, the ([A-z -]+) comes to your sight!" hunt2 = say I have noticed a (%P1) ahead!
/def -F -mregexp -t"You gather your gear and as you turn to leave, you spot a ([A-z -]+) nearby!" hunt3 = say I have noticed a (%P1) ahead!
/def -F -mregexp -t"Your patient tracking has paid off, the ([A-z -]+) is resting just ahead!" hunt4 = say I have noticed a (%P1) ahead!

# /def -F -mregexp -t"You creep stealthily forward and spy the ([A-z -]+)!|Suddenly, the ([A-z -]+) comes to your sight!|You gather your gear and as you turn to leave, you spot a ([A-z -]+) nearby!|Your patient tracking has paid off, the ([A-z -]+) is resting just ahead!" hunted = say I have noticed a [%P1] ahead!
/def -F -mregexp -t"The .+ you and runs away." huntagain = hunt
/def -F -mregexp -t"The .+ you and flies away." huntagain2 = hunt

# Combat

# You_Miss
/def -F -p5 -aCcyan -mregexp -t"You try to (bludgeon|hit|pound) ([A-z -]+) but miss (.+)" combat_misseds

# You_Hit
/def -F -p5 -aCbrightwhite -mregexp -t"You (smash|crush|pound|smite|beat|strike|firmly bash|powerfully bash|skillfully club|masterfully strike) ([A-z -']+) hitting (his|her|its) ([A-z ]+) with your ([A-z ]+) (causing|hammering|shaking|shattering|turning|SMASHING|SPLINTERING) (.+)" combat_hits
/def -F -p5 -aCred -mregexp -t"You score a CRITICAL hit!" combat_crit
/def -F -p5 -aCred -mregexp -t"You score a \*CRITICAL\* hit" combat_starcrit
/def -F -p5 -aCred -mregexp -t"You score a \*\*CRITICAL\*\* hit!" combat_doublestarcrit


# You_assault
#  ..You notice a good spot and decide to strike!

# You_Shield_Parry
/def -F -p5 -aCgreen -mregexp -t"You swing your [A-z ]+ against the attack and parry .+" combat_parried
/def -F -p5 -aCgreen -mregexp -t"You raise your [A-z ]+ as the attack comes and barely manage to parry .+" combat_parried2
/def -F -p5 -aCgreen -mregexp -t"You anticipate the attack and quickly intercept it with your [A-z ]+ and skillfully parry .+" combat_parried3
/def -F -p5 -aCgreen -mregexp -t"You smoothly move your [A-z ]+ before the attack and partially parry .+" combat_parried4
/def -F -p5 -aCgreen -mregexp -t"You put your whole weight against your [A-z ]+ and casually parry .+" combat_parried5
#You take the incoming blow to your tower shield and make a last second attempt to parry Elf's slash.


# You_weapon_parry
/def -F -p5 -aCgreen -mregexp -t"You cross your [A-z ]+ and [A-z ]+ and casually parry .+" combat_wparried
/def -F -p5 -aCgreen -mregexp -t"You send [A-z ]+ and [A-z ]+ to intercept the hit and parry .+" combat_wparried2
/def -F -p5 -aCgreen -mregexp -t"You direct the hit to the ground with your [A-z ]+ and skillfully parry .+" combat_wparried3

# You_dodge
/def -F -p5 -aCblue -mregexp -t"You sidestep to the (left|right) and dodge the .+" combat_dodged
/def -F -p5 -aCblue -mregexp -t"You nimbly dodge the (bite|chomp|hack|hit|nip|stab)." combat_dodged2
/def -F -p5 -aCblue -mregexp -t"You bend down quickly as the (bludgeon|bite|chomp|hack|hit|jab|nip|pound|slice|stab) comes and dodge it." combat_dodged3


# You avoid
/def -F -p5 -aCblue -mregexp -t"You evade the (bite|bludgeon|chomp|hit|jab|pierce|pound|thrust) by moving away from the hitline." combat_avoided1

# You resist
/def -F -p5 -aCgreen -t"You resist part of the incoming physical damage." combat_resist1

# You_Counter
#/def -F -p5 -mregexp -t"You swing your balance to the other half of your body as you parry ([A-z ]+)'s attack and use the motion to counter-attack!" combat_counter1

#Mob_Hits
#/def -F -p5 -mregexp  -t"[A-z -]+ (beats|pierces|rips|rends|stabs|strikes|tears) you hitting your [A-z ]+ with (his|her|its) [A-z ]+ causing .+"

# Mob_Misses
#/def -F -p5 -mregexp -t"[A-z -]+ tries to (bludgeon|chop|jab|hack|hit|pierce|pound|slice|stab|thrust) you but misses (by an inch|barely|slightly|completely)."


# Mob_dodges
#/def -F -p5 -mregexp -t"[A-z -]+ dodges your (hit|pound)."

#Mob_Parries
# [A-z -]+ reacts fast and swings (his|her|its) [A-z ]+ before the attack and casually parries your pound.
# [A-z -]+ casually parries your hit with (his|her|its) [A-z ]+.

#Mod parryfail
#[A-z -]+ almost falls as (he|she|it) raises (his|her|its) [A-z -]+ and has no chance to parry your pound.
#Orc vendor almost falls as he raises his dagger and has no chance to parry your hit.
