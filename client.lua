ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)
RegisterCommand('ogloszeniedc', function(source, args)
    local text = table.concat(args, " ")
    TriggerServerEvent("Imago_ogloszeniedc:send", text)
end)