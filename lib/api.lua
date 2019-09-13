local lib = {
  n = 10,
  m = 10,
  a = '1o1',
  field = {}
}

function lib.init()
  for i= 1, lib.n do
    lib.field[i] = {}
    for j= 1, lib.m do
      lib.field[i][j] = 'A'
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