
--[[
swapItems

  arg         - feild, which will be changed
              - from, to - points

  return      - void
--]]

return function(feild, from, to)

  if feild[from.y] == nil or feild[to.y] == nil then 
    error('Bad from,to or feild -> feild[from.y] == nil or feild[to.y] == nil' ..
          '-> from.y=' .. from.y .. ' to.y=' .. to.y)
  end

  local tmp = feild[from.y][from.x]
  feild[from.y][from.x] = feild[to.y][to.x]
  feild[to.y][to.x] = tmp
end

