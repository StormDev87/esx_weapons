local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

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
				--TriggerServerEvent('disassembleWeapon', false, data.current.arma, data.current.armaName, pedAmmo)
				TriggerServerEvent('disassembleWeapon', false, data.current.arma)
				Citizen.Wait(800)
				--OpenMenu()
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

--Chiamato da UseItem 
--passa: numero di munizioni da caricare, massima capacità pistola, nome dell'item da caricare, tipo di item (colpi pistola o smg etc etc), è un box 
RegisterNetEvent('esx_weapons:useItem')
AddEventHandler('esx_weapons:useItem', function(data, isComp)
	local ped = PlayerPedId()
	local weaponHash = GetSelectedPedWeapon(ped)
	local pedAmmo = GetAmmoInPedWeapon(ped, weaponHash)
	local correctType = controlWeaponType(weaponHash, data.idGroup)
	if IsPedArmed(ped, 4) and (correctType.value or (Config.SingleItem and isComp)) then
		if not isComp then
			TriggerServerEvent('esx_weapons:elabData', weaponHash, data, correctType.name, pedAmmo)
		else
			TriggerServerEvent('esx_weapons:elabDataComp', weaponHash, data)
		end
	else
		ESX.ShowNotification("Non hai l\'arma corretta in mano!", true, true, nil)
	end
end)

RegisterCommand('myOpenMenu',OpenMenu)
RegisterKeyMapping('myOpenMenu','OpenMenu','KEYBOARD', Config.KeyBind)

AddEventHandler('esx:onPlayerDeath',function()
	TriggerServerEvent('disassembleWeapon',true)
end)