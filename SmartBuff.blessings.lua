-- ===========================================================================
-- SmartBuff: per-player Blessing preference (Paladin only)
--
-- Lets a Paladin right-click another unit's portrait/frame and choose which
-- Blessing (Wisdom / Might / Kings) that specific person should receive,
-- overriding the normal class-based default. The choice is saved in
-- SmartBuffBlessingPrefs (account-wide, so it's remembered across all your
-- characters and future logins) and is looked up by the core buff-casting
-- code every time it considers buffing that person.
-- ===========================================================================

SmartBuffBlessingPrefs = SmartBuffBlessingPrefs or { };

local SMARTBUFF_BLESSING_LABELS = {
  BOW = "Blessing of Wisdom",
  BOM = "Blessing of Might",
  BOK = "Blessing of Kings",
};

-- Localized-spell-name -> short key ("BOW"/"BOM"/"BOK"). Built lazily since
-- SMARTBUFF_BOW etc. are only populated once SMARTBUFF_InitItemList() runs.
local smartBuffBlessingKeyByName = nil;

function SmartBuff_Blessing_Init()
  smartBuffBlessingKeyByName = {
    [SMARTBUFF_BOW]  = "BOW",
    [SMARTBUFF_GBOW] = "BOW",
    [SMARTBUFF_BOM]  = "BOM",
    [SMARTBUFF_GBOM] = "BOM",
    [SMARTBUFF_BOK]  = "BOK",
    [SMARTBUFF_GBOK] = "BOK",
  };
end

-- Stable storage key for a unit: "Realm-Name". Works across sessions/toons.
local function SmartBuff_Blessing_UnitKey(unit)
  if (not unit or not UnitExists(unit)) then return nil; end
  local name, realm = UnitName(unit);
  if (not name) then return nil; end
  if (not realm or realm == "") then
    realm = GetRealmName();
  end
  return realm .. "-" .. name;
end

function SmartBuff_Blessing_GetPref(unit)
  local key = SmartBuff_Blessing_UnitKey(unit);
  if (not key) then return nil; end
  return SmartBuffBlessingPrefs[key];
end

function SmartBuff_Blessing_SetPref(unit, value)
  local key = SmartBuff_Blessing_UnitKey(unit);
  if (not key) then return; end

  if (value == nil) then
    SmartBuffBlessingPrefs[key] = nil;
  else
    SmartBuffBlessingPrefs[key] = value;
  end

  local name = UnitName(unit) or key;
  if (value) then
    SMARTBUFF_AddMsg("SmartBuff: " .. name .. " will now receive " .. SMARTBUFF_BLESSING_LABELS[value] .. ".");
  else
    SMARTBUFF_AddMsg("SmartBuff: " .. name .. " reverted to the default Blessing.");
  end
end

-- Localized spell name -> "BOW"/"BOM"/"BOK", or nil if it's not a choosable Blessing.
local function SmartBuff_Blessing_KeyForSpell(spellName)
  if (not smartBuffBlessingKeyByName) then
    SmartBuff_Blessing_Init();
  end
  if (not spellName) then return nil; end
  return smartBuffBlessingKeyByName[spellName];
end

-- Called from SMARTBUFF_BuffUnit for every buff/unit pair being evaluated.
--   nil   -> no override applies, use the normal class-based behavior
--   true  -> force this Blessing to be cast on this unit
--   false -> force this Blessing to be skipped on this unit
function SmartBuff_Blessing_Override(buffName, unit)
  if (sPlayerClass ~= "PALADIN") then return nil; end

  local blessKey = SmartBuff_Blessing_KeyForSpell(buffName);
  if (not blessKey) then return nil; end

  local pref = SmartBuff_Blessing_GetPref(unit);
  if (not pref) then return nil; end

  return (pref == blessKey);
end

