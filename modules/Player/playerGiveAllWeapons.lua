local Weapons = {
  `dagger`,
  `bat`,
  `bottle`,
  `crowbar`,
  `unarmed`,
  `flashlight`,
  `golfclub`,
  `hammer`,
  `hatchet`,
  `knuckle`,
  `knife`,
  `machete`,
  `switchblade`,
  `nightstick`,
  `wrench`,
  `battleaxe`,
  `poolcue`,
  `stone_hatchet`,
  `pistol`,
  `pistol_mk2`,
  `combatpistol`,
  `appistol`,
  `stungun`,
  `pistol50`,
  `snspistol`,
  `snspistol_mk2`,
  `heavypistol`,
  `vintagepistol`,
  `flaregun`,
  `marksmanpistol`,
  `revolver`,
  `revolver_mk2`,
  `doubleaction`,
  `raypistol`,
  `ceramicpistol`,
  `navyrevolver`,
  `microsmg`,
  `smg`,
  `smg_mk2`,
  `assaultsmg`,
  `combatpdw`,
  `machinepistol`,
  `minismg`,
  `raycarbine`,
  `pumpshotgun`,
  `pumpshotgun_mk2`,
  `sawnoffshotgun`,
  `assaultshotgun`,
  `bullpupshotgun`,
  `musket`,
  `heavyshotgun`,
  `dbshotgun`,
  `autoshotgun`,
  `assaultrifle`,
  `assaultrifle_mk2`,
  `carbinerifle`,
  `carbinerifle_mk2`,
  `advancedrifle`,
  `specialcarbine`,
  `specialcarbine_mk2`,
  `bullpuprifle`,
  `bullpuprifle_mk2`,
  `compactrifle`,
  `mg`,
  `combatmg`,
  `combatmg_mk2`,
  `gusenberg`,
  `sniperrifle`,
  `heavysniper`,
  `heavysniper_mk2`,
  `marksmanrifle`,
  `marksmanrifle_mk2`,
  `rpg`,
  `grenadelauncher`,
  `grenadelauncher_smoke`,
  `minigun`,
  `firework`,
  `railgun`,
  `hominglauncher`,
  `compactlauncher`,
  `rayminigun`,
  `grenade`,
  `bzgas`,
  `smokegrenade`,
  `flare`,
  `molotov`,
  `stickybomb`,
  `proxmine`,
  `snowball`,
  `pipebomb`,
  `ball`,
  `petrolcan`,
  `fireextinguisher`,
  `parachute`,
}

Citizen.CreateThread(function()
  ChaosMod.Modules.new("playerGiveWeapons", "Give all Weapons", "Gives the player all weapons.", nil, function()
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      for _, WeaponHash in pairs(Weapons) do
        GiveWeaponToPed(MyPed, WeaponHash, 9999, true, false)
      end
    end
  end)
end)
