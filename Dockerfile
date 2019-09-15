FROM abaez/luarocks


ENV LUA_MODULES "luaunit"

WORKDIR /lua-test

RUN luarocks install $LUA_MODULES

ADD . .

ENTRYPOINT [ "lua", "test.lua", "-v" ]
