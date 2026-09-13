Backported by Areasis for 3.3.5

***********************************************************************
SmartBuff
Created by Aeldra (EU-Proudmoore)
***********************************************************************

SmartBuff is a buff addon, to cast buffs easily and quickly. All classes are supported.
Bind a key and it checks if you, a party/raid member, or a hunter or warlock pet, needs your buff and casts it.
Use the options menu to configure it as you like, for example: buffs, raid subgroups, pets, etc.
Run the mod whenever you wish; if nothing is buffed, there is no penalty or cooldown.

FAQ
Q1: How can I cast group/class buffs, instead of single buffs?
A1: Select both checkboxes, assign the classes, then use the "Grp buff check", "Grp range check", and "group size"/"class size" slider options.
Example: if you set the group/class slider to 3, it will only cast the greater buff if 3 or more units don't have it.

Q2: How can I move the frames and buttons?
A2: Use Shift-Left click and drag them around.

Q3: How can I assign a trigger key for buffs?
A3: Use the Blizzard interface -> keyboard layout to define the trigger key for SmartBuff. Open and close the SmartBuff options frame and it will remap this key to the new SecureActionButton.

Q4: How can I assign a key for debuffing?
A4: With the newer Blizzard secure UI, this is no longer possible!

Q5: How can I disable the scrollwheel buffing?
A5: Disable "Buff on scroll" in the SmartBuff options frame, close it, and rebind the scrollwheel to whatever you want :)

Q6: How can I cast buffs in combat?
A6: If you want to cast a spell in combat, you also have to check the "In combat" option in the main options frame (to the right of "Buff on scroll").
Be careful with this option. No logic is allowed in combat, so SB sets your first "in combat" buff on your key before combat, but in combat it can't take any action to work around the restriction. It can only show you when you need a buff; whenever you hit the key in combat, it casts that buff.
That's also why "In combat" is off by default.

Q7: SmartDebuff casts the wrong debuff on a player, is this a bug?
A7: Please look carefully at which color the debuff button is highlighted, this is very important! You have to click the button with the correct mouse button.
Highlighted BLUE = LEFT click
Highlighted RED = RIGHT click

Q8: It does not buff anything, what's wrong?
A8: Please make sure you have selected a buff and the right classes. If you are in resting mode (in a city), SmartBuff is in "sleep mode" by default and does not cast spells; select the "Buff in cities" option to cast buffs while resting as well.

Q9: Can I use SmartBuff in a macro?
A9: Yes, since Blizzard added the /click command, use the following command:
/click SmartBuff_KeyButton

Q10: It buffs over and over again, spams the splash screen, or shows other strange behavior - what's going wrong?
A10: It seems your SmartBuff config is corrupted. Please close WoW and delete the SmartBuff SavedVariables file, found here:
[DriveLetter]:\WorldofWarcraft\WTF\Account\[AccountName]\[ServerName]\[CharacterName]\SavedVariables\SmartBuff.lua


Features:
- Supports all classes
- Supports English clients
- Checks buffs and rebuffs you, raid/party members, and raid/party pets
- Set up your own buff templates (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, ZG, Custom 1-5)
- Auto switch templates
- Individual setup for each buff
- Supports group buffs: 'Gift of the Wild'/'Arcane Brilliance'/'Prayer of Fortitude'/'Prayer of Spirit', including group size and reagent check
- Supports class buffs: all greater blessings of the Paladin
- Supports self buffs
- Supports weapon buffs (individual for main and off hand): Shaman, all poisons (Rogue), all stones and oils, including reagent check
- Supports character level based buffs
- Supports tracking abilities
- Reminder if a buff is missing (splash/chat/sound)
- Rebuff timer
- Scrollwheel or only one key is needed
- Fast and easy to use
- FuBar support
- Titan Panel support


Usage:
Minimap button:
Left click: opens the SmartBuff options frame
Right click: enables/disables SmartBuff
Alt-Left click: SmartDebuff
Shift-Left click: move minimap button

Chat:
Type /sbm for the options menu in game
Type /sb [command] or /smartbuff [command] in game
- cast buff
toggle - Toggles SmartBuff On/Off
menu - Show/hide options menu
rbt - reset buff timers
sdb - SmartDebuff
rafp - reset all frame positions

Options frame:
Right click on a buff checkbox: opens the buff setup frame


Please send me a mail or write a comment if you discover bugs or have suggestions.

Contact:
aeldra@sonnenkinder.org
