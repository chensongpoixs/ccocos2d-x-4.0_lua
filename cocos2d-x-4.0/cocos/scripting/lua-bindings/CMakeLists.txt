set(cocos_root ${COCOS2DX_ROOT_PATH})
# 在lua_bindings_manual_headers最后面添加manual/pbc/lua_cocos2dx_pbc_manual.h、manual/pbc/pbc-lua.h
# 在lua_bindings_manual_files最后面添加manual/pbc/lua_cocos2dx_pbc_manual.cpp、manual/pbc/pbc-lua.c
set(lua_bindings_manual_headers
    scripting/lua-bindings/manual/CCComponentLua.h
    scripting/lua-bindings/manual/3d/lua_cocos2dx_3d_manual.h
    scripting/lua-bindings/manual/CCLuaStack.h
    scripting/lua-bindings/manual/CCLuaEngine.h
    scripting/lua-bindings/manual/lua_module_register.h
    scripting/lua-bindings/manual/CCLuaBridge.h
    scripting/lua-bindings/manual/extension/lua_cocos2dx_extension_manual.h
    scripting/lua-bindings/manual/LuaBasicConversions.h
    scripting/lua-bindings/manual/spine/LuaSkeletonAnimation.h
    scripting/lua-bindings/manual/platform/ios/CCLuaObjcBridge.h
    scripting/lua-bindings/manual/network/lua_cocos2dx_network_manual.h
    scripting/lua-bindings/manual/network/lua_xml_http_request.h
    scripting/lua-bindings/manual/network/Lua_web_socket.h
    scripting/lua-bindings/manual/network/lua_extensions.h
    scripting/lua-bindings/manual/network/lua_downloader.h
    scripting/lua-bindings/manual/audioengine/lua_cocos2dx_audioengine_manual.h
    scripting/lua-bindings/manual/Lua-BindingsExport.h
    scripting/lua-bindings/manual/tolua_fix.h
    scripting/lua-bindings/manual/navmesh/lua_cocos2dx_navmesh_manual.h
    scripting/lua-bindings/manual/navmesh/lua_cocos2dx_navmesh_conversions.h
    scripting/lua-bindings/manual/cocos2d/lua_cocos2dx_deprecated.h
    scripting/lua-bindings/manual/cocos2d/LuaScriptHandlerMgr.h
    scripting/lua-bindings/manual/cocos2d/lua_cocos2dx_manual.hpp
    scripting/lua-bindings/manual/Cocos2dxLuaLoader.h
    scripting/lua-bindings/manual/CCLuaValue.h
    scripting/lua-bindings/manual/physics3d/lua_cocos2dx_physics3d_manual.h
    scripting/lua-bindings/manual/cocostudio/lua-cocos-studio-conversions.h
    scripting/lua-bindings/manual/cocostudio/CustomGUIReader.h
    scripting/lua-bindings/manual/ui/lua_cocos2dx_ui_manual.hpp
    scripting/lua-bindings/manual/controller/lua_cocos2dx_controller_manual.hpp
	scripting/lua-bindings/manual/pbc/lua_cocos2dx_pbc_manual.h
	scripting/lua-bindings/manual/pbc/pbc-lua.h
    )

set(lua_bindings_manual_files
    scripting/lua-bindings/manual/CCLuaBridge.cpp
    scripting/lua-bindings/manual/CCLuaEngine.cpp
    scripting/lua-bindings/manual/CCLuaStack.cpp
    scripting/lua-bindings/manual/CCLuaValue.cpp
    scripting/lua-bindings/manual/Cocos2dxLuaLoader.cpp
    scripting/lua-bindings/manual/LuaBasicConversions.cpp
    scripting/lua-bindings/manual/lua_module_register.cpp
    scripting/lua-bindings/manual/tolua_fix.cpp
    scripting/lua-bindings/manual/CCComponentLua.cpp
    scripting/lua-bindings/manual/cocos2d/LuaScriptHandlerMgr.cpp
    scripting/lua-bindings/manual/cocos2d/lua_cocos2dx_deprecated.cpp
    scripting/lua-bindings/manual/cocos2d/lua_cocos2dx_manual.cpp
    scripting/lua-bindings/manual/cocos2d/lua_cocos2dx_physics_manual.cpp
    scripting/lua-bindings/manual/3d/lua_cocos2dx_3d_manual.cpp
    scripting/lua-bindings/manual/cocostudio/CustomGUIReader.cpp
    scripting/lua-bindings/manual/cocostudio/lua_cocos2dx_coco_studio_manual.cpp
    scripting/lua-bindings/manual/cocostudio/lua-cocos-studio-conversions.cpp
    scripting/lua-bindings/manual/cocostudio/lua_cocos2dx_csloader_manual.cpp
    scripting/lua-bindings/manual/controller/lua_cocos2dx_controller_manual.cpp
    scripting/lua-bindings/manual/extension/lua_cocos2dx_extension_manual.cpp
    scripting/lua-bindings/manual/network/lua_extensions.c
    scripting/lua-bindings/manual/network/lua_cocos2dx_network_manual.cpp
    scripting/lua-bindings/manual/network/Lua_web_socket.cpp
    scripting/lua-bindings/manual/network/lua_xml_http_request.cpp
    scripting/lua-bindings/manual/network/lua_downloader.cpp
    scripting/lua-bindings/#manual/spine/lua_cocos2dx_spine_manual.cpp
    scripting/lua-bindings/manual/spine/LuaSkeletonAnimation.cpp
    scripting/lua-bindings/manual/ui/lua_cocos2dx_ui_manual.cpp
    scripting/lua-bindings/manual/audioengine/lua_cocos2dx_audioengine_manual.cpp
    scripting/lua-bindings/manual/physics3d/lua_cocos2dx_physics3d_manual.cpp
    scripting/lua-bindings/manual/navmesh/lua_cocos2dx_navmesh_conversions.cpp
    scripting/lua-bindings/manual/navmesh/lua_cocos2dx_navmesh_manual.cpp
	scripting/lua-bindings/manual/pbc/lua_cocos2dx_pbc_manual.cpp
	scripting/lua-bindings/manual/pbc/pbc-lua.c
    )

