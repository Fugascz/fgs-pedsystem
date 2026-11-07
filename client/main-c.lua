isAllowed = false
isPlayingAnim = false
PLAYER_MODELS = {}
ANIMATIONS_DOG = {}

CreateThread(function()
    TriggerServerEvent('fgs-pedsystem:playerLoaded')
end)

RegisterNetEvent('fgs-pedsystem:sendPlayerData', function(allowed, data)
    isAllowed = allowed

    if allowed then
        PLAYER_MODELS = {
            dog = data.DOG,
            npc = data.NPC
        }
        ANIMATIONS_DOG = DOG_ANIMATIONS
    end
end)

RegisterCommand('pedmenu', function()
    if isAllowed then
        openPedMenu()
    else
        exports['fgs-notify']:sendNotify('error', 'Ped menu', 'Nemáš oprávnění otevřít ped menu!')
    end
end)

if USE_KEYMAPPING then
    RegisterKeyMapping('pedmenu', '~ [PED] Ped Menu ~', 'KEYBOARD', 'F11')
end