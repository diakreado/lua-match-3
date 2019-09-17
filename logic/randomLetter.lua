
--[[
randomLetter

  return - one of six letter chosen by random
--]]


math.randomseed(os.time())

return function()
  local letterArray = {'A','B','C','D','E','F'}

  local i = math.random(#letterArray)
  return letterArray[i]
end
