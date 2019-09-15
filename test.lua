lu = require('luaunit')
findMatch = require('game-logic/findMatch')


TestSucFind = {} --class
  TestSucFind.field = {
    {'A','B','C','D'},
    {'D','C','C','C'},
    {'A','B','C','D'},
    {'D','C','C','A'}
  }

  function TestSucFind:testExample()
    lu.assertEquals( findMatch(TestSucFind.field), {
      {orientation = 'h', x = 2, y = 2, len = 3},
      {orientation = 'v', x = 3, y = 1, len = 4}
    })
  end
  
  function TestSucFind:testTestOfTestOfTest()
    lu.assertEquals( 5*2, 10)
  end
-- class TestSucFind

os.exit( lu.LuaUnit.run() )