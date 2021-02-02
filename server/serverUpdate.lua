ChaosMod.VersionFile = LoadResourceFile(GetCurrentResourceName(), "version.json")
ChaosMod.Version = json.decode(ChaosMod.VersionFile).version

PerformHttpRequest("https://raw.githubusercontent.com/The-Neco/ChaosMod/master/version.json", function (errorCode, resultData, resultHeaders)
  print("^1==================================================================================\n^5[^1ChaosMod^5]^7 Checking if ^1ChaosMod^7 is up to date")
  if resultData ~= nil then
    local data = json.decode(resultData)
    if ChaosMod.Version ~= data.version and ChaosMod.Version < data.version then
      print("^5[^1ChaosMod^5] ^8WARNING: ^1ChaosMod ^7is not up to date.\nYou are currently using ^8" .. ChaosMod.Version .. "^7 the latest version is ^2" .. data.version .. ".\n^7Please download the latest version from https://github.com/The-Neco/ChaosMod/releases")
    else
      if ChaosMod.Version > data.version then
        print("^5[^1ChaosMod^5] ^8WARNING: ^7You are using a pre-release version of ^1ChaosMod ^7there may be bugs.")
      else
        print("^5[^1ChaosMod^5] ^1ChaosMod ^7is up to date.")
      end
    end
  else
    print("^5[^1ChaosMod^5] ^7Failed to check if ^1ChaosMod ^7is up to date.")
  end
  print("^1==================================================================================^7")
end)
