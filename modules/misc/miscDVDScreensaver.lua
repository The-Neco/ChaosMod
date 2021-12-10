Citizen.CreateThread(function()

  local SPEED = 0.003;
  ChaosMod.Modules.new("miscDVD", "DVD Screensaver", "Puts a DVD screensaver on your screen.", function()
    local screenresx, screenresy = GetActiveScreenResolution()
  	local boxHeight = 0.45
  	local boxWidth = boxHeight * (screenresy / screenresx)
  	local offsetX = 0
  	local offsetY = 0
  	local goingDown = true
  	local goingRight = true
    local speed = 0.003
    local DVD = true
    Citizen.CreateThread(function()
      while DVD do
        Citizen.Wait(0)
        if goingRight then
          offsetX = offsetX + speed
          if offsetX + boxWidth >= 1 then
            goingRight = false
          end
        else
          offsetX = offsetX - speed
          if offsetX <= 0 then
            goingRight = true
          end
        end
        if goingDown then
          offsetY = offsetY + speed
          if offsetY + boxHeight >= 1 then
            goingDown = false
          end
        else
          offsetY = offsetY - speed
          if offsetY <= 0 then
            goingDown = true

          end
        end
        DrawRect(0.5, offsetY / 2, 1.0, offsetY, 0, 0, 0, 255) -- TOP BAR
        local lowerHeight = (1 - offsetY - boxHeight)
        DrawRect(0.5, 1 - (lowerHeight / 2), 1.0, lowerHeight,  0, 0, 0, 255) -- Bottom bar
        DrawRect(offsetX / 2, 0.5, offsetX, 1.0, 0, 0, 0, 255) -- left bar
	      local rightWidth = (1 - offsetX - boxWidth);
	      DrawRect(1 - (rightWidth / 2), 0.5, rightWidth, 1.0, 0, 0, 0, 255) -- right bar
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    DVD = false
  end, nil)
end)
