
local findMatch             = require('logic/findMatch')
local findMove              = require('logic/findMove')
local randomLetter          = require('logic/randomLetter')
local swapItems             = require('logic/swapItems')
local verifyMove            = require('logic/verifyMove')
local removeFallAndCreate   = require('logic/removeFallAndCreate')

math.randomseed(os.time())

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
    local t = GameRound.field
    local rand = math.random

    for i = 1, GameRound.ySize do
      for j = 1, GameRound.xSize do
        local y = rand(GameRound.ySize)
        local x = rand(GameRound.xSize)
        t[i][j], t[y][x] = t[y][x], t[i][j]          
      end
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