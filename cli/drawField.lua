
return function(field)
  local ySize = #field
  local xSize = #field[1]

  io.write('\n     ')
  for i = 1, ySize do
    io.write(i .. ' ')
  end
  io.write('\n   ')
  for i = 1, ySize do
    io.write('--')
  end
  io.write('-\n')
  for i = 1, xSize do
    
    io.write(' ' .. i .. ' | ')
    for j = 1, ySize do
      io.write(field[i][j] .. ' ')
    end
    io.write('\n')
  end
end
