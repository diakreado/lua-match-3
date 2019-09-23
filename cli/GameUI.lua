local logic = require('logic.GameRound')
local drawField = require('cli.drawField')

GameUI = {} -- class

  GameUI.xSize = 9
  GameUI.ySize = 9

  function GameUI.init(xSize, ySize)
    logic.xSize = xSize
    logic.ySize = ySize
    logic.init()

    GameUI.xSize = xSize
    GameUI.ySize = ySize
  end

  function GameUI.start()
    while(true) do
      drawField(logic.dump(), logic.score)
      io.write('\n->  ')
      io.flush()
      local answer = io.read()
      local command = {}
      for s in answer:gmatch('%w*') do
        table.insert(command, s)
      end
      if #command > 3 and (command[1] == 'm' or command[1] == 'mv' or command[1] == 'move') then
        local y   = tonumber(command[2])
        local x   = tonumber(command[3])
        local dir = command[4]
        if x ~= nil and y ~= nil and
           (dir == 'r' or dir == 'l' or dir == 'u' or dir == 'd') then
          GameUI.move(x,y,dir)
        else
          io.write(' m\\mv\\move y x [r,l,u,d] - move (coordinate y,x) (right, left, up, down)\n')
          io.flush()
        end
      elseif #command > 0 and (command[1] == 't' or command[1] == 'tick') then
        GameUI.tick()
      elseif #command > 0 and (command[1] == 'mx' or command[1] == 'mix') then
        GameUI.mix()
      elseif #command > 0 and (command[1] == 'q' or command[1] == 'quit') then
        break
      else
        GameUI.help()
      end
    end
  end

  function GameUI.move(x,y,dir)
    if x < 1 or y < 1 or x > GameUI.xSize or y > GameUI.ySize then
      io.write(' X shoud be [1:' .. GameUI.xSize .. ']\n')
      io.write(' Y shoud be [1:' .. GameUI.ySize .. ']\n')
      io.flush()
      return
    end

    local secondPoint = {}
    if dir == 'r' then
      secondPoint = { x = x+1, y = y }
    elseif dir == 'l' then
      secondPoint = { x = x-1, y = y }
    elseif dir == 'u' then
      secondPoint = { x = x, y = y-1 }
    elseif dir == 'd' then
      secondPoint = { x = x, y = y+1 }
    else
      io.write('Incorrect input data!\n')
      io.flush()
    end

    local suc = logic.move({ x=x, y=y }, secondPoint)
    print(suc)
    while(logic.tick()) do end
  end

  function GameUI.mix()
    local move = logic.mix()
    if move == nil then
      print(true)
    else
      print(false)
    end
  end

  function GameUI.help()
    io.write('\n Available commands are:\n')
    io.write('    m\\mv\\move y x [r,l,u,d] - move (coordinate y,x) (right, left, up, down)\n')
    io.write('    mx\\mix\n')
    io.write('    q\\quit\n')
    io.flush()
  end

-- class GameUI

return GameUI