-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA CONVERTIDO DO vRP 0.5 (VRP) PARA vRP 1.0 (vRPEX)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES QUE APARECEM NA TELA
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("restarteventclient")   
AddEventHandler("restarteventclient",function() 
    Wait(0)
    announcestring = "~p~60 SEGUNDOS"
    Wait(5000)
    announcestring = false
    Wait(30000)
    announcestring = "~p~30 SEGUNDOS"
    Wait(5000)
    announcestring = false
    Wait(15000)
    announcestring = "~p~15 SEGUNDOS"
    Wait(5000)
    announcestring = false
    Wait(5000)
    announcestring = "~p~10 SEGUNDOS"
    Wait(5000)
    announcestring = false
    Wait(5000)
    announcestring = "~p~5 SEGUNDOS"
    Wait(5000)
    announcestring = false
    Wait(5000)
    announcestring = "~p~REINICIANDO!!"
    Wait(5000)
    announcestring = false
    TriggerServerEvent("restareventserver") 
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES DO TEXTO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(1)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieFunctionParameterString("~b~ALERTA DE RESTART~w~")
    PushScaleformMovieFunctionParameterString(announcestring)
	PopScaleformMovieFunctionVoid()
    return scaleform
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local timeDistance = 750
        if announcestring then 
            timeDistance = 1     
            scaleform = Initialize("mp_big_message_freemode")
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        end
        Citizen.Wait(timeDistance)
    end
end)
