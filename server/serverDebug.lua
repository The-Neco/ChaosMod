function DebugPrint(...)
  SetConvarReplicated("chaosmod_debug", GetConvar("chaosmod_debug", "false"))
  if GetConvar("chaosmod_debug", "false") == "true" then
    local args = {...}
    local message = table.concat(args, "   ")
    print("^5[^1ChaosMod^5] ^3DEBUG: " .. message .. "^0")
  end
end
