local lu         = require('luaunit')
local lib        = require('logic.GameRound')
local findMatch  = require('logic.findMatch')
local findMove   = require('logic.findMove')
local swapItems  = require('logic.swapItems')
local verifyMove = require('logic.verifyMove')


TestGameRound = {} -- class

  function TestGameRound:testExample()
    local field = {
      {'A','B','F','A'},
      {'A','D','B','E'},
      {'D','B','C','A'},
      {'D','B','B','A'}
    }

    lib.init( field )

    lu.assertEquals( lib.dump(), field )

    lib.move( { x=2, y=2 }, { x=1, y=2 } )
    lib.move( { x=2, y=2 }, { x=3, y=2 } )

    field = lib.dump()

    lu.assertEquals( field, {
      {'A','B','F','A'},
      {'D','B','A','E'},
      {'D','B','C','A'},
      {'D','B','B','A'}
    } )

    lu.assertEquals(field[4][1], 'D')

    lu.assertTrue(lib.tick())

    field = lib.dump()

    lu.assertEquals(field[4][1], 'A')    
  end

-- class TestGameRound

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

TestVerifyMove = {} -- class

  function TestVerifyMove:testExample()
    local field = {
      {'A','B','F','A'},
      {'D','C','E','E'},  -- [2][3] -> E -> B
      {'A','B','F','A'},
      {'D','C','B','A'}
    }
    lu.assertEquals( verifyMove(field, { x=3, y=2 }, { x=2, y=2 }), false ) -- E [2][3]
    field[2][3] = 'B'
    lu.assertEquals( verifyMove(field, { x=3, y=2 }, { x=2, y=2 }), true )-- B [2][3]
    
    lu.assertEquals( verifyMove(field, { x=3, y=2 }, { x=1, y=2 }), false ) -- B [2][3]

    lu.assertEquals( verifyMove(field, { x=4, y=1 }, { x=4, y=2 }), true ) -- A [1][4]

    lu.assertEquals( verifyMove(field, { x=4, y=3 }, { x=4, y=3 }), false ) -- A [3][4]
    lu.assertEquals( verifyMove(field, { x=4, y=3 }, { x=4, y=4 }), false ) -- A [3][4]
    lu.assertEquals( verifyMove(field, { x=4, y=3 }, { x=4, y=2 }), false ) -- A [3][4]
  end

-- class TestVerifyMove

os.exit( lu.LuaUnit.run() )