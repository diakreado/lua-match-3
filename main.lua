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

-- lib.move( { x=2, y=2 }, { x=1, y=2 } )

-- drawField(lib.dump())
-- print()

-- lib.tick()

-- drawField(lib.dump())
-- print()

-- lib.move( { x=2, y=2 }, { x=3, y=2 } )

-- drawField(lib.dump())
-- print()

-- lib.tick()

drawField(lib.dump())
print()

lib.mix()

drawField(lib.dump())
print()


