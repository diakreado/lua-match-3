
return function(field, score)
  local ySize = #field
  local xSize = #field[1]

  io.write('\n score: ' .. score .. '\n')

  io.write('\n     ')
  if xSize > 9 then io.write(' ') end
  if ySize > 9 then io.write(' ') end
  for j = 1, xSize do
    if xSize > 9 and j < 10 then
      io.write(j .. '  ')
    else
      io.write(j .. ' ')
    end
  end
  io.write('\n   ')
  if ySize > 9 then
    io.write('  ')
  end
  for j = 1, xSize do
    if xSize > 9 then io.write('---') else io.write('--') end
  end
  io.write('-\n')
  for i = 1, ySize do
    if ySize > 9 and i < 10 then
      io.write('  ' .. i)
    else
      io.write(' ' .. i)
    end
    if xSize > 9 then io.write(' |  ') else io.write(' | ') end
    for j = 1, xSize do
      if xSize > 9 then io.write(field[i][j] .. '  ') else io.write(field[i][j] .. ' ') end
    end
    io.write('\n')
  end
  io.flush()
end
