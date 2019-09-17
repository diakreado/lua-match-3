local lib = require('logic/GameRound')
local drawField = require('cli/drawField')

lib.xSize = 20
lib.ySize = 20

lib.init()

drawField(lib.dump())
print()

