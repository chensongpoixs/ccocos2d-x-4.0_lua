-- CC_USE_DEPRECATED_API = true
require "cocos.init"



-- cclog
cclog = function(...)
    print(string.format(...))
end

require "packages.base.protobuf"

--addr = io.open("addressbook.pb","rb")
--buffer = addr:read "*a"
--addr:close()


-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
end

local function initGLView()
    local director = cc.Director:getInstance()
    local glView = director:getOpenGLView()
    if nil == glView then
        glView = cc.GLViewImpl:create("Lua Empty Test")
        director:setOpenGLView(glView)
    end

    director:setOpenGLView(glView)

    glView:setDesignResolutionSize(480, 320, cc.ResolutionPolicy.NO_BORDER)

    --turn on display FPS
    director:setDisplayStats(true)

    --set FPS. the default value is 1.0/60 if you don't call this
    director:setAnimationInterval(1.0 / 60)
end

local function main()
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

    initGLView()

    require "hello2"
    cclog("result is " .. myadd(1, 1))




	---------------------------------

----	local socket = require"socket"
----
----	local host = "127.0.0.1"
----	local port = "8888"
----	local sever = assert(socket.bind(host, port)) --绑定
----	sever:settimeout(nil)   --不设置阻塞
----	local tab = {}
----	table.insert(tab, sever)
----
----	while 1 do
----	  local s
----	  s,_,_ = socket.select(tab, nil, nil)
----	  for k, v in ipairs(s) do
----		if v == sever then
----		local conn  = v:accept()  --连接
----		table.insert(tab, conn)
----	 else
----	   c, e = v:receive() --接收
----	   if c == nil then
----	  table.remove(tab, k)
----	  v:close()
----		else
----	  if e ~= "closed" then
----		cclog(c)
----		cclog("rvce")
----		v:send("ok\n") --发送
----	  else
----		break
----	  end
----	   end
----	 end
----	  end
----	end
----
----	--ack="ack\n"
----
----	--[[while 1 do
----	  local conn = sever:accept()
----	  if conn then
----	 print("accep")
----	  end
----	end--]]


	local socket = require ("socket")
	local client = false;

	if not socket then
		cclog("load socket module failed.")
	else
		cclog("success load socket module.")
		local host = "127.0.0.1"
		local port = 34561
		client = socket.connect4(host, port)
		if not client then
			print("connect server failed.")
		else
			client:send("this is lua client!");        
			client:settimeout(0);
		end
	end

	function receive_message()
		if client then
			local recvstr, err = client:receive();
			cclog("recvstr, err:", recvstr, err);
		end
	end


	--------------------------------------




	
	local filePath = cc.FileUtils:getInstance():fullPathForFilename("addressbook.pb")
	local buffer = read_protobuf_file_c(filePath)

	cclog("---test pbc----------")

	print(filePath..buffer)
	protobuf.register(buffer)

	local t = protobuf.decode("google.protobuf.FileDescriptorSet", buffer)

	local proto = t.file[1]

	print(proto.name)
	print(proto.package)

	local message = proto.message_type

	for _,v in ipairs(message) do
		print(v.name)
		for _,v in ipairs(v.field) do
			print("\t".. v.name .. " ["..v.number.."] " .. v.label)
		end
	end

	local addressbook = {
		name = "Alice",
		id = 12345,
		phone = {
			{ number = "1301234567" },
			{ number = "87654321", type = "WORK" },
		}
	}

	local code = protobuf.encode("tutorial.Person", addressbook)

	local decode = protobuf.decode("tutorial.Person" , code)

	print(decode.name)
	print(decode.id)
	for _,v in ipairs(decode.phone) do
		print("\t"..v.number, v.type)
	end

	local phonebuf = protobuf.pack("tutorial.Person.PhoneNumber number","87654321")
	local buffer = protobuf.pack("tutorial.Person name id phone", "Alice", 123, { phonebuf })
	print(protobuf.unpack("tutorial.Person name id phone", buffer))

	print("--------------------")

    ---------------

    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local origin = cc.Director:getInstance():getVisibleOrigin()

    -- add the moving dog
    local function creatDog()
        local frameWidth = 105
        local frameHeight = 95

        -- create dog animate
        local textureDog = cc.Director:getInstance():getTextureCache():addImage("dog.png")
        local rect = cc.rect(0, 0, frameWidth, frameHeight)
        local frame0 = cc.SpriteFrame:createWithTexture(textureDog, rect)
        rect = cc.rect(frameWidth, 0, frameWidth, frameHeight)
        local frame1 = cc.SpriteFrame:createWithTexture(textureDog, rect)

        local spriteDog = cc.Sprite:createWithSpriteFrame(frame0)
        spriteDog.isPaused = false
        spriteDog:setPosition(origin.x, origin.y + visibleSize.height / 4 * 3)
