Citizen.CreateThread(function()
  local airstrikeHash = `WEAPON_AIRSTRIKE_ROCKET`

  function getRandomOffsetCoord(startCoord, maxOffset)
    return vec3(startCoord.x + math.random(-maxOffset, maxOffset), startCoord.y + math.random(-maxOffset, maxOffset), startCoord.z + math.random(-maxOffset, maxOffset))
  end

  ChaosMod.Modules.new("miscAirstrike", "Airstrike", "ENEMY AC130 ABOVE.", function()
    RequestWeaponAsset(airstrikeHash, 31, 0)
    while not HasWeaponAssetLoaded(airstrikeHash) do
      Citizen.Wait(0)
    end
    local airstrike = true
    Citizen.CreateThread(function()
      while airstrike do
        Citizen.Wait(1000)
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local startPosition = getRandomOffsetCoord(myCoords, 10)
  		  local targetPosition = getRandomOffsetCoord(myCoords, 50)
        local groundZ = GetGroundZFor_3dCoord(targetPosition.x, targetPosition.y, targetPosition.z)
        if groundZ then
          ShootSingleBulletBetweenCoords(startPosition.x, startPosition.y, startPosition.z + 200, targetPosition.x, targetPosition.y, groundZ, 200, true, airstrikeHash, 0, true, false, 5000)
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    airstrike = false
    RemoveWeaponAsset(airstrikeHash)
  end, nil)
end)
