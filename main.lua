local lib = require('logic/GameRound')
local drawField = require('cli/drawField')


lib.init()



drawField(lib.dump())
print()

