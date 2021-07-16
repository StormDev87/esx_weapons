--This function is needed for clear the player loadout, is used before adding a new value of ammo
function loadoutClearFortype(myxPlayer, type)
  local xPlayer  = myxPlayer
  for a,b in pairs(Config.WeaponsStorm) do
    for k,v in ipairs(xPlayer.getLoadout()) do
      if v.name == v.name and b.type == type then
      xPlayer.removeWeaponAmmo(myPistol[i], v.ammo)
      end
    end
  end 
end
--test

--This function is needed for get the max value of ammo for specific group of weapons
function getPedAmmoForType(myxPlayer, idGroup)
  local result = 0
  local xPlayer  = myxPlayer
  for a,b in pairs(Config.WeaponsStorm) do
    if b.idGroup == idGroup then
      for k,v in ipairs(xPlayer.getLoadout()) do
        if v.ammo > result then
          result = v.ammo
        end
      end
    break
    end
  end 
  return result
end

--This function is needed for get the information utils in the process of diasseblament of weapons
function getInfoWeapon(weapon_t)
  result = {}
  for k,v in pairs(Config.WeaponsStorm) do
    if v.name == weapon_t then
        result.ammoName = v.ammoName
        result.itemName = v.itemName
        break
    end
  end
  return result
end

