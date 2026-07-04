# **SmartBuff-3.3.5**

A buff addon for WoW 3.3.5 that automatically checks and casts missing buffs on you, your party/raid, and pets.

## **📥 Installation**

1. Download/clone this repo.
2. Copy the `SmartBuff` folder into:
   World of Warcraft/Interface/AddOns/
3. Restart WoW or `/reload`.

## **⚙️ Usage**

- Bind a key to `SmartBuff_KeyButton` (or use scroll wheel / minimap button).
- Open options via the minimap button to select buffs, classes, and group settings.
- Full FAQ is in `ReadMe.txt`.

## **🙏 Credits**

- **Original addon:** Aeldra (EU-Proudmoore)
- **3.3.5 backport:** Areasis
- **Bugfixes in this fork:** see commit history

---

# **SmartBuff Documentation**

Backported by Areasis for 3.3.5

***********************************************************************

## **SmartBuff**
Created by Aeldra (EU-Proudmoore)

***********************************************************************

SmartBuff is a buff addon, to cast buffs ease and quickly. All classes are supported.
Bind a key and it checks if you, a party/raid member, also hunter and warlock pets, needs your buff and cast it.
Use the options menu to configure it you like, as example: buffs, raid subgroups, pets, etc.
Run the mod when ever you wish, if nothing is buffed, there is no penalty or cool down.

---

## **FAQ**

### **Q1: How can I cast group/class buffs, instead of single buffs?**
**A1:** Select both checkboxes, assign the classes, use following options the play around "Grp buff check", "Grp range check" and "group size"/"class size" slider.
Example, if you set the group/class slider to 3 it will only buff the greater buff if 3 or more units not have it.

### **Q2: How can I move the frames and buttons?**
**A2:** Use Shift-Left click and drag them arround

### **Q3: How can I assign a trigger key for buffs?**
**A3:** Use the Blizzard interface -> keyboard layout to define the trigger key for SmartBuff. Open and close the SmartBuff options frame and it will remap this key to the new SecureActionButton

### **Q4: How can I assign a key for debuffing?**
**A4:** During the new Blizzard secure UI is this not longer possible!

### **Q5: How can I disable the scrollwheel buffing?**
**A5:** Disable the "Buff on scroll" in the SmartBuff options frame, close it and rebind scrollwheel to whatever you want :)

### **Q6: How can I cast buffs in combat?**
**A6:** If you want to cast a spell in combat, the you have to check also the "in combat" option in the main options frame (on the right of "Buff on scroll").
Be carfully with this option. In combat is no logic allowed, so SB sets your first "combat"-buff on your key before combat, but in combat it can't do any actions to prevent to cast during the restrict[...]
Thats also the reason why the "in combat" is per default "off".

### **Q7: SmartDebuff casts the wrong debuff on a player, is this a bug?**
**A7:** Please watch carfully in which color the debuff button is highlighted, this is very important! You have to click the button with the correct mouse click.
- Highlighted **BLUE** = LEFT click
- Highlighted **RED** = RIGHT click

### **Q8: It does not buff anything, whats wrong?**
**A8:** Please make sure you have selected any buff and the right classes. If you are in resting mode (Cities) SmartBuff is per default in "sleep mode" and does not cast spells, select the option "Buff in[...]

### **Q9: Can I use SmartBuff in a macro?**
**A9:** Yes, since the last blizzard added a /click command, use following command:
```
/click SmartBuff_KeyButton
```

### **Q10: It buffs over and over again, splash screen spaming or other strange behaviors, whats going wrong?**
**A10:** It seems that your SmartBuff config has messed up. Please close WoW and delete SmartBuff SavedVariables file, you find it here:
```
[DriveLetter]:\WorldofWarcraft\WTF\Account\[AccountName]\[ServerName]\[CharacterName]\SavedVariables\SmartBuff.lua
```

---

## **Features**

