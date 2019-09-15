local Game = {
  n = 10,
  m = 10,
  field = {}
}

local function getRandomLetter()
  letterArray = {'A','B','C','D','E','F'}
  math.randomseed(os.clock()*1000000000000)

  local i = math.random(#letterArray)
  return letterArray[i]
end

function Game.findMove()
  local isMovePossible = false

  -- check horizontal line
  for i = 1, Game.n do
    for j = 1, Game.m do
      if Game.field[i][j] == Game.field[i][j+1] then
        isMovePossible =        
        Game.field[i][j] == Game.field[i][j-2] or
        Game.field[i][j] == Game.field[i][j+3] or

        Game.field[i-1] ~= nil and
        (Game.field[i][j] == Game.field[i-1][j-1] or Game.field[i][j] == Game.field[i-1][j+2]) or

        Game.field[i+1] ~= nil and
        (Game.field[i][j] == Game.field[i+1][j-1] or Game.field[i][j] == Game.field[i+1][j+2])
      end

      if not isMovePossible and Game.field[i][j] == Game.field[i][j + 2] then
        isMovePossible =
        Game.field[i-1] ~= nil and Game.field[i][j] == Game.field[i-1][j+1] or
        Game.field[i+1] ~= nil and Game.field[i][j] == Game.field[i+1][j+1]
      end
      if isMovePossible then return true end
    end
    if isMovePossible then return true end
  end

  -- check vertical line
  for i = 1, Game.m do
    for j = 1, Game.n do
      if Game.field[j+1] ~= nil and Game.field[j][i] == Game.field[j+1][i] then
        isMovePossible =        
        Game.field[j-2][i] ~= nil and Game.field[j][i] == Game.field[j-2][i] or 
        Game.field[j+3][i] ~= nil and Game.field[j][i] == Game.field[j+3][i] or

        Game.field[j-1] ~= nil and
        (Game.field[j][i] == Game.field[j-1][i-1] or Game.field[j][i] == Game.field[j-1][i+1]) or

        Game.field[j+2] ~= nil and
        (Game.field[j][i] == Game.field[j+2][i-1] or Game.field[j][i] == Game.field[j+2][i+1])
      end

      if not isMovePossible and Game.field[j+2] ~= nil and Game.field[j][i] == Game.field[j+2][i] then
        isMovePossible =
        Game.field[j][i] == Game.field[j+1][i-1] or
        Game.field[j][i] == Game.field[j+1][i+1]
      end
      if isMovePossible then return true end
    end
    if isMovePossible then return true end
  end

  return false
end

function Game:init()
  for i= 1, Game.n do
    Game.field[i] = {}
    for j= 1, Game.m do
      Game.field[i][j] = getRandomLetter()
    end
  end
end

function Game:tick()
  print(Game.n)
end

function Game:move(from, to)
  print(Game.n)
end

function Game:mix()
  print(Game.n)
end

function Game:dump()
  local field = {}
  for i= 1, Game.n do
    field[i] = {}
    for j= 1, Game.m do
      field[i][j] = Game.field[i][j]
    end
  end
  return field
end

return Game