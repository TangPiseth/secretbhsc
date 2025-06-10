-- Enhanced Growtopia Proxy Script v3.0
-- Made by icShark & TangPiseth
-- Features: REME/QEME/LEME modes, BTK Helper, Auto Convert, Advanced Automation

local AuthorizedIDs = {}

-- Core Configuration
local Configs = {
    IsMenuVisible = true,
    SpamText = "",
    ShowSettingsMenu = false,
    SpamDelay = 1000,
    IsSpamming = false,
    IsSbing = false,
    SbAmount = 0,
    SbCount = 10,
    HasExecuted = false,
    SbDelay = 90000,
    SbText = "",
    TextPull = "`9H`6e`9l`6l`9o {name} `9G`6a`9s`6?",
    Key = 118, -- F7
    Name = nil,
    TyperUserID = nil,
    TyperText = nil,
    IsKeySelecting = false,
    KeybindStr = "F7",
    Webhook = "",
    SbStarted = false,
    Base64Chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
    ModFly = false,
    AntiBounce = false,
    BTKSetup = false,
    Blues = 0,
    CurrentTax = 5,
    CurrentBet = 0,
    Player1Gems = 0,
    Player2Gems = 0,
    DisplayX = 0,
    DisplayY = 0,
    Player1PunchCount = 0,
    Player2PunchCount = 0,
    Player1Punched = false,
    Player1IsOnTheRight = false,
    Player2IsOnTheRight = false,
    Player1Won = false,
    SavedSkinColor = {x = 1.0, y = 1.0, z = 1.0, w = 1.0},
    SpinList = {},
    SpinListFake = {},
    DropList = {},
    PickUpList = {},
    WindowSize = ImVec2(950, 650),
    FileName = "EnhancedProxyOpts.txt",
    RandomEmojis = {"(alien)", "(megaphone)", "(wl)", "(mad)", "(gems)", "(party)", "(wow)", "(troll)", "(moyai)", "(weary)", "(sigh)", "(music)", "(kiss)", "(heart)", "(agree)", "(dance)", "(build)", "(vend)", "(bunny)", "(peace)", "(terror)", "(pine)", "(football)", "(fireworks)", "(song)", "(pizza)", "(shamrock)", "(cake)"},
    Player1Positions = {{x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}},
    Player2Positions = {{x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}},
    
    -- Auto Features
    AutoFarm = false,
    AutoFish = false,
    AutoMine = false,
    AutoBreak = false,
    AutoCollect = false,
    AutoSeed = false,
    AutoWateringCan = false,
    FarmDelay = 150,
    BreakDelay = 100,
    
    -- Auto Convert Features
    AutoConvertDL = false,
    AutoConvertBGL = false,
    AutoConvertBGLThreshold = 100,
    AutoMakeBGL = false,
    AutoMakeBGLAmount = 1,
    AutoDepositBGL = false,
    AutoWithdrawBGL = false,
    BankThreshold = 200,
    
    -- Enhanced Features
    AutoRespawn = false,
    AutoReconnect = false,
    AutoClearInventory = false,
    AutoSortInventory = false,
    AutoTrash = false,
    TrashItems = {2, 4, 6}, -- Default trash items
    
    -- World Features
    WorldRotation = {},
    AutoWorldRotate = false,
    WorldRotateInterval = 300000, -- 5 minutes
    CurrentWorldIndex = 1,
    LastWorldChange = 0,
    
    -- Security Features
    AntiScam = true,
    AntiMod = false,
    AntiTroll = false,
    AutoWorldLock = false,
    
    -- Visual Enhancements
    ShowPlayerCount = false,
    ShowItemCount = false,
    ShowGemsCount = false,
    ShowTimeInWorld = false,
    WorldJoinTime = 0,
    
    -- Custom Messages
    CustomWelcomeMsg = "Welcome to my world!",
    CustomGoodbyeMsg = "Thanks for visiting!",
    SendWelcomeMsg = false,
    
    -- Trading Features
    AutoAcceptTrade = false,
    TradeFilter = {},
    MinTradeValue = 1,
    AutoDeclineTrade = false,
}

