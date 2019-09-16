
local findMatch             = require('game-logic/findMatch')
local findMove              = require('game-logic/findMove')
local randomLetter          = require('game-logic/randomLetter')
local swapItems             = require('game-logic/swapItems')
local verifyMove            = require('game-logic/verifyMove')
local removeFallAndCreate   = require('game-logic/removeFallAndCreate')


local GameRound = {} -- class

  GameRound.ySize = 9
  GameRound.xSize = 9

  GameRound.score = 0

  GameRound.field = {}


  function GameRound.init(field)

    if field ~= nil then
      GameRound.ySize = #field
      GameRound.xSize = #field[1]
  
      for i = 1, GameRound.ySize do
        GameRound.field[i] = {}
        for j = 1, GameRound.xSize do
          GameRound.field[i][j] = field[i][j]
        end
      end
      return
    end

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
    -- delete matches
    -- increase score
    -- add new items to the field
  --]]
  function GameRound.tick()
    local matches = findMatch(GameRound.field)
    for i = 1, #matches do
      GameRound.score = GameRound.score + matches[i].len - 2
    end

    removeFallAndCreate(GameRound.field, matches)
  end


  --[[
    description - make move if it's possible: 
                        * points 'to' and 'from' are nearby,
                        * items aren't equal,
                        * move leads to match 3

    args        - (const from, const to) are points
                  point format - {x, y}
                  where x,y are int
    
    return      - bool
                    true  - if move was complete
                    false - if move wasn't complete
  --]]
  function GameRound.move(from, to)
    if verifyMove(GameRound.field, from, to) then
      swapItems(GameRound.field, from, to)
      return true
    end 
    return false
  end

  function GameRound.mix()
    math.randomseed( os.time() )
    local t = GameRound.field
    local rand = math.random

    for i = 1, GameRound.xSize * GameRound.ySize do
      local y2 = rand(GameRound.ySize)
      local y1 = rand(GameRound.ySize)
      local x2 = rand(GameRound.xSize)
      local x1 = rand(GameRound.xSize)
      t[y1][x1], t[y2][x2] = t[y2][x2], t[y1][x1]
    end
  end

  function GameRound.dump()
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