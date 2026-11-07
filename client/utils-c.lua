function closeAllMenus()
	ESX.UI.Menu.CloseAll()
end

function closeMenu(menuName)
	menuName = menuName or nil

	if menuName ~= nil then
		ESX.UI.Menu.Close('default', GetCurrentResourceName(), menuName)
	end
end

function isMenuOpen(menuName)
	menuName = menuName or nil
	if menuName ~= nil then
		return ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), menuName)
	end

	return nil
end

function createMenu(elements, menuName, title, align, cb, cb2)
	elements = elements or {{label = 'NASTAV ELEMENTY!'}}
	menuName = menuName or 'menu-create'
	title = title or 'Název nebyl nastaven'
	align = align or 'top-left'
	cb = cb or nil
	cb2 = cb2 or nil
	closeAllMenus()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), menuName, {
        title = title,
		align = align,
		elements = elements
	}, function(data, menu)
		if cb ~= nil then
			cb(data, menu)
		else
			menu.close()
		end
	end, function(data, menu)
		if cb2 ~= nil then
			cb2(data, menu)
		else
			menu.close()
		end
	end)
end

function setPed(model)
    local modelHash = requestModel(model)
    if not modelHash then
        exports['fgs-notify']:sendNotify('error', 'Ped menu', 'Model peda se nepodařilo načíst.')
        return
    end

    SetPlayerModel(PlayerId(), modelHash)
    local ped = PlayerPedId()
    SetPedComponentVariation(ped, 0, 0, 0, 2)
    SetEntityHealth(ped, GetEntityMaxHealth(ped))
    SetModelAsNoLongerNeeded(modelHash)

    exports['fgs-notify']:sendNotify('success', 'Ped menu', 'Tvůj ped byl změněn.')
end

function requestModel(model)
    local modelHash = type(model) == 'number' and model or GetHashKey(model)
    if not IsModelInCdimage(modelHash) or not IsModelValid(modelHash) then
        return nil
    end

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(0)
    end

    return modelHash
end

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(5)
    end
end

function playAnim(ped, dict, dictAnim)
    loadAnimDict(dict)
    TaskPlayAnim(ped, dict, dictAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
end