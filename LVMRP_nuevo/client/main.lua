ESX = nil

local theorical = false
local isInTheorical = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
end)

-- Enter / Exit marker events
AddEventHandler('LVMRP_driverschool:hasEnteredMarker', function(zone)
    if zone == 'reception' then
        CurrentAction     = 'reception'
    end
end)

AddEventHandler('LVMRP_driverschool:hasExitedMarker', function(zone)
	CurrentAction = nil
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true
        local isInMarker = false
        local currentZone = nil
        
        if GetDistanceBetweenCoords(coords, Config.SchoolPos, true) < 10 then
            DrawMarker(27, Config.SchoolPos.x, Config.SchoolPos.y, Config.SchoolPos.z -0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 255, 0, 100, false, true, 2, false, nil, nil, false)
            letSleep = false
            if GetDistanceBetweenCoords(coords, Config.SchoolPos, true) < 2 then
                ESX.ShowFloatingHelpNotification(_U('useReception'), Config.SchoolPos)
                isInMarker = true
                currentZone = 'reception'
            end
        end
			
        if isInMarker and not HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent('LVMRP_driverschool:hasEnteredMarker', currentZone)
        end
        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('LVMRP_driverschool:hasExitedMarker', LastZone)
        end
        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentAction then
			if IsControlJustReleased(0, 38) then
                if CurrentAction == 'reception' then
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        action = "openUI"
                    })
                end
			end
		end
	end
end)

RegisterNUICallback("Close",function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "closeUI"
    })
end)