local CheatOptions = {
    FastCommands = {
        "Fast Drop", "Fast Trash", "Fast Pull", "Fast Kick", "Fast World Ban", "Fast Trade", "Fast Inventory"
    },
    AntiCommands = {
        "Anti Freeze", "Anti Spammer Slave", "Anti Pickup", "Block SDB", "Anti Mod", "Anti Troll"
    },
    QuickCommands = {
        "Quick Display Block", "Quick Donation Box", "Quick Storage Box", "Quick Buy Champagne", "Convert DL to BGL", "Auto Make BGL", "Auto Sort Inventory"
    },
    RandomCommands = {
        "Encrypted Talk", "Modfly", "Antibounce", "Blacklist Mode", "Auto Respawn", "Auto Reconnect"
    },
    Visual = {
        "Reme Mode", "Qeme Mode", "Leme Mode", "World Ban Typer", "Send Typer Text Modchat", "Pull Type Gas", "Shorten Spin Text", "Drop Text", "Wrench Get Modal", "Watermark", "Emojis", "Show Command Text", "Show Player Count", "Show Item Count", "Show Time"
    },
    AutoFeatures = {
        "Auto Farm", "Auto Fish", "Auto Mine", "Auto Break", "Auto Collect", "Auto Seed", "Auto Watering Can", "Auto Clear Inventory", "Auto Trash"
    },
    ConvertFeatures = {
        "Auto Convert DL", "Auto Convert BGL", "Auto Make BGL", "Auto Deposit BGL", "Auto Withdraw BGL"
    }
}

local KeyCodes = {
    F1 = 112, F2 = 113, F3 = 114, F4 = 115, F5 = 116, F6 = 117, F7 = 118, F8 = 119, F9 = 120, F10 = 121, F11 = 122, F12 = 123,
    Num0 = 48, Num1 = 49, Num2 = 50, Num3 = 51, Num4 = 52, Num5 = 53, Num6 = 54, Num7 = 55, Num8 = 56, Num9 = 57,
    A = 65, B = 66, C = 67, D = 68, E = 69, F = 70, G = 71, H = 72, I = 73, J = 74, K = 75, L = 76, M = 77, N = 78, O = 79, P = 80, Q = 81, R = 82, S = 83, T = 84, U = 85, V = 86, W = 87, X = 88, Y = 89, Z = 90,
    Space = 32, Shift = 16, Control = 17, Alt = 18, Tab = 9, Enter = 13, Escape = 27, Backspace = 8, Delete = 46
}

local CheatStates = {}
for category, options in pairs(CheatOptions) do
    for _, option in ipairs(options) do
        CheatStates[option] = false
    end
end

-- Initialize missing global variables
local SearchRealSpunText = ""
local SearchFakeSpunText = ""
local SearchDropText = ""
local SearchPickUpText = ""

-- Utility Functions
local function SendWebhook(url, data)
    if url and url ~= "" then
        MakeRequest(url, "POST", {["Content-Type"] = "application/json"}, data)
    end
end

local function TalkBubble(text)
    local var = {}
    var[0] = "OnTalkBubble"
    var[1] = GetLocal().netid
    var[2] = text
    SendVariantList(var)
end

local function Overlay(text)
    local packet = {
        [0] = "OnTextOverlay",
        [1] = text,
    }
    SendVariantList(packet)
end

local function Warn(text)
    local pkt = {
        [0] = "OnAddNotification",
        [1] = "interface/atomic_button.rttex",
        [2] = text,
        [3] = 'audio/hub_open.wav',
        [4] = 0,
    }
    SendVariantList(pkt)
end

local function CLog(text)
    local var = {}
    var[0] = "OnConsoleMessage"
    var[1] = "`0[`bicShark `9Proxy`0] `9" .. text
    SendVariantList(var)
end

local function LogToConsole(text)
    local var = {}
    var[0] = "OnConsoleMessage"
    var[1] = text
    SendVariantList(var)
end

local function GetItem(id)
    local inv = GetInventory()
    if inv and inv[id] ~= nil then
        return inv[id].amount
    end
    return 0
end

local function GetPlayerFromUserID(userid)
    for _, plr in pairs(GetPlayerList()) do
        if tonumber(plr.userid) == tonumber(userid) then
            return plr
        end
    end
    return nil
end

local function GetPlayerFromNetID(netid)
    for _, plr in pairs(GetPlayerList()) do
        if tonumber(plr.netid) == tonumber(netid) then
            return plr
        end
    end
    return nil
end

local function Place(x, y, id)
    local pkt = {}
    pkt.type = 3
    pkt.value = id
    pkt.px = x
    pkt.py = y
    pkt.x = x * 32
    pkt.y = y * 32
    SendPacketRaw(false, pkt)