- ✅ Supports all classes
- ✅ Supports EN/DE/FR clients
- ✅ Checks buffs and rebuff you, raid/party members, raid/party pets
- ✅ Setup your own buff templates (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, ZG, Custom 1-5)
- ✅ Auto switch templates
- ✅ Individual setup for each buff
- ✅ Supports group buffs: 'Gift of the Wild'/'Arcane Brilliance'/'Prayer of Fortitude'/'Prayer of Spirit', incl. group size and reagence check
- ✅ Supports class buffs: all greater blessings of the Paladin
- ✅ Supports self buffs
- ✅ Supports weapon buffs (individual for main and off hand): Shaman, all poisons (Rogue), all stones and oils, incl. reagence check
- ✅ Supports character level based buffs
- ✅ Supports tracking abilities
- ✅ Reminder if a buff is missing (Splash/chat/sound)
- ✅ ReBuff Timer
- ✅ Scrollwheel or only one key is needed
- ✅ Fast and easy to use
- ✅ FuBar support
- ✅ Titan Panel support

---

## **Usage**

### **Minimap Button**
- **Left click:** opens SmartBuff options frame
- **Right click:** enables/disables SmartBuff
- **Alt-Left click:** SmartDebuff
- **Shift-Left click:** move minimap button

### **Chat Commands**
- `/sbm` — opens options menu in game
- `/sb [command]` or `/smartbuff [command]` — in game commands:
  - `cast buff`
  - `toggle` — Toggles SmartBuff On/Off
  - `menu` — Show/hide options menu
  - `rbt` — reset buff timers
  - `sdb` — SmartDebuff
  - `rafp` — reset all frame positions

### **Options Frame**
- **Right click on buff checkbox:** opens buff setup frame

---

## **Contact & Support**

Please send me a mail or write a comment if you discover Bugs or have Suggestions.

📧 **Contact:** aeldra@sonnenkinder.org

***********************************************************************

## **SmartDebuff**

Ein verschiebbares Fenster mit Knöpfen für alle Spieler in Solo/Party/Raid.
Verknüpft deine Debuff Zauber auf links und rechts Klick (Links = Blau, Rechts = Rot) von den Debuff Knöpfen.
Zeigt Debuffs gut sichbar Blau und Rot auf dem Knopf an, diese können dann mit entsprechenden Mausklick despelled werden.

Highlight the target that needs to debuffed and binds your debuff spells to left and right click (left = blue, right = red) on the debuff button.

### **Beschreibung**
SmartBuff ist ein Buff Addon, dass das (Re)Buffen so einfach und schnell wie möglich von statten geht. Es werden alle Klassen unterstützt. Auf Knopfdruck (Bind oder Macro erstelle ein Macro '/sb') w[...]

### **Features (Deutsch)**

- ✅ Unterstützt alle Klassen
- ✅ Unterstützt EN/DE/FR Clients
- ✅ Überprüft die Buffs und bufft dich, Raid/Party Mitglieder, Raid/Party Pets
- ✅ Individuelle Einstellungen für jeden Buff
- ✅ Erstellen von Buff-Vorlagen möglich (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, Naxx, ZG, Custom 1-5)
- ✅ Automatischer Vorlagewechsel
- ✅ Unterstützt Gruppen-Buffs: 'Gabe der Wildnis'/'Arkane Brillanz'/'Gebet der Seelenstärke'/'Gebet der Willenskraft', inkl. Gruppengrösse und Reagenzien Check
- ✅ Unterstützt Klassen-Buffs: Grosse Segen des Paladins
- ✅ Unterstützt Selbst-Buffs
- ✅ Unterstützt Waffen-Buffs (individuell für Waffen- und Schildhand): des Schamanen, alle Gifte (Schurke), alle Steine und Öle, inkl. Reagenzien Check
- ✅ Unterstützt vom Charakter-Level abhängige Buffs
- ✅ Unterstützt die Suche nach Kräutern, Erzen, etc.
- ✅ Unterstützt Debuffs
- ✅ Erinnerung, falls bei jemandem ein Buff fehlt (Splash/Chat/Ton)
- ✅ ReBuff Timer
- ✅ Buffen mit Mausrad oder alles auf nur einer Taste
- ✅ FuBar support
- ✅ Titan Panel support

