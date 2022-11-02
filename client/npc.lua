-- funtions
function SET_PED_RELATIONSHIP_GROUP_HASH ( iVar0, iParam0 )
    return Citizen.InvokeNative( 0xC80A74AC829DDD92, iVar0, _GET_DEFAULT_RELATIONSHIP_GROUP_HASH( iParam0 ) )
end

function _GET_DEFAULT_RELATIONSHIP_GROUP_HASH ( iParam0 )
    return Citizen.InvokeNative( 0x3CC4A718C258BDD0 , iParam0 );
end

function modelrequest( model )
    Citizen.CreateThread(function()
        RequestModel( model )
    end)
end

-- load NPCs
Citizen.CreateThread(function()
    for z, x in pairs(Config.AmbNpc) do
    while not HasModelLoaded( GetHashKey(Config.AmbNpc[z]["Model"]) ) do
        Wait(500)
        modelrequest( GetHashKey(Config.AmbNpc[z]["Model"]) )
    end
    local npcamb = CreatePed(GetHashKey(Config.AmbNpc[z]["Model"]), Config.AmbNpc[z]["Pos"].x, Config.AmbNpc[z]["Pos"].y, Config.AmbNpc[z]["Pos"].z, Config.AmbNpc[z]["Heading"], false, false, 0, 0)
    while not DoesEntityExist(npcamb) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npcamb, true)
    FreezeEntityPosition(npcamb, false) -- set to true id you dont want them to run away.
    SetEntityInvincible(npcamb, true)
    TaskStandStill(npcamb, -1)
    Wait(100)
    SET_PED_RELATIONSHIP_GROUP_HASH(npcamb, GetHashKey(Config.AmbNpc[z]["Model"]))
    SetEntityCanBeDamagedByRelationshipGroup(npcamb, false, `PLAYER`)
    SetEntityAsMissionEntity(npcamb, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(Config.AmbNpc[z]["Model"]))
    end
end)