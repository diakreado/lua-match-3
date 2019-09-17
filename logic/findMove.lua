
--[[
findMove

  description - find move in the field (2d array)
                move - possible action for player

  arg         - const field (2d array) in rectangular form

  return      - point, which may be use for move
                output - {
                  x,y - coordinate of the point
                        x - horizontal, y - vertical
                        coordinate start from 1
                  nil - if point or arg isn't exist
                }
--]]

return function(field)

  if field == nil then return nil end
  if #field < 1 then return nil end

  local ySize = #field
  local xSize = #field[1]

  -- check horizontal line
  for i = 1, ySize do
    for j = 1, xSize do
      -- find nearby items 
      if field[i][j] == field[i][j+1] then

        if field[i][j] == field[i][j-2] then
          return { x = j-2,  y = i }
        end

        if field[i][j] == field[i][j+3] then
          return { x = j+3,  y = i }
        end

        if field[i-1] ~= nil then
          if field[i][j] == field[i-1][j-1] then
            return { x = j-1,  y = i-1 }
          end
          if field[i][j] == field[i-1][j+2] then
            return { x = j+2,  y = i-1 }
          end
        end

        if field[i+1] ~= nil then
          if field[i][j] == field[i+1][j-1] then
            return { x = j-1,  y = i+1 }
          end
          if field[i][j] == field[i+1][j+2] then
            return { x = j+2,  y = i+1 }
          end
        end
      end

      -- find separated items
      if field[i][j] == field[i][j + 2] then

        if field[i-1] ~= nil and field[i][j] == field[i-1][j+1] then
          return { x = j+1,  y = i-1 }
        end

        if field[i+1] ~= nil and field[i][j] == field[i+1][j+1] then
          return { x = j+1,  y = i-1 }
        end        
      end
    end
  end

  -- check vertical line
  for i = 1, xSize do
    for j = 1, ySize do
      -- find nearby items 
      if field[j+1] ~= nil and field[j][i] == field[j+1][i] then

        if field[j-2] ~= nil and field[j][i] == field[j-2][i] then
          return { x = i,  y = j-2 }
        end

        if field[j+3] ~= nil and field[j][i] == field[j+3][i] then
          return { x = i,  y = j+3 }
        end

        if field[j-1] ~= nil then
          if field[j][i] == field[j-1][i-1] then
            return { x = i-1,  y = j-1 }
          end
          if field[j][i] == field[j-1][i+1] then
            return { x = i-1,  y = j+1 }
          end
        end

        if field[j+2] ~= nil then
          if field[i][j] == field[j+2][i-1] then
            return { x = i-1,  y = j+2 }
          end
          if field[i][j] == field[j+2][i+1] then
            return { x = i+1,  y = j+2 }
          end
        end
      end

      -- find separated items
      if field[j+2] ~= nil and field[j][i] == field[j+2][i] then

        if field[j][i] == field[j+1][i-1] then
          return { x = i-1,  y = j+1 }
        end

        if field[j][i] == field[j+1][i+1] then
          return { x = i+1,  y = j+1 }
        end
      end
    end
  end

  return nil
end