SMARTBUFF_PLAYERCLASS = nil;
SMARTBUFF_BUFFLIST = nil;
SMARTBUFF_PATTERNS = nil; 

-- Buff types
SMARTBUFF_CONST_ALL       = "ALL";
SMARTBUFF_CONST_GROUP     = "GROUP";
SMARTBUFF_CONST_SELF      = "SELF";
SMARTBUFF_CONST_FORCESELF = "FORCESELF";
SMARTBUFF_CONST_TRACK     = "TRACK";
SMARTBUFF_CONST_WEAPON    = "WEAPON";
SMARTBUFF_CONST_INV       = "INVENTORY";
SMARTBUFF_CONST_FOOD      = "FOOD";
SMARTBUFF_CONST_SCROLL    = "SCROLL";
SMARTBUFF_CONST_POTION    = "POTION";


-- Wraps GetItemInfo() and remembers when it came back empty, so we can
-- retry once the client actually receives that item's data (GetItemInfo
-- legitimately returns nil the first time for any item not yet cached
-- client-side - this is why some items, e.g. ones a warlock rarely
-- carries, can silently and permanently fail to register at login while
-- more commonly-seen items work fine).
SMARTBUFF_PendingItemInfo = false;
function SMARTBUFF_GII(id)
  local name = GetItemInfo(id);
  if (not name) then
    SMARTBUFF_PendingItemInfo = true;
  end
  return name;
end
-- END SMARTBUFF_GII

