
local localkeys = {}

exports('use', function()
    if IsPedInAnyVehicle(PlayerPedId()) then 
        local input = lib.inputDialog(Config.Menu.header, {
            {type = 'input', label = Config.Menu.text, description = Config.Menu.description, required = true, min = 3, max = 9},
        })
        if input ~= nil then 
            text = string.upper(input[1])
            ESX.TriggerServerCallback('fplate:isPlateTaken', function(xTaken)
                if xTaken then 
                    Config.Notifcation(Config.Notify[2])
                else    

                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    local oldplate = ESX.Game.GetVehicleProperties(vehicle).plate

                    Config.Notifcation(Config.Notify[3])
                    SetVehicleNumberPlateText(vehicle, text)


                    TriggerServerEvent('fplate:updatePlate', oldplate, text)
                end 
            end, text)
        end 
    else 
        Config.Notifcation(Config.Notify[1])
    end 
end)