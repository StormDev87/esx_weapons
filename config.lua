local ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


Config = {}
Config.Locale = 'it'

Config.SingleItem = true --with this flag is possible use only one item components for all weapons, divided by function, otherwise it's necessary specific item for any components for any weapons.

Config.UseKeyBind = true
Config.KeyBind = "F5"

--Config.WeaponsStorm = Config.WeaponsESX
--ESX.Config.Weapons
Config.WeaponsStorm = {}


Config.DefaultWeaponTintsStorm = {
	[0] = ('tint_default'),
	[1] = ('tint_green'),
	[2] = ('tint_gold'),
	[3] = ('tint_pink'),
	[4] = ('tint_army'),
	[5] = ('tint_lspd'),
	[6] = ('tint_orange'),
	[7] = ('tint_platinum')
}


Config.GroupWeapon = {
    ["pistol"] = { ammoName = "mpistol",    boxName = "boxpistol",  boxCapacity = 60,  wpCapacity = 250,  idGroup = 416676503},
    ["smg"]    = { ammoName = "msmg",       boxName = "boxsmg",     boxCapacity = 60,  wpCapacity = 250,  idGroup = -957766203},
    ["shot"]   = { ammoName = "mshot",      boxName = "boxshot",    boxCapacity = 60,  wpCapacity = 250,  idGroup = 860033945},
    ["rifle"]  = { ammoName = "mrifle",     boxName = "boxrifle",   boxCapacity = 60,  wpCapacity = 250,  idGroup = 970310034},
    ["sniper"] = { ammoName = "msniper",    boxName = "boxsniper",  boxCapacity = 60,  wpCapacity = 250,  idGroup = -1212426201},
    ["other"]  = { ammoName = "notApp",     boxName = "notApp",     boxCapacity = 60,  wpCapacity = 250,  idGroup = -999999},
}

Config.LocWeapon = {
    --Pistol
    ["WEAPON_PISTOL"]           = { itemName = "pistol",         group = "pistol"},
    ["WEAPON_COMBATPISTOL"]     = { itemName = "combatpistol",   group = "pistol"},
    ["WEAPON_APPISTOL"]         = { itemName = "appistol",       group = "pistol"},
    ["WEAPON_PISTOL50"]         = { itemName = "pistol50",       group = "pistol"},
    ["WEAPON_SNSPISTOL"]        = { itemName = "snspistol",      group = "pistol"},
    ["WEAPON_FLAREGUN"]         = { itemName = "flaregun",       group = "pistol"},
    ["WEAPON_REVOLVER"]         = { itemName = "revolver",       group = "pistol"},
    --Smg           
    ["WEAPON_MICROSMG"]         = { itemName = "microsmg",       group = "smg"},
    ["WEAPON_MINISMG"]          = { itemName = "minismg",        group = "smg"},
    ["WEAPON_SMG"]              = { itemName = "smg",            group = "smg"},
    ["WEAPON_ASSAULTSMG"]       = { itemName = "assaultsmg",     group = "smg"},
    --shot
    ["WEAPON_PUMPSHOTGUN"]      = { itemName = "pumpshotgun",    group = "shot"},    
    ["WEAPON_COMBATSHOTGUN"]    = { itemName = "combatshotgun",  group = "shot"},  
    ["WEAPON_HEAVYSHOTGUN"]     = { itemName = "heavyshotgun",   group = "shot"},   
    ["WEAPON_ASSAULTSHOTGUN"]   = { itemName = "assaultshotgun", group = "shot"}, 
    --rifle
    ["WEAPON_ASSAULTRIFLE"]     = { itemName = "assaultrifle",   group = "rifle"},   
    ["WEAPON_CARBINERIFLE"]     = { itemName = "carbinerifle",   group = "rifle"},   
    ["WEAPON_ADVANCEDRIFLE"]    = { itemName = "advancedrifle",  group = "rifle"},  
    ["WEAPON_SPECIALCARBINE"]   = { itemName = "specialcarbine", group = "rifle"}, 
    ["WEAPON_COMPACTRIFLE"]     = { itemName = "compactrifle",   group = "rifle"},   
    --sniper
    ["WEAPON_SNIPERRIFLE"]      = { itemName =  "sniperifle",    group = "sniper"},   
    ["WEAPON_MARKSMANRIFLE"]    = { itemName =  "marksmanrifle", group = "sniper"}, 
    --other
    ["WEAPON_STUNGUN"]          = { itemName = "stungun",        group = "notApp"},     
    ["WEAPON_DAGGER"]           = { itemName = "dagger",         group = "notApp"},      
    ["WEAPON_BAT"]              = { itemName = "bat",            group = "notApp"},         
    ["WEAPON_BOTTLE"]           = { itemName = "bottle",         group = "notApp"},      
    ["WEAPON_CROWBAR"]          = { itemName = "crowbar",        group = "notApp"},     
    ["WEAPON_GOLFCLUB"]         = { itemName = "golfclub",       group = "notApp"},    
    ["WEAPON_HATCHET"]          = { itemName = "hatchet",        group = "notApp"},     
    ["WEAPON_MACHETE"]          = { itemName = "machete",        group = "notApp"},     
    ["WEAPON_KNUCKLE"]          = { itemName = "knuckle",        group = "notApp"},     
    ["WEAPON_KNIFE"]            = { itemName = "knife",          group = "notApp"},       
    ["WEAPON_NIGHTSTICK"]       = { itemName = "nightstick",     group = "notApp"},  
    ["WEAPON_FLASHLIGHT"]       = { itemName = "flashlight",     group = "notApp"},  
    ["WEAPON_GRENADE"]          = { itemName = "grenade",        group = "notApp"},     
    ["WEAPON_SMOKEGRENADE"]     = { itemName = "smokegrenade",   group = "notApp"},
    ["WEAPON_STICKYBOMB"]       = { itemName = "stickybomb",     group = "notApp"},  
    ["WEAPON_MOLOTOV"]          = { itemName = "molotov",        group = "notApp"},     
    ["WEAPON_PETROLCAN"]        = { itemName = "petrolcan",      group = "notApp"},   
}

