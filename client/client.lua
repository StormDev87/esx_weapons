ESX             				= nil
local playerData 				= {}
local weaponList				= {}
local Time                      = 0
local Time2                     = 0

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
	createList()
end)

function createList()
	for k,v in pairs(Config.WeaponsStorm) do
		local tmp = {name = v.name, itemName = v.itemName}
		table.insert(weaponList, tmp)
	end
end

function OpenMenu()
    local elements = {}
	for i = 1, #weaponList do
		local weapon_t = weaponList[i].name
		local weapon_name = weaponList[i].itemName
		local weapon = GetHashKey(weapon_t)
		if HasPedGotWeapon(PlayerPedId(), weapon, false) then
			table.insert(elements, {label = _U('disassemble')..weapon_name, value = 'diassemble', arma = weapon_t})
			ESX.UI.Menu.CloseAll()
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'civilian_actions',
			{
			  css = 'identity',
			  title    = _U('disassemble_weapons'),
			  align    = 'top-left',
			  elements = elements
			},

			function(data, menu)
			local val = data.current.value
			if val == 'diassemble' then
				menu.close()
				local playerPed  = PlayerPedId()
				local weaponHash = weapon
				local pedAmmo = GetAmmoInPedWeapon(playerPed, data.current.arma)
				TriggerServerEvent('disassembleWeapon', false, data.current.arma)
				Citizen.Wait(800)
			end
		    end,
		    function(data, menu)
		        menu.close()
			end
		)
		end
	end
end

function controlWeaponType(weaponHash, group)
	local result = { name = "No_Match", value =false}
	local nameWeapon = ESX.GetWeaponFromHash(weaponHash)
	local typeNameWeapon = GetWeapontypeGroup(weaponHash)
	if  nameWeapon ~= nil then
		result.name = nameWeapon.name
	end
	if typeNameWeapon == group then
		result.value = true
	end
	return result
end

RegisterNetEvent('esx_weapons:useItem')
AddEventHandler('esx_weapons:useItem', function(data, isComp)
	local ped = PlayerPedId()
	local weaponHash = GetSelectedPedWeapon(ped)
	local pedAmmo = GetAmmoInPedWeapon(ped, weaponHash)
	local correctType = controlWeaponType(weaponHash, data.idGroup)
	if IsPedArmed(ped, 4) and (correctType.value or (Config.SingleItem and isComp)) then
		TriggerServerEvent('esx_weapons:elabData', weaponHash, data, isComp)
	else
		ESX.ShowNotification(_U('wrong_weapon'), true, true, nil)
	end
end)

RegisterCommand('myOpenMenu',OpenMenu)
RegisterKeyMapping('myOpenMenu','OpenMenu','KEYBOARD', Config.KeyBind)

AddEventHandler('esx:onPlayerDeath',function()
	TriggerServerEvent('disassembleWeapon',true)
end)