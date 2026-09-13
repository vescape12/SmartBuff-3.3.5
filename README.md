# **SmartBuff (3.3.5 Fixed Fork)**

A buff addon for WoW 3.3.5 that automatically checks and casts missing buffs on you, your party/raid, and pets. This is a bugfix fork of the original SmartBuff by **Aeldra**, backported for 3.3.5 by **Areasis**.

This fork is **English-only** — all other language files were removed to keep the codebase small and easy to maintain.

## **🔧 What's Fixed**

- **Buffs going permanently missing** — Item-based buffs (food, potions, Firestones, weapon stones/oils, etc.) were silently and *permanently* deleted from the checklist for the rest of your session if you didn't happen to be carrying the reagent the moment the addon started up — even if you picked one up five minutes later. Fixed to re-check properly every time instead of only once.
- **Slow-to-cache items never working** — Some items (especially ones you rarely carry) can return no data from the game the first time the addon asks about them. Previously that item just silently stayed broken all session; now the addon retries automatically once the game actually has the data.
- **Stale roster tracking** — SmartBuff tracked "who needs a buff" and "who's blacklisted after a failed cast" by raid/party *slot* (e.g. `party1`) rather than by the actual player. When your group's roster shuffled, leftover state from whoever used to be in that slot could cause a freshly-joined player to be skipped entirely. Now tracked by player name, and the roster mapping itself gets refreshed automatically every couple of seconds as a safety net.
- **Broken rank downgrade** — When a group had mixed levels, the addon tried to guess a lower spell rank by subtracting numbers from the spell ID. WoW spell ranks aren't sequential IDs, so this often produced an invalid spell and silently failed to cast. Now it looks up the correct rank by name instead.
- **Death Knight ghoul pet detection** — A typo (`utc` vs `uct`) meant the addon could never recognize undead pets, so DK ghoul buffing never triggered.
- **Feral Spirit wolves** — Shaman's temporary "Spirit Wolf" guardians are immune to buffs; the addon now ignores them entirely instead of repeatedly failing to buff them.
- **Warrior pattern bug** — Warriors were mistakenly assigned the Paladin's "Seal of X" exclusion pattern. Harmless, but wrong — removed.
- **Clearer template-switch message** — now reads "SmartBuff: Switched template -> X" instead of the old, more ambiguous wording.

## **✨ New Feature: Per-Player Blessing Preference (Paladins)**

Right-click a party/raid member's frame as a Paladin and pick which Blessing they should get — Wisdom, Might, or Kings — overriding the normal class-based default. Your choice is remembered per player and carries over across logins and all your characters.

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
- **Bugfixes and features in this fork:** see commit history
