// pbc-lua.h
#pragma once

#ifdef __cplusplus
extern "C" {
#endif
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
extern "C" {
#endif
    int luaopen_protobuf_c(lua_State *L);
#ifdef __cplusplus
}
#endif