
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData                = {}

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetCorObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = QBCore.Functions.GetPlayerData()
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
            if IsPedInAnyVehicle(PlayerPedId()) then
                SetUserRadioControlEnabled(false)
                if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
                end
        end
    end
end)
