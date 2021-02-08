Citizen.CreateThread(function()
  ChaosMod.Modules.new("playerPoof", "Deadly Aim", "Gives the player deadly aim.", function()
    local playerPoof = true
    Citizen.CreateThread(function()
      while playerPoof do
        Citizen.Wait(0)
        local isAimingAtEntity, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
        if isAimingAtEntity then
          if (IsEntityAPed(entity) or IsEntityAVehicle(entity)) and not IsEntityDead(entity) then
            local Coords = GetEntityCoords(entity)
            SetEntityHealth(entity, 0)
            SetEntityInvincible(entity, false)
            AddExplosion(Coords, 9, 100.0, true, false, 3.0, false)
          end
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    playerPoof = false

  end, nil)
end)
