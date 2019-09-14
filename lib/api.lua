local lib = {
  n = 10,
  m = 10,
  a = '1o1',
  field = {}
}

local function getRandomLetter()
  letterArray = {'A','B','C','D','E','F'}
  math.randomseed(os.clock()*1000000000000)

  local i = math.random(#letterArray)
  return letterArray[i]
end

function lib.checkFields()
  local lines = {}

  -- check horizontal line
  for i = 1, lib.n do
    local j = 1
    while j <= lib.m do
      if lib.field[i][j] == lib.field[i][j + 1] and lib.field[i][j] == lib.field[i][j + 2] then
        local k = j + 1
        while lib.field[i][j] == lib.field[i][k] do
          k = k + 1
        end
        lines[#lines + 1] = { pos = 'h', i = i, j = j, k = k-j}
        j = k
      end 
      j = j + 1
    end
  end

  -- check vertical line
  for i = 1, lib.m do
    local j = 1
    while j <= lib.n do
      if lib.field[j + 1] ~= nil and 
         lib.field[j][i] == lib.field[j + 1][i] and
         lib.field[j + 2] ~= nil and 
         lib.field[j][i] == lib.field[j + 2][i] then
        local k = j + 1
        while lib.field[k] ~= nil and lib.field[j][i] == lib.field[k][i] do
          k = k + 1
        end
        lines[#lines + 1] = {pos = 'v', j = j, i = i, k = k-j}
        j = k
      end 
      j = j + 1
    end
  end

  return lines
end

function lib.init()
  for i= 1, lib.n do
    lib.field[i] = {}
    for j= 1, lib.m do
      lib.field[i][j] = getRandomLetter()
    end
  end
end

function lib.tick()
  print(lib.a)
end

function lib.move(from, to)
  print(lib.a)
end

function lib.mix()
  print(lib.a)
end

function lib.dump()
  local field = {}
  for i= 1, lib.n do
    field[i] = {}
    for j= 1, lib.m do
      field[i][j] = lib.field[i][j]
    end
  end
  return field
end

return lib