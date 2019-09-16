
--[[
verifyMove

  description - check if points 'to' and 'from' are nearby,
                         items aren't equal,
                         move leads to match 3

  args        - const field (2d array)

  return      - bool
                  true  - if move is possible
                  false - if move isn't possible
--]]

local checkPossibleMatch = function(field, from, to)
  local fromValue = field[from.y][from.x]
  
  return  (( from.y ~= (to.y+1) and field[to.y+1] ~= nil and fromValue == field[to.y+1][to.x] and 
              ( from.y ~= (to.y+2) and field[to.y+2] ~= nil and fromValue == field[to.y+2][to.x] or
                from.y ~= (to.y-1) and field[to.y-1] ~= nil and fromValue == field[to.y-1][to.x] )
          ) or
          ( from.y ~= (to.y-1) and field[to.y-1] ~= nil and fromValue == field[to.y-1][to.x] and 
              ( from.y ~= (to.y+1) and field[to.y+1] ~= nil and fromValue == field[to.y+1][to.x] or
                from.y ~= (to.y-2) and field[to.y-2] ~= nil and fromValue == field[to.y-2][to.x] )
          ) or
          ( from.x ~= (to.x+1) and fromValue == field[to.y][to.x+1] and 
              ( from.x ~= (to.x+2) and  fromValue == field[to.y][to.x+2] or
                from.x ~= (to.x-1) and fromValue == field[to.y][to.x-1] )
          ) or
          ( from.x ~= (to.x-1) and fromValue == field[to.y][to.x-1] and 
              ( from.x ~= (to.x+1) and fromValue == field[to.y][to.x+1] or
                from.x ~= (to.x-2) and fromValue == field[to.y][to.x-2] )
          ))
end


return function(field, from, to) 
  local fromValue = field[from.y][from.x]
  
  return  -- check not equal
          ( fromValue ~= field[to.y][to.x] ) and 

          -- check that points are nearby
          ( math.abs(from.x - to.x) == 1 and from.y == to.y or
            math.abs(from.y - to.y) == 1 and from.x == to.x )   and

          -- check move leads to match 3
          ( checkPossibleMatch(field, from, to) or
            checkPossibleMatch(field, to, from) )

end
