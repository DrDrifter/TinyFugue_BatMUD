
# TinyFugue triggers for BatMud

This compilation of triggers is intended for BatMUD (www.bat.org) Multi-User Dungeon role playing game. The triggers are freely distributed and modifiable with only one restriction, you should note the players who have contributed to their creation.

Initial base of the triggers is Jenny's tf triggers to which I have extended to.

## Usage

Clone the repository by entering this command on your command line:

`git clone https://github.com/DrDrifter/TinyFugue_BatMUD.git`

After that, decide which triggers you will need and add those to your own .tfrc

You might want to start out by testing one guilds triggers, as sometimes triggers might overlap (with the keybindings)

Simply put, start tf, make sure the trigger files (.tf) are in your tf-lib path and type
`/load bat-xxx.tf`
where xxx is the name of the guild, eg. "ranger"

## Example
As I mostly play mage myself, here is an example of a possible .tfrc file:
```
/load protter.tf
/load bat-status.tf
/load bat-hilite.tf
/load bat-shadow.tf
/load bat-magical.tf
/load bat-riftmage.tf
/load bat-mage.tf
/load bat-conju.tf
/load bat-walk.tf
/load bat-navs.tf
/load log.tf
```
## Specific files and what they do:

### bat-generic.tf
This is the main support file which will be automatically loaded with guild files. Handles all skill & spell functions and acts as a wrapper for lower level functions. Absolutely necessary but doesn't need to be loaded individually (most of the time)

### bat-hilite.tf
Hilites text, players, important events, tells, flex wobbles etc. Colors blasts of certain types with certain colors as follows:
```
+----------+------------+---------+----------------------------------------------------------------
| Type     | Background | Text    | Spells
+----------+------------+---------+----------------------------------------------------------------
| Fire     | Red        | Yellow  | Mage, Druid & Channeller blasts, Con fioco
| Cold     | Cyan       | White   | Mage, Druid & Riftwalker blasts
| Poison   | Green      | Red     | Mage blasts, aelena poison
| Magical  | Yellow     | Red     | Mage, Nun, Druid, Channeller & Reaver blasts, Celestial spark
| Acid     | Yellow     | Green   | Mage blasts
| Electric | Blue       | Yellow  | Mage & Channeller blasts
| Asphyx   | Magenta    | Blue    | Mage blasts
| Psi      | Cyan       | Magenta | Psi & Folklorist blasts
+----------+------------+---------+---------------------------------------------------------------
```
### protter.tf
Old-style protter that will report prots that are up and when they go down. Includes a prot spell name parser.

### bat-magical.tf
Magical background triggers. Basic spells that are given from the background.

### bat-nomad.tf
Nomad background triggers. Basic skills that are given from the background.

### bat-grelig.tf
Good religious background triggers. Basic spells and skills that are given from the background.

### bat-sailor.tf
For now just ship type identification.

### bat-mage.tf
Mage guild triggers. For this to work you will need to edit your specializations in the file.

### bat-status.tf
Statusbar change for mage guild. Displays your ceremony status, worn eqset, damagetype, time & heartbeats since last tick, camp timer and if there is a shelter up. Loaded automatically with bat-mage.tf

### bat-analysis.tf
Damagetype resist triggers. Loaded automatically with bat-mage.tf.

### bat-essencecount.tf
Counter for mage essences. Loaded automatically with bat-mage.tf.

### bat-combat.tf
Melee combat hilite and hit counter. Not actively updated.

## Bugs & Other stuff
As some you might note, some triggers and scripts are copied from other people. Quite a huge part of all the credit go to Jenny, Hair, Era, Ggr and many more who I might forget to mention here (sorry).

In addition there are quite a few who help with testing and messages and sometimes also fixing my bugs. A huge thanks to all contributors and to the community.

You can use git to suggest improvements or contact me directly in mud for fixes / changes.