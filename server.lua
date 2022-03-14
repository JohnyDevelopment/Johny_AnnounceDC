ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local webhook = ""
local logo = "https://media.discordapp.net/attachments/853588228094427157/910804424929210378/imago.png"
RegisterNetEvent("Imago_ogloszeniedc:send")
AddEventHandler('Imago_ogloszeniedc:send', function(text)
    local gracz = source
    local xPlayer = ESX.GetPlayerFromId(gracz)
    local steamid, license, discord = "Nie wykryto", "Nie wykryto", "Nie wykryto"
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.match(v, "discord:") then
            discordid = string.sub(v, 9)
        end
    end
	if (xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'mod') then
        local name = GetPlayerName(source)
        local steamhex = GetPlayerIdentifier(source)
        print(discordid)
        print(text)
        if text == "" then
            print("ee")
            xPlayer.showNotification('~r~Text Nie Moze byc Pusty')
        else
            local logpodwysylanie = {
                {
                    ["color"] = "00000000",
                    ["title"] = "Ogłoszenie",
                    ["description"] = "**"..text.."** \n Discord Autora: <@"..discordid..">",
                    ["footer"] = {
                        ["text"] = "Nick Administratora W Grze: "..name,
                        ["icon_url"] = logo,
                    },
                }
            }
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name, avatar_url = logo, embeds = logpodwysylanie}), { ['Content-Type'] = 'application/json' })
        end
    else
        xPlayer.showNotification('~r~Nie posiadasz permisji')
    end
end)

