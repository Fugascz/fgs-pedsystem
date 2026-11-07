RegisterNetEvent('fgs-pedsystem:playerLoaded', function()
    local playerId = source
    local isAllowed, data = isPlayerAllowed(playerId)
    TriggerClientEvent('fgs-pedsystem:sendPlayerData', playerId, isAllowed, data)
end)