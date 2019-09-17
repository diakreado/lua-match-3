local lib = require('logic/GameRound')
local drawField = require('cli/drawField')

lib.xSize = 5
lib.ySize = 40

lib.init()

drawField(lib.dump())
print()

