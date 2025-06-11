y1 = 175 			-- Farm limit down
itemID = 14767 		-- POG seed
amtseed = 17000 	-- Maximum Tree (Usage; UWS)
delayPlant = 40 	-- Planting Delay
delayHarvest = 100 	-- Harvesting Delay
delayUWS = 4000 	-- Delay from use uws to harvest
delayRecon = 100    -- Delay reconnect
autoSpray = true    -- true or false (Usage; Automatically use Ultra World Spray after Planting)
autoPlant = true    -- true or false (Usage; Automatically Plants)
autoHarvest = true  -- true or false (Usage; Automatically Harvests)
autoGhost = true    -- true or false (Usage; Automatically Ghost)
magplantBgID = 14   -- Background ID for cave background

worldName = "" -- Don't Touch --
nowEnable = true -- Don't Touch --
isEnable = false -- Don't Touch --
ghostState = false -- Don't Touch --
wreckWrench = true -- Don't Touch --
changeRemote = false -- Don't Touch --
player = GetLocal().name -- Don't Touch --
currentWorld = GetWorld().name -- Don't Touch --
usedMagplants = {} -- Track used magplants
firstRun = true -- Flag for first run detection

world = "island"        -- Dont Touch!!!
if world == "island" then
ex = 199
ey = y1

function path(x, y, state)
SendPacketRaw(false, {state = state,
px = x,
py = y,
x = x*32,
y = y*32})
end

function h2(x, y, id)
SendPacketRaw(false,{type = 3,
value = id,
px = x,
py = y,
x = x*32,
y= y*32})
end

AddHook("onvariant", "mommy", function(var)
    if var[0] == "OnSDBroadcast" then
        return true
    end
end)

if worldName == "" or worldName == nil then
    worldName = string.upper(GetWorld().name)
end
if GetWorld().name ~= string.upper(worldName) then
    for i = 1, 1 do
        Sleep(4500)
        RequestJoinWorld(worldName)
        Sleep(delayRecon)
    end
end

AddHook("onvariant", "mommy", function(var)
    if var[0] == "OnSDBroadcast" then
        return true
    end
    if var[0] == "OnDialogRequest" and var[1]:find("MAGPLANT 5000") then
        return true
    end
    if var[0] == "OnTalkBubble" and var[2]:match("The MAGPLANT 5000 is empty.") then
        changeRemote = true
        return true
    end
    if var[0] == "OnTalkBubble" and var[2]:match("Collected") then
        return true
    end
    if var[0] == "OnDialogRequest" and var[1]:find("add_player_info") then
        if var[1]:find("|290|") then
            ghostState = true
        else
            ghostState = false
        end
        return true
    end
    return false
end)

local function place(id, x, y)
    if GetWorld() == nil then
        return
    end
    pkt = {}
    pkt.type = 3
    pkt.value = id
    pkt.px = math.floor(GetLocal().pos.x / 32 + x)
    pkt.py = math.floor(GetLocal().pos.y / 32 + y)
    pkt.x = GetLocal().pos.x
    pkt.y = GetLocal().pos.y
    SendPacketRaw(false, pkt)
    Sleep(40)
end

local function punch(x, y)
    if GetWorld() == nil then
        return
    end
    pkt = {}
    pkt.type = 3
    pkt.value = 18
    pkt.x = GetLocal().pos.x
    pkt.y = GetLocal().pos.y
    pkt.px = math.floor(GetLocal().pos.x / 32 + x)
    pkt.py = math.floor(GetLocal().pos.y / 32 + y)
    SendPacketRaw(false, pkt)
    Sleep(40)
end

local function wrench(x, y)
    if GetWorld() == nil then
        return
    end
    pkt = {}
    pkt.type = 3
    pkt.value = 32
    pkt.px = math.floor(GetLocal().pos.x / 32 + x)
    pkt.py = math.floor(GetLocal().pos.y / 32 + y)
    pkt.x = GetLocal().pos.x
    pkt.y = GetLocal().pos.y
    SendPacketRaw(false, pkt)
end

local function hold()
    if GetWorld() == nil then
        return
    end
        local pkt = {}
        pkt.type = 0
        pkt.state = 16779296
        SendPacketRaw(pkt)
        Sleep(90)
end

local function isReady(tile)
    if GetWorld() == nil then
        return
    end
    if tile and tile.extra and tile.extra.progress and tile.extra.progress == 1.0 then
        return true
    end
    return false
end

local function findItem(id)
    count = 0
    for _, inv in pairs(GetInventory()) do
        if inv.id == id then
            count = count + inv.amount
        end
    end
    return count