Config.MasterComponents = {
    'clip_default',
	'clip_extended',
	'flashlight', 
	'suppressor', 
	'luxary_finish',
}


Config.ComponentsItems = {}

Config.Ammo = {}

local antiRep = false

for k,v in pairs(Config.LocWeapon) do
    local appIdGroup = 0
    local appDefComp = ""
    local appWaponRef = k
    Config.WeaponsStorm[k] = {}
    Config.WeaponsStorm[k].name = k
    Config.WeaponsStorm[k].itemName = v.itemName
    Config.WeaponsStorm[k].group = v.group
    Config.WeaponsStorm[k].tints = Config.DefaultWeaponTintsStorm
    appDefComp = v.itemName
    for kk,vv in pairs(Config.GroupWeapon) do
        if v.group == kk then
            Config.WeaponsStorm[k].ammoName = vv.ammoName 
            Config.WeaponsStorm[k].boxName = vv.boxName 
            Config.WeaponsStorm[k].idGroup = vv.idGroup 
            appIdGroup = vv.idGroup
            local tmpAmmo = { quantity = nil,            max =  vv.wpCapacity, nameItem = vv.ammoName, itemRest = vv.ammoName, nameGroup = kk, isBox = false, idGroup = vv.idGroup}
            local tmpBox  = { quantity = vv.boxCapacity, max =  vv.wpCapacity, nameItem = vv.boxName,  itemRest = vv.ammoName, nameGroup = kk, isBox = true,  idGroup = vv.idGroup}
            table.insert(Config.Ammo, tmpAmmo)
            table.insert(Config.Ammo, tmpBox)
        end
    end
    if Config.SingleItem then
        appDefComp = "generic"
        appIdGroup = 696969696969
        appWaponRef = "allWeapon"
    end
    if not antiRep then
        for i=1, #Config.MasterComponents do
            local tmpComponents = { name = Config.MasterComponents[i], itemName = appDefComp.."_"..Config.MasterComponents[i], idGroup = appIdGroup, waponRef = appWaponRef}
            table.insert(Config.ComponentsItems, tmpComponents)
        end
        antiRep = Config.SingleItem
    end
end
