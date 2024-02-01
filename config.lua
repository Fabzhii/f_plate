Config = {}

Config.Notify = {
    {'Du bist in keinem Fahrzeug.', 'error'},
    {'Ein Fahrzeug mit diesem Kennzeichen existiert bereits.', 'error'},
    {'Du kannst das Kennzeichen erfolgreich geändert!', 'success'},
}

Config.Menu = {
    header = 'Kennzeichen',
    text = 'Kennzeichen Text',
    description = 'Maximal 9 Zeichen',
}

Config.Notifcation = function(notify)
    local message = notify[1]
    local notify_type = notify[2]
    lib.notify({
        position = 'top-right',
        description = message,
        type = notify_type,
    })
end 