set(lua_bindings_auto_headers
    scripting/lua-bindings/auto/lua_cocos2dx_audioengine_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_3d_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_controller_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_spine_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_studio_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_navmesh_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_csloader_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_physics3d_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_ui_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_physics_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_extension_auto.hpp
    scripting/lua-bindings/auto/lua_cocos2dx_backend_auto.hpp
    )

set(lua_bindings_auto_files
    scripting/lua-bindings/auto/lua_cocos2dx_3d_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_controller_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_extension_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_physics_auto.cpp
    #scripting/lua-bindings/#auto/lua_cocos2dx_spine_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_studio_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_csloader_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_ui_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_audioengine_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_physics3d_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_navmesh_auto.cpp
    scripting/lua-bindings/auto/lua_cocos2dx_backend_auto.cpp
    )

if(APPLE)
    # CCLuaObjcBridge.mm needed by ios and mac
    set(lua_bindings_manual_headers
        ${lua_bindings_manual_headers}
        scripting/lua-bindings/manual/platform/ios/CCLuaObjcBridge.h
        )
    set(lua_bindings_manual_files
        ${lua_bindings_manual_files}
        scripting/lua-bindings/manual/platform/ios/CCLuaObjcBridge.mm
        )
    if(IOS)
        set(lua_bindings_manual_headers
            ${lua_bindings_manual_headers}
            scripting/lua-bindings/manual/ui/lua_cocos2dx_webview_manual.hpp
            scripting/lua-bindings/auto/lua_cocos2dx_webview_auto.hpp
            scripting/lua-bindings/auto/lua_cocos2dx_video_auto.hpp
            scripting/lua-bindings/manual/ui/lua_cocos2dx_video_manual.hpp
            )
        set(lua_bindings_manual_files
            ${lua_bindings_manual_files}
            scripting/lua-bindings/manual/ui/lua_cocos2dx_webview_manual.cpp
            scripting/lua-bindings/auto/lua_cocos2dx_webview_auto.cpp
            scripting/lua-bindings/manual/ui/lua_cocos2dx_video_manual.cpp
            scripting/lua-bindings/auto/lua_cocos2dx_video_auto.cpp
            )
    endif()
elseif(ANDROID)
    set(lua_bindings_manual_headers
        ${lua_bindings_manual_headers}
        scripting/lua-bindings/manual/ui/lua_cocos2dx_webview_manual.hpp
        scripting/lua-bindings/auto/lua_cocos2dx_webview_auto.hpp
        scripting/lua-bindings/auto/lua_cocos2dx_video_auto.hpp
        scripting/lua-bindings/manual/ui/lua_cocos2dx_video_manual.hpp
        )
    set(lua_bindings_manual_files
        ${lua_bindings_manual_files}
        scripting/lua-bindings/manual/ui/lua_cocos2dx_webview_manual.cpp
        scripting/lua-bindings/auto/lua_cocos2dx_webview_auto.cpp
        scripting/lua-bindings/manual/ui/lua_cocos2dx_video_manual.cpp
        scripting/lua-bindings/auto/lua_cocos2dx_video_auto.cpp
        )
endif()

include(../deprecated/CMakeLists.txt)

set(lua_bindings_files
    ${lua_bindings_manual_files}
    ${lua_bindings_auto_files}
    ${COCOS_DEPRECATED_SRC}
    )
set(lua_bindings_headers
    ${lua_bindings_manual_headers}
    ${lua_bindings_auto_headers}
    ${COCOS_DEPRECATED_HEADER}
    )

list(APPEND lua_bindings_files ${lua_bindings_headers})

add_library(luacocos2d ${lua_bindings_files})
target_link_libraries(luacocos2d cocos2d)
add_dependencies(luacocos2d cocos2d)

get_target_property(lua_ext_depend external CC_LUA_DEPEND)
target_link_libraries(luacocos2d ${lua_ext_depend})

target_include_directories(luacocos2d
    PRIVATE scripting/lua-bindings/manual/platform/android
    PRIVATE scripting/lua-bindings/manual/platform/android/jni
    INTERFACE ${cocos_root}/cocos/scripting/lua-bindings/auto
    INTERFACE ${cocos_root}/cocos/scripting/lua-bindings/manual
)

if(WINDOWS)
    target_compile_definitions(luacocos2d PUBLIC _USRLUASTATIC)
endif()


set_target_properties(luacocos2d
                      PROPERTIES
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
                      FOLDER "Internal"
                      )

if(XCODE OR VS)
    cocos_mark_code_files("luacocos2d")
endif()