end

local function Punch(x, y)
    local pkt = {}
    pkt.type = 3
    pkt.value = 18
    pkt.px = x
    pkt.py = y
    pkt.x = x * 32
    pkt.y = y * 32
    SendPacketRaw(false, pkt)
end

local function DoubleClickItem(id)
    local packet = {
        type = 10,
        int_data = id
    }
    SendPacketRaw(false, packet)
end

local function Wrench(x, y)
    local pkt = {}
    pkt.type = 3
    pkt.value = 32
    pkt.px = math.floor(GetLocal().pos.x / 32 + x)
    pkt.py = math.floor(GetLocal().pos.y / 32 + y)
    pkt.x = GetLocal().pos.x
    pkt.y = GetLocal().pos.y
    SendPacketRaw(false, pkt)
    Sleep(40)
end

-- Safe function wrappers
local function SafeGetLocal()
    local success, result = pcall(GetLocal)
    return success and result or nil
end

local function SafeGetWorld()
    local success, result = pcall(GetWorld)
    return success and result or {name = "Unknown"}
end

local function SafeGetTile(x, y)
    local success, result = pcall(GetTile, x, y)
    return success and result or nil
end

-- Auto Convert Functions
local function AutoConvertDLToBGL()
    if not CheatStates["Auto Convert DL"] then return end
    
    local dlAmount = GetItem(1796)
    if dlAmount >= 100 then
        DoubleClickItem(1796)
        Sleep(100)
        SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
        CLog("Auto converted " .. math.floor(dlAmount/100) .. " Blue Gem Lock(s)")
        Sleep(1000)
    end
end

local function AutoConvertBGLToBGL()
    if not CheatStates["Auto Convert BGL"] then return end
    
    local bglAmount = GetItem(7188)
    if bglAmount >= Configs.AutoConvertBGLThreshold then
        DoubleClickItem(7188)
        Sleep(100)
        SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
        CLog("Auto converted " .. math.floor(bglAmount/100) .. " Black Gem Lock(s)")
        Sleep(1000)
    end
end

local function AutoMakeBGL()
    if not CheatStates["Auto Make BGL"] then return end
    
    local dlAmount = GetItem(1796)
    if dlAmount >= (Configs.AutoMakeBGLAmount * 100) then
        for i = 1, Configs.AutoMakeBGLAmount do
            DoubleClickItem(1796)
            Sleep(50)
            SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
            Sleep(100)
        end
        CLog("Auto made " .. Configs.AutoMakeBGLAmount .. " Blue Gem Lock(s)")
        Sleep(1000)
    end
end

-- Auto Farm Functions
local function AutoFarmTrees()
    if not CheatStates["Auto Farm"] then return end
    
    local localPlayer = SafeGetLocal()
    if not localPlayer then return end
    
    local localX = math.floor(localPlayer.pos.x / 32)
    local localY = math.floor(localPlayer.pos.y / 32)
    
    for dx = -3, 3 do
        for dy = -3, 3 do
            local checkX = localX + dx
            local checkY = localY + dy
            local tile = SafeGetTile(checkX, checkY)
            
            if tile and tile.fg ~= 0 then
                local itemInfo = GetItemInfo(tile.fg)
                if itemInfo and (itemInfo.name:find("Tree") or itemInfo.name:find("Bush")) then
                    if tile.ready_to_harvest then
                        FindPath(checkX, checkY)
                        Sleep(100)
                        Punch(checkX, checkY)
                        Sleep(Configs.FarmDelay)
                        
                        -- Auto replant if we have seeds
                        if CheatStates["Auto Seed"] then
                            local seedIds = {3016, 3018, 3020, 3022} -- Common tree seeds
                            for _, seedId in pairs(seedIds) do
                                if GetItem(seedId) > 0 then
                                    Place(checkX, checkY, seedId)
                                    Sleep(50)
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function AutoBreakBlocks()
    if not CheatStates["Auto Break"] then return end
    
    local localPlayer = SafeGetLocal()
    if not localPlayer then return end
    
    local localX = math.floor(localPlayer.pos.x / 32)
    local localY = math.floor(localPlayer.pos.y / 32)
    
    for dx = -2, 2 do
        for dy = -2, 2 do
            local checkX = localX + dx
            local checkY = localY + dy
            local tile = SafeGetTile(checkX, checkY)
            
            if tile and tile.fg ~= 0 then
                local blockIds = {2, 4, 6, 8, 10, 12} -- Common blocks to break
                for _, blockId in pairs(blockIds) do
                    if tile.fg == blockId then
                        FindPath(checkX, checkY)
                        Sleep(50)
                        Punch(checkX, checkY)
                        Sleep(Configs.BreakDelay)
                    end
                end
            end
        end
    end
