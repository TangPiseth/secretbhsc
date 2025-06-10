-- Enhanced Growtopia Proxy Script v3.0
-- Features: REME/QEME/LEME modes, BTK Helper, Auto Convert, Advanced Automation
-- Made for TangPiseth

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
    Blues = nil,
    CurrentTax = 5,
    CurrentBet = 0,
    Player1Gems = 0,
    Player2Gems = 0,
    DisplayX = nil,
    DisplayY = nil,
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

-- Utility Functions
local function SendWebhook(url, data)
    if url ~= "" then
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
    var[1] = "`0[`9Enhanced Proxy`0] `9" .. text
    SendVariantList(var)
end

local function GetItem(id)
    local inv = GetInventory()
    if inv[id] ~= nil then
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
end

local function GetPlayerFromNetID(netid)
    for _, plr in pairs(GetPlayerList()) do
        if tonumber(plr.netid) == tonumber(netid) then
            return plr
        end
    end
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

local function AutoBankManagement()
    if CheatStates["Auto Deposit BGL"] then
        local bglAmount = GetItem(7188)
        if bglAmount >= Configs.BankThreshold then
            SendPacket(2, "action|dialog_return\ndialog_name|bank_deposit\nbgl_count|" .. bglAmount)
            CLog("Auto deposited " .. bglAmount .. " Blue Gem Lock(s)")
            Sleep(1000)
        end
    end
    
    if CheatStates["Auto Withdraw BGL"] then
        -- This would need bank balance checking, simplified version
        SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|10")
        Sleep(1000)
    end
end

-- Auto Farm Functions
local function AutoFarmTrees()
    if not CheatStates["Auto Farm"] then return end
    
    local localX = math.floor(GetLocal().pos.x / 32)
    local localY = math.floor(GetLocal().pos.y / 32)
    
    for dx = -3, 3 do
        for dy = -3, 3 do
            local checkX = localX + dx
            local checkY = localY + dy
            local tile = GetTile(checkX, checkY)
            
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
    
    local localX = math.floor(GetLocal().pos.x / 32)
    local localY = math.floor(GetLocal().pos.y / 32)
    
    for dx = -2, 2 do
        for dy = -2, 2 do
            local checkX = localX + dx
            local checkY = localY + dy
            local tile = GetTile(checkX, checkY)
            
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

-- BTK Helper Functions
local function SetupGame(PlayerPositions)
    local OldX = math.floor(GetLocal().pos.x / 32)
    local OldY = math.floor(GetLocal().pos.y / 32)
    local Magplant = GetItem(5640)
    local Chandelier = GetItem(340)

    for i = 3, #PlayerPositions do -- Skip drop position (1) and display box (2)
        local ChandelierX = PlayerPositions[i].x
        local ChandelierY = PlayerPositions[i].y
        if ChandelierX ~= 0 and ChandelierY ~= 0 then
            FindPath(ChandelierX, ChandelierY)
            Sleep(250)
            if tonumber(Magplant) ~= 0 and tonumber(Chandelier) == 0 then
                Place(ChandelierX, ChandelierY, 5640)
            elseif tonumber(Chandelier) ~= 0 and tonumber(Magplant) == 0 then
                Place(ChandelierX, ChandelierY, 340)
            elseif tonumber(Magplant) ~= 0 and tonumber(Chandelier) ~= 0 then
                Place(ChandelierX, ChandelierY, 5640)
            end
            Sleep(250)
        end
    end

    if PlayerPositions[2].x ~= 0 and PlayerPositions[2].y ~= 0 then
        FindPath(PlayerPositions[2].x, PlayerPositions[2].y) -- Display box position
        Sleep(250)
    end
    FindPath(OldX, OldY)
    
    if tonumber(GetItem(7188)) >= 100 then
        SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
    end
end

local function CountBets(PlayerPositions)
    local TotalBet = 0

    if not PlayerPositions[2] or PlayerPositions[2].x == 0 then
        return 0
    end

    local PlayerX = PlayerPositions[2].x -- Display box position
    local PlayerY = PlayerPositions[2].y

    for _, Object in pairs(GetObjectList()) do
        local ItemX = math.floor(Object.pos.x / 32)
        local ItemY = math.floor(Object.pos.y / 32)

        if ItemX == PlayerX and ItemY == PlayerY then
            if Object.id == 242 then -- World Lock
                TotalBet = TotalBet + Object.amount / 100
            elseif Object.id == 1796 then -- Diamond Lock
                TotalBet = TotalBet + Object.amount
            elseif Object.id == 7188 then -- Blue Gem Lock
                TotalBet = TotalBet + Object.amount * 100
            elseif Object.id == 11550 then -- Black Gem Lock
                TotalBet = TotalBet + Object.amount * 10000
            end
        end
    end

    return TotalBet
end

local function CheckGems(PlayerPositions)
    local GemsAmount = 0
    for i = 3, #PlayerPositions do -- Check chandelier positions
        if PlayerPositions[i].x ~= 0 and PlayerPositions[i].y ~= 0 then
            for _, Object in pairs(GetObjectList()) do
                if (Object.id == 112 and PlayerPositions[i].x == math.floor(Object.pos.x / 32) and PlayerPositions[i].y == math.floor(Object.pos.y / 32)) then
                    GemsAmount = GemsAmount + Object.amount
                end
            end
        end
    end
    return GemsAmount
end

local function StartGame()
    Configs.CurrentBet = 0
    local Player1Bet = CountBets(Configs.Player1Positions)
    local Player2Bet = CountBets(Configs.Player2Positions)
    Configs.CurrentBet = Player1Bet + Player2Bet

    local Magplant = GetItem(5640)
    local Chandelier = GetItem(340)

    if tonumber(Magplant) == 0 and tonumber(Chandelier) == 0 then
        CLog("`4You don't have a Magplant Remote or Chandelier in your inventory!")
    else
        if Configs.CurrentBet == 0 then
            SendPacket(2, "action|input\n|text|`4Both players must drop their bets.")
        elseif Player1Bet == Player2Bet then
            local BlackGemLockValue = 10000
            local BlueGemLockValue = 100
            local DiamondLockValue = 1

            local BlackGemLocks = math.floor(Configs.CurrentBet / BlackGemLockValue)
            local RemainderAfterBlack = Configs.CurrentBet % BlackGemLockValue

            local BlueGemLocks = math.floor(RemainderAfterBlack / BlueGemLockValue)
            local DiamondLocks = RemainderAfterBlack % BlueGemLockValue

            local BetBreakdown = "`2Game Started! `9Bet amount: `1" .. Configs.CurrentBet .. " DL `2[TAX: " .. Configs.CurrentTax .. "%] - "

            if BlackGemLocks > 0 then
                BetBreakdown = BetBreakdown .. tostring(BlackGemLocks) .. " BGL, "
            end
            if BlueGemLocks > 0 then
                BetBreakdown = BetBreakdown .. tostring(BlueGemLocks) .. " Blue GL, "
            end
            if DiamondLocks > 0 then
                BetBreakdown = BetBreakdown .. tostring(DiamondLocks) .. " DL, "
            end

            BetBreakdown = BetBreakdown:sub(1, -3)

            SendPacket(2, "action|input\n|text|" .. BetBreakdown)

            SetupGame(Configs.Player1Positions)
            SetupGame(Configs.Player2Positions)
        else
            SendPacket(2, "action|input\n|text|`4Bets are not equal! Player 1: " .. Player1Bet .. " DL, Player 2: " .. Player2Bet .. " DL")
        end
    end
