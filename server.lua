local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


--This is di
RegisterServerEvent('disassembleWeapon')
AddEventHandler('disassembleWeapon', function(isDead, weapon_t)
 --print("Arrivo in smontaarmi")
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  --getComponents from loadout for weapon
  for k,v in pairs(xPlayer.loadout) do
    if v.name == weapon_t or isDead then
     local thisWeapon = getInfoWeapon(v.name)
     for kk,vv in pairs(v.components) do
        print(thisWeapon.itemName)
        xPlayer.addInventoryItem(thisWeapon.itemName.."_"..vv, 1)
        xPlayer.removeWeaponComponent(v.name, vv)
     end
        xPlayer.addInventoryItem(thisWeapon.ammoName, v.ammo)  
        xPlayer.removeWeapon(v.name, 500)
        xPlayer.addInventoryItem(thisWeapon.itemName, 1)
    end
  end
end)

--This is used for add ammo on weapons
RegisterServerEvent('esx_weapons:elabData')
AddEventHandler('esx_weapons:elabData', function(weaponHash, data, weaponName, pedAmmo)
  local regiveEtc = false
  local _pedAmmo = pedAmmo
  local _weaponName = weaponName
  local xPlayer  = ESX.GetPlayerFromId(source)
  
  local quantity = 0
  
  if data.isBox then
    regiveEtc = true
    quantity = data.quantity
  else
    quantity = xPlayer.getInventoryItem(data.nameItem).count
  end 

  local newPedAmmo = getPedAmmoForType(xPlayer, data.idGroup)
  _pedAmmo = newPedAmmo

  local somma = math.floor(_pedAmmo + quantity)
  local appSomma = somma
  
  if somma >= data.max then
    appSomma = data.max
  end
  local qtAmmo = appSomma - _pedAmmo

  if data.isBox then
    local qtRegive = quantity - qtAmmo
    xPlayer.addInventoryItem(data.itemRest, qtRegive)
    xPlayer.removeInventoryItem(data.nameItem, 1)
  end
  loadoutClearFortype(xPlayer, data.nameGroup)
  xPlayer.removeInventoryItem(data.itemRest, qtAmmo)
  xPlayer.addWeaponAmmo(_weaponName, qtAmmo)

end)


--This is used for assemble components on weapons
RegisterServerEvent('esx_weapons:elabDataComp')
AddEventHandler('esx_weapons:elabDataComp', function(weaponHash, component)
  print("Arrivo sul server esx_weapons elabDataComp", weaponHash)
  local xPlayer  = ESX.GetPlayerFromId(source)
  local weaponName = ESX.GetWeaponFromHash(weaponHash)
  if weaponName and weaponName.name then
    if (weaponName.name == component.waponRef) or Config.SingleItem then
      if  not xPlayer.hasWeaponComponent(weaponName.name , component.name) then
          xPlayer.removeInventoryItem(component.itemName, 1)
          print(weaponName.name, component.name)
          xPlayer.addWeaponComponent(weaponName.name, component.name)
      else
        xPlayer.showNotification('Hai già questo compoente equipaggiato!')
      end
    else
      xPlayer.showNotification('Non è L\'arma giusta!')
    end
  end
end)


--Usable Item
AddEventHandler('onResourceStart',function(resName)
  if resName == GetCurrentResourceName() then
   for k,v in pairs(Config.WeaponsStorm) do
      if(v.itemName ~= nil) then
        --Mounting weapons
        ESX.RegisterUsableItem(v.itemName, function(source)
          local xPlayer = ESX.GetPlayerFromId(source)
          xPlayer.removeInventoryItem(v.itemName, 1)
          xPlayer.addWeapon(v.name, 0)
          TriggerClientEvent('esx:showNotification', source, _U('mounted')..v.itemName)
        end)  
      end
   end 
   for k,v in pairs(Config.Ammo) do
    --Using ammo
     ESX.RegisterUsableItem(k, function(source)
     TriggerClientEvent('esx_weapons:useItem', source,  v, false)
     end)
   end
    for k,v in pairs(Config.ComponentsItems) do
      --Using Components
      ESX.RegisterUsableItem(v.itemName, function(source)
      TriggerClientEvent('esx_weapons:useItem', source,  v, true)
      end)
    end
 end
end)


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

function getPedAmmoForType(myxPlayer, idGroup)
	local result = 0
  local xPlayer  = myxPlayer
  for a,b in pairs(Config.WeaponsStorm) do
    if b.idGroup == idGroup then
      for k,v in ipairs(xPlayer.getLoadout()) do
        print(json.encode(v))
        if v.ammo ~= 0 then
          result = v.ammo
        end
      end
    break
    end
  end 
  return result
end


function getInfoWeapon(weapon_t)
  result = {}
  for k,v in pairs(Config.WeaponsStorm) do
    if v.name == weapon_t then
      print(v.ammoName, v.itemName)
        result.ammoName = v.ammoName
        result.itemName = v.itemName
        break
    end
  end
  return result
end

