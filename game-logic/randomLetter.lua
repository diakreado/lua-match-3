
--[[
randomLetter

  return - one of six letter chosen by random
--]]

return function()
  letterArray = {'A','B','C','D','E','F'}
  math.randomseed(os.clock()*1000000000000)

  local i = math.random(#letterArray)
  return letterArray[i]
end
