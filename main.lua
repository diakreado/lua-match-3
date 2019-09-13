local lib = require "./lib/api"

lib.init()

function drawField(field)
  io.write('   ')
  for i = 1, #field do
    io.write(i - 1 .. ' ')
  end
  io.write('\n  ')
  for i = 1, #field do
    io.write('--')
  end
  io.write('\n')
  for i = 1, 10 do
    io.write(i - 1 .. ' | ')
    for j = 1, 10 do
      io.write(field[i][j] .. ' ')
    end
    io.write('\n')
  end
end

drawField(lib.dump())