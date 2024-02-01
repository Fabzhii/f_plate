
local ox_inventory = exports.ox_inventory

RegisterServerEvent('fplate:updatePlate')
AddEventHandler('fplate:updatePlate', function(oldPlate, newPlate)
    MySQL.Async.execute('UPDATE owned_vehicles SET plate = @newplate WHERE plate = @oldplate', {
        ['@newplate']  = newPlate,
        ['@oldplate'] = oldPlate,
    })
    exports.ox_inventory:RemoveItem(source, 'plate', 1, nil)
end)

ESX.RegisterServerCallback('fplate:isPlateTaken', function(source, cb, plate)
	MySQL.scalar('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate},
	function(result)
		cb(result ~= nil)
	end)
end)