end

local function FormatNumber(num)
    num = math.floor(num + 0.5)
    local formatted = tostring(num)
    local k = 3
    while k < #formatted do
        formatted = formatted:sub(1, #formatted - k) .. "," .. formatted:sub(#formatted - k + 1)
        k = k + 4
    end
    return formatted
end

local function removeColorAndSymbols(str)
    cleanedStr = string.gsub(str, "`(%S)", '')
    cleanedStr = string.gsub(cleanedStr, "`{2}|(~{2})", '')
    return cleanedStr
end
if GetWorld() == nil then
    username = removeColorAndSymbols(player)
else
    username = removeColorAndSymbols(GetLocal().name)
end

--[START WHEN START SCRIPT]-------

for i = 4, 1, -1 do
SendPacket(2,"action|input\n|text|`6[Premium Script By `b@icShark`6]")
Sleep(1000)
end

local function warnText(text)
    text = text
    packet = {}
    packet[0] = "OnAddNotification"
    packet[1] = "interface/atomic_button.rttex"
    packet[2] = text
    packet[3] = "audio/hub_open.wav"
    packet[4] = 0
    SendVariantList(packet)
    return true
end

local function countReady()
    readyTree = 0
    for _, tile in pairs(GetTiles()) do
        if tile.fg == itemID then
            if isReady(GetTile(tile.x, tile.y)) then
                readyTree = readyTree + 1
            end
        end
    end
    return readyTree
end

local function countTree()
    if GetWorld() == nil then
        return 0
    end

    countTrees = 0
    for _, tile in pairs(GetTiles()) do
        if GetTile(tile.x, tile.y).fg == itemID and not isReady(GetTile(tile.x, tile.y)) then
            countTrees = countTrees + 1
        end
    end
    return countTrees
end

local function cheatSetup()
    if GetWorld() == nil then
        return
    end

    if countTree() >= 1 then
        for _, tile in pairs(GetTiles()) do
            if tile.fg == itemID and GetTile(tile.x, tile.y).collidable then
                FindPath(tile.x, tile.y, 60)
                if nowEnable then
                    Sleep(1000)
                    SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_autoplace|1\ncheck_gems|1")
                    isEnable = true
                    Sleep(1000)
                end
                if isEnable then
                    break
                end
            end
        end
        nowEnable = false
    end

    if countTree() == 0 then
        for _, tile in pairs(GetTiles()) do
            if tile.fg == 0 and GetTile(tile.x, tile.y).collidable then
                FindPath(tile.x, tile.y, 60)
                place(5640, 0, 0)
                if nowEnable then
                    Sleep(1000)
                    SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_autoplace|1\ncheck_gems|1")
                    isEnable = true
                    Sleep(1000)
                end
                if isEnable then
                    break
                end
            end
        end
        nowEnable = false
    end
end

-- Scan and log tile data for debugging
local function scanForMagplants()
    LogToConsole("`9Starting magplant scan...")
    local magplantCount = 0
    local matchingBgCount = 0
    
    for _, tile in pairs(GetTiles()) do
        -- Check if tile has a magplant (ID: 5666)
        if tile.fg == 5666 then
            magplantCount = magplantCount + 1
            LogToConsole("`9Found magplant at X:" .. tile.x .. " Y:" .. tile.y .. " with BG:" .. tile.bg)
            
            -- Check if it has our target background
            if tile.bg == magplantBgID then
                matchingBgCount = matchingBgCount + 1
                LogToConsole("`2MATCH! Magplant with correct bg at X:" .. tile.x .. " Y:" .. tile.y)
            end
        end
    end
    
    LogToConsole("`9Scan complete. Found " .. magplantCount .. " magplants, " .. matchingBgCount .. " with matching bg ID " .. magplantBgID)
end

-- Find magplant by background ID
local function findMagplant()
    if GetWorld() == nil then
        return nil
    end
    
    -- On first run, scan and log all magplants for debugging
    if firstRun then
        scanForMagplants()
        firstRun = false
    end
    
    -- Look for any magplant that has the specific background
    for _, tile in pairs(GetTiles()) do
        -- Check if the tile is a magplant (ID: 5666) and has our target background
        if tile.fg == 5666 and tile.bg == magplantBgID then
            -- Check if we've already used this magplant
            local key = tile.x .. "," .. tile.y
            if not usedMagplants[key] then
                LogToConsole("`2Found available magplant at X:" .. tile.x .. " Y:" .. tile.y)
                return {x = tile.x, y = tile.y}
            end
        end
    end
    
    -- If all magplants have been used, reset the used list and try again
    if next(usedMagplants) ~= nil then
        LogToConsole("`4All magplants marked as used. Resetting magplant list.")
        usedMagplants = {}
        -- Try one more time with reset list
        for _, tile in pairs(GetTiles()) do
            if tile.fg == 5666 and tile.bg == magplantBgID then
                local key = tile.x .. "," .. tile.y
                LogToConsole("`2Found magplant on second attempt at X:" .. tile.x .. " Y:" .. tile.y)
                return {x = tile.x, y = tile.y}
            end
        end
    end
    
    -- Fallback to any magplant if we can't find one with the specific background
    LogToConsole("`4No magplant found with background ID " .. magplantBgID .. ". Trying any magplant...")
    for _, tile in pairs(GetTiles()) do
        if tile.fg == 5666 then
            local key = tile.x .. "," .. tile.y
            if not usedMagplants[key] then
                LogToConsole("`3Found fallback magplant at X:" .. tile.x .. " Y:" .. tile.y)
                return {x = tile.x, y = tile.y}
            end
        end
    end
    
    LogToConsole("`4No available magplants found at all!")
    return nil
end

local function takeMagplant()
    if findItem(5640) == 0 or changeRemote then
        local magplant = findMagplant()
        if magplant then
            -- Mark this magplant as used if we're changing remote (indicating it's empty)
            if changeRemote then
                local key = magplant.x .. "," .. magplant.y
                usedMagplants[key] = true
                LogToConsole("`4Magplant at " .. magplant.x .. ", " .. magplant.y .. " is empty, marking as used.")
            end
            
            -- Path to magplant and get remote
            LogToConsole("`2Pathing to magplant at X:" .. magplant.x .. " Y:" .. magplant.y)
            FindPath(magplant.x, magplant.y - 1, 60)
            Sleep(300)
            wrench(0, 1)
            Sleep(300)
            SendPacket(2, "action|dialog_return\ndialog_name|magplant_edit\nx|".. magplant.x .."|\ny|".. magplant.y .."|\nbuttonClicked|getRemote")
            Sleep(1000)
        else
            LogToConsole("`4No available magplants found! Trying default method...")
            -- Fallback to original magplant coordinates if dynamic detection fails
            FindPath(1, 174, 60) -- Typical magplant location
            Sleep(300)
            wrench(0, 1)
            Sleep(300)
            SendPacket(2, "action|dialog_return\ndialog_name|magplant_edit\nx|1|\ny|175|\nbuttonClicked|getRemote")
            Sleep(1000)
        end
    end
    if wreckWrench then
        cheatSetup()
    end
    wreckWrench = false
    changeRemote = false
