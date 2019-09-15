
--[[
findMatch

  description - find matches in the field (2d array)
                matches - 3 or more same items in line

  arg         - field (2d array) in rectangular form

  return      - table with matches
                example - {
                  {orientation = 'h', x = 10, y = 8, len = 3}
                  {orientation = 'v', x = 6,  y = 2, len = 4}
                }
                where:
                  * orientation: 'h' - horizontal, 'v' - vertical
                  * x,y - coordinate of start matching point
                          x - horizontal, y - vertical
                          coordinate start from 1
                  * len - length of match
--]]
return function(field)
  local lines = {}

  if #field < 1 then return lines end

  local ySize = #field
  local xSize = #field[1]

  -- check horizontal line
  for i = 1, ySize do
    local j = 1
    while j <= xSize do
      if field[i][j] == field[i][j + 1] and field[i][j] == field[i][j + 2] then
        local k = j + 1
        while field[i][j] == field[i][k] do
          k = k + 1
        end
        lines[#lines + 1] = { orientation = 'h', x = j, y = i, len = k-j }
        j = k
      end 
      j = j + 1
    end
  end

  -- check vertical line
  for i = 1, xSize do
    local j = 1
    while j <= ySize do
      if field[j + 1] ~= nil and 
         field[j][i] == field[j + 1][i] and
         field[j + 2] ~= nil and 
         field[j][i] == field[j + 2][i] then
        local k = j + 1
        while field[k] ~= nil and field[j][i] == field[k][i] do
          k = k + 1
        end
        lines[#lines + 1] = { orientation = 'v', x = i, y = j, len = k-j }
        j = k
      end 
      j = j + 1
    end
  end

  return lines
end
