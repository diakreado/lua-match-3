local lib = require('game-logic/GameRound')

lib.init({
  {'A','B','F','A'},
  {'A','D','B','E'},
  {'D','B','C','A'},
  {'D','B','B','A'}
})
 
local function drawField(field)
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


drawField(lib.dump())
print()

