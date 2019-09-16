
local findMatch    = require('game-logic/findMatch')
local findMove     = require('game-logic/findMove')
local randomLetter = require('game-logic/randomLetter')
local swapItems    = require('game-logic/swapItems')
local verifyMove   = require('game-logic/verifyMove')


local GameRound = {} -- class

  GameRound.ySize = 9
  GameRound.xSize = 9
  GameRound.field = {}

  function GameRound.lol(arg1)
    print(arg1)
    print(arg1)
  end

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

    -- удаляет и сдвигает
    -- delete matches
    -- increase score
    -- add new items to the field

  --]]
  function GameRound.tick()

    local matches = findMatch(GameRound.field)

    for i = 1, #matches do
      print(matches[i].orientation, matches[i].x, matches[i].y, matches[i].len)
    end

    print(GameRound.ySize)
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
    print(GameRound.ySize)
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