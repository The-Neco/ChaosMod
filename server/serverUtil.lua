--https://gist.github.com/haggen/2fd643ea9a261fea2094#gistcomment-2339900
local charset = {}  do -- [0-9a-zA-Z]
  for c = 48, 57  do table.insert(charset, string.char(c)) end
  for c = 65, 90  do table.insert(charset, string.char(c)) end
  for c = 97, 122 do table.insert(charset, string.char(c)) end
end

function randomString(length)
  if not length or length <= 0 then return '' end
  math.randomseed(os.clock())
  return randomString(length - 1) .. charset[math.random(1, #charset)]
end
