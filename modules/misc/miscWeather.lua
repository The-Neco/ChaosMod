function setWeather(type)
  SetOverrideWeather(type)
  ClearWeatherTypePersist(type)
  SetWeatherTypePersist(type)
end

Citizen.CreateThread(function()
  ChaosMod.Modules.new("weatherExtraSunny", "Extra Sunny", "Sets the weather to extra sunny.", function()
    
    setWeather("EXTRASUNNY")
  end, nil)

  ChaosMod.Modules.new("weatherThunder", "Thunder", "Sets the weather to thunder.", function()
    setWeather("THUNDER")
  end, nil)

  ChaosMod.Modules.new("weatherFoggy", "Foggy", "Sets the weather to foggy.", function()
    setWeather("FOGGY")
  end, nil)

  ChaosMod.Modules.new("weatherNeutral", "Neutral", "Sets the weather to neutral.", function()
    setWeather("NEUTRAL")
  end, nil)

  ChaosMod.Modules.new("weatherXMAS", "XMAS", "Sets the weather to XMAS.", function()
    setWeather("XMAS")
  end, nil)

  local weathers = {"CLEAR", "EXTRASUNNY" , "CLOUDS", "OVERCAST", "RAIN", "CLEARING", "THUNDER", "SMOG", "FOGGY", "XMAS", "SNOWLIGHT", "BLIZZARD"}

  ChaosMod.Modules.new("weatherRandom", "Random Weather", "Changes the weather randomly.", function()
    local randomWeather = true
    setWeather(weathers[math.random(1, #weathers)])
    Citizen.CreateThread(function()
      while randomWeather do
        Citizen.Wait(math.random(1000,3000))
        setWeather(weathers[math.random(1, #weathers)])
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    randomWeather = false
  end, nil)


end)
