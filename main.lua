local lib = require('logic/GameRound')
local drawField = require('cli/drawField')


lib.init({
  {'A','C','F','A'},
  {'D','B','A','E'},
  {'D','B','C','A'},
  {'D','B','C','A'}
})

drawField(lib.dump())
print()

local point = lib.mix()
print(point.x , point.y)

drawField(lib.dump())
print()