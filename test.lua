lu = require('luaunit')
findMatch = require('game-logic/findMatch')
findMove = require('game-logic/findMove')
swapItems = require('game-logic/swapItems')

TestFindMatch = {} -- class

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


TestFindMove = {} -- class

  function TestFindMove:testExample()
    local field = {
      {'A','B','F','D'},
      {'D','C','E','E'},
      {'A','B','F','D'},
      {'D','C','B','A'}
    }
    lu.assertEquals( findMove(field), nil )

    field[2][3] = 'B'
    lu.assertEquals( findMove(field), { x = 3, y = 2 } )
  end
  
-- class TestFindMove


TestSwapItems = {} -- class

  function TestSwapItems:testExample()
    local field1 = {
      {'A','B','F','D'},
      {'D','C','E','E'},
      {'A','B','F','D'},
      {'D','C','B','A'}
    }
    local field2 = {
      {'A','B','F','D'},
      {'D','C','E','E'},
      {'A','B','F','D'},
      {'D','C','B','A'}
    }
    lu.assertEquals( field1, field2 )
    lu.assertEquals( field1[3][3], field2[3][3] )
    lu.assertEquals( field1[3][2], field2[3][2] )

    swapItems( field2, { x=3, y=3 }, { x=3, y=2 } )

    lu.assertEquals( field1[3][3], field2[2][3] )
    lu.assertEquals( field1[2][3], field2[3][3] )

    swapItems( field2, { x=3, y=3 }, { x=3, y=2 } )

    lu.assertEquals( field1, field2 )
  end
  
-- class TestSwapItems

os.exit( lu.LuaUnit.run() )