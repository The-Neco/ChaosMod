Citizen.CreateThread(function()
    ChaosMod.Modules.new("miscOrangeBall", "Spawn orange ball", "Where did that come from?", function()
        local ballHash = `prop_juicestand`
        local weaponHash = `weapon_specialcarbine`
        local minDistance = 2
        local maxDistance = 7
        local maxSpeedCheck = 40
        local player = PlayerPedId()
        local pos = GetEntityCoords(player)
        local playerSpeed = math.min(math.max(0, GetEntitySpeed(player)), maxSpeedCheck)
        local fixedDistance = ((playerSpeed / maxSpeedCheck) * (maxDistance - minDistance)) + minDistance
        local spawnPos = GetOffsetFromEntityInWorldCoords(player, 0, fixedDistance, 0)
        local ball = CreateObject(ballHash, spawnPos.xy, spawnPos.z - 0.2, true, true, false)
        local weight = math.random(1, 100) + 0.0
        SetObjectPhysicsParams(ball, weight, 1.0, 1.0, 0.0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0)
        local min, max = GetModelDimensions(ballHash)
        ShootSingleBulletBetweenCoords(spawnPos.x, spawnPos.y, spawnPos.z + max.z - min.z, spawnPos.x, spawnPos.y, spawnPos.z, 0, true, weaponHash, 0, false, true, 0.01)
        Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
        DeleteEntity(ball)
    end, nil)
  end)
  