function SMARTBUFF_InitItemList()
  -- Reagents
  SMARTBUFF_WILDBERRIES         = SMARTBUFF_GII(17021); --"Wild Berries"
  SMARTBUFF_WILDTHORNROOT       = SMARTBUFF_GII(17026); --"Wild Thornroot"
  SMARTBUFF_WILDQUILLVINE       = SMARTBUFF_GII(22148); --"Wild Quillvine"
  SMARTBUFF_WILDSPINELEAF       = SMARTBUFF_GII(44605); --"Wild Spineleaf"
  SMARTBUFF_ARCANEPOWDER        = SMARTBUFF_GII(17020); --"Arcane Powder"
  SMARTBUFF_HOLYCANDLE          = SMARTBUFF_GII(17028); --"Holy Candle"
  SMARTBUFF_SACREDCANDLE        = SMARTBUFF_GII(17029); --"Sacred Candle"
  SMARTBUFF_DEVOUTCANDLE        = SMARTBUFF_GII(44615); --"Devout Candle"
  SMARTBUFF_SYMBOLOFKINGS       = SMARTBUFF_GII(21177); --"Symbol of Kings"
  
  -- Stones and oils
  SMARTBUFF_SSROUGH             = SMARTBUFF_GII(2862);  --"Rough Sharpening Stone"
  SMARTBUFF_SSCOARSE            = SMARTBUFF_GII(2863);  --"Coarse Sharpening Stone"
  SMARTBUFF_SSHEAVY             = SMARTBUFF_GII(2871);  --"Heavy Sharpening Stone"
  SMARTBUFF_SSSOLID             = SMARTBUFF_GII(7964);  --"Solid Sharpening Stone"
  SMARTBUFF_SSDENSE             = SMARTBUFF_GII(12404); --"Dense Sharpening Stone"
  SMARTBUFF_SSELEMENTAL         = SMARTBUFF_GII(18262); --"Elemental Sharpening Stone"
  SMARTBUFF_SSFEL               = SMARTBUFF_GII(23528); --"Fel Sharpening Stone"
  SMARTBUFF_SSADAMANTITE        = SMARTBUFF_GII(23529); --"Adamantite Sharpening Stone"
  SMARTBUFF_WSROUGH             = SMARTBUFF_GII(3239);  --"Rough Weightstone"
  SMARTBUFF_WSCOARSE            = SMARTBUFF_GII(3240);  --"Coarse Weightstone"
  SMARTBUFF_WSHEAVY             = SMARTBUFF_GII(3241);  --"Heavy Weightstone"
  SMARTBUFF_WSSOLID             = SMARTBUFF_GII(7965);  --"Solid Weightstone"
  SMARTBUFF_WSDENSE             = SMARTBUFF_GII(12643); --"Dense Weightstone"
  SMARTBUFF_WSFEL               = SMARTBUFF_GII(28420); --"Fel Weightstone"
  SMARTBUFF_WSADAMANTITE        = SMARTBUFF_GII(28421); --"Adamantite Weightstone"
  SMARTBUFF_SHADOWOIL           = SMARTBUFF_GII(3824);  --"Shadow Oil"
  SMARTBUFF_FROSTOIL            = SMARTBUFF_GII(3829);  --"Frost Oil"
  SMARTBUFF_MANAOIL1            = SMARTBUFF_GII(20745); --"Minor Mana Oil"
  SMARTBUFF_MANAOIL2            = SMARTBUFF_GII(20747); --"Lesser Mana Oil"
  SMARTBUFF_MANAOIL3            = SMARTBUFF_GII(20748); --"Brilliant Mana Oil"
  SMARTBUFF_MANAOIL4            = SMARTBUFF_GII(22521); --"Superior Mana Oil"
  SMARTBUFF_MANAOIL5            = SMARTBUFF_GII(36899); --"Exceptional Mana Oil"
  SMARTBUFF_WIZARDOIL1          = SMARTBUFF_GII(20744); --"Minor Wizard Oil"
  SMARTBUFF_WIZARDOIL2          = SMARTBUFF_GII(20746); --"Lesser Wizard Oil"
  SMARTBUFF_WIZARDOIL3          = SMARTBUFF_GII(20750); --"Wizard Oil"
  SMARTBUFF_WIZARDOIL4          = SMARTBUFF_GII(20749); --"Brilliant Wizard Oil"
  SMARTBUFF_WIZARDOIL5          = SMARTBUFF_GII(22522); --"Superior Wizard Oil"
  SMARTBUFF_WIZARDOIL6          = SMARTBUFF_GII(36900); --"Exceptional Wizard Oil"
  SMARTBUFF_SPELLSTONE1         = SMARTBUFF_GII(41191); --"Spellstone"
  SMARTBUFF_SPELLSTONE2         = SMARTBUFF_GII(41192); --"Greater Spellstone"
  SMARTBUFF_SPELLSTONE3         = SMARTBUFF_GII(41193); --"Major Spellstone"
  SMARTBUFF_SPELLSTONE4         = SMARTBUFF_GII(41194); --"Master Spellstone"
  SMARTBUFF_SPELLSTONE5         = SMARTBUFF_GII(41195); --"Demonic Spellstone"
  SMARTBUFF_SPELLSTONE6         = SMARTBUFF_GII(41196); --"Grand Spellstone"
  SMARTBUFF_FIRESTONE1          = SMARTBUFF_GII(41170); --"Lesser Firestone"
  SMARTBUFF_FIRESTONE2          = SMARTBUFF_GII(41169); --"Firestone"
  SMARTBUFF_FIRESTONE3          = SMARTBUFF_GII(41171); --"Greater Firestone"
  SMARTBUFF_FIRESTONE4          = SMARTBUFF_GII(41172); --"Major Firestone"
  SMARTBUFF_FIRESTONE5          = SMARTBUFF_GII(40773); --"Master Firestone"
  SMARTBUFF_FIRESTONE6          = SMARTBUFF_GII(41173); --"Fel Firestone"
  SMARTBUFF_FIRESTONE7          = SMARTBUFF_GII(41174); --"Grand Firestone"
  
  -- Poisons
  SMARTBUFF_INSTANTPOISON1      = SMARTBUFF_GII(6947);  --"Instant Poison"
  SMARTBUFF_INSTANTPOISON2      = SMARTBUFF_GII(6949);  --"Instant Poison II"
  SMARTBUFF_INSTANTPOISON3      = SMARTBUFF_GII(6950);  --"Instant Poison III"
  SMARTBUFF_INSTANTPOISON4      = SMARTBUFF_GII(8926);  --"Instant Poison IV"
  SMARTBUFF_INSTANTPOISON5      = SMARTBUFF_GII(8927);  --"Instant Poison V"
  SMARTBUFF_INSTANTPOISON6      = SMARTBUFF_GII(8928);  --"Instant Poison VI"
  SMARTBUFF_INSTANTPOISON7      = SMARTBUFF_GII(21927); --"Instant Poison VII"
  SMARTBUFF_INSTANTPOISON8      = SMARTBUFF_GII(43230); --"Instant Poison VIII"
  SMARTBUFF_INSTANTPOISON9      = SMARTBUFF_GII(43231); --"Instant Poison IX"
  SMARTBUFF_WOUNDPOISON1        = SMARTBUFF_GII(10918); --"Wound Poison"
  SMARTBUFF_WOUNDPOISON2        = SMARTBUFF_GII(10920); --"Wound Poison II"
  SMARTBUFF_WOUNDPOISON3        = SMARTBUFF_GII(10921); --"Wound Poison III"
  SMARTBUFF_WOUNDPOISON4        = SMARTBUFF_GII(10922); --"Wound Poison IV"
  SMARTBUFF_WOUNDPOISON5        = SMARTBUFF_GII(22055); --"Wound Poison V"
  SMARTBUFF_WOUNDPOISON6        = SMARTBUFF_GII(43234); --"Wound Poison VI"
  SMARTBUFF_WOUNDPOISON7        = SMARTBUFF_GII(43235); --"Wound Poison VII"
  SMARTBUFF_MINDPOISON1         = SMARTBUFF_GII(5237);  --"Mind-numbing Poison"
  SMARTBUFF_DEADLYPOISON1       = SMARTBUFF_GII(2892);  --"Deadly Poison"
  SMARTBUFF_DEADLYPOISON2       = SMARTBUFF_GII(2893);  --"Deadly Poison II"
  SMARTBUFF_DEADLYPOISON3       = SMARTBUFF_GII(8984);  --"Deadly Poison III"
  SMARTBUFF_DEADLYPOISON4       = SMARTBUFF_GII(8985);  --"Deadly Poison IV"
  SMARTBUFF_DEADLYPOISON5       = SMARTBUFF_GII(20844); --"Deadly Poison V"
  SMARTBUFF_DEADLYPOISON6       = SMARTBUFF_GII(22053); --"Deadly Poison VI"
  SMARTBUFF_DEADLYPOISON7       = SMARTBUFF_GII(22054); --"Deadly Poison VII"
  SMARTBUFF_DEADLYPOISON8       = SMARTBUFF_GII(43232); --"Deadly Poison VIII"
  SMARTBUFF_DEADLYPOISON9       = SMARTBUFF_GII(43233); --"Deadly Poison IX"
  SMARTBUFF_CRIPPLINGPOISON1    = SMARTBUFF_GII(3775);  --"Crippling Poison"
  SMARTBUFF_ANESTHETICPOISON1   = SMARTBUFF_GII(21835); --"Anesthetic Poison"
  SMARTBUFF_ANESTHETICPOISON2   = SMARTBUFF_GII(43237); --"Anesthetic Poison II"
  
  -- Food
  SMARTBUFF_SAGEFISHDELIGHT     = SMARTBUFF_GII(21217); --"Sagefish Delight"
  SMARTBUFF_BUZZARDBITES        = SMARTBUFF_GII(27651); --"Buzzard Bites"
  SMARTBUFF_RAVAGERDOG          = SMARTBUFF_GII(27655); --"Ravager Dog"
  SMARTBUFF_FELTAILDELIGHT      = SMARTBUFF_GII(27662); --"Feltail Delight"
  SMARTBUFF_CLAMBAR             = SMARTBUFF_GII(30155); --"Clam Bar"
  SMARTBUFF_BROILEDBLOODFIN     = SMARTBUFF_GII(33867); --"Broiled Bloodfin"
  SMARTBUFF_SPORELINGSNACK      = SMARTBUFF_GII(27656); --"Sporeling Snack"
  SMARTBUFF_BLACKENEDSPOREFISH  = SMARTBUFF_GII(27663); --"Blackened Sporefish"
  SMARTBUFF_BLACKENEDBASILISK   = SMARTBUFF_GII(27657); --"Blackened Basilisk"
  SMARTBUFF_GRILLEDMUDFISH      = SMARTBUFF_GII(27664); --"Grilled Mudfish"
  SMARTBUFF_POACHEDBLUEFISH     = SMARTBUFF_GII(27665); --"Poached Bluefish"
  SMARTBUFF_ROASTEDCLEFTHOOF    = SMARTBUFF_GII(27658); --"Roasted Clefthoof"
  SMARTBUFF_SPICYHOTTALBUK      = SMARTBUFF_GII(33872); --"Spicy Hot Talbuk"
  SMARTBUFF_SKULLFISHSOUP       = SMARTBUFF_GII(33825); --"Skullfish Soup"
  SMARTBUFF_WARPBURGER          = SMARTBUFF_GII(27659); --"Warp Burger"
  SMARTBUFF_TALBUKSTEAK         = SMARTBUFF_GII(27660); --"Talbuk Steak"
  SMARTBUFF_GOLDENFISHSTICKS    = SMARTBUFF_GII(27666); --"Golden Fish Sticks"
  SMARTBUFF_CRUNCHYSERPENT      = SMARTBUFF_GII(31673); --"Crunchy Serpent"
  SMARTBUFF_MOKNATHALSHORTRIBS  = SMARTBUFF_GII(31672); --"Mok'Nathal Shortribs"
  SMARTBUFF_SPICYCRAWDAD        = SMARTBUFF_GII(27667); --"Spicy Crawdad"
  --SMARTBUFF_FISHERMANSFEAST     = SMARTBUFF_GII(33052); --"Fisherman's Feast"
  --SMARTBUFF_HOTAPPLECIDER       = SMARTBUFF_GII(34411); --"Hot Apple Cider"
  SMARTBUFF_WOTLKFOOD1          = SMARTBUFF_GII(34748); --"Mammoth Meal"
  SMARTBUFF_WOTLKFOOD2          = SMARTBUFF_GII(43268); --"Dalaran Clam Chowder"
  SMARTBUFF_WOTLKFOOD3          = SMARTBUFF_GII(42942); --"Baked Manta Ray"
  SMARTBUFF_WOTLKFOOD4          = SMARTBUFF_GII(34762); --"Grilled Sculpin"
  SMARTBUFF_WOTLKFOOD5          = SMARTBUFF_GII(34763); --"Smoked Salmon"
  SMARTBUFF_WOTLKFOOD6          = SMARTBUFF_GII(34765); --"Pickled Fangtooth"
  SMARTBUFF_WOTLKFOOD7          = SMARTBUFF_GII(34764); --"Poached Nettlefish"
  SMARTBUFF_WOTLKFOOD8          = SMARTBUFF_GII(34749); --"Shoveltusk Steak"
  SMARTBUFF_WOTLKFOOD9          = SMARTBUFF_GII(34750); --"Wyrm Delight"
  SMARTBUFF_WOTLKFOOD10         = SMARTBUFF_GII(34751); --"Roasted Worg"
  SMARTBUFF_WOTLKFOOD11         = SMARTBUFF_GII(34752); --"Rhino Dogs"
  SMARTBUFF_WOTLKFOOD12         = SMARTBUFF_GII(34757); --"Very Burnt Worg"
  SMARTBUFF_WOTLKFOOD13         = SMARTBUFF_GII(43001); --"Tracker Snacks"
  SMARTBUFF_WOTLKFOOD14         = SMARTBUFF_GII(34755); --"Tender Shoveltusk Steak"
  SMARTBUFF_WOTLKFOOD15         = SMARTBUFF_GII(42993); --"Spicy Fried Herring"
  SMARTBUFF_WOTLKFOOD16         = SMARTBUFF_GII(34768); --"Spicy Blue Nettlefish"
  SMARTBUFF_WOTLKFOOD17         = SMARTBUFF_GII(34756); --"Spiced Wyrm Burger"
  SMARTBUFF_WOTLKFOOD18         = SMARTBUFF_GII(42996); --"Snapper Extreme"
  SMARTBUFF_WOTLKFOOD19         = SMARTBUFF_GII(42994); --"Rhinolicious Wyrmsteak"
  SMARTBUFF_WOTLKFOOD20         = SMARTBUFF_GII(34766); --"Poached Northern Sculpin"
  SMARTBUFF_WOTLKFOOD21         = SMARTBUFF_GII(34758); --"Mighty Rhino Dogs"
  SMARTBUFF_WOTLKFOOD22         = SMARTBUFF_GII(34754); --"Mega Mammoth Meal"
  SMARTBUFF_WOTLKFOOD23         = SMARTBUFF_GII(34769); --"Imperial Manta Steak"
  SMARTBUFF_WOTLKFOOD24         = SMARTBUFF_GII(42995); --"Hearty Rhino"
  SMARTBUFF_WOTLKFOOD25         = SMARTBUFF_GII(34767); --"Firecracker Salmon"
  SMARTBUFF_WOTLKFOOD26         = SMARTBUFF_GII(43000); --"Dragonfin Filet"
  SMARTBUFF_WOTLKFOOD27         = SMARTBUFF_GII(42998); --"Cuttlesteak"
  SMARTBUFF_WOTLKFOOD28         = SMARTBUFF_GII(42997); --"Blackened Worg Steak"
  SMARTBUFF_WOTLKFOOD29         = SMARTBUFF_GII(42999); --"Blackened Dragonfin"
  SMARTBUFF_WOTLKFOOD30         = SMARTBUFF_GII(42779); --"Steaming Chicken Soup"
  SMARTBUFF_WOTLKFOOD31         = SMARTBUFF_GII(34125); --"Shoveltusk Soup"
  SMARTBUFF_WOTLKFOOD32         = SMARTBUFF_GII(39691); --"Succulent Orca Stew"
  
  --SMARTBUFF_BCPETFOOD1          = SMARTBUFF_GII(33874); --"Kibler's Bits (Pet food)"
  --SMARTBUFF_WOTLKPETFOOD1       = SMARTBUFF_GII(43005); --"Spiced Mammoth Treats (Pet food)"
  
  
  -- Scrolls
  SMARTBUFF_SOAGILITY1          = SMARTBUFF_GII(3012);  --"Scroll of Agility I"
  SMARTBUFF_SOAGILITY2          = SMARTBUFF_GII(1477);  --"Scroll of Agility II"
  SMARTBUFF_SOAGILITY3          = SMARTBUFF_GII(4425);  --"Scroll of Agility III"
  SMARTBUFF_SOAGILITY4          = SMARTBUFF_GII(10309); --"Scroll of Agility IV"
  SMARTBUFF_SOAGILITY5          = SMARTBUFF_GII(27498); --"Scroll of Agility V"
  SMARTBUFF_SOAGILITY6          = SMARTBUFF_GII(33457); --"Scroll of Agility VI"
  SMARTBUFF_SOAGILITY7          = SMARTBUFF_GII(43463); --"Scroll of Agility VII"
  SMARTBUFF_SOAGILITY8          = SMARTBUFF_GII(43464); --"Scroll of Agility VIII"
  SMARTBUFF_SOINTELLECT1        = SMARTBUFF_GII(955);   --"Scroll of Intellect I"
  SMARTBUFF_SOINTELLECT2        = SMARTBUFF_GII(2290);  --"Scroll of Intellect II"
  SMARTBUFF_SOINTELLECT3        = SMARTBUFF_GII(4419);  --"Scroll of Intellect III"
  SMARTBUFF_SOINTELLECT4        = SMARTBUFF_GII(10308); --"Scroll of Intellect IV"
  SMARTBUFF_SOINTELLECT5        = SMARTBUFF_GII(27499); --"Scroll of Intellect V"
  SMARTBUFF_SOINTELLECT6        = SMARTBUFF_GII(33458); --"Scroll of Intellect VI"
  SMARTBUFF_SOINTELLECT7        = SMARTBUFF_GII(37091); --"Scroll of Intellect VII"
  SMARTBUFF_SOINTELLECT8        = SMARTBUFF_GII(37092); --"Scroll of Intellect VIII"
  SMARTBUFF_SOSTAMINA1          = SMARTBUFF_GII(1180);  --"Scroll of Stamina I"
  SMARTBUFF_SOSTAMINA2          = SMARTBUFF_GII(1711);  --"Scroll of Stamina II"
  SMARTBUFF_SOSTAMINA3          = SMARTBUFF_GII(4422);  --"Scroll of Stamina III"
  SMARTBUFF_SOSTAMINA4          = SMARTBUFF_GII(10307); --"Scroll of Stamina IV"
  SMARTBUFF_SOSTAMINA5          = SMARTBUFF_GII(27502); --"Scroll of Stamina V"
  SMARTBUFF_SOSTAMINA6          = SMARTBUFF_GII(33461); --"Scroll of Stamina VI"
  SMARTBUFF_SOSTAMINA7          = SMARTBUFF_GII(37093); --"Scroll of Stamina VII"
  SMARTBUFF_SOSTAMINA8          = SMARTBUFF_GII(37094); --"Scroll of Stamina VIII"
  SMARTBUFF_SOSPIRIT1           = SMARTBUFF_GII(1181);  --"Scroll of Spirit I"
  SMARTBUFF_SOSPIRIT2           = SMARTBUFF_GII(1712);  --"Scroll of Spirit II"
  SMARTBUFF_SOSPIRIT3           = SMARTBUFF_GII(4424);  --"Scroll of Spirit III"
  SMARTBUFF_SOSPIRIT4           = SMARTBUFF_GII(10306); --"Scroll of Spirit IV"
  SMARTBUFF_SOSPIRIT5           = SMARTBUFF_GII(27501); --"Scroll of Spirit V"
  SMARTBUFF_SOSPIRIT6           = SMARTBUFF_GII(33460); --"Scroll of Spirit VI"
  SMARTBUFF_SOSPIRIT7           = SMARTBUFF_GII(37097); --"Scroll of Spirit VII"
  SMARTBUFF_SOSPIRIT8           = SMARTBUFF_GII(37098); --"Scroll of Spirit VIII"
  SMARTBUFF_SOSTRENGHT1         = SMARTBUFF_GII(954);   --"Scroll of Strength I"
  SMARTBUFF_SOSTRENGHT2         = SMARTBUFF_GII(2289);  --"Scroll of Strength II"
  SMARTBUFF_SOSTRENGHT3         = SMARTBUFF_GII(4426);  --"Scroll of Strength III"
  SMARTBUFF_SOSTRENGHT4         = SMARTBUFF_GII(10310); --"Scroll of Strength IV"
  SMARTBUFF_SOSTRENGHT5         = SMARTBUFF_GII(27503); --"Scroll of Strength V"
  SMARTBUFF_SOSTRENGHT6         = SMARTBUFF_GII(33462); --"Scroll of Strength VI"
  SMARTBUFF_SOSTRENGHT7         = SMARTBUFF_GII(43465); --"Scroll of Strength VII"
  SMARTBUFF_SOSTRENGHT8         = SMARTBUFF_GII(43466); --"Scroll of Strength VIII"
  
  
  SMARTBUFF_FLASK1              = SMARTBUFF_GII(46377);  --"Flask of Endless Rage"
  SMARTBUFF_FLASK2              = SMARTBUFF_GII(46376);  --"Flask of the Frost Wyrm"
  SMARTBUFF_FLASK3              = SMARTBUFF_GII(46379);  --"Flask of Stoneblood"
  SMARTBUFF_FLASK4              = SMARTBUFF_GII(46378);  --"Flask of Pure Mojo"
  SMARTBUFF_FLASK5              = SMARTBUFF_GII(47499);  --"Flask of the North"
  
  SMARTBUFF_ELIXIR1             = SMARTBUFF_GII(39666);  --"Elixir of Mighty Agility"
  SMARTBUFF_ELIXIR2             = SMARTBUFF_GII(44332);  --"Elixir of Mighty Thoughts"
  SMARTBUFF_ELIXIR3             = SMARTBUFF_GII(40078);  --"Elixir of Mighty Fortitude"
  SMARTBUFF_ELIXIR4             = SMARTBUFF_GII(40073);  --"Elixir of Mighty Strength"
  SMARTBUFF_ELIXIR5             = SMARTBUFF_GII(40072);  --"Elixir of Spirit"
  SMARTBUFF_ELIXIR6             = SMARTBUFF_GII(40097);  --"Elixir of Protection"
  SMARTBUFF_ELIXIR7             = SMARTBUFF_GII(44328);  --"Elixir of Mighty Defense"
  SMARTBUFF_ELIXIR8             = SMARTBUFF_GII(44331);  --"Elixir of Lightning Speed"
  SMARTBUFF_ELIXIR9             = SMARTBUFF_GII(44329);  --"Elixir of Expertise"
  SMARTBUFF_ELIXIR10            = SMARTBUFF_GII(44327);  --"Elixir of Deadly Strikes"
  SMARTBUFF_ELIXIR11            = SMARTBUFF_GII(44330);  --"Elixir of Armor Piercing"
  SMARTBUFF_ELIXIR12            = SMARTBUFF_GII(44325);  --"Elixir of Accuracy"
  --SMARTBUFF_ELIXIR1             = SMARTBUFF_GII(39666);  --"Elixir"

  
  --SMARTBUFF_ = SMARTBUFF_GII(xxx); --""
  
  --if (SMARTBUFF_SACREDCANDLE) then
    --SMARTBUFF_AddMsgD(SMARTBUFF_SACREDCANDLE.." found");
  --end
  
  SMARTBUFF_AddMsgD("Item list initialized");
