
--[[

--]]

local randomLetter = require('game-logic/randomLetter')

local function removeItems(field, matches)
  for i = 1, #matches do
    local len = matches[i].len
    local x   = matches[i].x
    local y   = matches[i].y
    if matches[i].orientation == 'h' then
      for j = 0, len-1 do
        field[y][x+j] = '0'
      end
    end
    if matches[i].orientation == 'v' then
      for j = 0, len-1 do
        if field[y+j] ~= nil then
          field[y+j][x] = '0'
        end
      end
    end
  end
end

local function fallItems(field)
  local ySize = #field
  local xSize = #field[1]
  for j = 1, xSize do
    for i = ySize, 1, -1 do
      if field[i][j] ~= '0' then
        local k = i + 1
        while(field[k] ~= nil and field[k][j] == '0') do
          field[k][j] = field[k-1][j]
          field[k-1][j] = '0'
          k = k + 1
        end
      end
    end
  end
end

local function createNewItems(field)
  local ySize = #field
  local xSize = #field[1]
  for i = 1, ySize do
    for j = 1, xSize do
      if field[i][j] == '0' then
        field[i][j] = randomLetter()
      end
    end
  end
end

return function(field, matches)
  removeItems(field, matches)
  fallItems(field)
  createNewItems(field)
end