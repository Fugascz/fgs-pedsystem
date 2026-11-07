function isPlayerAllowed(id)
    local steamid, license = getidentifiers(id)
    for playerIndex, playerData in pairs(ALLOWED_USERS) do
        if playerData.PLAYER_IDENTIFIER == steamid or playerData.PLAYER_IDENTIFIER == license then
            return true, playerData.ALLOWED_PEDS
        end
    end
    return false, nil
end

function getidentifiers(player)
    if player == 0 then
        return
    end

    local steamid = 'Not Linked'
    local license = 'Not Linked'

    for _, v in pairs(GetPlayerIdentifiers(player)) do
        if string.sub(v, 1, string.len('steam:')) == 'steam:' then
            steamid = v
        elseif string.sub(v, 1, string.len('license:')) == 'license:' then
            license = v
        end
    end

    return steamid, license
end