end


function SMARTBUFF_InitSpellIDs()
  SMARTBUFF_RANGECHECKSPELL = GetSpellInfo(5185);  --"Healing Touch"
  
  -- Druid  
  SMARTBUFF_DRUID_CAT       = GetSpellInfo(768);   --"Cat Form"
  SMARTBUFF_DRUID_TREE      = GetSpellInfo(33891); --"Tree of Life"
  SMARTBUFF_DRUID_MOONKIN   = GetSpellInfo(24858); --"Moonkin Form"
  SMARTBUFF_DRUID_TRACK     = GetSpellInfo(5225);  --"Track Humanoids"
  SMARTBUFF_MOTW            = GetSpellInfo(1126);  --"Mark of the Wild"
  SMARTBUFF_GOTW            = GetSpellInfo(21849); --"Gift of the Wild"
  SMARTBUFF_THORNS          = GetSpellInfo(467);   --"Thorns"
  SMARTBUFF_BARKSKIN        = GetSpellInfo(22812); --"Barkskin"
  SMARTBUFF_NATURESGRASP    = GetSpellInfo(16689); --"Nature's Grasp"
  SMARTBUFF_TIGERSFURY      = GetSpellInfo(5217);  --"Tiger's Fury"
  SMARTBUFF_SAVAGEROAR      = GetSpellInfo(52610);  --"Savage Roar"

  -- Priest
  SMARTBUFF_PWF             = GetSpellInfo(1243);  --"Power Word: Fortitude"
  SMARTBUFF_POF             = GetSpellInfo(21562); --"Prayer of Fortitude"
  SMARTBUFF_SP              = GetSpellInfo(976);   --"Shadow Protection"
  SMARTBUFF_POSP            = GetSpellInfo(27683); --"Prayer of Shadow Protection"
  SMARTBUFF_INNERFIRE       = GetSpellInfo(588);   --"Inner Fire"
  SMARTBUFF_DS              = GetSpellInfo(14752); --"Divine Spirit"
  SMARTBUFF_POS             = GetSpellInfo(27681); --"Prayer of Spirit"
  SMARTBUFF_PWS             = GetSpellInfo(17);    --"Power Word: Shield"
  SMARTBUFF_FEARWARD        = GetSpellInfo(6346);  --"Fear Ward"
  SMARTBUFF_ELUNESGRACE     = GetSpellInfo(2651);  --"Elune's Grace"
  SMARTBUFF_FEEDBACK        = GetSpellInfo(13896); --"Feedback"
  SMARTBUFF_SHADOWGUARD     = GetSpellInfo(18137); --"Shadowguard"
  SMARTBUFF_TOUCHOFWEAKNESS = GetSpellInfo(2652);  --"Touch of Weakness"
  SMARTBUFF_INNERFOCUS      = GetSpellInfo(14751); --"Inner Focus"
  SMARTBUFF_RENEW           = GetSpellInfo(139);   --"Renew"
  SMARTBUFF_LEVITATE        = GetSpellInfo(1706);  --"Levitate"
  SMARTBUFF_SHADOWFORM      = GetSpellInfo(15473); --"Shadowform"
  SMARTBUFF_VAMPIRICEMBRACE = GetSpellInfo(15286); --"Vampiric Embrace"
  
  -- Mage
  SMARTBUFF_AI              = GetSpellInfo(1459);  --"Arcane Intellect"
  SMARTBUFF_DALARANI        = GetSpellInfo(61024); --"Dalaran Intellect"
  SMARTBUFF_AB              = GetSpellInfo(23028); --"Arcane Brilliance"
  SMARTBUFF_DALARANB        = GetSpellInfo(61316); --"Dalaran Brilliance"
  SMARTBUFF_ICEARMOR        = GetSpellInfo(7302);  --"Ice Armor"
  SMARTBUFF_FROSTARMOR      = GetSpellInfo(168);   --"Frost Armor"
  SMARTBUFF_MAGEARMOR       = GetSpellInfo(6117);  --"Mage Armor"
  SMARTBUFF_MOLTENARMOR     = GetSpellInfo(30482); --"Molten Armor"
  SMARTBUFF_DAMPENMAGIC     = GetSpellInfo(604);   --"Dampen Magic"
  SMARTBUFF_AMPLIFYMAGIC    = GetSpellInfo(1008);  --"Amplify Magic"
  SMARTBUFF_MANASHIELD      = GetSpellInfo(1463);  --"Mana Shield"
  SMARTBUFF_FIREWARD        = GetSpellInfo(543);   --"Fire Ward"
  SMARTBUFF_FROSTWARD       = GetSpellInfo(6143);  --"Frost Ward"
  SMARTBUFF_ICEBARRIER      = GetSpellInfo(11426); --"Ice Barrier"
  SMARTBUFF_COMBUSTION      = GetSpellInfo(11129); --"Combustion"
  SMARTBUFF_ARCANEPOWER     = GetSpellInfo(12042); --"Arcane Power"
  SMARTBUFF_PRESENCEOFMIND  = GetSpellInfo(12043); --"Presence of Mind"
  SMARTBUFF_ICYVEINS        = GetSpellInfo(12472); --"Icy Veins"
  SMARTBUFF_SUMMONWATERELE  = GetSpellInfo(31687); --"Summon Water Elemental"
  SMARTBUFF_FOCUSMAGIC      = GetSpellInfo(54646); --"Focus Magic"
  SMARTBUFF_SLOWFALL        = GetSpellInfo(130);   --"Slow Fall"
  
  -- Warlock
  SMARTBUFF_FELARMOR        = GetSpellInfo(28176); --"Fel Armor"
  SMARTBUFF_DEMONARMOR      = GetSpellInfo(706);   --"Demon Armor"
  SMARTBUFF_DEMONSKIN       = GetSpellInfo(687);   --"Demon Skin"
  SMARTBUFF_UNENDINGBREATH  = GetSpellInfo(5697);  --"Unending Breath"
  SMARTBUFF_DINVISIBILITY   = GetSpellInfo(132);   --"Detect Invisibility"
  SMARTBUFF_SOULLINK        = GetSpellInfo(19028); --"Soul Link"
  SMARTBUFF_SHADOWWARD      = GetSpellInfo(6229);  --"Shadow Ward"
  SMARTBUFF_DARKPACT        = GetSpellInfo(18220); --"Dark Pact"
  SMARTBUFF_LIFETAP         = GetSpellInfo(1454);  --"Life Tap"
  
  SMARTBUFF_FELI            = GetSpellInfo(54424); --"Fel Intelligence"
  
  
  -- Hunter
  SMARTBUFF_TRUESHOTAURA    = GetSpellInfo(19506); --"Trueshot Aura"
  SMARTBUFF_RAPIDFIRE       = GetSpellInfo(3045);  --"Rapid Fire"
  SMARTBUFF_AOTH            = GetSpellInfo(13165); --"Aspect of the Hawk"
  SMARTBUFF_AOTM            = GetSpellInfo(13163); --"Aspect of the Monkey"
  SMARTBUFF_AOTW            = GetSpellInfo(20043); --"Aspect of the Wild"
  SMARTBUFF_AOTB            = GetSpellInfo(13161); --"Aspect of the Beast"
  SMARTBUFF_AOTC            = GetSpellInfo(5118);  --"Aspect of the Cheetah"
  SMARTBUFF_AOTP            = GetSpellInfo(13159); --"Aspect of the Pack"
  SMARTBUFF_AOTV            = GetSpellInfo(34074); --"Aspect of the Viper"
  SMARTBUFF_AOTDH           = GetSpellInfo(61846); --"Aspect of the Dragonhawk"
  
  -- Shaman
  SMARTBUFF_LIGHTNINGSHIELD = GetSpellInfo(324);   --"Lightning Shield"
  SMARTBUFF_WATERSHIELD     = GetSpellInfo(24398); --"Water Shield"
  SMARTBUFF_EARTHSHIELD     = GetSpellInfo(974);   --"Earth Shield"
  SMARTBUFF_ROCKBITERW      = GetSpellInfo(8017);  --"Rockbiter Weapon"
  SMARTBUFF_FROSTBRANDW     = GetSpellInfo(8033);  --"Frostbrand Weapon"
  SMARTBUFF_FLAMETONGUEW    = GetSpellInfo(8024);  --"Flametongue Weapon"
  SMARTBUFF_WINDFURYW       = GetSpellInfo(8232);  --"Windfury Weapon"
  SMARTBUFF_WATERBREATHING  = GetSpellInfo(131);   --"Water Breathing"
  SMARTBUFF_EARTHLIVINGW    = GetSpellInfo(51730); --"Earthliving Weapon"
  SMARTBUFF_WATERWALKING    = GetSpellInfo(546);   --"Water Walking"
  
  -- Warrior
  SMARTBUFF_BATTLESHOUT     = GetSpellInfo(6673);  --"Battle Shout"
  SMARTBUFF_COMMANDINGSHOUT = GetSpellInfo(469);   --"Commanding Shout"
  SMARTBUFF_BERSERKERRAGE   = GetSpellInfo(18499); --"Berserker Rage"
  SMARTBUFF_BLOODRAGE       = GetSpellInfo(2687);  --"Bloodrage"
  SMARTBUFF_RAMPAGE         = GetSpellInfo(29801); --"Rampage"
  SMARTBUFF_VIGILANCE       = GetSpellInfo(50720); --"Vigilance"

  -- Rogue
  SMARTBUFF_BLADEFLURRY     = GetSpellInfo(13877); --"Blade Flurry"
  SMARTBUFF_SAD             = GetSpellInfo(5171);  --"Slice and Dice"
  SMARTBUFF_EVASION         = GetSpellInfo(5277);  --"Evasion"
  SMARTBUFF_HUNGERFORBLOOD  = GetSpellInfo(51662); --"Hunger For Blood"
  SMARTBUFF_TRICKS          = GetSpellInfo(57934); --"Tricks of the Trade"
  
  -- Paladin
  SMARTBUFF_RIGHTEOUSFURY         = GetSpellInfo(25780); --"Righteous Fury"
  SMARTBUFF_HOLYSHIELD            = GetSpellInfo(20925); --"Holy Shield"
  SMARTBUFF_BOM                   = GetSpellInfo(19740); --"Blessing of Might"
  SMARTBUFF_GBOM                  = GetSpellInfo(25782); --"Greater Blessing of Might"
  SMARTBUFF_BOW                   = GetSpellInfo(19742); --"Blessing of Wisdom"
  SMARTBUFF_GBOW                  = GetSpellInfo(25894); --"Greater Blessing of Wisdom"
  SMARTBUFF_BOSAL                 = GetSpellInfo(1038);  --"Blessing of Salvation"
  SMARTBUFF_BOK                   = GetSpellInfo(20217); --"Blessing of Kings"
  SMARTBUFF_GBOK                  = GetSpellInfo(25898); --"Greater Blessing of Kings"
  SMARTBUFF_BOSAN                 = GetSpellInfo(20911); --"Blessing of Sanctuary"
  SMARTBUFF_GBOSAN                = GetSpellInfo(25899); --"Greater Blessing of Sanctuary"
  SMARTBUFF_BOF                   = GetSpellInfo(1044);  --"Blessing of Freedom"
  SMARTBUFF_BOP                   = GetSpellInfo(1022);  --"Blessing of Protection"
  SMARTBUFF_SOCOMMAND             = GetSpellInfo(20375); --"Seal of Command"
  SMARTBUFF_SOJUSTICE             = GetSpellInfo(20164); --"Seal of Justice"
  SMARTBUFF_SOLIGHT               = GetSpellInfo(20165); --"Seal of Light"
  SMARTBUFF_SORIGHTEOUSNESS       = GetSpellInfo(21084); --"Seal of Righteousness"
  SMARTBUFF_SOWISDOM              = GetSpellInfo(20166); --"Seal of Wisdom"
  SMARTBUFF_SOTCRUSADER           = GetSpellInfo(21082); --"Seal of the Crusader"
  SMARTBUFF_SOVENGEANCE           = GetSpellInfo(31801); --"Seal of Vengeance"
  SMARTBUFF_SOCORRUPTION          = GetSpellInfo(53736); --"Seal of Corruption"
  --SMARTBUFF_SOBLOOD               = GetSpellInfo(31892); --"Seal of Blood"  REMOVED 3.2
  --SMARTBUFF_SOMARTYR              = GetSpellInfo(53720); --"Seal of the Martyr"  REMOVED 3.2
  SMARTBUFF_DEVOTIONAURA          = GetSpellInfo(465);   --"Devotion Aura"
  SMARTBUFF_RETRIBUTIONAURA       = GetSpellInfo(7294);  --"Retribution Aura"
  SMARTBUFF_CONCENTRATIONAURA     = GetSpellInfo(19746); --"Concentration Aura"
  SMARTBUFF_SHADOWRESISTANCEAURA  = GetSpellInfo(19876); --"Shadow Resistance Aura"
  SMARTBUFF_FROSTRESISTANCEAURA   = GetSpellInfo(19888); --"Frost Resistance Aura"
  SMARTBUFF_FIRERESISTANCEAURA    = GetSpellInfo(19891); --"Fire Resistance Aura"
  SMARTBUFF_SANCTITYAURA          = GetSpellInfo(20218); --"Sanctity Aura"
  SMARTBUFF_CRUSADERAURA          = GetSpellInfo(32223); --"Crusader Aura"
  SMARTBUFF_SACREDSHIELD          = GetSpellInfo(53601); --"Sacred Shield"
  SMARTBUFF_AVENGINGWARTH         = GetSpellInfo(31884); --"Avenging Wrath"
  
  -- Death Knight
  --SMARTBUFF_ = GetSpellInfo(xxx); --"xxx"
  SMARTBUFF_ROCINDERGLACIER   = GetSpellInfo(53341); --"Rune of Cinderglacier"
  SMARTBUFF_ROFROSTFEVER      = GetSpellInfo(53343); --"Rune of Frostfever"
  SMARTBUFF_ROLICHBANE        = GetSpellInfo(53331); --"Rune of Lichbane"
  SMARTBUFF_ROSPELLSHATTERING = GetSpellInfo(53342); --"Rune of Spellshattering"
  SMARTBUFF_ROSWORDSHATTERING = GetSpellInfo(53323); --"Rune of Swordshattering"
  SMARTBUFF_ROFALLENCRUSADER  = GetSpellInfo(53344); --"Rune of the Fallen Crusader"
  SMARTBUFF_FROZENRUNEWEAPON  = GetSpellInfo(50406); --"Frozen Rune Weapon"
  SMARTBUFF_BLOODPRESENCE     = GetSpellInfo(48266); --"Blood Presence"
  SMARTBUFF_FROSTPRESENCE     = GetSpellInfo(48263); --"Frost Presence"
  SMARTBUFF_UNHOLYPRESENCE    = GetSpellInfo(48265); --"Unholy Presence"  
  SMARTBUFF_PATHOFFROST       = GetSpellInfo(3714);  --"Path of Frost"
  SMARTBUFF_BONESHIELD        = GetSpellInfo(49222); --"Bone Shield"
  SMARTBUFF_HORNOFWINTER      = GetSpellInfo(57330); --"Horn of Winter"
  SMARTBUFF_BLOODAURA         = GetSpellInfo(50365); --"Blood Aura"
  SMARTBUFF_FROSTAURA         = GetSpellInfo(50384); --"Frost Aura"
  SMARTBUFF_UNHOLYAURA        = GetSpellInfo(50391); --"Unholy Aura"
  SMARTBUFF_ABOMINATIONSMIGHT = GetSpellInfo(53138); --"Abomination's Might"  
  
  
  -- Tracking
  SMARTBUFF_FINDMINERALS    = GetSpellInfo(2580);  --"Find Minerals"
  SMARTBUFF_FINDHERBS       = GetSpellInfo(2383);  --"Find Herbs"
  SMARTBUFF_FINDTREASURE    = GetSpellInfo(2481);  --"Find Treasure"
  SMARTBUFF_TRACKHUMANOIDS  = GetSpellInfo(19883); --"Track Humanoids"
  SMARTBUFF_TRACKBEASTS     = GetSpellInfo(1494);  --"Track Beasts"
  SMARTBUFF_TRACKUNDEAD     = GetSpellInfo(19884); --"Track Undead"
  SMARTBUFF_TRACKHIDDEN     = GetSpellInfo(19885); --"Track Hidden"
  SMARTBUFF_TRACKELEMENTALS = GetSpellInfo(19880); --"Track Elementals"
  SMARTBUFF_TRACKDEMONS     = GetSpellInfo(19878); --"Track Demons"
  SMARTBUFF_TRACKGIANTS     = GetSpellInfo(19882); --"Track Giants"
  SMARTBUFF_TRACKDRAGONKIN  = GetSpellInfo(19879); --"Track Dragonkin"
  SMARTBUFF_SENSEDEMONS     = GetSpellInfo(5500);  --"Sense Demons"
  SMARTBUFF_SENSEUNDEAD     = GetSpellInfo(5502);  --"Sense Undead"

  -- Racial
  SMARTBUFF_STONEFORM       = GetSpellInfo(20594); --"Stoneform"
  --SMARTBUFF_PRECEPTION      = GetSpellInfo(20600); --"Perception"
  SMARTBUFF_BLOODFURY       = GetSpellInfo(20572); --"Blood Fury" 33697, 33702
  SMARTBUFF_BERSERKING      = GetSpellInfo(20554); --"Berserking" 26296, 26297
  SMARTBUFF_WOTFORSAKEN     = GetSpellInfo(7744);  --"Will of the Forsaken"
  
  -- Food
  SMARTBUFF_FOOD_AURA       = GetSpellInfo(46899); --"Well Fed"
  SMARTBUFF_FOOD_SPELL      = GetSpellInfo(433);   --"Food"
  SMARTBUFF_DRINK_SPELL     = GetSpellInfo(430);   --"Drink"
  
  
  -- Misc
  SMARTBUFF_KIRUSSOV        = GetSpellInfo(46302); --"K'iru's Song of Victory"
  SMARTBUFF_FISHING         = GetSpellInfo(7620);  --"Fishing"
  
  -- Scroll
  SMARTBUFF_SBAGILITY       = GetSpellInfo(8115);  --"Scroll buff: Agility"
  SMARTBUFF_SBINTELLECT     = GetSpellInfo(8096);  --"Scroll buff: Intellect"
  SMARTBUFF_SBSTAMINA       = GetSpellInfo(8099);  --"Scroll buff: Stamina"
  SMARTBUFF_SBSPIRIT        = GetSpellInfo(8112);  --"Scroll buff: Spirit"
  SMARTBUFF_SBSTRENGHT      = GetSpellInfo(8118);  --"Scroll buff: Strength"
  
  -- Flasks & Elixirs
  SMARTBUFF_BFLASK1         = GetSpellInfo(53760);  --"Flask of Endless Rage"
  SMARTBUFF_BFLASK2         = GetSpellInfo(53755);  --"Flask of the Frost Wyrm"
  SMARTBUFF_BFLASK3         = GetSpellInfo(53758);  --"Flask of Stoneblood"
  SMARTBUFF_BFLASK4         = GetSpellInfo(54212);  --"Flask of Pure Mojo"
  SMARTBUFF_BFLASK5         = GetSpellInfo(67019);  --"Flask of the North"
  
  SMARTBUFF_BELIXIR1        = GetSpellInfo(28497);  --"Mighty Agility"
  SMARTBUFF_BELIXIR2        = GetSpellInfo(60347);  --"Mighty Thoughts"
  SMARTBUFF_BELIXIR3        = GetSpellInfo(53751);  --"Elixir of Mighty Fortitude"
  SMARTBUFF_BELIXIR4        = GetSpellInfo(53748);  --"Mighty Strength"
  SMARTBUFF_BELIXIR5        = GetSpellInfo(53747);  --"Elixir of Spirit"
  SMARTBUFF_BELIXIR6        = GetSpellInfo(53763);  --"Protection"
  SMARTBUFF_BELIXIR7        = GetSpellInfo(60343);  --"Mighty Defense"
  SMARTBUFF_BELIXIR8        = GetSpellInfo(60346);  --"Lightning Speed"
  SMARTBUFF_BELIXIR9        = GetSpellInfo(60344);  --"Expertise"
  SMARTBUFF_BELIXIR10       = GetSpellInfo(60341);  --"Deadly Strikes"
  SMARTBUFF_BELIXIR11       = GetSpellInfo(60345);  --"Armor Piercing"
  SMARTBUFF_BELIXIR12       = GetSpellInfo(60340);  --"Accuracy"  
  
  --if (SMARTBUFF_GOTW) then
  --  SMARTBUFF_AddMsgD(SMARTBUFF_GOTW.." found");
  --end  
  
  --SMARTBUFF_AddMsgD("Spell IDs initialized");