end

local function CheckWinner()
    local TotalGemsP1 = CheckGems(Configs.Player1Positions)
    local TotalGemsP2 = CheckGems(Configs.Player2Positions)
    Configs.Player1Gems = TotalGemsP1
    Configs.Player2Gems = TotalGemsP2
    
    if TotalGemsP1 > TotalGemsP2 then
        SendPacket(2, "action|input\n|text|`2Player 1 WINS! `9P1: `2" .. TotalGemsP1 .. " gems`9, P2: `4" .. TotalGemsP2 .. " gems")
        Configs.Player1Won = true
    elseif TotalGemsP1 < TotalGemsP2 then
        SendPacket(2, "action|input\n|text|`2Player 2 WINS! `9P1: `4" .. TotalGemsP1 .. " gems`9, P2: `2" .. TotalGemsP2 .. " gems")
        Configs.Player1Won = false
    else
        SendPacket(2, "action|input\n|text|`8TIE GAME! `9Both players: `2" .. TotalGemsP1 .. " gems")
        Configs.Player1Won = false
    end
end

local function CalculateDrops(CurrentBet)
    local BlueGemLockValue = 100
    local BlackGemLockValue = 10000

    local TaxAmount = math.floor(Configs.CurrentBet * Configs.CurrentTax / 100)
    local AdjustedBet = Configs.CurrentBet - TaxAmount

    if AdjustedBet >= BlackGemLockValue then
        local BlackGemLocks = math.floor(AdjustedBet / BlackGemLockValue)
        local Remainder = AdjustedBet % BlackGemLockValue

        if BlackGemLocks > 0 then
            Sleep(250)
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550|\nitem_count|" .. BlackGemLocks)
        end

        if Remainder > 0 then
            local BlueGemLocks = math.floor(Remainder / BlueGemLockValue)
            local DiamondLocks = Remainder % BlueGemLockValue

            if BlueGemLocks > 0 then
                Sleep(250)
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. BlueGemLocks)
            end

            if DiamondLocks > 0 then
                Sleep(250)
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. DiamondLocks)
            end
        end
    elseif AdjustedBet <= 10000 and AdjustedBet > BlueGemLockValue then
        local BlueGemLocks = math.floor(AdjustedBet / BlueGemLockValue)
        local Remainder = AdjustedBet % BlueGemLockValue

        if BlueGemLocks > 0 then
            Sleep(250)
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. BlueGemLocks)
        end

        if Remainder > 0 then
            Sleep(250)
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. Remainder)
        end
    elseif AdjustedBet <= 100 then
        Sleep(250)
        SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. AdjustedBet)
    end
end

