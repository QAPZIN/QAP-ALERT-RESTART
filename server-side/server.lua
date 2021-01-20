-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA CONVERTIDO DO vRP 0.5 (VRP) PARA vRP 1.0 (vRPEX)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMANDO 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rrsystem',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local nusers = vRP.getUsers()
        for k,v in pairs(nusers) do
            local nplayer = vRP.getUserSource(parseInt(k))
            if nplayer then
                TriggerClientEvent("chatMessage",nplayer,"[SYSTEM]",{64,64,255}," - ALERTA DE RESTART! DESLOGUE IMEDIATAMENTE!")
                TriggerClientEvent("restarteventclient",nplayer)
            end
        end
     end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- KICK ALL 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("restareventserver") 
AddEventHandler("restareventserver",function()
    local nusers = vRP.getUsers()
    for k,v in pairs(nusers) do
        local nplayer = vRP.getUserSource(parseInt(k))
        if nplayer then
            vRP.kick(nplayer,"[SYSTEM] - O SERVIDOR ACABA DE SER REINICIADO.")
        end
    end
end)
