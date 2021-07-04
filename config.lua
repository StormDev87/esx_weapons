local ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Config.SingleItem = true --with this flag is possible use only one item components for all weapons, divided by function, otherwise it's necessary specific item for any components for any weapons.

Config.UseKeyBind = true
Config.KeyBind = "F5"

Config.WeaponsStorm = Config.WeaponsESX
--ESX.Config.Weapons

Config.GroupWeapon = {
    ["pistol"] = { ammoName = "mpistol",    boxName = "boxpistol",  type = 416676503},
    ["smg"]    = { ammoName = "msmg",       boxName = "boxsmg",     type = -957766203},
    ["shot"]   = { ammoName = "mshot",      boxName = "boxshot",    type = 860033945},
    ["rifle"]  = { ammoName = "mrifle",     boxName = "boxrifle",   type = 970310034},
    ["sniper"] = { ammoName = "msniper",    boxName = "boxsniper",  type = -1212426201},
    ["other"]  = { ammoName = "notApp",     boxName = "notApp",     type = -999999},
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


Config.ComponentsItems = {}

Config.Ammo = {
    ["mpistol"]     = {quantity = nil, max = 250, nameItem = 'mpistol',     nameGroup = "pistol",   isBox = false,  itemRest = "mpistol",   idGroup = 416676503},
    ["boxpistol"]   = {quantity = 60,  max = 250, nameItem = 'boxpistol',   nameGroup = "pistol",   isBox = true,   itemRest = "mpistol",   idGroup = 416676503},

    ["msmg"]        = {quantity = nil, max = 250, nameItem = 'msmg',        nameGroup = "smg",      isBox = false,  itemRest = "msmg",      idGroup = -957766203},
    ["boxsmg"]      = {quantity = 60,  max = 250, nameItem = 'boxsmg',      nameGroup = "smg",      isBox = true,   itemRest = "msmg",      idGroup = -957766203},

    ["mshot"]       = {quantity = nil, max = 250, nameItem = 'mshot',       nameGroup = "shot",     isBox = false,  itemRest = "mshot",     idGroup = 860033945},
    ["boxshot"]     = {quantity = 60,  max = 250, nameItem = 'boxshot',     nameGroup = "shot",     isBox = true,   itemRest = "mshot",     idGroup = 860033945},

    ["mrifle"]      = {quantity = nil, max = 250, nameItem = 'mrifle',      nameGroup = "rifle",    isBox = false,  itemRest = "mrifle",    idGroup = 970310034},
    ["boxrifle"]    = {quantity = 60,  max = 250, nameItem = 'boxrifle',    nameGroup = "rifle",    isBox = true,   itemRest = "mrifle",    idGroup = 970310034},

    ["msniper"]     = {quantity = nil, max = 250, nameItem = 'msniper',     nameGroup = "sniper",   isBox = false,  itemRest = "msniper",   idGroup = 1212426201},
    ["boxsniper"]   = {quantity = 60,  max = 250, nameItem = 'boxsniper',   nameGroup = "sniper",   isBox = true,   itemRest = "msniper",   idGroup = 1212426201},

}

--[[
	{
		name = 'WEAPON_COMBATPISTOL',
		label = ('weapon_combatpistol'),
		ammo = {label = ('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = ('component_clip_default'), hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01')},
			{name = 'clip_extended', label = ('component_clip_extended'), hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')},
			{name = 'flashlight', label = ('component_flashlight'), hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
			{name = 'suppressor', label = ('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
			{name = 'luxary_finish', label = ('component_luxary_finish'), hash = GetHashKey('COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER')}
		}
	},
},]]



for k,v in pairs(Config.LocWeapon) do
    for i=1, #Config.WeaponsStorm do
        local hashGroup = 48488484848484
        if Config.WeaponsStorm[i].name == k then --Founded my weapon          
            for kk,vv in pairs(Config.GroupWeapon) do
                if v.group == kk then
                    Config.WeaponsStorm[i].ammoName = vv.ammoName 
                    Config.WeaponsStorm[i].boxName = vv.boxName 
                    Config.WeaponsStorm[i].type = vv.type 
                    hashGroup = vv.type
                end
            end
            for n=1, #Config.WeaponsStorm[i].components do
                local tmpName = v.itemName.."_"..Config.WeaponsStorm[i].components[n].name
                Config.WeaponsStorm[i].components[n].waponRef = k 
                Config.WeaponsStorm[i].components[n].idGroup = hashGroup
                Config.WeaponsStorm[i].components[n].itemName = tmpName
                table.insert(Config.ComponentsItems, Config.WeaponsStorm[i].components[n])
            end
            Config.WeaponsStorm[i].itemName = v.itemName --Adding UsableItemName
            Config.WeaponsStorm[i].group = v.group --Adding group appartenance
            Config.WeaponsStorm[i].idGroup = hashGroup
            break
        end

    end
end

--[[
	{
		name = 'WEAPON_COMBATPISTOL',
        
        --ADDED DATA
        itemName = "combatpistol",
        group = "pistol",
        idGroup = 416676503,
        ammoName = "mpistol",
        boxName = "boxpistol",

		label = ('weapon_combatpistol'),
		ammo = {label = ('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', itemName='combatpistol_clip_default', idGroup=416676503, waponRef="WEAPON_COMBATPISTOL", label = ('component_clip_default'), hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01')},
			{name = 'clip_extended',itemName='combatpistol_clip_extended', idGroup=416676503, waponRef="WEAPON_COMBATPISTOL", label = ('component_clip_extended'), hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')},
			{name = 'flashlight', itemName='combatpistol_flashlight', idGroup=416676503, waponRef="WEAPON_COMBATPISTOL", label = ('component_flashlight'), hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
			{name = 'suppressor', itemName='combatpistol_suppressor', idGroup=416676503, waponRef="WEAPON_COMBATPISTOL", label = ('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
			{name = 'luxary_finish', itemName='combatpistol_luxary_finish', idGroup=416676503, waponRef="WEAPON_COMBATPISTOL", label = ('component_luxary_finish'), hash = GetHashKey('COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER')}
		}
	},
},]]
