
local findMatch             = require('logic.findMatch')
local findMove              = require('logic.findMove')
local randomLetter          = require('logic.randomLetter')
local swapItems             = require('logic.swapItems')
local verifyMove            = require('logic.verifyMove')
local removeFallAndFill     = require('logic.removeFallAndFill')

math.randomseed(os.time())

local GameRound = {} -- class

  GameRound.ySize = 9
  GameRound.xSize = 9
  GameRound.score = 0

  GameRound.field = {}


  --[[
    description - initialize field by arg or
                  random items if arg doesn't exist

    arg         - (const field) 2d array (rectangle) - use for initialize field
                - void - then use xSize, ySize and random values

    return      - void
  --]]
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
      while(GameRound.tick()) do end
      if #findMatch(GameRound.field) == 0 and findMove(GameRound.field) ~= nil then
        break
      end
    end

    GameRound.score = 0
  end

  --[[
    description - remove the matched items, move items down
                      and fill void by random created items,
                      increase score
    
    return      - bool
                    true  - if tick has result
                    false - if not
  --]]
  function GameRound.tick()
    local matches = findMatch(GameRound.field)

    if #matches == 0 then return false end

    for i = 1, #matches do
      GameRound.score = GameRound.score + matches[i].len - 2
    end
    
    removeFallAndFill(GameRound.field, matches)
    return true
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
    if from.x < 1 or to.x < 1 or
       from.y < 1 or to.y < 1 or
       from.x > GameRound.xSize or to.x > GameRound.xSize or
       from.y > GameRound.ySize or to.y > GameRound.ySize then
      return false
    end
    if verifyMove(GameRound.field, from, to) then
      swapItems(GameRound.field, from, to)
      return true
    end 
    return false
  end

  --[[
    description - work only if possible move isn't exist
    
    return      - possible move or
                  nil if mix success
  --]]
  function GameRound.mix()
    local possibleMove = findMove(GameRound.field)

    if possibleMove ~= nil then
      return possibleMove
    else

      local t = GameRound.field
      local rand = math.random

      while(true) do
        for i = 1, GameRound.ySize do
          for j = 1, GameRound.xSize do
            local y = rand(GameRound.ySize)
            local x = rand(GameRound.xSize)
            t[i][j], t[y][x] = t[y][x], t[i][j]          
          end
        end
        if #findMatch(GameRound.field) == 0 and findMove(GameRound.field) ~= nil then
          break
        end
      end
      return nil
    end
  end

  --[[    
    return      - copied game field
  --]]
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