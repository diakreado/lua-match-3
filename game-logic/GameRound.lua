
local findMatch    = require('GameRound-logic/findMatch')
local findMove     = require('GameRound-logic/findMove')
local randomLetter = require('GameRound-logic/randomLetter')
local swapItems    = require('GameRound-logic/swapItems')
local verifyMove   = require('GameRound-logic/verifyMove')


local GameRound = {} -- class

  GameRound.ySize = 9
  GameRound.xSize = 9
  GameRound.field = {}

  function GameRound:init()
    while (true) do
      for i = 1, GameRound.ySize do
        GameRound.field[i] = {}
        for j = 1, GameRound.xSize do
          GameRound.field[i][j] = randomLetter()
        end
      end
      if #findMatch(GameRound.field) == 0 and #findMove(GameRound.field) ~= nil then
        break
      end
    end
  end

  --[[

    -- удаляет и сдвигает
    -- delete matches
    -- increase score
    -- add new items to the field

  --]]
  function GameRound:tick()

    print(GameRound.ySize)
  end


  --[[
    args - (from, to) are points
            point format - {x, y}
            where x,y are int

    -- делает ход изменяет поле, если никто не против
    -- from - to = 1
    -- after change we get match 3 or more
  --]]
  function GameRound:move(from, to)

    if verifyMove(GameRound.feild, from, to) then  

      swapItems(GameRound.field, from, to)
    end 
    
    return 'lol'
  end

  function GameRound:mix()
    print(GameRound.ySize)
  end

  function GameRound:dump()
    local field = {}
    for i = 1, GameRound.ySize do
      field[i] = {}
      for j = 1, GameRound.xSize do
        field[i][j] = GameRound.field[i][j]
      end
    end
    return field
  end

-- class GameRound

return GameRound