local function DropBets()
    local OldX = math.floor(GetLocal().pos.x / 32)
    local OldY = math.floor(GetLocal().pos.y / 32)
    
    if Configs.Player1Won then
        if Configs.Player1Positions[1].x ~= 0 and Configs.Player1Positions[1].y ~= 0 then
            FindPath(Configs.Player1Positions[1].x, Configs.Player1Positions[1].y) -- Drop position
            Sleep(250)
            CalculateDrops(Configs.CurrentBet)
        end
    else
        if Configs.Player2Positions[1].x ~= 0 and Configs.Player2Positions[1].y ~= 0 then
            FindPath(Configs.Player2Positions[1].x, Configs.Player2Positions[1].y) -- Drop position
            Sleep(250)
            CalculateDrops(Configs.CurrentBet)
        end
    end
    
    Sleep(250)
    FindPath(OldX, OldY)
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
    content = content .. "Auto Convert BGL Threshold=" .. Configs.AutoConvertBGLThreshold .. "\n"
    content = content .. "Auto Make BGL Amount=" .. Configs.AutoMakeBGLAmount .. "\n"
    content = content .. "Bank Threshold=" .. Configs.BankThreshold .. "\n"

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
            elseif option == "Current Tax" then
                Configs.CurrentTax = tonumber(state) or Configs.CurrentTax
            elseif option == "Farm Delay" then
                Configs.FarmDelay = tonumber(state) or Configs.FarmDelay
            elseif option == "Break Delay" then
                Configs.BreakDelay = tonumber(state) or Configs.BreakDelay
            elseif option == "Auto Convert BGL Threshold" then
                Configs.AutoConvertBGLThreshold = tonumber(state) or Configs.AutoConvertBGLThreshold
            elseif option == "Auto Make BGL Amount" then
                Configs.AutoMakeBGLAmount = tonumber(state) or Configs.AutoMakeBGLAmount
            elseif option == "Bank Threshold" then
                Configs.BankThreshold = tonumber(state) or Configs.BankThreshold
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
    if ImGui.Begin('Enhanced Growtopia Proxy v3.0 - By TangPiseth', true, ImGui.WindowFlags.Resize) then
        local CurrentSize = ImGui.GetWindowSize()
        if CurrentSize.x ~= Configs.WindowSize.x or CurrentSize.y ~= Configs.WindowSize.y then
            Configs.WindowSize = CurrentSize
        end
        
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
                    local worldName = GetWorld().name
                    SendPacket(2, "action|join_request\nname|" .. worldName)
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
            
            -- Auto Features Tab
            if ImGui.BeginTabItem("Auto Features") then
                ImGui.Columns(3, nil, false)
                
                ImGui.Text("Auto Farm/Mine:")
                for _, option in ipairs(CheatOptions.AutoFeatures) do
                    local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                    if changed then CheatStates[option] = newValue end
                end
                
                ImGui.Text("Farm Delay (ms):")
                local changed, newValue = ImGui.InputInt("##FarmDelay", Configs.FarmDelay)
                if changed then Configs.FarmDelay = math.max(50, newValue) end
                
                ImGui.Text("Break Delay (ms):")
                changed, newValue = ImGui.InputInt("##BreakDelay", Configs.BreakDelay)
                if changed then Configs.BreakDelay = math.max(50, newValue) end
                
                ImGui.NextColumn()
                
                ImGui.Text("Auto Convert:")
                for _, option in ipairs(CheatOptions.ConvertFeatures) do
                    local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                    if changed then CheatStates[option] = newValue end
                end
                
                ImGui.Text("BGL Convert Threshold:")
                changed, newValue = ImGui.InputInt("##BGLThreshold", Configs.AutoConvertBGLThreshold)
                if changed then Configs.AutoConvertBGLThreshold = math.max(1, newValue) end
                
                ImGui.Text("Auto Make BGL Amount:")
                changed, newValue = ImGui.InputInt("##MakeBGLAmount", Configs.AutoMakeBGLAmount)
                if changed then Configs.AutoMakeBGLAmount = math.max(1, newValue) end
                
                ImGui.Text("Bank Threshold:")
                changed, newValue = ImGui.InputInt("##BankThreshold", Configs.BankThreshold)
                if changed then Configs.BankThreshold = math.max(1, newValue) end
                
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
                
                if GetLocal() then
                    ImGui.Text("Current World: " .. GetWorld().name)
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
                for _, option in ipairs(CheatOptions.Visual) do
                    if option:find("eme Mode") then
                        local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then CheatStates[option] = newValue end
                    end
                end
                
                local changed, newValue = ImGui.Checkbox("Shorten Spin Text", CheatStates["Shorten Spin Text"])
                if changed then CheatStates["Shorten Spin Text"] = newValue end
                
                changed, newValue = ImGui.Checkbox("World Ban Typer", CheatStates["World Ban Typer"])
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
                
                ImGui.Text("REME Mode Info:")
                ImGui.TextWrapped("REME calculates (first digit + last digit) mod 10")
                ImGui.Separator()
                ImGui.Text("QEME Mode Info:")
                ImGui.TextWrapped("QEME shows last digit of spin number")
                ImGui.Separator()
                ImGui.Text("LEME Mode Info:")
                ImGui.TextWrapped("LEME calculates sum of digits mod 10")
                
                ImGui.Columns(1)
                ImGui.EndTabItem()
            end
            
            -- BTK Helper Tab
            if ImGui.BeginTabItem("BTK Helper") then
                ImGui.Text("Enhanced BTK (Bet The Killer) Helper")
                ImGui.Separator()
                
                ImGui.Columns(2, nil, false)
                
                ImGui.Text("Setup Instructions:")
                ImGui.TextWrapped("1. Click 'Setup BTK' button\n2. Punch 5 positions for Player 1:\n   - Drop Position\n   - Display Box\n   - 3 Chandelier positions\n3. Punch 5 positions for Player 2 in same order")
                
                if ImGui.Button("Setup BTK") then
                    Configs.BTKSetup = true
                    Configs.Player1PunchCount = 0
                    Configs.Player2PunchCount = 0
                    Configs.Player1Punched = false
                    CLog("`bBTK Setup started! Punch Player 1 positions (Drop, Display, 3x Chandelier)")
                end
                
                ImGui.SameLine()
                if ImGui.Button("Clear Setup") then
                    for i = 1, #Configs.Player1Positions do
                        Configs.Player1Positions[i].x = 0
                        Configs.Player1Positions[i].y = 0
                        Configs.Player2Positions[i].x = 0
                        Configs.Player2Positions[i].y = 0
                    end
                    Configs.Player1PunchCount = 0
                    Configs.Player2PunchCount = 0
                    Configs.Player1Punched = false
                    Configs.BTKSetup = false
                    CLog("BTK setup cleared!")
                end
                
                ImGui.Text("Tax Percentage:")
                local changed, newValue = ImGui.SliderFloat("##TaxSlider", Configs.CurrentTax, 0, 50, "%.0f%%")
                if changed then Configs.CurrentTax = newValue end
                
                ImGui.NextColumn()
                
                ImGui.Text("Game Controls:")
                if ImGui.Button("Start Game", ImVec2(100, 30)) then
                    StartGame()
                end
                ImGui.SameLine()
                if ImGui.Button("Check Winner", ImVec2(100, 30)) then
                    CheckWinner()
                end
                ImGui.SameLine()
                if ImGui.Button("Drop to Winner", ImVec2(100, 30)) then
                    DropBets()
                end
                
                ImGui.Text("Current Bet Information:")
                if Configs.CurrentBet > 0 then
                    local bglValue = math.floor(Configs.CurrentBet / 10000)
                    local blueValue = math.floor((Configs.CurrentBet % 10000) / 100)
                    local dlValue = Configs.CurrentBet % 100
                    
                    ImGui.Text("Total Bet: " .. Configs.CurrentBet .. " DL")
                    if bglValue > 0 then ImGui.Text("BGL: " .. bglValue) end
                    if blueValue > 0 then ImGui.Text("Blue GL: " .. blueValue) end
                    if dlValue > 0 then ImGui.Text("Diamond Locks: " .. dlValue) end
                    ImGui.Text("Tax Amount: " .. math.floor(Configs.CurrentBet * Configs.CurrentTax / 100) .. " DL")
                else
                    ImGui.Text("No active bet")
                end
                
                ImGui.Text("Gem Counts:")
                ImGui.Text("Player 1 Gems: " .. Configs.Player1Gems)
                ImGui.Text("Player 2 Gems: " .. Configs.Player2Gems)
                
                ImGui.Columns(1)
                ImGui.EndTabItem()
            end
            
            -- Visual & Chat Tab
            if ImGui.BeginTabItem("Visual & Chat") then
                ImGui.Columns(2, nil, false)
                
                ImGui.Text("Visual Options:")
                for _, option in ipairs(CheatOptions.Visual) do
                    if not option:find("eme Mode") then
                        local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then CheatStates[option] = newValue end
                    end
                end
                
                ImGui.Text("Pull Text:")
                local changed, newValue = ImGui.InputText("##PullText", Configs.TextPull, 128)
                if changed then Configs.TextPull = newValue end
                
                if ImGui.Button("Reset Pull Text") then
                    Configs.TextPull = "`9H`6e`9l`6l`9o {name} `9G`6a`9s`6?"
                end
                
                ImGui.NextColumn()
                
                ImGui.Text("Skin Color:")
                changed, newValue = ImGui.ColorEdit4("##SkinColor", Configs.SavedSkinColor)
                if changed then
                    Configs.SavedSkinColor = newValue
                end
                
                if ImGui.Button("Apply Skin Color") then
                    local red = math.floor(Configs.SavedSkinColor.x * 255)
                    local green = math.floor(Configs.SavedSkinColor.y * 255)
                    local blue = math.floor(Configs.SavedSkinColor.z * 255)
                    local transparency = math.floor((1 - Configs.SavedSkinColor.w) * 255)
                    SendPacket(2, string.format("action|dialog_return\ndialog_name|skinpicker\nred|%d\ngreen|%d\nblue|%d\ntransparency|%d", red, green, blue, transparency))
                end
                
                if ImGui.Button("Random Nickname") then
                    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
                    local nick = ""
                    for i = 1, 8 do
                        local randIndex = math.random(1, #chars)
                        nick = nick .. chars:sub(randIndex, randIndex)
                    end
                    SendPacket(2, "action|input\n|text|/nick " .. nick)
                end
                
                ImGui.Columns(1)
                ImGui.EndTabItem()
            end
            
            -- Spam & SB Tab
            if ImGui.BeginTabItem("Spam & SB") then
                ImGui.Columns(2, nil, false)
                
                ImGui.Text("Auto Spam:")
                ImGui.Text("Spam Text:")
                local changed, newValue = ImGui.InputText("##SpamText", Configs.SpamText, 128)
                if changed then Configs.SpamText = newValue end
                
                ImGui.Text("Spam Delay (ms):")
                changed, newValue = ImGui.InputInt("##SpamDelay", Configs.SpamDelay)
                if changed then Configs.SpamDelay = math.max(100, newValue) end
                
                if Configs.IsSpamming then
                    if ImGui.Button("Stop Spamming") then
                        Configs.IsSpamming = false
                    end
                else
                    if ImGui.Button("Start Spamming") then
                        if Configs.SpamText ~= "" then
                            Configs.IsSpamming = true
                        else
                            CLog("Please set spam text first!")
                        end
                    end
                end
                
                ImGui.NextColumn()
                
                ImGui.Text("Super Broadcast:")
                ImGui.Text("SB Text:")
                changed, newValue = ImGui.InputText("##SBText", Configs.SbText, 128)
                if changed then Configs.SbText = newValue end
                
                ImGui.Text("SB Count: " .. Configs.SbAmount)
                
                if Configs.IsSbing then
                    if ImGui.Button("Stop SB") then
                        Configs.IsSbing = false
                    end
                else
                    if ImGui.Button("Start SB") then
                        if Configs.SbText ~= "" then
                            Configs.IsSbing = true
                            Configs.SbStarted = true
                        else
                            CLog("Please set SB text first!")
                        end
                    end
                end
                
                if ImGui.Button("Reset SB Count") then
                    Configs.SbAmount = 0
                end
                
                ImGui.Text("Webhook URL:")
                changed, newValue = ImGui.InputText("##Webhook", Configs.Webhook, 256)
                if changed then Configs.Webhook = newValue end
                
                if ImGui.Button("Test Webhook") then
                    if Configs.Webhook ~= "" then
                        local testPayload = '{"content": "Enhanced Proxy webhook test!"}'
                        SendWebhook(Configs.Webhook, testPayload)
                        CLog("Webhook test sent!")
                    end
                end
                
                ImGui.Columns(1)
                ImGui.EndTabItem()
            end
            
            -- Logs Tab
            if ImGui.BeginTabItem("Logs") then
                ImGui.Columns(2, nil, false)
                
                ImGui.Text("Drop Logs:")
                ImGui.BeginChild("DropLogs", ImVec2(0, 200), true)
                for _, log in ipairs(Configs.DropList) do
                    ImGui.Text(log)
                end
                ImGui.EndChild()
                
                if ImGui.Button("Clear Drop Logs") then
                    Configs.DropList = {}
                end
                
                ImGui.NextColumn()
                
                ImGui.Text("Pickup Logs:")
                ImGui.BeginChild("PickupLogs", ImVec2(0, 200), true)
                for _, log in ipairs(Configs.PickUpList) do
                    ImGui.Text(log)
                end
                ImGui.EndChild()
                
                if ImGui.Button("Clear Pickup Logs") then
                    Configs.PickUpList = {}
                end
                
                ImGui.Columns(1)
                
                if ImGui.Button("Export All Logs") then
                    local logFile = "ProxyLogs_" .. os.date("%Y%m%d_%H%M%S") .. ".txt"
                    local file = io.open(logFile, "w")
                    if file then
                        file:write("=== DROP LOGS ===\n")
                        for _, log in ipairs(Configs.DropList) do
                            file:write(log .. "\n")
                        end
                        file:write("\n=== PICKUP LOGS ===\n")
                        for _, log in ipairs(Configs.PickUpList) do
                            file:write(log .. "\n")
                        end
                        file:close()
                        CLog("All logs exported to " .. logFile)
                    end
                end
                
                ImGui.EndTabItem()
            end
            
            -- Settings Tab
            if ImGui.BeginTabItem("Settings") then
                ImGui.Text("Enhanced Growtopia Proxy v3.0")
                ImGui.Text("Made by TangPiseth - " .. os.date("%Y-%m-%d"))
                ImGui.Separator()
                
                ImGui.Text("Menu Keybind:")
                local changed, newValue = ImGui.InputText("##MenuKey", Configs.KeybindStr, 16)
                if changed then Configs.KeybindStr = newValue end
                
                if Configs.IsKeySelecting then
                    ImGui.Text("Press any key to set keybind...")
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
                
                ImGui.EndTabItem()
            end
            
            ImGui.EndTabBar()
        end
        
        ImGui.End()
    end
    
    -- BTK Settings Window
    if Configs.ShowSettingsMenu then
        ImGui.SetNextWindowSize(ImVec2(400, 500))
        if ImGui.Begin("BTK Position Settings", true, ImGui.WindowFlags.Resize) then
            ImGui.Text("Player 1 Positions:")
            ImGui.BeginChild("P1Positions", ImVec2(0, 150), true)
            local posNames = {"Drop Position", "Display Box", "Chandelier 1", "Chandelier 2", "Chandelier 3"}
            for i, pos in ipairs(Configs.Player1Positions) do
                if pos.x ~= 0 or pos.y ~= 0 then
                    ImGui.Text(posNames[i] .. ": (" .. pos.x .. ", " .. pos.y .. ")")
                end
            end
            if Configs.Player1Gems > 0 then
                ImGui.Text("Gems: " .. Configs.Player1Gems)
            end
            ImGui.EndChild()
            
            ImGui.Text("Player 2 Positions:")
            ImGui.BeginChild("P2Positions", ImVec2(0, 150), true)
            for i, pos in ipairs(Configs.Player2Positions) do
                if pos.x ~= 0 or pos.y ~= 0 then
                    ImGui.Text(posNames[i] .. ": (" .. pos.x .. ", " .. pos.y .. ")")
                end
            end
            if Configs.Player2Gems > 0 then
                ImGui.Text("Gems: " .. Configs.Player2Gems)
            end
            ImGui.EndChild()
            
            if ImGui.Button("Clear All Positions") then
                for i = 1, #Configs.Player1Positions do
                    Configs.Player1Positions[i].x = 0
                    Configs.Player1Positions[i].y = 0
                    Configs.Player2Positions[i].x = 0
                    Configs.Player2Positions[i].y = 0
                end
                Configs.Player1PunchCount = 0
                Configs.Player2PunchCount = 0
                Configs.Player1Punched = false
                Configs.BTKSetup = false
                CLog("All BTK positions cleared!")
            end
            
            ImGui.End()
        end
    end
end

-- Enhanced Variant Handler
local function VarlistHandler(varlist)
    -- Spin detection with REME/QEME/LEME
    if varlist[0]:find("OnTalkBubble") then
        if varlist[2]:find("spun") and (varlist[2]:match("`4(%d+)") or varlist[2]:match("`2(%d+)") or varlist[2]:match("`b(%d+)")) then
            local FinalText = ""
            local SpinNumber = 0
            local SpinColor = ""
            local FilterText = varlist[2]:gsub("``", ""):gsub("`.", "")
            local NetID = tonumber(varlist[1])
            
            if FilterText:find("spun the wheel and got") and not FilterText:find("%[FAKE%]") then
                SpinNumber = tonumber(FilterText:match("the wheel and got (%d+)"))
                
                -- Determine spin color
                if (SpinNumber > 10 and SpinNumber < 19) or SpinNumber > 28 then
                    SpinColor = SpinNumber % 2 == 0 and "`4" or "`b"
                else
                    if SpinNumber == 0 then
                        SpinColor = "`2"
                    else
                        SpinColor = SpinNumber % 2 == 0 and "`b" or "`4"
                    end
                end
                
                if CheatStates["Shorten Spin Text"] then
                    FinalText = "`0[`2REAL`0] " .. varlist[2]:sub(4,-1):match("(%g+)") .. " `0spun " .. SpinColor .. SpinNumber .. "`0!"
                else
                    FinalText = "`0[`2REAL`0] " .. varlist[2]
                end
                
                local TextForList = "`0[`2REAL`0] " .. varlist[2]:sub(4,-1):match("(%g+)"):gsub("`.", "") .. " spun " .. SpinNumber .. "!"
                table.insert(Configs.SpinList, os.date("%X") .. " (" .. GetPlayerFromNetID(varlist[1]).userid .. ") " .. TextForList:sub(14,-1) .. " in " .. GetWorld().name .. "\n")
                
                -- REME Mode calculation
                if CheatStates["Reme Mode"] then
                    local remeResult
                    if SpinNumber >= 10 then
                        local firstDigit = math.floor(SpinNumber / 10)
                        local lastDigit = SpinNumber % 10
                        remeResult = (firstDigit + lastDigit) % 10
                    else
                        remeResult = SpinNumber
                    end
                    FinalText = FinalText .. " `9R`6E`9M`6E`9: `2" .. remeResult
                end
                
                -- LEME Mode calculation
                if CheatStates["Leme Mode"] then
                    local lemeResult = 0
                    local ResultsText = ""
                    
                    if SpinNumber == 1 or SpinNumber == 10 or SpinNumber == 29 then
                        lemeResult = 1
                        ResultsText = " `c[3x]"
                    elseif SpinNumber == 19 or SpinNumber == 28 or SpinNumber == 0 then
                        lemeResult = 0
                        ResultsText = " `c[4x]"
                    elseif SpinNumber == 9 or SpinNumber == 18 or SpinNumber == 27 or SpinNumber == 36 then
                        lemeResult = 9
                    else
                        local digitSum = 0
                        local tempNum = SpinNumber
                        while tempNum > 0 do
                            digitSum = digitSum + (tempNum % 10)
                            tempNum = math.floor(tempNum / 10)
                        end
                        lemeResult = digitSum % 10
                    end
                    FinalText = FinalText .. " `9L`6E`9M`6E`9: `2" .. lemeResult .. ResultsText
                end
                
                -- QEME Mode calculation
                if CheatStates["Qeme Mode"] then
                    local qemeResult = SpinNumber % 10
                    FinalText = FinalText .. " `9Q`6E`9M`6E`9: `2" .. qemeResult
                end
            else
                -- Fake spin detected
                FinalText = "`0[`4FAKE`0] " .. varlist[2]
                local TextForList = "`0[`4FAKE`0] " .. varlist[2]:gsub("`.", "")
                table.insert(Configs.SpinListFake, os.date("%X") .. " (" .. GetPlayerFromNetID(varlist[1]).userid .. ") " .. TextForList:sub(14,-1) .. " in " .. GetWorld().name .. "\n")
                
                for _, player in pairs(GetPlayerList()) do
                    if player.netid == NetID then
                        Configs.TyperUserID = math.floor(player.userid)
                        Configs.Name = player.name:gsub("@", ""):gsub("`.", ""):gsub("%b()", "")
                        Configs.TyperText = varlist[2]:gsub("`.", "")
                        
                        if CheatStates["World Ban Typer"] then
                            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. GetPlayerFromUserID(Configs.TyperUserID).netid .. "|\nbuttonClicked|world_ban")
                            Warn("`4Banned `0" .. Configs.Name .. "`4 for typing wheel text!")
                        else
                            CLog(Configs.Name .. " `4tried to type wheel text! UserID: " .. Configs.TyperUserID)
                            Warn(Configs.Name .. " `4tried to type wheel text!")
                        end
                    end
                end
            end
            
            local var = {}
            var[0] = "OnTalkBubble"
            var[1] = varlist[1]
            var[2] = FinalText
            SendVariantList(var)
            return true
        end
        
        -- Encrypted talk handler
        if CheatStates["Encrypted Talk"] then
            local text = varlist[2]:gsub("`.", "")
            if text:match("^[A-Za-z0-9+/=]*$") and #text % 4 == 0 and #text > 8 then
                local function DecodeBase64(data)
                    data = string.gsub(data, '[^' .. Configs.Base64Chars .. '=]', '')
                    return (data:gsub('.', function(char)
                        if char == '=' then return '' end
                        local index = Configs.Base64Chars:find(char) - 1
                        local binary = ''
                        for i = 6, 1, -1 do
                            binary = binary .. (index % 2^i - index % 2^(i-1) > 0 and '1' or '0')
                        end
                        return binary
                    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(binaryChunk)
                        if #binaryChunk ~= 8 then return '' end
                        local charCode = 0
                        for i = 1, 8 do
                            charCode = charCode + (binaryChunk:sub(i, i) == '1' and 2^(8-i) or 0)
                        end
                        return string.char(charCode)
                    end))
                end
                
                local decryptedText = DecodeBase64(text)
                CLog("`b(Encrypted): " .. decryptedText)
                TalkBubble("`2(Encrypted): `0" .. decryptedText)
            end
        end
    end
    
    -- Console message handler
    if varlist[0]:find("OnConsoleMessage") then
        local FilterText = varlist[1]:gsub("`.", "")
        
        -- Watermark
        if CheatStates["Watermark"] and not varlist[1]:find("%[Enhanced Proxy%]") then
            varlist[1] = "`0[`9Enhanced Proxy`0] " .. varlist[1]
            SendVariantList(varlist)
            return true
        end
        
        -- Anti spammer slave
        if CheatStates["Anti Spammer Slave"] and varlist[1]:find("'s Spammer Slave") then
            return true
        end
        
        -- Pickup logging
        if varlist[1]:find("Collected") and not varlist[1]:find("<") then
            local Amount, ItemName = FilterText:match("Collected  (%d+) (.+)%.")
            if Amount and ItemName then
                table.insert(Configs.PickUpList, os.date("%X") .. ": Picked up " .. Amount .. " " .. ItemName .. " in " .. GetWorld().name)
            end
        end
        
        -- SB delay detection
        if varlist[1]:match("has been queued:") then
            local Minutes, Seconds = varlist[1]:match("in ~(%d+) min[s]?, (%d+) sec[s]?")
            Minutes = tonumber(Minutes) or 0
            Seconds = tonumber(Seconds) or 0
            Configs.SbDelay = math.max(((Minutes * 60) + Seconds) * 1000, 91000)
        end
    end
    
    -- Dialog handlers
    if varlist[0] == "OnDialogRequest" then
        local dialog = varlist[1]
        
        -- Quick storage box
        if dialog:find("embed_data|hash|") and CheatStates["Quick Storage Box"] and dialog:find("Storage Box") then
            local ItemAmount = dialog:match("add_label|small|You have `w(%d+)")
            local StorageX, StorageY, Hash = dialog:match("embed_data|x|(%d+)\nembed_data|y|(%d+)\nembed_data|hash|(%d+)")
            if ItemAmount and StorageX and StorageY and Hash then
                SendPacket(2, "action|dialog_return\ndialog_name|storage\nx|" .. StorageX .. "|\ny|" .. StorageY .. "|\nhash|" .. Hash .. "|\nbuttonClicked|withdraw\n\nitem_count|" .. ItemAmount)
                return true
            end
        end
        
        -- Quick display block
        if dialog:find("`wEdit Display Block") and CheatStates["Quick Display Block"] then
            Configs.DisplayX, Configs.DisplayY = dialog:match("embed_data|x|(%d+)\nembed_data|y|(%d+)")
            if Configs.DisplayX and Configs.DisplayY then
                Wrench(0, 0)
                Sleep(90)
                SendPacket(2, "action|dialog_return\ndialog_name|displayblock_edit\nx|" .. Configs.DisplayX .. "|\ny|" .. Configs.DisplayY .. "|\nbuttonClicked|get_display_item")
                return true
            end
        end
        
        -- Quick donation box
        if dialog:find("Donation Box") and CheatStates["Quick Donation Box"] then
            local DonationX, DonationY = dialog:match("embed_data|x|(%d+)\nembed_data|y|(%d+)")
            if DonationX and DonationY then
                SendPacket(2, "action|dialog_return\ndialog_name|donate_edit\nx|" .. DonationX .. "|\ny|" .. DonationY .. "|\nbuttonClicked|withdrawall")
                return true
            end
        end
        
        -- Wrench get modal
        if dialog:find("'s Inventory") and CheatStates["Wrench Get Modal"] then
            local ItemNames = {
                ["Blue Gem Lock"] = 0,
                ["Diamond Lock"] = 0,
                ["Black Gem Lock"] = 0,
                ["World Lock"] = 0
            }
            
            local CustomNumbers = {
                ["Black Gem Lock"] = "b",
                ["Blue Gem Lock"] = "e",
                ["Diamond Lock"] = "1",
                ["World Lock"] = "9"
            }
            
            local BankAmount = dialog:match("add_smalltext|Blue Gem Locks in the Bank: `$(%d+)``|")
            BankAmount = BankAmount and tonumber(BankAmount) or 0
            
            for ItemName, _ in pairs(ItemNames) do
                local _, Amount = dialog:match("add_button_with_icon||`$" .. ItemName .. "``|staticframe|(%d+)|(%d+)|")
                if Amount then
                    ItemNames[ItemName] = tonumber(Amount)
                end
            end
            
            ItemNames["Blue Gem Lock"] = ItemNames["Blue Gem Lock"] + BankAmount
            
            -- Auto convert to BGL if over threshold
            if ItemNames["Blue Gem Lock"] > 100 then
                local excess = ItemNames["Blue Gem Lock"] - 100
                local bglGain = math.floor(excess / 100)
                local remaining = excess % 100 + 100
                ItemNames["Black Gem Lock"] = ItemNames["Black Gem Lock"] + bglGain
                ItemNames["Blue Gem Lock"] = remaining
            end
            
            local FirstLock = true
            local TotalModal = "`9Modal: "
            local ItemOrder = {"Black Gem Lock", "Blue Gem Lock", "Diamond Lock", "World Lock"}
            
            for _, ItemName in ipairs(ItemOrder) do
                local Amount = ItemNames[ItemName]
                if Amount > 0 then
                    if not FirstLock then
                        TotalModal = TotalModal .. "`0, "
                    end
                    TotalModal = TotalModal .. "`0" .. Amount .. " `" .. CustomNumbers[ItemName] .. ItemName .. (Amount > 1 and "s" or "")
                    FirstLock = false
                end
            end
            
            if TotalModal == "`9Modal: " then
                TotalModal = "`9Player has no modal"
            end
            
            CLog(TotalModal)
            return true
        end
        
        -- Fast actions blocking
        if dialog:find("View Inventory") and (CheatStates["Fast Pull"] or CheatStates["Fast Kick"] or CheatStates["Fast World Ban"] or CheatStates["Fast Trade"]) then
            return true
        end
    end
    
    -- Block SDB
    if varlist[0]:find("OnSDBroadcast") and CheatStates["Block SDB"] then
        return true
    end
    
    -- Spawn handling
    if varlist[0]:find("OnSpawn") then
        if varlist[1]:match("name|Spawning...") and CheatStates["Anti Spammer Slave"] then
            return true
        end
        
        -- Blacklist checking
        local UserID = varlist[1]:match("userID|(%d+)")
        if UserID then
            for _, blacklistUID in pairs(FileRead("BlacklistedUserIDS.txt")) do
                if UserID == blacklistUID then
                    SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. varlist[1]:match("netID|(%d+)") .. "|\nbuttonClicked|world_ban")
                    Overlay("`4Blacklisted user detected: " .. varlist[1]:match("name|(%g+)"))
                    break
                end
            end
        end
    end