end


function SMARTBUFF_InitSpellList()
  if (SMARTBUFF_PLAYERCLASS == nil) then return; end
  SMARTBUFF_PATTERNS = nil;
  
  --if (SMARTBUFF_GOTW) then
  --  SMARTBUFF_AddMsgD(SMARTBUFF_GOTW.." found");
  --end
  
  -- Hero
  if (SMARTBUFF_PLAYERCLASS == "HERO") then
    SMARTBUFF_BUFFLIST = {      
      {SMARTBUFF_MOTW, 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60,70,80}, "WPET;DKPET", SMARTBUFF_GOTW, 60, {50,60,70,80}, {SMARTBUFF_WILDBERRIES,SMARTBUFF_WILDTHORNROOT,SMARTBUFF_WILDQUILLVINE,SMARTBUFF_WILDSPINELEAF}},
      {SMARTBUFF_THORNS, 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54,64,74}, "HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;WPET;DKPET"},
      {SMARTBUFF_BARKSKIN, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_NATURESGRASP, 0.75, SMARTBUFF_CONST_FORCESELF},
      {SMARTBUFF_TIGERSFURY, 0.1, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT},
      {SMARTBUFF_SAVAGEROAR, 0.15, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT},
      {SMARTBUFF_DRUID_MOONKIN, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DRUID_TREE, -1, SMARTBUFF_CONST_SELF},
	  {SMARTBUFF_SHADOWFORM, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_VAMPIRICEMBRACE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_PWF, 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60,70,80}, "WPET", SMARTBUFF_POF, 60, {48,60,70,80}, {SMARTBUFF_HOLYCANDLE,SMARTBUFF_SACREDCANDLE,SMARTBUFF_SACREDCANDLE,SMARTBUFF_DEVOUTCANDLE}},
      {SMARTBUFF_SP, 10, SMARTBUFF_CONST_GROUP, {30,42,56,68,76}, "WPET;DKPET", SMARTBUFF_POSP, 20, {56,70,77}, {SMARTBUFF_SACREDCANDLE,SMARTBUFF_SACREDCANDLE,SMARTBUFF_DEVOUTCANDLE}},
      {SMARTBUFF_INNERFIRE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DS, 30, SMARTBUFF_CONST_GROUP, {30,40,50,60,70,80}, "ROGUE;WARRIOR;DEATHKNIGHT;HPET;WPET", SMARTBUFF_POS, 60, {60,70,80}, {SMARTBUFF_SACREDCANDLE,SMARTBUFF_SACREDCANDLE,SMARTBUFF_DEVOUTCANDLE}},
      {SMARTBUFF_PWS, 0.5, SMARTBUFF_CONST_GROUP, {6,12,18,24,30,36,42,48,54,60,65,70,75,80}, "MAGE;WARLOCK;ROGUE;PALADIN;WARRIOR;DRUID;HUNTER;SHAMAN;DEATHKNIGHT;HPET;WPET;DKPET"},
      {SMARTBUFF_FEARWARD, 10, SMARTBUFF_CONST_GROUP, {20}, "HPET;WPET;DKPET"},
      {SMARTBUFF_LEVITATE, 2, SMARTBUFF_CONST_GROUP, {34}, "HPET;WPET;DKPET"},
      {SMARTBUFF_ELUNESGRACE, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FEEDBACK, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SHADOWGUARD, 10, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_TOUCHOFWEAKNESS, 10, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_INNERFOCUS, -1, SMARTBUFF_CONST_SELF},
	  {SMARTBUFF_AI, 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56,70,80}, "ROGUE;WARRIOR;DEATHKNIGHT;HPET;WPET;DKPET", SMARTBUFF_AB, 60, {56,70,80}, {SMARTBUFF_ARCANEPOWDER,SMARTBUFF_ARCANEPOWDER,SMARTBUFF_ARCANEPOWDER}},
      {SMARTBUFF_DALARANI, 30, SMARTBUFF_CONST_GROUP, {80,80,80,80,80,80,80}, "ROGUE;WARRIOR;DEATHKNIGHT;HPET;WPET;DKPET", SMARTBUFF_DALARANB, 60, {80,80,80}, {SMARTBUFF_ARCANEPOWDER,SMARTBUFF_ARCANEPOWDER,SMARTBUFF_ARCANEPOWDER}},
      {SMARTBUFF_FOCUSMAGIC, 30, SMARTBUFF_CONST_GROUP, {20}, "WARRIOR;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;DEATHKNIGHT;HPET;WPET;DKPET"},
      {SMARTBUFF_ICEARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_MAGEARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_MOLTENARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DAMPENMAGIC, 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60,67,76}, "HPET;WPET;DKPET"},
      {SMARTBUFF_AMPLIFYMAGIC, 10, SMARTBUFF_CONST_GROUP, {18,30,42,54,63,69,77}, "HPET;WPET;DKPET"},
      {SMARTBUFF_SLOWFALL, 0.5, SMARTBUFF_CONST_GROUP, {12}, "HPET;WPET;DKPET"},
      {SMARTBUFF_MANASHIELD, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FIREWARD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTWARD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ICEBARRIER, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_COMBUSTION, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ICYVEINS, 0.33, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ARCANEPOWER, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_PRESENCEOFMIND, 0.165, SMARTBUFF_CONST_SELF},
	  {SMARTBUFF_FELARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DEMONARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DEMONSKIN, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOULLINK, 0, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DINVISIBILITY, 10, SMARTBUFF_CONST_GROUP, {26}, "HPET;WPET;DKPET"},
      {SMARTBUFF_UNENDINGBREATH, 10, SMARTBUFF_CONST_GROUP, {16}, "HPET;WPET;DKPET"},
      {SMARTBUFF_SHADOWWARD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DARKPACT, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_LIFETAP, 0.025, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SPELLSTONE6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE7, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE1, 60, SMARTBUFF_CONST_INV},
	  {SMARTBUFF_TRUESHOTAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_RAPIDFIRE, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTDH, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTH, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTM, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTV, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTW, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTB, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTC, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTP, -1, SMARTBUFF_CONST_SELF},
	  {SMARTBUFF_LIGHTNINGSHIELD, 10, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_WATERSHIELD, 10, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_EARTHSHIELD, 10, SMARTBUFF_CONST_GROUP, {50,60,70,75,80}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;HPET;WPET;DKPET"},
      {SMARTBUFF_WINDFURYW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_FLAMETONGUEW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_FROSTBRANDW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_ROCKBITERW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_EARTHLIVINGW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_WATERBREATHING, 10, SMARTBUFF_CONST_GROUP, {22}},
      {SMARTBUFF_WATERWALKING, 10, SMARTBUFF_CONST_GROUP, {28}},
	  {SMARTBUFF_BATTLESHOUT, 2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_COMMANDINGSHOUT, 2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BERSERKERRAGE, 0.165, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BLOODRAGE, 0.165, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_RAMPAGE, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_VIGILANCE, 30, SMARTBUFF_CONST_GROUP, {40}, "WARRIOR;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;DEATHKNIGHT;HPET;WPET;DKPET"},
	  {SMARTBUFF_BLADEFLURRY, 0.165, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SAD, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_TRICKS, 0.5, SMARTBUFF_CONST_GROUP, {75}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;HPET;WPET;DKPET"},
      {SMARTBUFF_HUNGERFORBLOOD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_EVASION, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_INSTANTPOISON9, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON8, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON7, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON7, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_MINDPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON9, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON8, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON7, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_CRIPPLINGPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_ANESTHETICPOISON2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_ANESTHETICPOISON1, 60, SMARTBUFF_CONST_INV},
	  {SMARTBUFF_RIGHTEOUSFURY, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_HOLYSHIELD, 0.166, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AVENGINGWARTH, 0.333, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SACREDSHIELD, 0.5, SMARTBUFF_CONST_GROUP, {80}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;HPET;WPET;DKPET"},
      {SMARTBUFF_BOM, 10, SMARTBUFF_CONST_GROUP, {4,12,22,32,42,52,60,70,73,79}, "DRUID;MAGE;PRIEST;SHAMAN;WARLOCK;WPET;DKPET", SMARTBUFF_GBOM, 30, {52,60,70,73,79}, {SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS} },
      {SMARTBUFF_BOW, 10, SMARTBUFF_CONST_GROUP, {14,24,34,44,54,60,65,71,77}, "ROGUE;WARRIOR;DEATHKNIGHT;HPET;WPET;DKPET", SMARTBUFF_GBOW, 30, {54,60,65,71,77}, {SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS} },
      {SMARTBUFF_BOK, 10, SMARTBUFF_CONST_GROUP, {20}, "WPET", SMARTBUFF_GBOK, 30, {60}, {SMARTBUFF_SYMBOLOFKINGS} },
      {SMARTBUFF_BOSAN, 10, SMARTBUFF_CONST_GROUP, {30}, "DRUID;HUNTER;MAGE;PRIEST;ROGUE;SHAMAN;WARLOCK;HPET;WPET;DKPET", SMARTBUFF_GBOSAN, 30, {60}, {SMARTBUFF_SYMBOLOFKINGS} },
      {SMARTBUFF_BOSAL, 10, SMARTBUFF_CONST_GROUP, {26}, "WARRIOR;HPET;WPET;DKPET"},
      {SMARTBUFF_BOF, 0.166, SMARTBUFF_CONST_GROUP, {18}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;HPET;WPET;DKPET"},
      {SMARTBUFF_SOCOMMAND, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOFURY, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOJUSTICE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOLIGHT, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SORIGHTEOUSNESS, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOWISDOM, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOTCRUSADER, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOVENGEANCE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOCORRUPTION, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DEVOTIONAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_RETRIBUTIONAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_CONCENTRATIONAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SHADOWRESISTANCEAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTRESISTANCEAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FIRERESISTANCEAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SANCTITYAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_CRUSADERAURA, -1, SMARTBUFF_CONST_SELF},
	  {SMARTBUFF_FROZENRUNEWEAPON, 10, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_HORNOFWINTER, 2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BONESHIELD, 5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_PATHOFFROST, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BLOODAURA, -1, SMARTBUFF_CONST_SELF},      
      {SMARTBUFF_BLOODPRESENCE, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTPRESENCE, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_UNHOLYAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_UNHOLYPRESENCE, -1, SMARTBUFF_CONST_SELF}
    };
  end

  -- Druid
  if (SMARTBUFF_PLAYERCLASS == "DRUID") then
    SMARTBUFF_BUFFLIST = {      
      {SMARTBUFF_MOTW, 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60,70,80}, "WPET;DKPET", SMARTBUFF_GOTW, 60, {50,60,70,80}, {SMARTBUFF_WILDBERRIES,SMARTBUFF_WILDTHORNROOT,SMARTBUFF_WILDQUILLVINE,SMARTBUFF_WILDSPINELEAF}},
      {SMARTBUFF_THORNS, 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54,64,74}, "HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;WPET;DKPET"},
      {SMARTBUFF_BARKSKIN, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_NATURESGRASP, 0.75, SMARTBUFF_CONST_FORCESELF},
      {SMARTBUFF_TIGERSFURY, 0.1, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT},
      {SMARTBUFF_SAVAGEROAR, 0.15, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT},
      {SMARTBUFF_DRUID_MOONKIN, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DRUID_TREE, -1, SMARTBUFF_CONST_SELF}      
    };
  end
  
  -- Priest
  if (SMARTBUFF_PLAYERCLASS == "PRIEST") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_SHADOWFORM, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_VAMPIRICEMBRACE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_PWF, 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60,70,80}, "WPET", SMARTBUFF_POF, 60, {48,60,70,80}, {SMARTBUFF_HOLYCANDLE,SMARTBUFF_SACREDCANDLE,SMARTBUFF_SACREDCANDLE,SMARTBUFF_DEVOUTCANDLE}},
      {SMARTBUFF_SP, 10, SMARTBUFF_CONST_GROUP, {30,42,56,68,76}, "WPET;DKPET", SMARTBUFF_POSP, 20, {56,70,77}, {SMARTBUFF_SACREDCANDLE,SMARTBUFF_SACREDCANDLE,SMARTBUFF_DEVOUTCANDLE}},
      {SMARTBUFF_INNERFIRE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DS, 30, SMARTBUFF_CONST_GROUP, {30,40,50,60,70,80}, "ROGUE;WARRIOR;DEATHKNIGHT;HPET;WPET", SMARTBUFF_POS, 60, {60,70,80}, {SMARTBUFF_SACREDCANDLE,SMARTBUFF_SACREDCANDLE,SMARTBUFF_DEVOUTCANDLE}},
      {SMARTBUFF_PWS, 0.5, SMARTBUFF_CONST_GROUP, {6,12,18,24,30,36,42,48,54,60,65,70,75,80}, "MAGE;WARLOCK;ROGUE;PALADIN;WARRIOR;DRUID;HUNTER;SHAMAN;DEATHKNIGHT;HPET;WPET;DKPET"},
      {SMARTBUFF_FEARWARD, 10, SMARTBUFF_CONST_GROUP, {20}, "HPET;WPET;DKPET"},
      {SMARTBUFF_LEVITATE, 2, SMARTBUFF_CONST_GROUP, {34}, "HPET;WPET;DKPET"},
      {SMARTBUFF_ELUNESGRACE, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FEEDBACK, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SHADOWGUARD, 10, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_TOUCHOFWEAKNESS, 10, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_INNERFOCUS, -1, SMARTBUFF_CONST_SELF}      
    };
  end
  
  -- Mage
  if (SMARTBUFF_PLAYERCLASS == "MAGE") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_AI, 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56,70,80}, "ROGUE;WARRIOR;DEATHKNIGHT;HPET;WPET;DKPET", SMARTBUFF_AB, 60, {56,70,80}, {SMARTBUFF_ARCANEPOWDER,SMARTBUFF_ARCANEPOWDER,SMARTBUFF_ARCANEPOWDER}},
      {SMARTBUFF_DALARANI, 30, SMARTBUFF_CONST_GROUP, {80,80,80,80,80,80,80}, "ROGUE;WARRIOR;DEATHKNIGHT;HPET;WPET;DKPET", SMARTBUFF_DALARANB, 60, {80,80,80}, {SMARTBUFF_ARCANEPOWDER,SMARTBUFF_ARCANEPOWDER,SMARTBUFF_ARCANEPOWDER}},
      {SMARTBUFF_FOCUSMAGIC, 30, SMARTBUFF_CONST_GROUP, {20}, "WARRIOR;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;DEATHKNIGHT;HPET;WPET;DKPET"},
      {SMARTBUFF_ICEARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_MAGEARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_MOLTENARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DAMPENMAGIC, 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60,67,76}, "HPET;WPET;DKPET"},
      {SMARTBUFF_AMPLIFYMAGIC, 10, SMARTBUFF_CONST_GROUP, {18,30,42,54,63,69,77}, "HPET;WPET;DKPET"},
      {SMARTBUFF_SLOWFALL, 0.5, SMARTBUFF_CONST_GROUP, {12}, "HPET;WPET;DKPET"},
      {SMARTBUFF_MANASHIELD, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FIREWARD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTWARD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ICEBARRIER, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_COMBUSTION, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ICYVEINS, 0.33, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ARCANEPOWER, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_PRESENCEOFMIND, 0.165, SMARTBUFF_CONST_SELF}
    };
    SMARTBUFF_PATTERNS = SMARTBUFF_MAGE_PATTERN;
  end
  
  -- Warlock
  if (SMARTBUFF_PLAYERCLASS == "WARLOCK") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_FELARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DEMONARMOR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DEMONSKIN, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOULLINK, 0, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DINVISIBILITY, 10, SMARTBUFF_CONST_GROUP, {26}, "HPET;WPET;DKPET"},
      {SMARTBUFF_UNENDINGBREATH, 10, SMARTBUFF_CONST_GROUP, {16}, "HPET;WPET;DKPET"},
      {SMARTBUFF_SHADOWWARD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DARKPACT, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_LIFETAP, 0.025, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SPELLSTONE6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_SPELLSTONE1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE7, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_FIRESTONE1, 60, SMARTBUFF_CONST_INV}
    };
    SMARTBUFF_PATTERNS = SMARTBUFF_WARLOCK_PATTERN;
  end

  -- Hunter
  if (SMARTBUFF_PLAYERCLASS == "HUNTER") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_TRUESHOTAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_RAPIDFIRE, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTDH, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTH, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTM, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTV, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTW, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTB, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTC, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AOTP, -1, SMARTBUFF_CONST_SELF}
    };
    SMARTBUFF_PATTERNS = SMARTBUFF_HUNTER_PATTERN;
  end

  -- Shaman
  if (SMARTBUFF_PLAYERCLASS == "SHAMAN") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_LIGHTNINGSHIELD, 10, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_WATERSHIELD, 10, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_EARTHSHIELD, 10, SMARTBUFF_CONST_GROUP, {50,60,70,75,80}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;HPET;WPET;DKPET"},
      {SMARTBUFF_WINDFURYW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_FLAMETONGUEW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_FROSTBRANDW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_ROCKBITERW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_EARTHLIVINGW, 30, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_WATERBREATHING, 10, SMARTBUFF_CONST_GROUP, {22}},
      {SMARTBUFF_WATERWALKING, 10, SMARTBUFF_CONST_GROUP, {28}}
    };
    SMARTBUFF_PATTERNS = SMARTBUFF_SHAMAN_PATTERN;
  end

  -- Warrior
  if (SMARTBUFF_PLAYERCLASS == "WARRIOR") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_BATTLESHOUT, 2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_COMMANDINGSHOUT, 2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BERSERKERRAGE, 0.165, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BLOODRAGE, 0.165, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_RAMPAGE, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_VIGILANCE, 30, SMARTBUFF_CONST_GROUP, {40}, "WARRIOR;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;DEATHKNIGHT;HPET;WPET;DKPET"}
    };
  end
  
  -- Rogue
  if (SMARTBUFF_PLAYERCLASS == "ROGUE") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_BLADEFLURRY, 0.165, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SAD, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_TRICKS, 0.5, SMARTBUFF_CONST_GROUP, {75}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;HPET;WPET;DKPET"},
      {SMARTBUFF_HUNGERFORBLOOD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_EVASION, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_INSTANTPOISON9, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON8, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON7, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_INSTANTPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON7, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_WOUNDPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_MINDPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON9, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON8, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON7, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON6, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON5, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON4, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON3, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_DEADLYPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_CRIPPLINGPOISON1, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_ANESTHETICPOISON2, 60, SMARTBUFF_CONST_INV},
      {SMARTBUFF_ANESTHETICPOISON1, 60, SMARTBUFF_CONST_INV}
    };
  end

  -- Paladin
  if (SMARTBUFF_PLAYERCLASS == "PALADIN") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_RIGHTEOUSFURY, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_HOLYSHIELD, 0.166, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AVENGINGWARTH, 0.333, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SACREDSHIELD, 0.5, SMARTBUFF_CONST_GROUP, {80}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;HPET;WPET;DKPET"},
      {SMARTBUFF_BOM, 10, SMARTBUFF_CONST_GROUP, {4,12,22,32,42,52,60,70,73,79}, "DRUID;MAGE;PRIEST;SHAMAN;WARLOCK;WPET;DKPET", SMARTBUFF_GBOM, 30, {52,60,70,73,79}, {SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS} },
      {SMARTBUFF_BOW, 10, SMARTBUFF_CONST_GROUP, {14,24,34,44,54,60,65,71,77}, "ROGUE;WARRIOR;DEATHKNIGHT;HPET;WPET;DKPET", SMARTBUFF_GBOW, 30, {54,60,65,71,77}, {SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS,SMARTBUFF_SYMBOLOFKINGS} },
      {SMARTBUFF_BOK, 10, SMARTBUFF_CONST_GROUP, {20}, "WPET", SMARTBUFF_GBOK, 30, {60}, {SMARTBUFF_SYMBOLOFKINGS} },
      {SMARTBUFF_BOSAN, 10, SMARTBUFF_CONST_GROUP, {30}, "DRUID;HUNTER;MAGE;PRIEST;ROGUE;SHAMAN;WARLOCK;HPET;WPET;DKPET", SMARTBUFF_GBOSAN, 30, {60}, {SMARTBUFF_SYMBOLOFKINGS} },
      {SMARTBUFF_BOSAL, 10, SMARTBUFF_CONST_GROUP, {26}, "WARRIOR;HPET;WPET;DKPET"},
      {SMARTBUFF_BOF, 0.166, SMARTBUFF_CONST_GROUP, {18}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;HPET;WPET;DKPET"},
      --{SMARTBUFF_BOP, 1, SMARTBUFF_CONST_GROUP, {10,24,38}},
      {SMARTBUFF_SOCOMMAND, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOFURY, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOJUSTICE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOLIGHT, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SORIGHTEOUSNESS, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOWISDOM, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOTCRUSADER, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOVENGEANCE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOCORRUPTION, 30, SMARTBUFF_CONST_SELF},
      --{SMARTBUFF_SOBLOOD, 30, SMARTBUFF_CONST_SELF},      
      --{SMARTBUFF_SOMARTYR, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DEVOTIONAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_RETRIBUTIONAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_CONCENTRATIONAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SHADOWRESISTANCEAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTRESISTANCEAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FIRERESISTANCEAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SANCTITYAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_CRUSADERAURA, -1, SMARTBUFF_CONST_SELF}
    };
    SMARTBUFF_PATTERNS = SMARTBUFF_PALADIN_PATTERN;
  end
  
  -- Deathknight
  if (SMARTBUFF_PLAYERCLASS == "DEATHKNIGHT") then
    SMARTBUFF_BUFFLIST = {
      --SMARTBUFF_ROCINDERGLACIER
      --SMARTBUFF_ROFROSTFEVER
      --SMARTBUFF_ROLICHBANE
      --SMARTBUFF_ROSPELLSHATTERING
      --SMARTBUFF_ROSWORDSHATTERING
      --SMARTBUFF_ROFALLENCRUSADER
      {SMARTBUFF_FROZENRUNEWEAPON, 10, SMARTBUFF_CONST_WEAPON},
      {SMARTBUFF_HORNOFWINTER, 2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BONESHIELD, 5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_PATHOFFROST, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BLOODAURA, -1, SMARTBUFF_CONST_SELF},      
      {SMARTBUFF_BLOODPRESENCE, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FROSTPRESENCE, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_UNHOLYAURA, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_UNHOLYPRESENCE, -1, SMARTBUFF_CONST_SELF}
    };
    SMARTBUFF_PATTERNS = SMARTBUFF_DEATHKNIGHT_PATTERN;
  end

  -- Stones and oils
  SMARTBUFF_WEAPON = {
    {SMARTBUFF_SSROUGH, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSCOARSE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSHEAVY, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSSOLID, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSDENSE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSELEMENTAL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSFEL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSADAMANTITE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSROUGH, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSCOARSE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSHEAVY, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSSOLID, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSDENSE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSFEL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSADAMANTITE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SHADOWOIL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_FROSTOIL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL5, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL4, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL3, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL2, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL1, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL6, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL5, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL4, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL3, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL2, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL1, 60, SMARTBUFF_CONST_INV}
  };

  -- Tracking
  SMARTBUFF_TRACKING = {
    {SMARTBUFF_FINDMINERALS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_FINDHERBS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_FINDTREASURE, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKHUMANOIDS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKBEASTS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKUNDEAD, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKHIDDEN, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKELEMENTALS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKDEMONS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKGIANTS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKDRAGONKIN, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_SENSEDEMONS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_SENSEUNDEAD, -1, SMARTBUFF_CONST_TRACK}
  };

  -- Racial
  SMARTBUFF_RACIAL = {
    {SMARTBUFF_STONEFORM, 0.133, SMARTBUFF_CONST_SELF},  -- Dwarv
    --{SMARTBUFF_PRECEPTION, 0.333, SMARTBUFF_CONST_SELF}, -- Human
    {SMARTBUFF_BLOODFURY, 0.416, SMARTBUFF_CONST_SELF},  -- Orc
    {SMARTBUFF_BERSERKING, 0.166, SMARTBUFF_CONST_SELF}, -- Troll
    {SMARTBUFF_WOTFORSAKEN, 0.083, SMARTBUFF_CONST_SELF} -- Undead
  };

  -- FOOD
  SMARTBUFF_FOOD = {
    {SMARTBUFF_WOTLKFOOD32, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD31, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD30, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD29, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD28, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD27, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD26, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD25, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD24, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD23, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD22, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD21, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD20, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD19, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD18, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD17, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD16, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD15, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD14, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD13, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD12, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD11, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD10, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD9, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD8, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD7, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD6, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD5, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD4, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD3, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD2, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WOTLKFOOD1, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SPICYCRAWDAD, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_MOKNATHALSHORTRIBS, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_CRUNCHYSERPENT, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_GOLDENFISHSTICKS, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SPICYHOTTALBUK, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SKULLFISHSOUP, 30, SMARTBUFF_CONST_FOOD},    
    {SMARTBUFF_TALBUKSTEAK, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WARPBURGER, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_ROASTEDCLEFTHOOF, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_POACHEDBLUEFISH, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_GRILLEDMUDFISH, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BLACKENEDBASILISK, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BLACKENEDSPOREFISH, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SPORELINGSNACK, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BROILEDBLOODFIN, 30, SMARTBUFF_CONST_FOOD},    
    {SMARTBUFF_CLAMBAR, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_FELTAILDELIGHT, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_RAVAGERDOG, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BUZZARDBITES, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SAGEFISHDELIGHT, 15, SMARTBUFF_CONST_FOOD}
  };

  -- Scrolls
  SMARTBUFF_SCROLL = {  
    {SMARTBUFF_SOAGILITY8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOINTELLECT8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOSTAMINA8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSPIRIT8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSTRENGHT8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT}
  };
  
  -- Potions
  SMARTBUFF_POTION = {
    {SMARTBUFF_FLASK1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK1},
    {SMARTBUFF_FLASK2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK2},
    {SMARTBUFF_FLASK3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK3},
    {SMARTBUFF_FLASK4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK4},
    {SMARTBUFF_FLASK5, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK5},
    {SMARTBUFF_ELIXIR1,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR1},
    {SMARTBUFF_ELIXIR2,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR2},
    {SMARTBUFF_ELIXIR3,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR3},
    {SMARTBUFF_ELIXIR4,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR4},
    {SMARTBUFF_ELIXIR5,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR5},
    {SMARTBUFF_ELIXIR6,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR6},
    {SMARTBUFF_ELIXIR7,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR7},
    {SMARTBUFF_ELIXIR8,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR8},
    {SMARTBUFF_ELIXIR9,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR9},
    {SMARTBUFF_ELIXIR10, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR10},
    {SMARTBUFF_ELIXIR11, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR11},
    {SMARTBUFF_ELIXIR12, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR12}
  }
  
  SMARTBUFF_AddMsgD("Spell list initialized");
end
