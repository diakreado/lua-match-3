local lib = require "./game-logic/GameRound"
findMatch = require('game-logic/findMatch')
findMove = require('game-logic/findMove')

lib.init()

function drawField(field)
  io.write('    ')
  for i = 1, #field[1] do
    io.write(i .. ' ')
  end
  io.write('\n  ')
  for i = 1, #field[1] do
    io.write('--')
  end
  io.write('-\n')
  for i = 1, #field do
    io.write(i .. ' | ')
    for j = 1, #field[i] do
      io.write(field[i][j] .. ' ')
    end
    io.write('\n')
  end
end

local field = lib.dump()

drawField(field)
print()
