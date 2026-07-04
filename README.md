# **SmartBuff (3.3.5 Fixed Fork)**

A buff addon for WoW 3.3.5 that automatically checks and casts missing buffs on you, your party/raid, and pets. This is a bugfix fork of the original SmartBuff by **Aeldra**, backported for 3.3.5 by **Areasis**.

## **🔧 What's Fixed**

- **Broken rank downgrade** — When a group had mixed levels, the addon tried to guess a lower spell rank by subtracting numbers from the spell ID. WoW spell ranks aren't sequential IDs, so this often produced an invalid spell and silently failed to cast (most noticeable with Paladin blessings/seals like **Blessing of Wisdom**). Now it looks up the correct rank by name instead.
- **Death Knight ghoul pet detection** — A typo (`utc` vs `uct`) meant the addon could never recognize undead pets, so DK ghoul buffing never triggered.
- **Warrior pattern bug** — Warriors were mistakenly assigned the Paladin's "Seal of X" exclusion pattern. Harmless, but wrong — removed.
- **Chinese/Taiwanese locales** — Missing `SMARTBUFF_UNDEAD` constant, which broke undead pet detection for those clients. Added.

## **📥 Installation**

1. Download/clone this repo.
2. Copy the `SmartBuff` folder into:
   ```
   World of Warcraft/Interface/AddOns/
   ```
3. Restart WoW or `/reload`.

## **⚙️ Usage**

- Bind a key to `SmartBuff_KeyButton` (or use scroll wheel / minimap button).
- Open options via the minimap button to select buffs, classes, and group settings.
- Full FAQ is in `ReadMe.txt`.

## **🙏 Credits**

- **Original addon:** Aeldra (EU-Proudmoore)
- **3.3.5 backport:** Areasis
- **Bugfixes in this fork:** see commit history