end

local function remoteCheck()
    if GetWorld() == nil then
        return
    else
        if findItem(5640) == 0 or findItem(5640) < 0 then
            Sleep(1000)
            takeMagplant()
            Sleep(1000)
        end
    end
end

local function worldNot()
    if GetWorld().name ~= (worldName:upper()) then
        LogToConsole("`4Disconnected")
        for i = 1, 1 do
            Sleep(5000)
            RequestJoinWorld(worldName)
            Sleep(5000)
            cheatSetup()
        end
        Sleep(delayRecon)
        LogToConsole("`2Reconnected")
    else
        Sleep(delayRecon)
        remoteCheck()
    end
end

local function reconnectPlayer()
    if GetWorld() == nil then
        for i = 1, 1 do
            Sleep(5000)
            RequestJoinWorld(worldName)
            Sleep(5000)
            cheatSetup()
            Sleep(1000)
            nowEnable = true
            isEnable = false
        end
        Sleep(1000)
        remoteCheck()
                Sleep(1000)
        LogToConsole("`2Reconnected")
    else
        if GetWorld().name == (worldName:upper()) then
            Sleep(1000)
            remoteCheck()
            Sleep(1000)
        end
    end
end

local function wrenchMe()
    if GetWorld() == nil then
        Sleep(1000)
        reconnectPlayer()
    else
        SendPacket(2, "action|wrench\n|netid|".. GetLocal().netid)
    end
end

--[ HARVESTING ]-------------------------------------------------------------------

function harvest()
           if autoHarvest then
                for y = ey, 0, -1 do
                    for x = 0, ex, 1 do
                        if isReady(GetTile(x,y)) then
                            path(x, y, 16779296)
                            Sleep(delayHarvest)
                            h2(x, y, 18)
                            Sleep(delayHarvest)
                        end
                        if GetWorld() == nil then
                            Sleep(delayRecon)
                            reconnectPlayer()
                            break
                        end
                    end
                end
    end