end

local function AutoCollectItems()
    if not CheatStates["Auto Collect"] then return end
    
    for _, obj in pairs(GetObjectList()) do
        if obj.id == 112 then -- Gems
            FindPath(math.floor(obj.pos.x / 32), math.floor(obj.pos.y / 32))
            Sleep(100)
        end
    end
end

local function AutoTrashItems()
    if not CheatStates["Auto Trash"] then return end
    
    for _, itemId in pairs(Configs.TrashItems) do
        local amount = GetItem(itemId)
        if amount > 0 then
            SendPacket(2, "action|dialog_return\ndialog_name|trash\nitem_trash|" .. itemId .. "|\nitem_count|" .. amount)
            Sleep(100)
        end
    end
end

-- File Management
local function FileRead(FileName)
    local file = io.open(FileName, 'r')
    if not file then return {} end
    local data = {}
    for line in file:lines() do
        table.insert(data, line)
    end
    file:close()
    return data
end

local function FileWrite(FileName, data)
    local blacklisted = FileRead(FileName)
    for _, id in pairs(blacklisted) do
        if id == data then
            return
        end
    end
    local file = io.open(FileName, 'a')
    if file then
        file:write(data .. "\n")
        file:close()
    end
end

local function FileModify(FileName, data)
    local file = io.open(FileName, 'w')
    if file then
        file:write(data)
        file:close()
    end
end

local function HandleSaveSettings()
    local content = ""

    for category, options in pairs(CheatOptions) do
        for _, option in ipairs(options) do
            content = content .. option .. "=" .. tostring(CheatStates[option]) .. "\n"
        end
    end

    content = content .. "SB Text=" .. Configs.SbText .. "\n"
    content = content .. "Spam Text=" .. Configs.SpamText .. "\n"
    content = content .. "Key=" .. Configs.Key .. "\n"
    content = content .. "KeybindStr=" .. Configs.KeybindStr .. "\n"
    content = content .. "Pull Text=" .. Configs.TextPull .. "\n"
    content = content .. "Webhook=" .. Configs.Webhook .. "\n"
    content = content .. "Current Tax=" .. Configs.CurrentTax .. "\n"
    content = content .. "Farm Delay=" .. Configs.FarmDelay .. "\n"
    content = content .. "Break Delay=" .. Configs.BreakDelay .. "\n"

    FileModify(Configs.FileName, content)
end

local function LoadSettings()
    local file = io.open(Configs.FileName, "r")
    if not file then
        CLog("`4Settings file not found, using defaults.")
        return
    end

    local data = file:read("*a")
    file:close()

    if not data or data == "" then
        CLog("`4Settings file is empty.")
        return
    end

    for line in string.gmatch(data, "[^\r\n]+") do
        local option, state = line:match("([^=]+)=(.*)")
        if option and state then
            if option == "Key" then
                Configs.Key = tonumber(state) or Configs.Key
            elseif option == "KeybindStr" then
                Configs.KeybindStr = state
            elseif option == "SB Text" then
                Configs.SbText = state
            elseif option == "Spam Text" then
                Configs.SpamText = state
            elseif option == "Pull Text" then
                Configs.TextPull = state
            elseif option == "Webhook" then
                Configs.Webhook = state
            else
                CheatStates[option] = (state:lower() == "true")
            end
        end
    end
end