--[[
        local animFrames = CCArray:create()

        animFrames:addObject(frame0)
        animFrames:addObject(frame1)
]]--

        local animation = cc.Animation:createWithSpriteFrames({frame0,frame1}, 0.5)
        local animate = cc.Animate:create(animation)
        spriteDog:runAction(cc.RepeatForever:create(animate))

        -- moving dog at every frame
        local function tick()
            if spriteDog.isPaused then return end
            local x, y = spriteDog:getPosition()
            if x > origin.x + visibleSize.width then
                x = origin.x
            else
                x = x + 1
            end

            spriteDog:setPositionX(x)
        end

        cc.Director:getInstance():getScheduler():scheduleScriptFunc(tick, 0, false)

        return spriteDog
    end

    -- create farm
    local function createLayerFarm()
        local layerFarm = cc.Layer:create()

        -- add in farm background
        local bg = cc.Sprite:create("farm.jpg")
        bg:setPosition(origin.x + visibleSize.width / 2 + 80, origin.y + visibleSize.height / 2)
        layerFarm:addChild(bg)

        -- add land sprite
        for i = 0, 3 do
            for j = 0, 1 do
                local spriteLand = cc.Sprite:create("land.png")
                spriteLand:setPosition(200 + j * 180 - i % 2 * 90, 10 + i * 95 / 2)
                layerFarm:addChild(spriteLand)
            end
        end

        -- add crop
        local frameCrop = cc.SpriteFrame:create("crop.png", cc.rect(0, 0, 105, 95))
        for i = 0, 3 do
            for j = 0, 1 do
                local spriteCrop = cc.Sprite:createWithSpriteFrame(frameCrop)
                spriteCrop:setPosition(10 + 200 + j * 180 - i % 2 * 90, 30 + 10 + i * 95 / 2)
                layerFarm:addChild(spriteCrop)
            end
        end

        -- add moving dog
        local spriteDog = creatDog()
        layerFarm:addChild(spriteDog)

        -- handing touch events
        local touchBeginPoint = nil
        local function onTouchBegan(touch, event)
            local location = touch:getLocation()
            cclog("onTouchBegan: %0.2f, %0.2f", location.x, location.y)
            touchBeginPoint = {x = location.x, y = location.y}
            spriteDog.isPaused = true
            -- CCTOUCHBEGAN event must return true
            return true
        end

        local function onTouchMoved(touch, event)
            local location = touch:getLocation()
            cclog("onTouchMoved: %0.2f, %0.2f", location.x, location.y)
            if touchBeginPoint then
				spriteDog.isPaused = false
				spriteDog:setPosition(location.x, location.y)
               -- local cx, cy = layerFarm:getPosition()
                --layerFarm:setPosition(cx + location.x - touchBeginPoint.x,
               --                       cy + location.y - touchBeginPoint.y)
                --touchBeginPoint = {x = location.x, y = location.y}
            end
        end

        local function onTouchEnded(touch, event)
            local location = touch:getLocation()
            cclog("onTouchEnded: %0.2f, %0.2f", location.x, location.y)
            touchBeginPoint = nil
            spriteDog.isPaused = false
        end

        local listener = cc.EventListenerTouchOneByOne:create()
        listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
        listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
        listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
        local eventDispatcher = layerFarm:getEventDispatcher()
        eventDispatcher:addEventListenerWithSceneGraphPriority(listener, layerFarm)

        return layerFarm
    end


    -- create menu
    local function createLayerMenu()
        local layerMenu = cc.Layer:create()

        local menuPopup, menuTools, effectID

        local function menuCallbackClosePopup()
            -- stop test sound effect
            cc.AudioEngine:stop(effectID)
            menuPopup:setVisible(false)
        end

        local function menuCallbackOpenPopup()
            -- loop test sound effect
            local effectPath = cc.FileUtils:getInstance():fullPathForFilename("effect1.wav")
            effectID = cc.AudioEngine:play2d(effectPath)
            menuPopup:setVisible(true)
        end

        -- add a popup menu
        local menuPopupItem = cc.MenuItemImage:create("menu2.png", "menu2.png")
        menuPopupItem:setPosition(0, 0)
        menuPopupItem:registerScriptTapHandler(menuCallbackClosePopup)
        menuPopup = cc.Menu:create(menuPopupItem)
        menuPopup:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
        menuPopup:setVisible(false)
        layerMenu:addChild(menuPopup)
        
        -- add the left-bottom "tools" menu to invoke menuPopup
        local menuToolsItem = cc.MenuItemImage:create("menu1.png", "menu1.png")
        menuToolsItem:setPosition(0, 0)
        menuToolsItem:registerScriptTapHandler(menuCallbackOpenPopup)
        menuTools = cc.Menu:create(menuToolsItem)
        local itemWidth = menuToolsItem:getContentSize().width
        local itemHeight = menuToolsItem:getContentSize().height
        menuTools:setPosition(origin.x + itemWidth/2, origin.y + itemHeight/2)
        layerMenu:addChild(menuTools)

        return layerMenu
    end

    -- play background music, preload effect
    local bgMusicPath = cc.FileUtils:getInstance():fullPathForFilename("background.mp3") 
    cc.AudioEngine:play2d(bgMusicPath, true)
    local effectPath = cc.FileUtils:getInstance():fullPathForFilename("effect1.wav")
    cc.AudioEngine:preload(effectPath)

    -- run
    local sceneGame = cc.Scene:create()
    sceneGame:addChild(createLayerFarm())
    sceneGame:addChild(createLayerMenu())
    cc.Director:getInstance():runWithScene(sceneGame)
end

xpcall(main, __G__TRACKBACK__)