end

-- Enhanced Packet Handler
local function PacketHandler(type, pkt)
    -- Fast drop
    if pkt:find("action|drop\n|itemID|") and CheatStates["Fast Drop"] then
        local ItemID = pkt:match("itemID|(%d+)")
        local ItemAmount = GetItem(tonumber(ItemID))
        SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. ItemID .. "|\nitem_count|" .. ItemAmount)
        return true
    end
    
    -- Fast trash
    if pkt:find("action|trash\n|itemID|") and CheatStates["Fast Trash"] then
        local ItemID = pkt:match("itemID|(%d+)")
        local ItemAmount = GetItem(tonumber(ItemID))
        SendPacket(2, "action|dialog_return\ndialog_name|trash\nitem_trash|" .. ItemID .. "|\nitem_count|" .. ItemAmount)
        return true
    end
    
    -- Fast actions on wrench
    if pkt:find("action|wrench\n|netid|") then
        local NetID = pkt:match("action|wrench\n|netid|(%d+)")
        
        if CheatStates["Fast Pull"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|pull")
            if CheatStates["Pull Type Gas"] then
                if Configs.TextPull:match("{name}") then
                    local player = GetPlayerFromNetID(NetID)
                    if player then
                        local playerName = player.name:gsub("%b()", ""):gsub("`.", ""):gsub("%[.-%]", "")
                        local chatText = Configs.TextPull:gsub("{name}", playerName)
                        SendPacket(2, "action|input\n|text|" .. chatText)
                    end
                else
                    SendPacket(2, "action|input\n|text|" .. Configs.TextPull)
                end
            end
        elseif CheatStates["Fast Kick"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|kick")
        elseif CheatStates["Fast World Ban"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|world_ban")
        elseif CheatStates["Fast Trade"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|trade")
        elseif CheatStates["Fast Inventory"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|viewinv")
        end
    end
    
    -- Command handling
    if pkt:find("action|input\n|text|") then
        local Command = pkt:match("text|(.+)")
        
        -- Toggle commands
        local toggles = {
            ["/reme"] = "Reme Mode",
            ["/qeme"] = "Qeme Mode",
            ["/leme"] = "Leme Mode",
            ["/watermark"] = "Watermark",
            ["/emojis"] = "Emojis",
            ["/modfly"] = "Modfly",
            ["/antibounce"] = "Antibounce",
            ["/fdrop"] = "Fast Drop",
            ["/ftrash"] = "Fast Trash",
            ["/fpull"] = "Fast Pull",
            ["/fkick"] = "Fast Kick",
            ["/fban"] = "Fast World Ban",
            ["/autofarm"] = "Auto Farm",
            ["/autoconvert"] = "Auto Convert DL"
        }
        
        for cmd, mode in pairs(toggles) do
            if Command:find("^" .. cmd .. "$") then
                CheatStates[mode] = not CheatStates[mode]
                local status = CheatStates[mode] and "`2enabled" or "`4disabled"
                CLog(mode .. " is now " .. status)
                return true
            end
        end
        
        -- Drop commands
        if Command:find("^/dw%s+%d+$") then
            local amount = Command:match("/dw%s+(%d+)")
            if GetItem(242) >= tonumber(amount) then
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242\nitem_count|" .. amount)
                if CheatStates["Drop Text"] then
                    SendPacket(2, "action|input\n|text|`9Dropped " .. amount .. " World Lock(s)")
                end
            else
                CLog("`4Not enough World Locks!")
            end
            return true
        end
        
        if Command:find("^/dd%s+%d+$") then
            local amount = Command:match("/dd%s+(%d+)")
            if GetItem(1796) >= tonumber(amount) then
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796\nitem_count|" .. amount)
                if CheatStates["Drop Text"] then
                    SendPacket(2, "action|input\n|text|`9Dropped " .. amount .. " Diamond Lock(s)")
                end
            else
                CLog("`4Not enough Diamond Locks!")
            end
            return true
        end
        
        if Command:find("^/db%s+%d+$") then
            local amount = Command:match("/db%s+(%d+)")
            local bglAmount = GetItem(7188)
            local blackAmount = GetItem(11550)
            
            if bglAmount >= tonumber(amount) then
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188\nitem_count|" .. amount)
                if CheatStates["Drop Text"] then
                    SendPacket(2, "action|input\n|text|`9Dropped " .. amount .. " Blue Gem Lock(s)")
                end
            elseif blackAmount >= 1 then
                SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
                Sleep(150)
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188\nitem_count|" .. amount)
                if CheatStates["Drop Text"] then
                    SendPacket(2, "action|input\n|text|`9Auto converted and dropped " .. amount .. " Blue Gem Lock(s)")
                end
            else
                CLog("`4Not enough Blue Gem Locks or Black Gem Locks to convert!")
            end
            return true
        end
        
        -- Utility commands
        if Command:find("^/res$") then
            SendPacket(2, "action|respawn")
            return true
        end
        
        if Command:find("^/relog$") then
            local var = {}
            var[0] = "OnReconnect"
            SendVariantList(var)
            return true
        end
        
        if Command:find("^/exit$") then
            SendPacket(3, "action|quit_to_exit")
            return true
        end
        
        if Command:find("^/rworld$") then
            local randomWorld = "PROXY" .. math.random(1000, 9999)
            SendPacket(2, "action|join_request\nname|" .. randomWorld)
            return true
        end
        
        if Command:find("^/rnick$") then
            local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
            local nick = ""
            for i = 1, 8 do
                local randIndex = math.random(1, #chars)
                nick = nick .. chars:sub(randIndex, randIndex)
            end
            SendPacket(2, "action|input\n|text|/nick " .. nick)
            return true
        end
        
        -- Bank commands
        if Command:find("^/wd%s+%d+$") then
            local amount = Command:match("/wd%s+(%d+)")
            SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|" .. amount)
            return true
        end
        
        if Command:find("^/depo%s+%d+$") then
            local amount = Command:match("/depo%s+(%d+)")
            SendPacket(2, "action|dialog_return\ndialog_name|bank_deposit\nbgl_count|" .. amount)
            return true
        end
        
        -- Convert commands
        if Command:find("^/blue$") then
            SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
            return true
        end
        
        if Command:find("^/black$") then
            SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
            return true
        end
        
        -- Watermark for chat
        if CheatStates["Emojis"] and CheatStates["Watermark"] and not Command:find("/") then
            local randomEmoji = Configs.RandomEmojis[math.random(1, #Configs.RandomEmojis)]
            SendPacket(2, "action|input\n|text|`0[`9Enhanced Proxy`0] " .. randomEmoji .. " : " .. Command)
            return true
        elseif CheatStates["Watermark"] and not Command:find("/") then
            SendPacket(2, "action|input\n|text|`0[`9Enhanced Proxy`0] : " .. Command)
            return true
        end
    end
end

-- Enhanced Raw Packet Handler
local function RawPacketHandler(pkt)
    -- Anti pickup
    if pkt.type == 11 and CheatStates["Anti Pickup"] then
        return true
    end
    
    -- Anti freeze
    if pkt.type == 20 and GetLocal() and pkt.netid == GetLocal().netid then
        if pkt.y < 20 and CheatStates["Anti Freeze"] then
            CLog("Blocked freeze attempt!")
            return true
        end
    end
    
    -- Auto convert on telephone
    if pkt.type == 3 and pkt.value == 32 then
        if CheatStates["Convert DL to BGL"] then
            local tile = GetTile(pkt.px, pkt.py)
            if tile and tile.fg == 3898 then -- Telephone
                SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|" .. pkt.px .. "|\ny|" .. pkt.py .. "|\nbuttonClicked|bglconvert")
                return true
            end
        end
        
        if CheatStates["Quick Buy Champagne"] then
            local tile = GetTile(pkt.px, pkt.py)
            if tile and tile.fg == 3898 then -- Telephone
                SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|" .. pkt.px .. "|\ny|" .. pkt.py .. "|\nbuttonClicked|getchamp")
                return true
            end
        end
    end
    
    -- BTK setup punch detection
    if pkt.type == 0 and (pkt.state == 2592 or pkt.state == 2608) and Configs.BTKSetup then
        local PosX = pkt.px
        local PosY = pkt.py
        
        -- Player 1 setup
        if Configs.Player1PunchCount < 5 and not Configs.Player1Punched then
            Configs.Player1Positions[Configs.Player1PunchCount + 1].x = PosX
            Configs.Player1Positions[Configs.Player1PunchCount + 1].y = PosY
            
            local posNames = {"Drop Position", "Display Box", "Chandelier 1", "Chandelier 2", "Chandelier 3"}
            CLog("Set Player 1 " .. posNames[Configs.Player1PunchCount + 1] .. " to: (" .. PosX .. ", " .. PosY .. ")")
            
            Configs.Player1PunchCount = Configs.Player1PunchCount + 1
            if Configs.Player1PunchCount == 5 then
                CLog("`2Player 1 setup complete! Now punch Player 2 positions.")
                Configs.Player1Punched = true
            end
        -- Player 2 setup
        elseif Configs.Player1Punched and Configs.Player2PunchCount < 5 then
            Configs.Player2Positions[Configs.Player2PunchCount + 1].x = PosX
            Configs.Player2Positions[Configs.Player2PunchCount + 1].y = PosY
            
            local posNames = {"Drop Position", "Display Box", "Chandelier 1", "Chandelier 2", "Chandelier 3"}
            CLog("Set Player 2 " .. posNames[Configs.Player2PunchCount + 1] .. " to: (" .. PosX .. ", " .. PosY .. ")")
            
            Configs.Player2PunchCount = Configs.Player2PunchCount + 1
            if Configs.Player2PunchCount == 5 then
                CLog("`2BTK Setup complete! You can now use BTK functions.")
                Configs.BTKSetup = false
            end
        end
    end
    
    -- Drop logging
    if pkt.type == 14 and pkt.padding4 ~= 0 and pkt.netid == -1 and GetLocal() and pkt.snetid == GetLocal().netid then
        local itemInfo = GetItemInfo(pkt.value)
        if itemInfo then
            table.insert(Configs.DropList, os.date("%X") .. ": Dropped " .. math.floor(pkt.padding4) .. " " .. itemInfo.name .. " in " .. GetWorld().name)
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
        if GetLocal() then
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
            
            -- Auto bank management
            AutoBankManagement()
            
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
            if CheatStates["Auto Respawn"] and GetLocal().health <= 0 then
                SendPacket(2, "action|respawn")
                Sleep(1000)
            end
            
            -- Auto spam
            if Configs.IsSpamming and Configs.SpamText ~= "" then
                SendPacket(2, "action|input\n|text|" .. Configs.SpamText)
                Sleep(Configs.SpamDelay)
            end
            
            -- Auto SB
            if Configs.IsSbing and Configs.SbText ~= "" then
                SendPacket(2, "action|input\n|text|/sb " .. Configs.SbText)
                Configs.SbAmount = Configs.SbAmount + 1
                
                if CheatStates["Watermark"] then
                    SendPacket(2, "action|input\n|text|`0[`9Enhanced Proxy`0] `2SB sent! Count: " .. Configs.SbAmount)
                end
                
                if Configs.Webhook ~= "" then
                    local sbPayload = string.format([[{
                        "embeds": [{
                            "title": "Auto SB",
                            "description": "Player: %s\nWorld: %s\nSB Count: %d\nTime: %s",
                            "color": 2096896
                        }]
                    }]], GetLocal().name:gsub("`.", ""), GetWorld().name, Configs.SbAmount, os.date("%H:%M:%S"))
                    SendWebhook(Configs.Webhook, sbPayload)
                end
                
                Sleep(Configs.SbDelay)
            end
        end
        
        Sleep(100) -- Main loop delay
    end
end

-- Hook registration
AddHook("OnInput", "InputDetector", InputDetector)
AddHook("onvariant", "VarlistHandler", VarlistHandler)
AddHook("onsendpacket", "PacketHandler", PacketHandler)
AddHook("onsendpacketraw", "RawPacketHandler", RawPacketHandler)
AddHook("OnDraw", "MainMenu", MainMenu)

-- Initialize
LoadSettings()
CLog("`2Enhanced Growtopia Proxy v3.0 loaded successfully!")
CLog("`9Features: REME/QEME/LEME, BTK Helper, Auto Convert, Advanced Automation")
CLog("`9Press " .. Configs.KeybindStr .. " to open menu")
CLog("`9Made by TangPiseth - " .. os.date("%Y-%m-%d"))

-- Send webhook notification
if GetLocal() then
    local loadPayload = string.format([[{
        "embeds": [{
            "title": "Enhanced Proxy Loaded",
            "description": "**User:** %s\n**UserID:** %s\n**World:** %s\n**Time:** %s",
            "color": 65280,
            "footer": {
                "text": "Enhanced Growtopia Proxy v3.0"
            }
        }]
    }]], GetLocal().name:gsub("`.", ""), GetLocal().userid, GetWorld().name, os.date("%Y-%m-%d %H:%M:%S"))
    
    -- You can add your webhook URL here
    -- SendWebhook("YOUR_WEBHOOK_URL", loadPayload)
end

-- Start auto features loop
RunThread(AutoFeaturesLoop)