-- Enhanced Main Menu
local function MainMenu()
    if not Configs.IsMenuVisible then return end
    
    ImGui.SetNextWindowSize(Configs.WindowSize, 4)
    if ImGui.Begin('icShark Proxy v3.0 - Enhanced by TangPiseth', true, ImGui.WindowFlags.Resize) then
        local CurrentSize = ImGui.GetWindowSize()
        if CurrentSize.x ~= Configs.WindowSize.x or CurrentSize.y ~= Configs.WindowSize.y then
            Configs.WindowSize = CurrentSize
        end
        
        -- Credits and watermark
        ImGui.TextColored(ImVec4(0.3, 0.8, 1.0, 1.0), "Credits: icShark (Original Creator) & TangPiseth (Enhanced Version)")
        ImGui.TextColored(ImVec4(0.8, 0.8, 0.8, 1.0), "Date: 2025-06-10 | User: " .. (SafeGetLocal() and SafeGetLocal().name:gsub("`.", "") or "TangPiseth"))
        ImGui.Separator()
        
        if ImGui.BeginTabBar("MainTabs") then
            -- Fast Actions Tab
            if ImGui.BeginTabItem("Fast Actions") then
                ImGui.Columns(4, nil, false)
                ImGui.Text("Fast Commands:")
                for _, option in ipairs(CheatOptions.FastCommands) do
                    local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                    if changed then
                        CheatStates[option] = newValue
                        if option == "Fast Pull" then
                            CheatStates["Fast Kick"] = false
                            CheatStates["Fast World Ban"] = false
                        elseif option == "Fast Kick" then
                            CheatStates["Fast Pull"] = false
                            CheatStates["Fast World Ban"] = false
                        elseif option == "Fast World Ban" then
                            CheatStates["Fast Pull"] = false
                            CheatStates["Fast Kick"] = false
                        elseif option == "Fast Trade" then
                            CheatStates["Fast Inventory"] = false
                        elseif option == "Fast Inventory" then
                            CheatStates["Fast Trade"] = false
                        end
                    end
                end

                ImGui.NextColumn()
                ImGui.Text("Anti Commands:")
                for _, option in ipairs(CheatOptions.AntiCommands) do
                    local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                    if changed then CheatStates[option] = newValue end
                end

                ImGui.NextColumn()
                ImGui.Text("Quick Commands:")
                for _, option in ipairs(CheatOptions.QuickCommands) do
                    local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                    if changed then CheatStates[option] = newValue end
                end

                ImGui.NextColumn()
                ImGui.Text("Random Commands:")
                for _, option in ipairs(CheatOptions.RandomCommands) do
                    local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                    if changed then
                        CheatStates[option] = newValue
                        
                        if option == "Modfly" then
                            if CheatStates["Modfly"] and not Configs.ModFly then
                                ChangeValue("[C] Modfly", true)
                                Configs.ModFly = true
                            elseif not CheatStates["Modfly"] and Configs.ModFly then
                                ChangeValue("[C] Modfly", false)
                                Configs.ModFly = false
                            end
                        elseif option == "Antibounce" then
                            if CheatStates["Antibounce"] and not Configs.AntiBounce then
                                ChangeValue("[C] Antibounce", true)
                                Configs.AntiBounce = true
                            elseif not CheatStates["Antibounce"] and Configs.AntiBounce then
                                ChangeValue("[C] Antibounce", false)
                                Configs.AntiBounce = false
                            end
                        end
                    end
                end
                
                ImGui.Columns(1)
                ImGui.Separator()
                
                if ImGui.Button("Convert BGL to BGL") then
                    DoubleClickItem(7188)
                end
                ImGui.SameLine()
                if ImGui.Button("Rejoin World") then
                    local world = SafeGetWorld()
                    if world then
                        SendPacket(2, "action|join_request\nname|" .. world.name)
                    end
                end
                ImGui.SameLine()
                if ImGui.Button("Random World") then
                    local randomWorld = "PROXY" .. math.random(1000, 9999)
                    SendPacket(2, "action|join_request\nname|" .. randomWorld)
                end
                ImGui.SameLine()
                if ImGui.Button("Reconnect") then
                    local var = {}
                    var[0] = "OnReconnect"
                    SendVariantList(var)
                end
                
                ImGui.EndTabItem()
            end
            
            -- Auto Features Tab (Fixed)
            if ImGui.BeginTabItem("Auto Features") then
                ImGui.Columns(3, nil, false)
                
                ImGui.Text("Auto Farm/Mine:")
                if CheatOptions.AutoFeatures then
                    for _, option in ipairs(CheatOptions.AutoFeatures) do
                        local changed, newValue = ImGui.Checkbox(option, CheatStates[option] or false)
                        if changed then CheatStates[option] = newValue end
                    end
                end
                
                ImGui.Text("Farm Delay (ms):")
                local changed, newValue = ImGui.InputInt("##FarmDelay", Configs.FarmDelay or 150)
                if changed and newValue then 
                    Configs.FarmDelay = math.max(50, newValue) 
                end
                
                ImGui.Text("Break Delay (ms):")
                changed, newValue = ImGui.InputInt("##BreakDelay", Configs.BreakDelay or 100)
                if changed and newValue then 
                    Configs.BreakDelay = math.max(50, newValue) 
                end
                
                ImGui.NextColumn()
                
                ImGui.Text("Auto Convert:")
                if CheatOptions.ConvertFeatures then
                    for _, option in ipairs(CheatOptions.ConvertFeatures) do
                        local changed, newValue = ImGui.Checkbox(option, CheatStates[option] or false)
                        if changed then CheatStates[option] = newValue end
                    end
                end
                
                ImGui.Text("BGL Convert Threshold:")
                changed, newValue = ImGui.InputInt("##BGLThreshold", Configs.AutoConvertBGLThreshold or 100)
                if changed and newValue then 
                    Configs.AutoConvertBGLThreshold = math.max(1, newValue) 
                end
                
                ImGui.Text("Auto Make BGL Amount:")
                changed, newValue = ImGui.InputInt("##MakeBGLAmount", Configs.AutoMakeBGLAmount or 1)
                if changed and newValue then 
                    Configs.AutoMakeBGLAmount = math.max(1, newValue) 
                end
                
                ImGui.NextColumn()
                
                ImGui.Text("Status:")
                if CheatStates["Auto Farm"] then
                    ImGui.TextColored(ImVec4(0, 1, 0, 1), "Auto Farm: ACTIVE")
                else
                    ImGui.TextColored(ImVec4(1, 0, 0, 1), "Auto Farm: INACTIVE")
                end
                
                if CheatStates["Auto Convert DL"] then
                    ImGui.TextColored(ImVec4(0, 1, 0, 1), "Auto Convert DL: ACTIVE")
                else
                    ImGui.TextColored(ImVec4(1, 0, 0, 1), "Auto Convert DL: INACTIVE")
                end
                
                local localPlayer = SafeGetLocal()
                local currentWorld = SafeGetWorld()
                if localPlayer and currentWorld then
                    ImGui.Text("Current World: " .. currentWorld.name)
                    ImGui.Text("World Lock: " .. GetItem(242))
                    ImGui.Text("Diamond Lock: " .. GetItem(1796))
                    ImGui.Text("Blue Gem Lock: " .. GetItem(7188))
                    ImGui.Text("Black Gem Lock: " .. GetItem(11550))
                end
                
                ImGui.Columns(1)
                ImGui.EndTabItem()
            end
            
            -- REME/QEME/LEME Tab
            if ImGui.BeginTabItem("REME/QEME/LEME") then
                ImGui.Columns(3, nil, false)
                
                ImGui.Text("Wheel Modes:")
                local wheelModes = {"Reme Mode", "Qeme Mode", "Leme Mode"}
                for _, mode in ipairs(wheelModes) do
                    local changed, newValue = ImGui.Checkbox(mode, CheatStates[mode] or false)
                    if changed then CheatStates[mode] = newValue end
                end
                
                local changed, newValue = ImGui.Checkbox("Shorten Spin Text", CheatStates["Shorten Spin Text"] or false)
                if changed then CheatStates["Shorten Spin Text"] = newValue end
                
                changed, newValue = ImGui.Checkbox("World Ban Typer", CheatStates["World Ban Typer"] or false)
                if changed then CheatStates["World Ban Typer"] = newValue end
                
                ImGui.NextColumn()
                
                ImGui.Text("Wheel Statistics:")
                ImGui.Text("Real Spins Logged: " .. #Configs.SpinList)
                ImGui.Text("Fake Spins Detected: " .. #Configs.SpinListFake)
                
                if ImGui.Button("Clear Real Logs") then
                    Configs.SpinList = {}
                end
                ImGui.SameLine()
                if ImGui.Button("Clear Fake Logs") then
                    Configs.SpinListFake = {}
                end
                
                if ImGui.Button("Save Logs to File") then
                    local logFile = "WheelLogs_" .. os.date("%Y%m%d_%H%M%S") .. ".txt"
                    local file = io.open(logFile, "w")
                    if file then
                        file:write("=== icShark Proxy - Wheel Logs ===\n")
                        file:write("Generated: " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n\n")
                        file:write("=== REAL SPINS ===\n")
                        for _, log in ipairs(Configs.SpinList) do
                            file:write(log)
                        end
                        file:write("\n=== FAKE SPINS ===\n")
                        for _, log in ipairs(Configs.SpinListFake) do
                            file:write(log)
                        end
                        file:close()
                        CLog("Logs saved to " .. logFile)
                    end
                end
                
                ImGui.NextColumn()
                
                ImGui.Text("Mode Information:")
                ImGui.TextWrapped("REME: (first digit + last digit) mod 10")
                ImGui.Separator()
                ImGui.TextWrapped("QEME: Last digit of spin number")
                ImGui.Separator()
                ImGui.TextWrapped("LEME: Sum of digits with special rules")
                
                ImGui.Columns(1)
                ImGui.EndTabItem()
            end
            
            -- Settings Tab
            if ImGui.BeginTabItem("Settings") then
                ImGui.TextColored(ImVec4(0.3, 0.8, 1.0, 1.0), "icShark Growtopia Proxy v3.0")
                ImGui.TextColored(ImVec4(0.8, 0.8, 0.8, 1.0), "Enhanced by TangPiseth - 2025-06-10")
                ImGui.TextColored(ImVec4(1.0, 0.8, 0.3, 1.0), "Original Creator: icShark")
                ImGui.Separator()
                
                ImGui.Text("Menu Keybind:")
                local changed, newValue = ImGui.InputText("##MenuKey", Configs.KeybindStr, 16)
                if changed then Configs.KeybindStr = newValue end
                
                if Configs.IsKeySelecting then
                    ImGui.TextColored(ImVec4(1.0, 1.0, 0.0, 1.0), "Press any key to set keybind...")
                end
                
                if ImGui.Button("Change Keybind") then
                    Configs.IsKeySelecting = true
                end
                
                ImGui.Separator()
                
                if ImGui.Button("Save Settings") then
                    HandleSaveSettings()
                    CLog("Settings saved successfully!")
                end
                
                ImGui.SameLine()
                if ImGui.Button("Load Settings") then
                    LoadSettings()
                    CLog("Settings loaded!")
                end
                
                ImGui.SameLine()
                if ImGui.Button("Reset All") then
                    for category, options in pairs(CheatOptions) do
                        for _, option in ipairs(options) do
                            CheatStates[option] = false
                        end
                    end
                    CLog("All settings reset!")
                end
                
                ImGui.Separator()
                ImGui.Text("Special Thanks:")
                ImGui.BulletText("icShark - Original proxy creator")
                ImGui.BulletText("TangPiseth - Enhanced features & fixes")
                ImGui.BulletText("Growtopia Community - Testing & feedback")
                
                ImGui.EndTabItem()
            end
            
            ImGui.EndTabBar()
        end
        
        ImGui.End()
    end
end

-- Simplified Variant Handler
local function VarlistHandler(varlist)
    if not varlist or not varlist[0] then return end
    
    -- Console message handler with watermark
    if varlist[0]:find("OnConsoleMessage") then
        if CheatStates["Watermark"] and not varlist[1]:find("%[icShark Proxy%]") then
            varlist[1] = "`0[`bicShark `9Proxy`0] " .. varlist[1]
            SendVariantList(varlist)
            return true
        end
        
        -- Pickup logging
        if varlist[1]:find("Collected") and not varlist[1]:find("<") then
            local FilterText = varlist[1]:gsub("`.", "")
            local Amount, ItemName = FilterText:match("Collected  (%d+) (.+)%.")
            if Amount and ItemName then
                local world = SafeGetWorld()
                table.insert(Configs.PickUpList, os.date("%X") .. ": Picked up " .. Amount .. " " .. ItemName .. " in " .. (world and world.name or "Unknown"))
            end
        end
    end
    
    -- Block SDB if enabled
    if varlist[0]:find("OnSDBroadcast") and CheatStates["Block SDB"] then
        return true
    end
end

-- Simplified Packet Handler
local function PacketHandler(type, pkt)
    if not pkt then return end
    
    -- Fast drop
    if pkt:find("action|drop\n|itemID|") and CheatStates["Fast Drop"] then
        local ItemID = pkt:match("itemID|(%d+)")
        if ItemID then
            local ItemAmount = GetItem(tonumber(ItemID))
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. ItemID .. "|\nitem_count|" .. ItemAmount)
            return true
        end
    end
    
    -- Command handling with watermark
    if pkt:find("action|input\n|text|") then
        local Command = pkt:match("text|(.+)")
        if not Command then return end
        
        -- Watermark for non-commands
        if CheatStates["Watermark"] and not Command:find("/") then
            if CheatStates["Emojis"] then
                local randomEmoji = Configs.RandomEmojis[math.random(1, #Configs.RandomEmojis)]
                SendPacket(2, "action|input\n|text|`0[`bicShark `9Proxy`0] " .. randomEmoji .. " : " .. Command)
            else
                SendPacket(2, "action|input\n|text|`0[`bicShark `9Proxy`0] : " .. Command)
            end
            return true
        end
        
        -- Toggle commands
        if Command == "/watermark" then
            CheatStates["Watermark"] = not CheatStates["Watermark"]
            CLog("Watermark " .. (CheatStates["Watermark"] and "enabled" or "disabled"))
            return true
        end
    end
end

-- Input handler
local function InputDetector(Keys)
    if Configs.IsKeySelecting then
        for KeyName, KeyCode in pairs(KeyCodes) do
            if KeyCode == Keys then
                Configs.KeybindStr = KeyName
                Configs.Key = KeyCode
                CLog("Keybind set to: " .. KeyName)
                break
            end
        end
        Configs.IsKeySelecting = false
    elseif Keys == Configs.Key then
        Configs.IsMenuVisible = not Configs.IsMenuVisible
    end
end

-- Auto features loop
local function AutoFeaturesLoop()
    while true do
        local localPlayer = SafeGetLocal()
        if localPlayer then
            -- Auto convert features
            if CheatStates["Auto Convert DL"] then
                AutoConvertDLToBGL()
            end
            
            if CheatStates["Auto Convert BGL"] then
                AutoConvertBGLToBGL()
            end
            
            if CheatStates["Auto Make BGL"] then
                AutoMakeBGL()
            end
            
            -- Auto farm
            if CheatStates["Auto Farm"] then
                AutoFarmTrees()
            end
            
            -- Auto break
            if CheatStates["Auto Break"] then
                AutoBreakBlocks()
            end
            
            -- Auto collect
            if CheatStates["Auto Collect"] then
                AutoCollectItems()
            end
            
            -- Auto trash
            if CheatStates["Auto Trash"] then
                AutoTrashItems()
            end
            
            -- Auto respawn
            if CheatStates["Auto Respawn"] and localPlayer.health <= 0 then
                SendPacket(2, "action|respawn")
                Sleep(1000)
            end
            
            -- Auto spam
            if Configs.IsSpamming and Configs.SpamText ~= "" then
                if CheatStates["Watermark"] then
                    SendPacket(2, "action|input\n|text|`0[`bicShark `9Proxy`0] " .. Configs.SpamText)
                else
                    SendPacket(2, "action|input\n|text|" .. Configs.SpamText)
                end
                Sleep(Configs.SpamDelay)
            end
        end
        
        Sleep(1000) -- Main loop delay - increased to prevent lag
    end
end

-- Hook registration
AddHook("OnInput", "InputDetector", InputDetector)
AddHook("onvariant", "VarlistHandler", VarlistHandler)
AddHook("onsendpacket", "PacketHandler", PacketHandler)
AddHook("OnDraw", "MainMenu", MainMenu)

-- Initialize
LoadSettings()
CLog("`2icShark Proxy v3.0 loaded successfully!")
CLog("`9Enhanced by TangPiseth with advanced features")
CLog("`9Press " .. Configs.KeybindStr .. " to open menu")
CLog("`bCredits: icShark (Original) & TangPiseth (Enhanced)")

-- Send webhook notification
local localPlayer = SafeGetLocal()
local currentWorld = SafeGetWorld()
if localPlayer and currentWorld then
    local loadPayload = string.format([[{
        "embeds": [{
            "title": "icShark Proxy Loaded",
            "description": "**User:** %s\n**UserID:** %s\n**World:** %s\n**Enhanced by:** TangPiseth\n**Date:** 2025-06-10 17:54:28",
            "color": 65280,
            "footer": {
                "text": "icShark Proxy v3.0 - Enhanced Edition"
            }
        }]
    }]], localPlayer.name:gsub("`.", ""), localPlayer.userid, currentWorld.name)
    
    -- You can add your webhook URL here
    -- SendWebhook("YOUR_WEBHOOK_URL", loadPayload)
end

-- Start auto features loop in a separate thread
RunThread(AutoFeaturesLoop)