end

--[ CHECK MISS HARVEST ]-----------------------------------------------------------

function htantimiss()
        harvest()
        Sleep(1100)
        previousGem = GetPlayerInfo().gems
end

--[ PLANTING ]---------------------------------------------------------------------

local function plant()
    if autoPlant then
        if countTree() < amtseed then
              for y = ey , 0, -1 do
               for x = 0, ex,10 do
                    if GetWorld() == nil then
                        return
                    else
                        if GetTile(x, y).fg == 0  then
                            path(x, y, 32)
                            Sleep(delayPlant)
                            h2(x, y, 5640)
                            Sleep(delayPlant)
                        end
                    end
                    if GetWorld() == nil then
                        Sleep(delayRecon)
                        reconnectPlayer()
                        break
                    end
                    if changeRemote then
                        break
                    end
                end
                if GetWorld() == nil then
                    Sleep(delayRecon)
                    reconnectPlayer()
                    break
                end
                if changeRemote then
                    break
                 end
             end
         end
     end
 end

-- [ CHECK MISS PLANT ]------------------------------------------------------------

local function plantantimiss()
    if autoPlant then
        if countTree() < amtseed then
            for x = ex, 0, -10 do
                for y = ey , 0 do
                    if GetWorld() == nil then
                        return
                    else
                        if GetTile(x, y).fg == 0  then
                            path(x, y, 48)
                            Sleep(delayPlant)
                            h2(x, y, 5640)
                            Sleep(delayPlant)
                        end
                    end
                    if GetWorld() == nil then
                        Sleep(delayRecon)
                        reconnectPlayer()
                        break
                    end
                    if changeRemote then
                        break
                    end
                end
                if GetWorld() == nil then
                    Sleep(delayRecon)
                    reconnectPlayer()
                    break
                end
                if changeRemote then
                    break
                end
             end
         end
     end
end

-- [ FUNCTION UWS ]-----------------------------------------------------------------

function uws()
    if autoSpray then
      if countTree() >= amtseed then
         Sleep(5000)
          SendPacket(2, "action|dialog_return\ndialog_name|ultraworldspray")
        end
    end
end

--[ CHEAT MENU / ABILITY ] ---------------------------------------------------------

ChangeValue("[C] Modfly", true)

function dontdropgems()
    SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_gems|1\n")
    Sleep(100)
end
dontdropgems()

--[ WHILE START CICLE ]-------------------------------------------------------------
    while true do
    wrenchMe()
    Sleep(1000)
    if not ghostState then
        Sleep(1000)
        for i = 1, 1 do
            if autoGhost then
                SendPacket(2, "action|input\ntext|/ghost")
                break
            end
        end
    end
    if findItem(5640) == 0 or findItem(5640) < 0 then
        Sleep(1000)
        takeMagplant()
    end
    remoteCheck()
    harvest()
    htantimiss()
    Sleep(1000)
    plant()

     if GetWorld() == nil then
        LogToConsole("`4Disconnected")
        Sleep(delayRecon)
        reconnectPlayer()
        Sleep(delayRecon)
    end

    if GetWorld().name == (worldName:upper()) then
        Sleep(delayRecon)
    else
        LogToConsole("`4Disconnected")
        Sleep(delayRecon)
        worldNot()
        Sleep(delayRecon)
    end

    if changeRemote then
        Sleep(100)
        takeMagplant()
        plant()
    end

    if findItem(5640) == 0 or findItem(5640) < 0 then
        Sleep(100)
        takeMagplant()
        plant()
    end

plantantimiss()

     if GetWorld() == nil then
        LogToConsole("`4Disconnected")
        Sleep(delayRecon)
        reconnectPlayer()
        Sleep(delayRecon)
    end

    if GetWorld().name == (worldName:upper()) then
        Sleep(delayRecon)
    else
        LogToConsole("`4Disconnected")
        Sleep(delayRecon)
        worldNot()
        Sleep(delayRecon)
    end

    if changeRemote then
        Sleep(100)
        takeMagplant()
        plantantimiss()
    end

    if findItem(5640) == 0 or findItem(5640) < 0 then
        Sleep(100)
        takeMagplant()
        plantantimiss()
    end

    Sleep(1000)
    uws()
    Sleep(100)
    plantantimiss()
    Sleep(2000)
    uws()
    Sleep(delayUWS)
end
end