### **Gebrauch (Deutsch)**

**Minimap-Knopf:**
- **Links Klick:** öffnet das SmartBuff Menü
- **Rechts Klick:** schaltet SmartBuff an/aus
- **Alt-Links Klick:** SmartDebuff
- **Shift-Links Klick:** Minimap verschieben

**Chat:**
- `/sbm` — für das Option-Menü in game
- `/sb [command]` oder `/smartbuff [command]` in game:
  - `toggle` — Toggles SmartBuff An/Aus
  - `menu` — Öffnet/versteckt das Options-Menü
  - `rbt` — Buff Timer zurücksetzen
  - `sdb` — SmartDebuff
  - `rafp` — Alle Fensterpositionen zurücksetzen

**Optionen-Menü:**
- **Rechtsklick auf die Buff-Checkbox:** öffnet das Buffsetup-Menü

**Kontakt:** aeldra@sonnenkinder.org

***********************************************************************

## **Changelog**

| Rev  | Date       | Description |
|------|------------|-------------|
| 3.3e | 2010-08-17 | Updated linked buffs detection; Fixed minimap button LUA error, if SmartBuff is toggled before it is initialized |
| 3.3d | 2010-06-28 | Added mage elemental to warlock pets; Updated spell range detection; Updated battleground/arena detection; Updated UI buff synchronization; Updated linked buffs detection; Fixed battleground/arena auto template switch; Fixed LUA error, if SmartBuff is toggled before it is initialized |
| 3.3c | 2010-01-19 | Fixed minimap button behavior with other minimap addons; Fixed dual spec change issue |
| 3.3b | 2010-01-05 | Added buffs: Priest (Vampiric Embrace), Rogue (Tricks of the Trade); Fixed spell check for Arcane/Dalaran Intellect and Arcane/Dalaran Brilliance; Updated auto check timer range; Updated chat command |
| 3.3a | 2009-12-09 | Added template: Arena and ICC; Updated spell range detection; Updated location detection; Updated instance templates; Updated Titan Panel support |
| 3.2b | 2009-09-07 | Added forms: Druid (Moonkin, Tree), Priest (Shadow); Updated Consumables: Flask of the North; Updated buff detection |
| 3.2a | 2009-08-06 | Added dual spec support; Added buffs: Paladin (Hand of Freedom); Added Data Broker support; Updated buff list; Updated group/raid buff detection |
| 3.1a | 2009-04-15 | Added buffs: Paladin (Sacred Shield, Avenging Wrath), Death Knight (Auras), Mage (Slow Fall), Shaman (Water Walking); Added Death Knight pet support; Added basic flask and elixir support |
| 3.0e | 2008-12-03 | Added buffs: Warlock (Life Tap), Druid (Savage Roar); Updated spell level check; Updated food list |
| 3.0d | 2008-11-25 | Added Parrot support; Added buffs: Mage (Dalaran Intellect/Brilliance), Priest (Levitate); Updated reagents list |
| 3.0c | 2008-11-18 | Updated spell list and levels; Added scroll support; Added items: oils, poisons, stones, food; Added buffs: Hunter (Aspect of the Dragonhawk), Rogue (Hunger for Blood) |
| 3.0b | 2008-10-25 | Fixed group buff support; Added buffs: Mage (Focus Magic), Warrior (Vigilance); Added items: Warlock (Spellstone, Master Firestone); Updated Titan support |
| 3.0a | 2008-10-15 | Updated to patch 3.0; Added special crusader aura check; Added fishing check; Updated battlefield and arena detection; Updated buff and item detection |

**For complete version history, see commit logs.**
