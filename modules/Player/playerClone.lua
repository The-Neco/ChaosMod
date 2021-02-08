Citizen.CreateThread(function()
  ChaosMod.Modules.new("clonePlayer", "Clone Player", "Makes an evil (or maybe not so evil) twin of yourself.", function()

    local friendly = math.random(0,1)
    local RelationshipGroup = `_COMPANION_CLONE_FRIENDLY`
    
    if friendly == 1 then
      AddRelationshipGroup("_COMPANION_CLONE_FRIENDLY", groupHash)
      SetRelationshipBetweenGroups(0, RelationshipGroup, `PLAYER`)
      SetRelationshipBetweenGroups(0, `PLAYER`, RelationshipGroup)
    else
      AddRelationshipGroup("_COMPANION_CLONE_FRIENDLY", groupHash)
      SetRelationshipBetweenGroups(5, RelationshipGroup, `PLAYER`)
      SetRelationshipBetweenGroups(5, `PLAYER`, RelationshipGroup)
    end

    local MyPed = PlayerPedId()
    local NewPed = ClonePed(MyPed, GetEntityHeading(MyPed), true, false)
    if IsPedInAnyVehicle(MyPed, false) then
      SetPedIntoVehicle(NewPed, GetVehiclePedIsIn(MyPed, false), -2)
    end
    SetPedSuffersCriticalHits(NewPed, false)
    SetPedHearingRange(NewPed, 9999.0)
    SetPedConfigFlag(NewPed, 281, true)
    SetPedCanRagdollFromPlayerImpact(NewPed, false)
    SetPedRagdollBlockingFlags(NewPed, 5)

    SetPedRelationshipGroupHash(NewPed, RelationshipGroup)

    if friendly == 1 then
      SetPedAsGroupMember(NewPed, GetPlayerGroup(PlayerId()))
    end

    SetPedCombatAttributes(NewPed, 5, true)
    SetPedCombatAttributes(NewPed, 46, true)

    GiveWeaponToPed(NewPed, GetSelectedPedWeapon(MyPed), 9999, true, true)

    SetPedAccuracy(NewPed, 100)
    SetPedFiringPattern(NewPed, 0xC6EE6B4C)
  end, nil)
end)
