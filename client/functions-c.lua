function openPedMenu()
    local elements = {}

    if PLAYER_MODELS.dog then
        elements[#elements + 1] = {label = 'PES MENU', value = 'dog_menu'}
    end

    if PLAYER_MODELS.npc then
        elements[#elements + 1] = {label = 'NPC MENU', value = 'npc_menu'}
    end

    if isPlayerADog() and next(ANIMATIONS_DOG) then
        elements[#elements + 1] = {label = 'ANIMACE', value = 'animations'}
    end

    if not PLAYER_MODELS.npc and not PLAYER_MODELS.dog then
        elements[#elements + 1] = {label = 'Nemáš povolenou změnu peda!'}
    end

    createMenu(elements, 'fgspedmenu', 'Výběr peda', 'right', function(data, menu)
        if data.current.value == 'dog_menu' then
            menu.close()
            openPedModelMenu(PED_MODELS.DOG, 'fgspedmenudog')
        elseif data.current.value == 'npc_menu' then
            menu.close()
            openPedModelMenu(PED_MODELS.NPC, 'fgspedmenunpc')
        elseif data.current.value == 'animations' then
            menu.close()
            openDogAnimationMenu()
        end
    end, function(data, menu)
        menu.close()
    end)
end

function openPedModelMenu(models, menuName)
    local elements = {}

    for _, data in pairs(models) do
        elements[#elements + 1] = {
            label = data.LABEL,
            model = data.MODEL
        }
    end

    createMenu(elements, menuName, 'Výběr peda', 'right', function(data)
        setPed(data.current.model)
    end, function(data, menu)
        menu.close()
        openPedMenu()
    end)
end

function openDogAnimationMenu()
    local elements = {
        {label = 'Zrušit animaci', value = 'cancel_animation'}
    }

    for index, data in pairs(ANIMATIONS_DOG) do
        elements[#elements + 1] = {
            value = index,
            label = data.LABEL,
            anim = data.ANIM,
            anim_dict = data.ANIM_DICT
        }
    end

    createMenu(elements, 'fgspedmenudoganims', 'Animace', 'right', function(data, menu)
        local ped = PlayerPedId()

        if data.current.value == 'cancel_animation' then
            ClearPedTasksImmediately(ped)
            isPlayingAnim = false
            return
        end

        if isPlayingAnim then
            ClearPedTasksImmediately(ped)
        end

        playAnim(ped, data.current.anim, data.current.anim_dict)
        isPlayingAnim = true
    end, function(data, menu)
        menu.close()
        openPedMenu()
    end)
end

function isPlayerADog()
    local playerModel = GetEntityModel(PlayerPedId())

    for _, data in pairs(PED_MODELS.DOG) do
        if GetHashKey(data.MODEL) == playerModel then
            return true
        end
    end

    return false
end