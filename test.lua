lu = require('luaunit')
findMatch = require('game-logic/findMatch')

TestFindMatch = {} --class

  function TestFindMatch:testExample()
    local field = {
      {'A','B','C','D'},
      {'D','C','C','C'},
      {'A','B','C','D'},
      {'D','C','C','A'}
    }
    lu.assertEquals( findMatch(field), {
      {orientation = 'h', x = 2, y = 2, len = 3},
      {orientation = 'v', x = 3, y = 1, len = 4}
    })
  end
  
-- class TestFindMatch

os.exit( lu.LuaUnit.run() )