-- Used by the raid-subgroup/class-group Greater Blessing caster to decide
-- whether it's safe to Greater-Blessing an entire group at once, or whether
-- someone in that group has a conflicting personal preference. If so, we
-- back off from the group-wide cast and let individual per-unit casting
-- (which honors the override above) handle everyone in that group instead -
-- otherwise the group-wide cast would overwrite a manual choice.
function SmartBuff_Blessing_GroupHasOverride(buffName, units)
  if (sPlayerClass ~= "PALADIN" or not units) then return false; end

  local blessKey = SmartBuff_Blessing_KeyForSpell(buffName);
  if (not blessKey) then return false; end

  for _, unit in pairs(units) do
    local pref = SmartBuff_Blessing_GetPref(unit);
    if (pref and pref ~= blessKey) then
      return true;
    end
  end

  return false;
end

-- ===========================================================================
-- Right-click unit menu integration (Paladin only)
-- ===========================================================================

UnitPopupButtons["SMARTBUFF_TITLE"]   = { text = "SmartBuff:", dist = 0, isTitle = true, notCheckable = true };
UnitPopupButtons["SMARTBUFF_BOW"]     = { text = SMARTBUFF_BLESSING_LABELS.BOW, dist = 0, notCheckable = true };
UnitPopupButtons["SMARTBUFF_BOM"]     = { text = SMARTBUFF_BLESSING_LABELS.BOM, dist = 0, notCheckable = true };
UnitPopupButtons["SMARTBUFF_BOK"]     = { text = SMARTBUFF_BLESSING_LABELS.BOK, dist = 0, notCheckable = true };
UnitPopupButtons["SMARTBUFF_DEFAULT"] = { text = "Use Default", dist = 0, notCheckable = true };

local SMARTBUFF_BLESSING_MENU_TYPES = {
  PARTY = true, PARTY_OFFLINE = true,
  RAID_PLAYER = true, RAID = true,
  PLAYER = true,
};

local smartBuffOrigUnitPopupShowMenu = UnitPopup_ShowMenu;
UnitPopup_ShowMenu = function(dropdownMenu, which, unit, name, userData)
  local inserted = false;

  if (sPlayerClass == "PALADIN" and SMARTBUFF_BLESSING_MENU_TYPES[which] and unit
    and UnitIsPlayer(unit) and UnitIsFriend("player", unit)) then
    local menu = UnitPopupMenus[which];
    if (menu) then
      tinsert(menu, "SMARTBUFF_TITLE");
      tinsert(menu, "SMARTBUFF_BOW");
      tinsert(menu, "SMARTBUFF_BOM");
      tinsert(menu, "SMARTBUFF_BOK");
      tinsert(menu, "SMARTBUFF_DEFAULT");
      inserted = true;
    end
  end

  smartBuffOrigUnitPopupShowMenu(dropdownMenu, which, unit, name, userData);

  -- Clean up again so the entries don't accumulate on the shared list.
  if (inserted) then
    local menu = UnitPopupMenus[which];
    for n = 1, 5 do
      tremove(menu);
    end
  end
end

local smartBuffOrigUnitPopupOnClick = UnitPopup_OnClick;
UnitPopup_OnClick = function(self, ...)
  local button = self and self.value;

  if (button == "SMARTBUFF_BOW" or button == "SMARTBUFF_BOM" or button == "SMARTBUFF_BOK" or button == "SMARTBUFF_DEFAULT") then
    local dropdownFrame = UIDROPDOWNMENU_INIT_MENU;
    local unit = dropdownFrame and dropdownFrame.unit;

    if (unit) then
      if (button == "SMARTBUFF_DEFAULT") then
        SmartBuff_Blessing_SetPref(unit, nil);
      else
        SmartBuff_Blessing_SetPref(unit, string.gsub(button, "SMARTBUFF_", ""));
      end
    end

    CloseDropDownMenus();
    return;
  end

  return smartBuffOrigUnitPopupOnClick(self, ...);
end
-- END Blessing preference menu integration
