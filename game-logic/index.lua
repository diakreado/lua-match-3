
local findMatch = require('game-logic/findMatch')
local findMove = require('game-logic/findMove')

local function getRandomLetter()
  letterArray = {'A','B','C','D','E','F'}
  math.randomseed(os.clock()*1000000000000)

  local i = math.random(#letterArray)
  return letterArray[i]
end

local Game = {} -- class

  Game.n = 10
  Game.m = 10
  Game.field = {}

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

-- class Game

return Game