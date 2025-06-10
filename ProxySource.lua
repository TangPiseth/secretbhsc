local AuthorizedIDs = {}

local content = MakeRequest("https://raw.githubusercontent.com/DuxiiYT/BotHax-Proxy/refs/heads/main/AuthorizationIDs.txt", "GET").content

for id in content:gmatch("[^\r\n]+") do
    AuthorizedIDs[#AuthorizedIDs + 1] = tonumber(id)
end

local Configs = {
    IsMenuVisible = true,
    SpamText = "",
    ShowSettingsMenu = false,
    SpamDelay = 0,
    IsSpamming = false,
    IsSbing = false,
    SbAmount = 0,
    HasExecuted = false,
    SbDelay = 90000,
    SbText = "",
    TextPull = "`9H`6e`9l`6l`9o {name} `9G`6a`9s`6?",
    Key = 118,
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
    WindowSize = ImVec2(800, 400),
    FileName = "ProxyOpts.txt",
    RandomEmojis = {"(alien)", "(megaphone)", "(wl)", "(mad)", "(gems)", "(party)", "(wow)", "(troll)", "(moyai)", "(weary)", "(sigh)", "(music)", "(kiss)", "(heart)", "(agree)", "(dance)", "(build)", "(vend)", "(bunny)", "(peace)", "(terror)", "(pine)", "(football)", "(fireworks)", "(song)", "(pizza)", "(shamrock)", "(cake)"},
    Player1Positions = {{x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}},
    Player2Positions = {{x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 0}},
}

local CheatOptions = {
    FastCommands = {
        "Fast Drop", "Fast Trash", "Fast Pull", "Fast Kick", "Fast World Ban", "Fast Trade", "Fast Inventory"
    },
    AntiCommands = {
        "Anti Freeze", "Anti Spammer Slave", "Anti Pickup", "Block SDB"
    },
    QuickCommands = {
        "Quick Display Block", "Quick Donation Box", "Quick Storage Box", "Quick Buy Champagne", "Convert DL to BGL"
    },
    RandomCommands = {
        "Encrypted Talk", "Modfly", "Antibounce", "Blacklist Mode"
    },
    Visual = {
        "Reme Mode", "Qeme Mode", "Leme Mode", "World Ban Typer", "Send Typer Text Modchat", "Pull Type Gas", "Shorten Spin Text", "Drop Text", "Wrench Get Modal", "Watermark", "Emojis", "Show Command Text"
    }
}

local KeyCodes = {
    Lbutton = 1,
    Rbutton = 2,
    Xbutton1 = 5,
    Xbutton2 = 6,
    Cancel = 3,
    Mbutton = 4,
    Back = 8,
    Tab = 9,
    Clear = 12,
    Return = 13,
    Shift = 16,
    Control = 17,
    Menu = 18,
    Pause = 19,
    Capital = 20,
    Escape = 27,
    Space = 32,
    Prior = 33,
    Next = 34,
    End = 35,
    Home = 36,
    Left = 37,
    Up = 38,
    Right = 39,
    Down = 40,
    Select = 41,
    Print = 42,
    Execute = 43,
    Snapshot = 44,
    Insert = 45,
    Delete = 46,
    Help = 47,
    Num0 = 48,
    Num1 = 49,
    Num2 = 50,
    Num3 = 51,
    Num4 = 52,
    Num5 = 53,
    Num6 = 54,
    Num7 = 55,
    Num8 = 56,
    Num9 = 57,
    A = 65,
    B = 66,
    C = 67,
    D = 68,
    E = 69,
    F = 70,
    G = 71,
    H = 72,
    I = 73,
    J = 74,
    K = 75,
    L = 76,
    M = 77,
    N = 78,
    O = 79,
    P = 80,
    Q = 81,
    R = 82,
    S = 83,
    T = 84,
    U = 85,
    V = 86,
    W = 87,
    X = 88,
    Y = 89,
    Z = 90,
    Lwin = 91,
    Rwin = 92,
    Apps = 93,
    Numpad0 = 96,
    Numpad1 = 97,
    Numpad2 = 98,
    Numpad3 = 99,
    Numpad4 = 100,
    Numpad5 = 101,
    Numpad6 = 102,
    Numpad7 = 103,
    Numpad8 = 104,
    Numpad9 = 105,
    Multiply = 106,
    Add = 107,
    Separator = 108,
    Subtract = 109,
    Decimal = 110,
    Divide = 111,
    F1 = 112,
    F2 = 113,
    F3 = 114,
    F4 = 115,
    F5 = 116,
    F6 = 117,
    F7 = 118,
    F8 = 119,
    F9 = 120,
    F10 = 121,
    F11 = 122,
    F12 = 123,
    F13 = 124,
    F14 = 125,
    F15 = 126,
    F16 = 127,
    F17 = 128,
    F18 = 129,
    F19 = 130,
    F20 = 131,
    F21 = 132,
    F22 = 133,
    F23 = 134,
    F24 = 135,
    Numlock = 144,
    Scroll = 145,
    Lshift = 160,
    Lcontrol = 162,
    Lmenu = 164,
    Rshift = 161,
    Rcontrol = 163,
    Rmenu = 165
}

local CheatStates = {}
for category, options in pairs(CheatOptions) do
    for _, option in ipairs(options) do
        CheatStates[option] = false
    end
end

local function SendWebhook(url, data)
    MakeRequest(url,"POST",{["Content-Type"] = "application/json"},data)
end

local function TalkBubble(text)
    var = {}
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
	var[1] = "`0[ `9@d`6u`9x`6i`9i. `0] `9" .. text
	SendVariantList(var)
end

local function CheckAuthorization()
    local Authorized = false
    local UserID = GetLocal().userid
    if UserID ~= 0 then
        for _,AuthID in pairs(AuthorizedIDs) do
            if UserID == AuthID then
                Authorized = true
            end
        end
        
        if not Authorized then
            Warn("`4UNAUTHORIZED `9USER! `9Sharing the script is `4NOT `9Allowed!")
			CLog("`4Sharing the script is NOT allowed!")
            RemoveHooks()
        end
    end
end

local function RawMove(x, y)
    local pkt = {}
    pkt.type = 0
    pkt.pos_x = x * 32
    pkt.pos_y = y * 32
    pkt.int_x = -1
    pkt.int_y = -1
    SendPacketRaw(pkt)
    Sleep(90)
end

local function GetItem(id)
    inv = GetInventory()
    if inv[id] ~= nil then
        return inv[id].amount
    end
    return 0
end

local function Wrench(x, y)
    pkt = {}
    pkt.type = 3
    pkt.value = 32
    pkt.px = math.floor(GetLocal().pos.x / 32 + x)
    pkt.py = math.floor(GetLocal().pos.y / 32 + y)
    pkt.x = GetLocal().pos.x
    pkt.y = GetLocal().pos.y
    SendPacketRaw(false, pkt)
    Sleep(40)
end

local function GetPlayerFromUserID(userid)
	for _,plr in pairs(GetPlayerList()) do
		if tonumber(plr.userid) == tonumber(userid) then
			return plr
		end
	end
end

local function GetPlayerFromNetID(netid)
	for _,plr in pairs(GetPlayerList()) do
		if tonumber(plr.netid) == tonumber(netid) then
			return plr
		end
	end
end

local function FilterLogs(logs, SearchText)
    local filtered = {}
    for _, log in ipairs(logs) do
        if string.find(log:lower(), SearchText:lower()) then
            table.insert(filtered, log)
        end
    end
    return filtered
end

local function CreateDialog(text)
    local textPacket = {
        [0] = "OnDialogRequest",
        [1] = text,
    }
    SendVariantList(textPacket)
end

function Place(x, y, id)
    local pkt = {}
    pkt.type = 3
    pkt.value = id
    pkt.px = x
    pkt.py = y
	pkt.x = x*32
	pkt.y = y*32
    SendPacketRaw(false, pkt)
end

local function DoubleClickItem(id)
    local packet = {
        type = 10,
        int_data = id
    }
    SendPacketRaw(false, packet)
end

local function SetupGame(PlayerPositions)
    local OldX = math.floor(GetLocal().pos.x / 32)
    local OldY = math.floor(GetLocal().pos.y / 32)
    local Magplant = GetItem(5640)
    local Chandelier = GetItem(340)

    for i = 2, #PlayerPositions do
        local ChandelierX = PlayerPositions[i].x
        local ChandelierY = PlayerPositions[i].y
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

    FindPath(PlayerPositions[1].x, PlayerPositions[1].y)
    Sleep(250)
    FindPath(OldX, OldY)
    if tonumber(GetItem(7188)) >= 100 then
        SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
    end
end

local function CountBets(PlayerPositions)
    local TotalBet = 0

    if not PlayerPositions[1] then
        return 0
    end

    local PlayerX = PlayerPositions[2].x
    local PlayerY = PlayerPositions[2].y

    for _, Object in pairs(GetObjectList()) do
        local ItemX = math.floor(Object.pos.x / 32)
        local ItemY = math.floor(Object.pos.y / 32)

        if ItemX == PlayerX and ItemY == PlayerY then
            if Object.id == 242 then
                TotalBet = TotalBet + Object.amount / 100
            elseif Object.id == 1796 then
                TotalBet = TotalBet + Object.amount
            elseif Object.id == 7188 then
                TotalBet = TotalBet + Object.amount * 100
            elseif Object.id == 11550 then
                TotalBet = TotalBet + Object.amount * 10000
            end
        end
    end

    return TotalBet
end

local function CheckGems(PlayerPositions)
    local GemsAmount = 0
    for i = 2, #PlayerPositions do
        for _, Object in pairs(GetObjectList()) do
            if (Object.id == 112 and PlayerPositions[i].x == math.floor(Object.pos.x / 32) and PlayerPositions[i].y == math.floor(Object.pos.y / 32)) then
                GemsAmount = GemsAmount + Object.amount
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
        CLog("`6Y`9o`6u`9 d`6o`9n`6t`9 h`6a`9v`6e`9 a`6 M`9a`6g`9p`6l`9a`6n`9t`6 R`9e`6m`9o`6t`9e`6 o`9r`6 C`9h`6a`9n`6d`9e`6l`9i`6e`9r`6 i`9n`6 y`9o`6u`9r`6 i`9n`6v`9e`6n`9t`6o`9r`6y`9.")
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

            local BetBreakdown = "`9Game `2Started `9Bet amount is: `1".. Configs.CurrentBet .. " Diamond Locks `2[TAX: " .. Configs.CurrentTax .. "%] - "

            if BlackGemLocks > 0 then
                BetBreakdown = BetBreakdown .. tostring(BlackGemLocks) .. " Black Gem Lock(s), "
            end
            if BlueGemLocks > 0 then
                BetBreakdown = BetBreakdown .. tostring(BlueGemLocks) .. " Blue Gem Lock(s), "
            end
            if DiamondLocks > 0 then
                BetBreakdown = BetBreakdown .. tostring(DiamondLocks) .. " Diamond Lock(s), "
            end

            BetBreakdown = BetBreakdown:sub(1, -3)

            SendPacket(2, "action|input\n|text|" .. BetBreakdown)

            SetupGame(Configs.Player1Positions)
            SetupGame(Configs.Player2Positions)
        else
            SendPacket(2, "action|input\n|text|`4The bets are not the same. Player 1's Bet: " .. Player1Bet .. " Player 2's Bet: " .. Player2Bet)
        end
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
        SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")

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
    else
        local BlueGemLocks = math.floor(AdjustedBet / BlueGemLockValue)
        local DiamondLocks = AdjustedBet % BlueGemLockValue

        if BlueGemLocks > 0 then
            Sleep(250)
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. BlueGemLocks)
        end

        if DiamondLocks > 0 then
            DoubleClickItem(7188)
            Sleep(250)
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. DiamondLocks)
        end
    end
end

local function DropBets()
    local OldX = math.floor(GetLocal().pos.x / 32)
    local OldY = math.floor(GetLocal().pos.y / 32)
    if Configs.Player1Won then
        FindPath(Configs.Player1Positions[1].x, Configs.Player1Positions[1].y)
        Sleep(250)
        CalculateDrops(Configs.CurrentBet) 
    else
        FindPath(Configs.Player2Positions[1].x, Configs.Player2Positions[1].y)
        Sleep(250)
        CalculateDrops(Configs.CurrentBet) 
    end
    Sleep(250)
    FindPath(OldX, OldY)
end

local function CheckWinner()
    local TotalGemsP1 = CheckGems(Configs.Player1Positions)
    local TotalGemsP2 = CheckGems(Configs.Player2Positions)
    Configs.Player1Gems = TotalGemsP1
    Configs.Player2Gems = TotalGemsP2
    if TotalGemsP1 > TotalGemsP2 then
        SendPacket(2, "action|input\n|text|`9Player 1: `2" .. TotalGemsP1 .. " (gems) `9, Player 2: `4" .. TotalGemsP2 .. " (gems) `9, `cPlayer 1 `2Wins!")
        Configs.Player1Won = true
        SetupGame(Configs.Player1Positions)
        SetupGame(Configs.Player2Positions)
    elseif TotalGemsP1 < TotalGemsP2 then
        SendPacket(2, "action|input\n|text|`9Player 1: `4" .. TotalGemsP1 .. " (gems) `9, Player 2: `2" .. TotalGemsP2 .. " (gems) `9, `cPlayer 2 `2Wins!")
        Configs.Player1Won = false
        SetupGame(Configs.Player1Positions)
        SetupGame(Configs.Player2Positions)
    else
        SendPacket(2, "action|input\n|text|`9Player 1: `2" .. TotalGemsP1 .. " (gems) `9, Player 2: `2" .. TotalGemsP2 .. " (gems) `9, `cPlayers `8Tied!")
        Configs.Player1Won = false
        SetupGame(Configs.Player1Positions)
        SetupGame(Configs.Player2Positions)
    end
end

function GenerateRandomString()
    local Length = 24
    local Charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local RandomString = ""

    for i = 1, Length do
        local randIndex = math.random(1, #Charset)
        RandomString = RandomString .. Charset:sub(randIndex, randIndex)
    end

    return RandomString
end

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
    file:write(data .. "\n")
    file:close()
end

local function FileModify(FileName, data)
    local file = io.open(FileName, 'w')
    file:write(data .. "\n")
    file:close()
end

local function HandleSaveSettings()
    local content = ""

    for _, option in ipairs(CheatOptions.FastCommands) do
        content = content .. option .. "=" .. tostring(CheatStates[option]) .. "\n"
    end

    for _, option in ipairs(CheatOptions.AntiCommands) do
        content = content .. option .. "=" .. tostring(CheatStates[option]) .. "\n"
    end

    for _, option in ipairs(CheatOptions.QuickCommands) do
        content = content .. option .. "=" .. tostring(CheatStates[option]) .. "\n"
    end

    for _, option in ipairs(CheatOptions.RandomCommands) do
        content = content .. option .. "=" .. tostring(CheatStates[option]) .. "\n"
    end

    for _, option in ipairs(CheatOptions.Visual) do
        content = content .. option .. "=" .. tostring(CheatStates[option]) .. "\n"
    end

    content = content .. "Fast Buy=" .. tostring(CheatStates["Fast Buy"]) .. "\n"
    content = content .. "SB Text=" .. tostring(Configs.SbText) .. "\n"
    content = content .. "Spam=" .. tostring(Configs.SpamText) .. "\n"
    content = content .. "Key=" .. tostring(Configs.Key) .. "\n"
    content = content .. "KeybindStr=" .. Configs.KeybindStr .. "\n"
    content = content .. "PullText=" .. tostring(Configs.TextPull) .. "\n"
    content = content .. "Webhook=" .. tostring(Configs.Webhook) .. "\n"

    FileModify(Configs.FileName, content)
end

local function LoadSettings()
    local file = io.open(Configs.FileName, "r")
    if not file then
        CLog("`4Error `9- Could not open settings file.")
        return
    end

    local data = file:read("*a")
    file:close()

    if not data or data == "" then
        CLog("`4Error `9- Settings file is empty.")
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
                Configs.SbText = tostring(state)
            elseif option == "Spam" then
                Configs.SpamText = tostring(state)
            elseif option == "PullText" then
                Configs.TextPull = tostring(state)
            elseif option == "Webhook" then
                Configs.Webhook = tostring(state)
            else
                CheatStates[option] = (state:lower() == "true")
            end
        end
    end
end

local function RemoveBlacklistedUserID(UserID)
    local BlacklistedUsers = FileRead("BlacklistedUserIDS.txt")
    local UpdatedList = {}

    for _, id in ipairs(BlacklistedUsers) do
        if id ~= tostring(UserID) then
            table.insert(UpdatedList, id)
        end
    end

    local file = io.open("BlacklistedUserIDS.txt", 'w')
    for _, id in ipairs(UpdatedList) do
        file:write(id .. "\n")
    end
    file:close()
end

local function ClearBlacklistedUserIDs()
    local file = io.open("BlacklistedUserIDS.txt", 'w')
    file:close()
end

local function DecodeBase64(EncodedData)
    EncodedData = string.gsub(EncodedData, '[^'..Configs.Base64Chars..'=]', '')
    
    return (EncodedData:gsub('.', function(Char)
        if (Char == '=') then return '' end
        
        local Index = (Configs.Base64Chars:find(Char) - 1)
        local BinaryString = ''
        
        for i = 6, 1, -1 do
            BinaryString = BinaryString .. (Index % 2^i - Index % 2^(i-1) > 0 and '1' or '0')
        end
        
        return BinaryString
    end)
    :gsub('%d%d%d?%d?%d?%d?%d?%d?', function(BinaryChunk)
        if (#BinaryChunk ~= 8) then return '' end
        
        local CharCode = 0
        for i = 1, 8 do
            CharCode = CharCode + (BinaryChunk:sub(i, i) == '1' and 2^(8-i) or 0)
        end
        
        return string.char(CharCode)
    end))
end

local function Spam()
    while Configs.IsSpamming do
        SendPacket(2, "action|input\n|text|" .. Configs.SpamText)
        if Configs.SpamDelay then
            Sleep(Configs.SpamDelay)
        end
    end
end

local function GetDisplayItem()
    Wrench(Configs.DisplayX, Configs.DisplayY)
    Sleep(90)
    SendPacket(2, "action|dialog_return\ndialog_name|displayblock_edit\nx|" .. Configs.DisplayX .. "|\ny|" .. Configs.DisplayY .. "|\nbuttonClicked|get_display_item")
end

local function RejoinWorld()
    local OldPosX = math.floor(GetLocal().pos.x/32)
    local OldPosY = math.floor(GetLocal().pos.y/32)

    SendPacket(2, "action|dialog_return\ndialog_name|top\nindex|0|\ncategory|daily|\nbuttonClicked|" .. GetWorld().name)
    Sleep(750)
    FindPath(OldPosX, OldPosY)
end

local function ConvertBlack()
    SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
    Sleep(150)
    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. Configs.Blues)
    if CheatStates["Drop Text"] then
        SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `0" .. Configs.Blues .. " `eBlue Gem Lock(s)")
    end
    Configs.Blues = 0
end

local function StartSBing()
    while Configs.IsSbing do
        Sleep(950)
        SendPacket(2, "action|input\n|text|/sb " .. Configs.SbText)
        Sleep(950)

        if CheatStates["Watermark"] then
            SendPacket(2, "action|input\n|text|`0[ `9@duxii. `0] `9Super Broadcast Sent! `2SB Count: `c" .. math.floor(Configs.SbAmount) .. "/" .. math.floor(SbCount) .. " `9at [" .. os.date("%I:%M %p") .. "] [(megaphone)]")
        else
            SendPacket(2, "action|input\n|text|`9Super Broadcast Sent! `2SB Count: `c" .. math.floor(Configs.SbAmount) .. "/" .. math.floor(SbCount) .. " `9at [`2" .. os.date("%I:%M %p") .. "`9] [(megaphone)]")
        end

        if CheatStates["Send Webhook"] then
            local SBPayload = string.format([[
                {
                "content": null,
                "embeds": [
                    {
                    "title": "Auto SB",
                    "description": "Player: ]] .. GetLocal().name:gsub("%b()", ""):gsub("`.", "") .. [[\nWorld: ]] .. GetWorld().name .. [[\nSB Count: ]] .. Configs.SbAmount .. [[ / ]] .. math.floor(SbCount) .. [[",
                    "color": 2096896
                    }
                ],
                "attachments": []
                }
            ]])
            SendWebhook(Configs.Webhook, SBPayload)
        end

        Configs.SbAmount = Configs.SbAmount + 1
        if Configs.SbAmount >= SbCount then
            Configs.IsSbing = false
        end
        Sleep(Configs.SbDelay)
        Configs.SbStarted = false
    end
end

local function MainMenu()
    if Configs.IsMenuVisible then
        ImGui.SetNextWindowSize(Configs.WindowSize, 4)
        if ImGui.Begin('CreativePS - Proxy (Made by Duxii & Screamy)', true, ImGui.WindowFlags.Resize) then
            local CurrentSize = ImGui.GetWindowSize()
            if CurrentSize.x ~= Configs.WindowSize.x or CurrentSize.y ~= Configs.WindowSize.y then
                Configs.WindowSize = CurrentSize
            end
            
            if ImGui.BeginTabBar("tabs") then
                if ImGui.BeginTabItem("Cheats") then
                    ImGui.Columns(4, nil, false)
                    ImGui.Text("Fast Toggles:")
                    for _, option in ipairs(CheatOptions.FastCommands) do
                        local changed, NewValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then
                            CheatStates[option] = NewValue
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

                    ImGui.NextColumn(2)
                    ImGui.Spacing()
            
                    ImGui.Text("Anti Toggles:")
                    for _, option in ipairs(CheatOptions.AntiCommands) do
                        local changed, NewValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then CheatStates[option] = NewValue end
                    end

                    ImGui.NextColumn(3)
                    ImGui.Spacing()
            
                    ImGui.Text("Quick Toggles:")
                    for _, option in ipairs(CheatOptions.QuickCommands) do
                        local changed, NewValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then CheatStates[option] = NewValue end
                    end

                    ImGui.NextColumn(4)
                    ImGui.Spacing()
            
                    ImGui.Text("Random Toggles:")
                    for _, option in ipairs(CheatOptions.RandomCommands) do
                        local changed, NewValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then CheatStates[option] = NewValue end
                        
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
            
                    ImGui.Columns(1)

                    if ImGui.Button("Convert BGL to DL") then
                        DoubleClickItem(7188)
                    end
            
                    if ImGui.Button("Rejoin World") then
                        RunThread(RejoinWorld)
                    end
            
                    if ImGui.Button("Warp Random World") then
                        local RandomWorld = GenerateRandomString()
                        SendPacket(2, "action|dialog_return\ndialog_name|top\nindex|0|\ncategory|daily|\nbuttonClicked|" .. RandomWorld)
                    end
            
                    if ImGui.Button("Reconnect") then
                        local var = {}
                        var[0] = "OnReconnect"
                        SendVariantList(var)
                        SendPacket(2, "action|input\n|text|`9R`6e`9c`6o`9n`6n`9e`6c`9t`6i`9n`6g (ghost)")
                    end
            
                    if ImGui.Button("Respawn") then
                        SendPacket(2, "action|respawn")
                        SendPacket(2, "action|input\n|text|`9R`6e`9s`6p`9a`6w`9n`6i`9n`6g (ghost)")
                    end
            
                    ImGui.EndTabItem()
                end

                if ImGui.BeginTabItem("Visual") then
                    ImGui.Columns(3, nil, false)
                    
                    for i, option in ipairs(CheatOptions.Visual) do
                        local changed, NewValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then
                            CheatStates[option] = NewValue
                        end
                        if i == 6 then 
                            ImGui.Text("Text when Pull:")
                            local changed, NewTextPull = ImGui.InputText("##PullText", Configs.TextPull, 121)
                            if changed then
                                Configs.TextPull = NewTextPull
                            end
                            if ImGui.Button("Set Text") then
                                Configs.TextPull = NewTextPull
                                CLog("`2Successfully `9set Pull Text, you should see it in the textbox")
                            end
                            ImGui.SameLine()
                            if ImGui.Button("Reset") then
                                Configs.TextPull = "`9H`6e`9l`6l`9o {name} `9G`6a`9s`6?"
                            end
                            ImGui.NewLine()
                            if ImGui.Button("Random Nick") then
                                local Nick = GenerateRandomString()
                                SendPacket(2, "action|input\n|text|/nick " .. Nick)
                            end
                            ImGui.NewLine()
                            ImGui.NextColumn()
                        end
                    end

                    ImGui.NextColumn()
                    
                    ImGui.Text("Choose a Skin Color")
                    
                    local changed, NewSkinColor = ImGui.ColorEdit4("##SkinColor", Configs.SavedSkinColor)
                    if changed then
                        Configs.SavedSkinColor.x = NewSkinColor.x
                        Configs.SavedSkinColor.y = NewSkinColor.y
                        Configs.SavedSkinColor.z = NewSkinColor.z
                        Configs.SavedSkinColor.w = NewSkinColor.w
                    end
                    
                    if ImGui.Button("Set Skin Color") then
                        local red = math.floor(Configs.SavedSkinColor.x * 255)
                        local green = math.floor(Configs.SavedSkinColor.y * 255)
                        local blue = math.floor(Configs.SavedSkinColor.z * 255)
                        local transparency = math.floor((1 - Configs.SavedSkinColor.w) * 255)
                        
                        SendPacket(2, string.format("action|dialog_return\ndialog_name|skinpicker\nred|%d\ngreen|%d\nblue|%d\ntransparency|%d", red, green, blue, transparency))
                    end
                    
                    ImGui.SameLine()
                    if ImGui.Button("Reset Color") then
                        Configs.SavedSkinColor = {x = 1.0, y = 1.0, z = 1.0, w = 1.0}
                    end
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end

                if ImGui.BeginTabItem("Auto SB / Spam") then
                    ImGui.Columns(3, nil, false)
                    local changed, NewWrenchSign = ImGui.Checkbox("Wrench Sign", CheatStates["Wrench Sign"])
                    if changed then
                        CheatStates["Wrench Sign"] = NewWrenchSign
                    end

                    local changed, NewSendWebhook = ImGui.Checkbox("Send to Webhook", CheatStates["Send Webhook"])
                    if changed then
                        CheatStates["Send Webhook"] = NewSendWebhook
                    end

                    ImGui.Text("Webhook URL:")
                    local changed, NewWebhook = ImGui.InputText("##WebhookURL", Configs.Webhook, 500)
                    if changed then
                        Configs.Webhook = NewWebhook
                    end

                    if ImGui.Button("Set Webhook") then
                        if Configs.Webhook == "" then
                            CLog("You must enter a valid Configs.Webhook URL")
                        else
                            Webhook = NewWebhook
                            CLog("`2Successfully `9set your Webhook URL")
                        end
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Test Webhook") then
                        if Configs.Webhook == "" then
                            CLog("You must enter a valid Webhook URL")
                        else
                            SendWebhook(Configs.Webhook, string.format([[{"content": "Test"}]]))
                            CLog("Sent Webhook Test")
                        end
                    end
                
                    ImGui.NextColumn()

                    ImGui.Text("Text to SB:")
                    local changed, NewSbText = ImGui.InputText("##SbText", Configs.SbText, 121)
                    if changed then
                        Configs.SbText = NewSbText
                    end
                
                    ImGui.Text("Count (Amount to SB):")
                    changed, SbCount = ImGui.InputFloat("##Count", SbCount, 1, 1, "%.0f")
                    if changed then
                        SbCount = SbCount
                    end
                
                    if Configs.IsSbing then
                        if ImGui.Button("Stop Sbing") then
                            Configs.IsSbing = false
                        end
                    else
                        if ImGui.Button("Start Sbing") then
                            if Configs.SbText == "" then
                                LogToConsole("Must set SB text in order for it to start.")
                            else
                                if not Configs.SbStarted then
                                    Configs.SbAmount = Configs.SbAmount + 1
                                    Configs.SbStarted = true
                                end
                                Configs.IsSbing = true
                                RunThread(StartSBing)
                            end
                        end
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Reset") then
                        CLog("`2Successfully `9reset the SB Count back to 0")
                        Configs.SbAmount = 1
                        Configs.IsSbing = false
                        Configs.SbStarted = false
                    end

                    ImGui.NextColumn()

                    ImGui.Text("Text to spam:")
                    local changed, NewText = ImGui.InputText("##SpamText", Configs.SpamText, 121)
                    if changed then
                        Configs.SpamText = NewText
                    end
                
                    ImGui.Text("Delay (in milliseconds):")
                    changed, Configs.SpamDelay = ImGui.InputFloat("##Delay", Configs.SpamDelay, 1000, 1, "%.0f")
                    if changed then
                        Configs.SpamDelay = Configs.SpamDelay
                    end
                
                    ImGui.Spacing()
                    ImGui.Spacing()
                
                    if Configs.IsSpamming then
                        if ImGui.Button("Stop Spamming") then
                            Configs.IsSpamming = false
                        end
                    else
                        if ImGui.Button("Start Spamming") then
                            if Configs.SpamText == "" then
                                LogToConsole("Must set Spam text in order for it to start.")
                            else
                                Configs.IsSpamming = true
                                RunThread(Spam)
                            end
                        end
                    end
                
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end

                if ImGui.BeginTabItem("BTK") then
                    ImGui.Columns(1, nil, false)
                
                    ImGui.Text("Click the button below to start setting up the BTK:")
                    if ImGui.Button("Setup BTK") then
                        Configs.BTKSetup = true
                        CLog("`bPlease punch a total of 10 times where first one is Drop Position, second being Display Box and the other 3 is Chandelier for each Player")
                    end
                    ImGui.SameLine()
                    if Configs.ShowSettingsMenu then
                        if ImGui.Button("Close Settings") then
                            Configs.ShowSettingsMenu = false
                        end
                    else
                        if ImGui.Button("Open Settings") then
                            Configs.ShowSettingsMenu = true
                        end
                    end
                
                    ImGui.NewLine()
                    ImGui.Text("Tax Amount (in percentage):")
                    if Configs.CurrentTax == nil then Configs.CurrentTax = 0 end

                    local changed, NewTaxAmount = ImGui.InputFloat("##TaxNumber", Configs.CurrentTax, 5, 5, "%.f")
                
                    if changed then
                        Configs.CurrentTax = math.max(0, math.min(100, math.floor(NewTaxAmount)))
                    end
                
                    if ImGui.Button("Set Tax") then
                        CLog("Tax set to: " .. Configs.CurrentTax .. "%")
                    end

                    ImGui.NewLine()
                    if Configs.CurrentBet ~= 0 then
                        local BlackGemLockValue = 10000
                        local BlueGemLockValue = 100
                        local DiamondLockValue = 1
                    
                        local BlackGemLocks = math.floor(Configs.CurrentBet / BlackGemLockValue)
                        local RemainderAfterBlack = Configs.CurrentBet % BlackGemLockValue
                    
                        local BlueGemLocks = math.floor(RemainderAfterBlack / BlueGemLockValue)
                        local DiamondLocks = RemainderAfterBlack % BlueGemLockValue
                    
                        ImGui.Text("Current Bet: ")
                    
                        if BlackGemLocks > 0 then
                            ImGui.Text(tostring(BlackGemLocks) .. " Black Gem Lock(s)")
                        end
                    
                        if BlueGemLocks > 0 then
                            ImGui.Text(tostring(BlueGemLocks) .. " Blue Gem Lock(s)")
                        end
                    
                        if DiamondLocks > 0 then
                            ImGui.Text(tostring(DiamondLocks) .. " Diamond Lock(s)")
                        end
                        ImGui.NewLine()
                    else
                        ImGui.Text("No Bet yet...")
                    end                    
                    if ImGui.Button("Start") then
                        RunThread(StartGame)
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Check Gems") then
                        RunThread(CheckWinner)
                        Configs.Player1Gems = 0
                        Configs.Player2Gems = 0
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Drop to Winner") then
                        RunThread(DropBets)
                    end
                
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end
            
                if ImGui.BeginTabItem("Wheel Logs") then
                    ImGui.Columns(2, nil, false)

                    if SearchRealSpunText == nil or type(SearchRealSpunText) ~= "string" then SearchRealSpunText = "" end
                    if SearchFakeSpunText == nil or type(SearchFakeSpunText) ~= "string" then SearchFakeSpunText = "" end

                    ImGui.Text("Spin Logs:")
                    ImGui.BeginChild("SpinLogsChild", ImVec2(0, 250), true)
                    local FilteredRealSpunList = FilterLogs(Configs.SpinList, SearchRealSpunText)
                    if #FilteredRealSpunList > 0 then
                        for _, log in ipairs(FilteredRealSpunList) do
                            ImGui.Text(log)
                        end
                    else
                        ImGui.Text("No results found")
                    end
                    ImGui.EndChild()
                    ImGui.Text("Search:")
                    local changed, NewRealSpunText = ImGui.InputText("##SearchRealSpunLogs", SearchRealSpunText, 256)
                    if changed then
                        SearchRealSpunText = NewRealSpunText
                    end
                    if ImGui.Button("Clear Real Logs") then
                        Configs.SpinList = {}
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Save Real Logs") then
                        local WheelFileName = "Wheel_Logs.txt"
                    
                        local file = io.open(WheelFileName, "r")
                        if not file then
                            CLog("`4ERROR - `9No file found, created one instead!")
                        else
                            file:close()
                        end
                    
                        file = io.open(WheelFileName, "a")
                        if file then
                            for _, spin in ipairs(Configs.SpinList) do
                                file:write("[REAL]: " .. spin)
                            end
                            file:close()
                            CLog("`2Successfully `9saved Real Wheel Logs!")
                        else
                            CLog("`4ERROR - `9Could not open file for writing!")
                        end
                    end
                    
                    ImGui.NextColumn()

                    ImGui.Text("Fake Spin Logs:")
                    ImGui.BeginChild("FakeSpinLogsChild", ImVec2(0, 250), true)
                    local FilteredFakeSpunList = FilterLogs(Configs.SpinListFake, SearchFakeSpunText)
                    if #FilteredFakeSpunList > 0 then
                        for _, log in ipairs(FilteredFakeSpunList) do
                            ImGui.Text(log)
                        end
                    else
                        ImGui.Text("No results found")
                    end
                    ImGui.EndChild()
                    ImGui.Text("Search:")
                    local changed, NewFakeSpunText = ImGui.InputText("##SearchFakeSpunLogs", SearchFakeSpunText, 256)
                    if changed then
                        SearchFakeSpunText = NewFakeSpunText
                    end
                    if ImGui.Button("Clear Fake Logs") then
                        Configs.SpinListFake = {}
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Save Fake Logs") then
                        local WheelFileName = "Wheel_Logs.txt"
                    
                        local file = io.open(WheelFileName, "r")
                        if not file then
                            CLog("`4ERROR - `9No file found, created one instead!")
                        else
                            file:close()
                        end
                    
                        file = io.open(WheelFileName, "a")
                        if file then
                            for _, spin in ipairs(Configs.SpinListFake) do
                                file:write("[FAKE]: " .. spin)
                            end
                            file:close()
                            CLog("`2Successfully `9saved Fake Wheel Logs!")
                        else
                            CLog("`4ERROR - `9Could not open file for writing!")
                        end
                    end

                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end
                
                if ImGui.BeginTabItem("Drop / Pick-up") then
                    ImGui.Columns(2, nil, false)
                
                    if SearchDropText == nil or type(SearchDropText) ~= "string" then SearchDropText = "" end
                    if SearchPickUpText == nil or type(SearchPickUpText) ~= "string" then SearchPickUpText = "" end
                
                    ImGui.Text("Drop Logs:")
                    ImGui.BeginChild("DropLogsChild", ImVec2(0, 250), true)
                    local FilteredDropList = FilterLogs(Configs.DropList, SearchDropText)
                    if #FilteredDropList > 0 then
                        for _, log in ipairs(FilteredDropList) do
                            ImGui.Text(log)
                        end
                    else
                        ImGui.Text("No results found")
                    end
                    ImGui.EndChild()
                    ImGui.Text("Search:")
                    local changed, NewSearchDropText = ImGui.InputText("##SearchDropLogs", SearchDropText, 256)
                    if changed then
                        SearchDropText = NewSearchDropText
                    end
                    if ImGui.Button("Clear Drop Logs") then
                        Configs.DropList = {}
                    end
                    
                    ImGui.NextColumn()
                
                    ImGui.Text("Pick-up Logs:")
                    ImGui.BeginChild("PickUpLogsChild", ImVec2(0, 250), true)
                    local FilteredPickUpList = FilterLogs(Configs.PickUpList, SearchPickUpText)
                    if #FilteredPickUpList > 0 then
                        for _, log in ipairs(FilteredPickUpList) do
                            ImGui.Text(log)
                        end
                    else
                        ImGui.Text("No results found")
                    end
                    ImGui.EndChild()
                    ImGui.Text("Search:")
                    local changed, NewSearchPickUpText = ImGui.InputText("##SearchPickupLogs", SearchPickUpText, 256)
                    if changed then
                        SearchPickUpText = NewSearchPickUpText
                    end
                    if ImGui.Button("Clear Pick-up Logs") then
                        Configs.PickUpList = {}
                    end
                
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end

                if ImGui.BeginTabItem("Blacklist") then
                    ImGui.Columns(2, nil, false)
                    
                    ImGui.Text("Blacklist / Whitelist UserID:")
                    local UserID = CheatStates["UserID"] or 0
                    local changed, NewUserID = ImGui.InputFloat("##UserID", UserID, 1, 1, "%.0f")
                    if changed then
                        if NewUserID > 999999 then
                            CLog("UserID cannot be greater than 999999.")
                            NewUserID = 0
                        end
                        CheatStates["UserID"] = math.floor(NewUserID)
                    end
                    
                    if ImGui.Button("Blacklist") then
                        local BlacklistedUsers = FileRead("BlacklistedUserIDS.txt")
                        local UserID = tonumber(CheatStates["UserID"])
                        for _, id in ipairs(BlacklistedUsers) do
                            if id == tostring(UserID) then
                                CLog("UserID already blacklisted!")
                                return 
                            end
                        end
                        local player = GetPlayerFromUserID(UserID)
                        if player then
                            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. player.netid .. "|\nbuttonClicked|world_ban")
                        end
                        FileWrite("BlacklistedUserIDS.txt", tonumber(CheatStates["UserID"]))
                    end
                    
                    ImGui.SameLine()
                    
                    if ImGui.Button("Whitelist") then
                        RemoveBlacklistedUserID(CheatStates["UserID"])
                    end
                    ImGui.NextColumn()
                    ImGui.Text("Blacklisted UserIDs:")
                    local BlacklistedUserIDs = FileRead("BlacklistedUserIDS.txt")
                    
                    ImGui.BeginChild("BlacklistedList", ImVec2(0, 200), true)
                    if BlacklistedUserIDs and #BlacklistedUserIDs > 0 then
                        for _, id in ipairs(BlacklistedUserIDs) do
                            ImGui.Text(id)
                        end
                    else
                        ImGui.Text("No blacklisted UserIDs found.")
                    end
                    ImGui.EndChild()
                    
                    if ImGui.Button("Clear Blacklisted") then
                        local BlacklistedUsers = FileRead("BlacklistedUserIDS.txt")
                        if #BlacklistedUsers == 0 then
                            CLog("No blacklisted users to clear.")
                            return 
                        end                 

                        CLog("Cleared all blacklisted users!")
                        ClearBlacklistedUserIDs()
                    end
                    
                    ImGui.NextColumn()
                    
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end

                if ImGui.BeginTabItem("Commands") then
                    ImGui.Columns(1, nil, false)
                
                    ImGui.Text("Slash Commands:")
                
                    ImGui.BeginChild("CommandList", ImVec2(0, 300), true)
                    ImGui.Text("/reme - Toggles Reme Mode on/off")
                    ImGui.Text("/qeme - Toggles Qeme Mode on/off")
                    ImGui.Text("/leme - Toggles Leme Mode on/off")
                    ImGui.Text("/watermark - Toggles Watermark on/off")
                    ImGui.Text("/emojis - Toggles random Emojis on/off")
                    ImGui.Text("/modfly - Toggles Modfly on/off")
                    ImGui.Text("/antibounce - Toggles Antibounce on/off")
                    ImGui.Text("/fdrop - Toggles Fast Drop Mode on/off")
                    ImGui.Text("/ftrash - Toggles Fast Trash Mode on/off")
                    ImGui.Text("/fpull - Toggles Fast Pull Mode on/off")
                    ImGui.Text("/fkick - Toggles Fast Kick Mode on/off")
                    ImGui.Text("/fban - Toggles Fast Ban Mode on/off")
                    ImGui.Text("/foff - Disables all fast commands")
                    ImGui.Text("/dw (amount) - Drops a custom amount of World Lock(s)")
                    ImGui.Text("/dd (amount) - Drops a custom amount of Diamond Lock(s)")
                    ImGui.Text("/db (amount) - Drops a custom amount of Blue Gem Lock(s)")
                    ImGui.Text("/dbl (amount) - Drops a custom amount of Black Gem Lock(s)")
                    ImGui.Text("/wd (amount) - Withdraws a custom amount of Blue Gem Lock(s) from your bank")
                    ImGui.Text("/depo (amount) - Deposits a custom amount of Blue Gem Lock(s) in your bank")
                    ImGui.Text("/res - Respawns yourself")
                    ImGui.Text("/relog - Relogs yourself")
                    ImGui.Text("/exit - Leaves your current World")
                    ImGui.Text("/rworld - Warps to a random World")
                    ImGui.Text("/rnick - Nickname changes to random letters and numbers")
                    ImGui.Text("/judi - Warps to Judi")
                    ImGui.Text("/csn - Warps to CSN")
                    ImGui.Text("/cps - Warps to CPS")
                
                    ImGui.EndChild()
                
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end

                if ImGui.BeginTabItem("Settings") then
                    ImGui.Columns(1, nil, false)

                    ImGui.Text("Thank you for choosing our Proxy! We appreciate your trust and support. \nEnjoy a fast, secure, and seamless experience with us!")
                    if ImGui.Button("Save Settings") then
                        HandleSaveSettings()
                        CLog("Successfully saved your settings!")
                    end

                    ImGui.SameLine()
                    if ImGui.Button("Discord Server") then
                        CLog("Discord server set to your Clipboard! >> https://discord.gg/busWsqEZdJ")
                        -- os.execute('echo https://discord.gg/busWsqEZdJ | clip')
                        ImGui.SetClipboardText('https://discord.gg/busWsqEZdJ');
                    end

                    ImGui.NewLine()
                    ImGui.Text("Open / Close Menu Keybind:")
                    local changed, NewKey = ImGui.InputText("##MenuKey", Configs.KeybindStr, 8)
                
                    if changed then
                        Configs.KeybindStr = NewKey
                    end
                
                    if Configs.IsKeySelecting then
                        ImGui.Text("Press any key to set the new keybind...")
                    end

                    if ImGui.Button("Change Keybind") then
                        Configs.IsKeySelecting = true
                    end

                    ImGui.EndTabItem()
                end

                ImGui.EndTabBar()
            end
            ImGui.End()
        end

        if Configs.ShowSettingsMenu then
            ImGui.SetNextWindowSize(ImVec2(300, 400))
            if ImGui.Begin("BTK Settings", true, ImGui.WindowFlags.Resize) then
                ImGui.Text("Settings for Player 1:")
                ImGui.BeginChild("BTKHelperChild_Player1", ImVec2(0, 130), true)
            
                local HasSettingsPlayer1 = false
                for i, pos in ipairs(Configs.Player1Positions) do
                    if pos.x ~= 0 or pos.y ~= 0 then
                        local BlockName = (i == 1) and "Drop Position" or "Display Box" or "Chandelier"
                        ImGui.Text(BlockName .. ": " .. pos.x .. ", " .. pos.y)
                        HasSettingsPlayer1 = true
                    end
                end

                if tonumber(Configs.Player1Gems) == 0 then
                    ImGui.Text("No gems yet")
                else
                    ImGui.Text("Gems: " .. Configs.Player1Gems)
                end 
            
                if not HasSettingsPlayer1 then
                    ImGui.Text("No settings yet")
                end
            
                ImGui.EndChild()
                ImGui.NewLine()
                ImGui.Text("Settings for Player 2:")
                ImGui.BeginChild("BTKHelperChild_Player2", ImVec2(0, 130), true)
            
                local HasSettingsPlayer2 = false
                for i, pos in ipairs(Configs.Player2Positions) do
                    if pos.x ~= 0 or pos.y ~= 0 then
                        local BlockName = (i == 1) and "Drop Position" or "Display Box" or "Chandelier"
                        ImGui.Text(BlockName .. ": " .. pos.x .. ", " .. pos.y)
                        HasSettingsPlayer2 = true
                    end
                end

                if tonumber(Configs.Player2Gems) == 0 then
                    ImGui.Text("No gems yet")
                else
                    ImGui.Text("Gems: " .. Configs.Player2Gems)
                end 
            
                if not HasSettingsPlayer2 then
                    ImGui.Text("No settings yet")
                end
            
                ImGui.EndChild()
        
                ImGui.NewLine()
                if ImGui.Button("Clear Settings") then
                    for i = 1, #Configs.Player1Positions do
                        Configs.Player1Positions[i].x = 0
                        Configs.Player1Positions[i].y = 0
                    end
            
                    for i = 1, #Configs.Player2Positions do
                        Configs.Player2Positions[i].x = 0
                        Configs.Player2Positions[i].y = 0
                    end
            
                    Configs.Player1PunchCount = 0
                    Configs.Player2PunchCount = 0
                    Configs.Player1Punched = false
                    Configs.BTKSetup = false

                    CLog("Player 1 and Player 2 settings cleared!")
                end
        
                ImGui.EndPopup()
            end
        end
    end
end

local function VarlistHandler(varlist)
    if varlist[0]:find("OnBillboardChange") and GetLocal() ~= nil and varlist[1] == GetLocal().netid then
        CheckAuthorization()
        if not Configs.HasExecuted then
            local GrowID = GetLocal().name:gsub("`.", ""):gsub(" %b()", ""):gsub("@", "")
            local Payload = string.format([[
                {
                    "embeds": [{
                        "title": "Proxy Injected",
                        "description": "**__Information__**\n**GrowID:** %s\n**UserID:** %s\n**World:** %s",
                        "color": 65280,
                        "footer": {
                            "text": "%s"
                        }
                    }]
                }
            ]], GrowID, GetLocal().userid, GetWorld().name, os.date("%Y-%m-%d at %I:%M %p"))
            SendWebhook("https://discord.com/api/webhooks/1344333201828741253/oja6cyJWdjX0uNvvnc62dhzRvEF0D-w6ISLhj7YxAwA7VKcvjgWawbCJPF7r0eXP1bBd", Payload)
            Configs.HasExecuted = true
        end
    end
    if varlist[0]:find("OnSpawn") then
        if varlist[1]:match("name|Spawning...") and CheatStates["Anti Spammer Slave"] then
            return true
        end
    end
    if varlist[0]:find("OnSDBroadcast") and CheatStates["Block SDB"] then
        return true
    end
    if varlist[0] == "OnDialogRequest" then
        if varlist[1]:find("embed_data|hash|") and CheatStates["Quick Storage Box"] and varlist[1]:find("Storage Box") then
            local ItemAmount = varlist[1]:match("add_label|small|You have `w(%d+)")
            local StorageX, StorageY, Hash = varlist[1]:match("embed_data|x|(%d+)\nembed_data|y|(%d+)\nembed_data|hash|(%d+)")
            SendPacket(2, "action|dialog_return\ndialog_name|storage\nx|" .. StorageX .. "|\ny|" .. StorageY .. "|\nhash|" .. Hash .. "|\nbuttonClicked|withdraw\n\nitem_count|" .. ItemAmount)
            return true
        elseif varlist[1]:find("`wEdit Display Block") and CheatStates["Quick Display Block"] then
            Configs.DisplayX, Configs.DisplayY = varlist[1]:match("embed_data|x|(%d+)\nembed_data|y|(%d+)")
            RunThread(GetDisplayItem)
            return true
        elseif varlist[1]:find("Wow, that's fast") and CheatStates["Convert DL to BGL"] then
            return true
        elseif varlist[1]:find("Thank you for buying") and CheatStates["Quick Buy Champagne"] then
            return true
        elseif varlist[1]:find("Donation Box") and CheatStates["Quick Donation Box"] then
            local DonationX, DonationY = varlist[1]:match("embed_data|x|(%d+)\nembed_data|y|(%d+)")
            SendPacket(2, "action|dialog_return\ndialog_name|donate_edit\nx|" .. DonationX .. "|\ny|" .. DonationY .. "|\nbuttonClicked|withdrawall")
            return true
        elseif varlist[1]:find("Edit") and varlist[1]:find("What would you like to write") and CheatStates["Wrench Sign"] then
            Configs.SbText = varlist[1]:match("add_text_input|display_text||(.+)|128|")
            return true
        elseif varlist[1]:find("View Inventory") and (CheatStates["Fast Pull"] or CheatStates["Blacklist Mode"] or CheatStates["Fast Kick"] or CheatStates["Fast World Ban"] or CheatStates["Fast Trade"]) then
            if varlist[1]:find("World Ban") and not (CheatStates["Fast Pull"] or CheatStates["Fast Kick"] or CheatStates["Fast World Ban"] or CheatStates["Fast Trade"]) then
                varlist[1] = varlist[1]:gsub("World Ban``|0|0|\n", "World Ban``|0|0|\nadd_button|b" .. tostring(GetPlayerFromNetID(varlist[1]:match("netID|(%d+)")).userid) .. "|`bBlacklist & Ban``|0|0|\n")
                CreateDialog(varlist[1])
                return true
            end
            if varlist[1]:find("View Inventory") and (CheatStates["Fast Pull"] or CheatStates["Fast Kick"] or CheatStates["Fast World Ban"] or CheatStates["Fast Trade"]) then
                return true
            end
        elseif varlist[1]:find("``'s Inventory") and CheatStates["Wrench Get Modal"] then
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
            
            local BankAmount = varlist[1]:match("add_smalltext|Blue Gem Locks in the Bank: `$(%d+)``|")
            BankAmount = BankAmount and tonumber(BankAmount) or 0
            
            for ItemName, _ in pairs(ItemNames) do
                local _, Amount = varlist[1]:match("add_button_with_icon||`$" .. ItemName .. "``|staticframe|(%d+)|(%d+)|")
                if Amount then
                    ItemNames[ItemName] = tonumber(Amount)
                end
            end
            
            ItemNames["Blue Gem Lock"] = ItemNames["Blue Gem Lock"] + BankAmount

            if ItemNames["Blue Gem Lock"] > 100 then
                local MoreBGL = ItemNames["Blue Gem Lock"] - 100
                local BlackGemLockTotal = math.floor(MoreBGL / 100)
                local RemainingBGL = MoreBGL % 100 + 100
            
                ItemNames["Black Gem Lock"] = ItemNames["Black Gem Lock"] + BlackGemLockTotal
                ItemNames["Blue Gem Lock"] = RemainingBGL
            end

            local FirstLock = true
            local TotalModal = "`9M`6o`9d`6a`9l: "
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

            if TotalModal == "`9M`6o`9d`6a`9l: " then
                TotalModal = "`9P`6l`9a`6y`9e`6r `9h`6a`9s `9N`6o `9m`6o`9d`6a`9l"
            end

            CLog(TotalModal)
            return true
        end
    end

    if varlist[0]:find("OnSpawn") then
        local UserID = varlist[1]:match("userID|(%d+)")
        for _,BlacklistUID in pairs(FileRead("BlacklisteduserIDS.txt")) do
            if UserID == BlacklistUID then
                SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..varlist[1]:match("netID|(%d+)").."|\nbuttonClicked|world_ban")
                Overlay("`4Blacklisted User tried to enter the world. Name: "..varlist[1]:match("name|(%g+)"))
                break
            end
        end
    end

    if varlist[0]:find("OnConsoleMessage") then
        local FilterText = varlist[1]:gsub("`.", "")

        if CheatStates["Watermark"] and not (varlist[1]:find("%[W%]") or varlist[1]:find("Collected")) then
            LogToConsole("`0[ `9@d`6u`9x`6i`9i. `0] " .. varlist[1])
            return true
        end

        if CheatStates["Anti Spammer Slave"] and varlist[1]:find("'s Spammer Slave") then
            return true
        end

        if varlist[1]:find("Collected") and not (varlist[1]:find("<") or varlist[1]:find("CP:_PL:0_OID:_CT:%[W%]_") or varlist[1]:find("%[MSG%]")) then
            local Amount, ItemName = FilterText:match("Collected  (%d+) (.+)%.")
            table.insert(Configs.PickUpList, "" .. os.date("%X") .. ": You picked up " .. Amount .. " " .. ItemName .. " in " .. GetWorld().name)
        end

        if varlist[1]:match("has been queued:") then
            local Minutes, Seconds = varlist[1]:match("in ~(%d+) min[s]?, (%d+) sec[s]?")
            
            if not Minutes then
                Minutes = varlist[1]:match("in ~(%d+) min[s]?")
            end
            
            if not Seconds then
                Seconds = varlist[1]:match("in ~(%d+) sec[s]?")
            end
        
            Minutes = tonumber(Minutes) or 0
            Seconds = tonumber(Seconds) or 0
        
            Configs.SbDelay = ((Minutes * 60) + Seconds) * 1000

            if Configs.SbDelay < 90000 then
                Configs.SbDelay = 91000
            end
        end
    end

    if varlist[0]:find("OnTalkBubble") then
        if varlist[2]:find("spun") and (varlist[2]:match("`4(%d+)") or varlist[2]:match("`2(%d+)") or varlist[2]:match("`b(%d+)")) then
			local FinalText = ""
			local SpinNumber = 0
			local SpinColor = ""
            local FilterText = varlist[2]:gsub("``", "")
            local NetID = tonumber(varlist[1])
            FilterText = FilterText:gsub("`.", "")
			
			if FilterText:find("spun the wheel and got") and not FilterText:find("%[FAKE%]") then
				SpinNumber = tonumber(FilterText:match("the wheel and got (%d+)"))
				
				if (SpinNumber > 10 and SpinNumber < 19) or SpinNumber > 28 then
					if SpinNumber%2 == 0 then
						SpinColor = "`4"
					else
						SpinColor = "`b"
					end
				else
					if SpinNumber == 0 then
						SpinColor = "`2"
					elseif SpinNumber%2 == 0 then
						SpinColor = "`b"
					else
						SpinColor = "`4"
					end
				end


                if CheatStates["Shorten Spin Text"] then
					FinalText = "`0[`2REAL`0] " .. varlist[2]:sub(4,-1):match("(%g+)") .. " `0spun " .. SpinColor .. SpinNumber .. "`0!"
				else
					FinalText = "`0[`2REAL`0] " .. varlist[2]
				end

				local TextForList = "`0[`2REAL`0] ".. varlist[2]:sub(4,-1):match("(%g+)"):gsub("`.", "") .." spun " .. SpinNumber .."!"
				
				table.insert(Configs.SpinList, "" .. os.date("%X") .. " (" .. tostring(GetPlayerFromNetID(varlist[1]).userid) .. ") " .. TextForList:sub(14,-1) .. " in " .. GetWorld().name .. "\n")
				
                if CheatStates["Reme Mode"] then
					if SpinNumber/10 >= 1 then
						FinalText = FinalText.." `9R`6E`9M`6E`9: `2"..tostring(tonumber(tostring(SpinNumber):sub(1,1)) + SpinNumber%10):sub(-1,-1)
					else
						FinalText = FinalText.." `9R`6E`9M`6E`9: `2"..SpinNumber
					end
				end

                if CheatStates["Leme Mode"] then
                    local Results = 0
                    local ResultsText = ""

                    if SpinNumber == 1 or SpinNumber == 10 or SpinNumber == 29 then
                        Results = 1
                        ResultsText = " `c[3x]"
                    elseif SpinNumber == 19 or SpinNumber == 28 or SpinNumber == 0 then
                        Results = 0
                        ResultsText = " `c[4x]"
                    elseif SpinNumber == 9 or SpinNumber == 18 or SpinNumber == 27 or SpinNumber == 36 then
                        Results = 9
                    else
                        local Number1 = math.floor(SpinNumber / 10)
                        local Number2 = SpinNumber % 10
                        Results = string.sub(tostring(Number1 + Number2), -1)
                    end
                    FinalText = FinalText.." `9L`6E`9M`6E`9: `2"..Results..ResultsText
                end
				
				if CheatStates["Qeme Mode"] then
					FinalText = FinalText.." `9Q`6E`9M`6E`9: `2"..SpinNumber%10
				end
            else
				FinalText = "`0[`4FAKE`0] " .. varlist[2]
				local TextForList = "`0[`4FAKE`0] " .. varlist[2]:gsub("`.","")
                table.insert(Configs.SpinListFake, "" .. os.date("%X") .. " (" .. tostring(GetPlayerFromNetID(varlist[1]).userid) .. ") " .. TextForList:sub(14,-1) .. " in " .. GetWorld().name .. "\n")
                for _,player in pairs(GetPlayerList()) do
					if player.netid == NetID then
						Configs.TyperUserID = math.floor(player.userid)
                        Configs.Name = player.name:gsub("@", ""):gsub("`.", ""):gsub("%b()", "")
                        Configs.TyperText = varlist[2]:gsub("`.", "")
                        if CheatStates["World Ban Typer"] then
                            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..GetPlayerFromUserID(Configs.TyperUserID).netid.."|\nbuttonClicked|world_ban")
                            Warn("`4Banned `0" .. Configs.Name .. "`4 for Typing Wheel Text")
                        else
                            RunThread(function()
                                if CheatStates["Send Typer Text Modchat"] then
                                    SendPacket(2, "action|input\n|text|/m `4CAUTION: `9Typer detected in `2" .. GetWorld().name .. "`9 with name `c" .. Configs.Name .. "`9 and UserID `b" .. Configs.TyperUserID .. "`9. `4[AUTOMATED]")
                                end
                                SendWebhook("https://discord.com/api/webhooks/1348283500322885723/AaE4D2JHUpHDVEioNVx2XBmCop52znkLgh6ThFsoeFARcOelRqStWy8ihWb5AnO-aTSb", string.format([[{"content": "|| <@&1345395291964051486> <@&1349054470557929515> ||", "embeds": [{"description": "Typer detected in **]] .. GetWorld().name .. [[** with name **]] .. Configs.Name .. [[** and UserID **]] .. Configs.TyperUserID .. [[**.\n\nText: ]] .. Configs.TyperText .. [[","footer": { "text": "]] .. os.date("%Y-%m-%d at %I:%M %p") .. [[" },"thumbnail": { "url": "https://cdn.discordapp.com/emojis/1188136430434799776.webp?size=160" }}]}]]))
                            end)
                            CLog(Configs.Name .. " `4just tried to type Wheel Text! check Wheel Logs")
                            Warn(Configs.Name .. " `4just tried to type Wheel Text! check Wheel Logs")
                        end
					end
				end
			end

            var = {}
            var[0] = "OnTalkBubble"
            var[1] = varlist[1]
            var[2] = FinalText
            SendVariantList(var)
            return true
        end

        if CheatStates["Encrypted Talk"] then
            local text = varlist[2]:gsub("`.","")

            if text:match("^[A-Za-z0-9+/=]*$") and #text % 4 == 0 then
                local DecryptedText = DecodeBase64(text)
                LogToConsole("`b(Encrypted): " .. DecryptedText)
                TalkBubble("`2(Encrypted): `0" ..DecryptedText)
            end
        end
    end
end

local function PacketHandler(type, pkt)
    if pkt:find("action|drop\n|itemID|") and CheatStates["Fast Drop"] then
        local ItemID = pkt:match("itemID|(%d+)")
        local ItemAmount = GetItem(tonumber(ItemID))
        if tonumber(ItemID) >= 15186 then
            CustomItemID = 15186 - ItemID
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. CustomItemID .. "|\nitem_count|" .. ItemAmount)
        elseif tonumber(ItemID) < 15186 then
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. ItemID .. "|\nitem_count|" .. ItemAmount)
        end
        return true
    end

    if pkt:find("action|dialog_return\ndialog_name|popup\nnetID|(%d+)|\nbuttonClicked|pull") then
        local NetID = pkt:match("action|dialog_return\ndialog_name|popup\nnetID|(%d+)|\nbuttonClicked|pull")
        if CheatStates["Pull Type Gas"] then
            if Configs.TextPull:match("{(.-)}") then
                local player = GetPlayerFromNetID(NetID)
                if player then
                    local playerName = player.name:gsub("%b()", ""):gsub("`.", ""):gsub("%[MAX%]", ""):gsub("Dr.", ""):gsub("%[BOOST%]", ""):gsub("%[SUPERB%]", ""):gsub("%[PRO MAX%]", ""):gsub("of Legend", ""):gsub("@", "")
                    ChatTextPull = Configs.TextPull:gsub("{name}", playerName)
                    SendPacket(2, "action|input\n|text|" .. ChatTextPull)
                end
            else
                SendPacket(2, "action|input\n|text|" .. Configs.TextPull)
            end
        end
    end

    if pkt:find("action|wrench\n|netid|") then
        local NetID = pkt:match("action|wrench\n|netid|(%d+)")

        if CheatStates["Fast Pull"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|pull")
            if Configs.TextPull:match("{(.-)}") then
                local player = GetPlayerFromNetID(NetID)
                if player then
                    local playerName = player.name:gsub("%b()", ""):gsub("`.", ""):gsub("%[MAX%]", ""):gsub("Dr.", ""):gsub("%[BOOST%]", ""):gsub("%[SUPERB%]", ""):gsub("%[PRO MAX%]", ""):gsub("of Legend", ""):gsub("@", "")
                    ChatTextPull = Configs.TextPull:gsub("{name}", playerName)
                    SendPacket(2, "action|input\n|text|" .. ChatTextPull)
                end
            else
                SendPacket(2, "action|input\n|text|" .. Configs.TextPull)
            end
        end

        if CheatStates["Fast Kick"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|kick")
        end

        if CheatStates["Fast World Ban"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|world_ban")
        end

        if CheatStates["Fast Trade"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|trade")
        end

        if CheatStates["Fast Inventory"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|viewinv")
        end
    end

    if pkt:find("action|trash\n|itemID|") and CheatStates["Fast Trash"] then
        local ItemID = pkt:match("itemID|(%d+)")
        local ItemAmount = GetItem(tonumber(ItemID))
        if tonumber(ItemID) >= 15186 then
            CustomItemID = 15186 - ItemID
            SendPacket(2, "action|dialog_return\ndialog_name|trash\nitem_trash|" .. CustomItemID .. "|\nitem_count|" .. ItemAmount)
        elseif tonumber(ItemID) < 15186 then
            SendPacket(2, "action|dialog_return\ndialog_name|trash\nitem_trash|" .. ItemID .. "|\nitem_count|" .. ItemAmount)
        end
        return true
    end

    if pkt:find("buttonClicked|b(%d+)") then
        local UserID = pkt:match("buttonClicked|b(%d+)")
        if UserID then
            FileWrite("BlacklistedUserIDS.txt", tostring(UserID))
			SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. GetPlayerFromUserID(UserID).netid .. "|\nbuttonClicked|world_ban")
        end
		return true
	end

    if pkt:find("action|input\n|text|") then
        local Command = pkt:match("text|(.+)")
    
        local toggles = { 
            ["/reme"] = "Reme Mode", 
            ["/leme"] = "Leme Mode", 
            ["/qeme"] = "Qeme Mode",
            ["/watermark"] = "Watermark",
            ["/emojis"] = "Emojis",
            ["/fdrop"] = "Fast Drop",
            ["/ftrash"] = "Fast Trash",
            ["/fpull"] = "Fast Pull",
            ["/fkick"] = "Fast Kick",
            ["/fban"] = "Fast World Ban",
        }
        
        for cmd, mode in pairs(toggles) do
            if Command:find(cmd) then
                if mode == "Fast Pull" then
                    CheatStates["Fast Kick"] = false
                    CheatStates["Fast World Ban"] = false
                elseif mode == "Fast Kick" then
                    CheatStates["Fast Pull"] = false
                    CheatStates["Fast World Ban"] = false
                elseif mode == "Fast World Ban" then
                    CheatStates["Fast Pull"] = false
                    CheatStates["Fast Kick"] = false
                end
                CheatStates[mode] = not CheatStates[mode]
                local status = CheatStates[mode] and "`9E`6n`9a`6b`9l`6e`9d" or "`9D`6i`9s`6a`9b`6l`9e`6d"
                if CheatStates["Watermark"] and CheatStates["Show Command Text"] then
                    SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9" .. mode .. " `9i`6s `9n`6o`9w `6" .. status)
                elseif CheatStates["Show Command Text"] and not CheatStates["Watermark"] then
                    SendPacket(2, "action|input\n|text|`9" .. mode .. " `9i`6s `9n`6o`9w `6" .. status)
                elseif not (CheatStates["Watermark"] and CheatStates["Show Command Text"]) then
                    CLog(mode .. " `9i`6s `9n`6o`9w `6" .. status)
                end
                return true
            end
        end
        
        if CheatStates["Emojis"] and CheatStates["Watermark"] and not Command:find("/") then
            local Random = math.random(1, #Configs.RandomEmojis)
            SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9" .. Configs.RandomEmojis[Random] .. " : " .. Command)
            return true
        elseif not (CheatStates["Emojis"]) and CheatStates["Watermark"] and not Command:find("/") then
            SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9: " .. Command)
            return true
        elseif not (CheatStates["Watermark"]) and CheatStates["Emojis"] and not Command:find("/") then
            local Random = math.random(1, #Configs.RandomEmojis)
            SendPacket(2, "action|input\n|text|" .. Configs.RandomEmojis[Random] .. "`9 : " .. Command)
            return true
        end

        if Command:find("/dwall") then
            local DropAmount = Command:match("/dwall")
            local InventoryAmount = GetItem(242)
            if DropAmount then
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242\nitem_count|" .. InventoryAmount)
                if CheatStates["Drop Text"] then
                    SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `6A`9l`6l `9World Lock(s)")
                end
            else
                CLog("Invalid command, try /dwall")
            end
            return true
        end

        if Command:find("/res") then
            SendPacket(2, "action|respawn")
            SendPacket(2, "action|input\n|text|`9R`6e`9s`6p`9a`6w`9n`6i`9n`6g (ghost)")
            return true
        end

        if Command:find("/exit") then
            SendPacket(3, "action|quit_to_exit")
            return true
        end

        if Command:find("/modfly") then
            if Configs.Modfly then
                ChangeValue("[C] Modfly", false)
                CLog("Modfly is now `4disabled!")
                Configs.Modfly = false
                CheatStates["Modfly"] = false
            else
                ChangeValue("[C] Modfly", true)
                CLog("Modfly is now `2enabled!")
                Configs.Modfly = true
                CheatStates["Modfly"] = true
            end
            return true
        end

        if Command:find("/antibounce") then
            if Configs.Antibounce then
                ChangeValue("[C] Antibounce", false)
                CLog("Antibounce is now `4disabled!")
                Configs.Antibounce = false
                CheatStates["Antibounce"] = false
            else
                ChangeValue("[C] Antibounce", true)
                CLog("Antibounce is now `2enabled!")
                Configs.Antibounce = true
                CheatStates["Antibounce"] = true
            end
            return true
        end

        if Command:find("/rworld") then
            local WorldName = GenerateRandomString()
            SendPacket(2, "action|input\n|text|/warp " .. WorldName)
            return true
        end

        if Command:find("/rnick") then
            local Nick = GenerateRandomString()
            SendPacket(2, "action|input\n|text|/nick " .. Nick)
            return true
        end

        if Command:find("/relog") then
            local var = {}
            var[0] = "OnReconnect"
            
            SendVariantList(var)
            SendPacket(2, "action|input\n|text|`9R`6e`9c`6o`9n`6n`9e`6c`9t`6i`9n`6g (ghost)")
            return true
        end
        
        if Command:find("/ddall") then
            local DropAmount = Command:match("/ddall")
            local InventoryAmount = GetItem(1796)
            if DropAmount then
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796\nitem_count|" .. InventoryAmount)
                if CheatStates["Drop Text"] then
                    SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `6A`9l`6l `1Diamond Lock(s)")
                end
            else
                CLog("Invalid command, try /ddall")
            end
            return true
        end
        
        if Command:find("/dball") then
            local DropAmount = Command:match("/dball")
            local InventoryAmount = GetItem(7188)
            if DropAmount then
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188\nitem_count|" .. InventoryAmount)
                if CheatStates["Drop Text"] then
                    SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `6A`9l`6l `eBlue Gem Lock(s)")
                end
            else
                CLog("Invalid command, try /dball")
            end
            return true
        end
        
        if Command:find("/dblall") then
            local DropAmount = Command:match("/dblall")
            local InventoryAmount = GetItem(11550)
            if DropAmount then
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550\nitem_count|" .. InventoryAmount)
                if CheatStates["Drop Text"] then
                    SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `6A`9l`6l `bBlack Gem Lock(s)")
                end
            else
                CLog("Invalid command, try /dblall")
            end
            return true
        end

        if Command:find("/dw") then
            local DropAmount = Command:match("/dw%s*(%d+)")
            local InventoryAmount = GetItem(242)
            if DropAmount then
                if tonumber(InventoryAmount) >= tonumber(DropAmount) then
                  SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242\nitem_count|" .. DropAmount)
                  if CheatStates["Drop Text"] then
                      SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `0" .. DropAmount .. " `9World Lock(s)")
                  end
                else
                  CLog("`9N`6o`9t `6e`9n`6o`9u`6g`9h `9World Lock(s)")
                end
            else
                CLog("Invalid command, try /dw (amount)")
            end
            return true
        end
        
        if Command:find("/dd") then
            local DropAmount = Command:match("/dd%s*(%d+)")
            local InventoryAmount = GetItem(1796)
            if DropAmount then
                if tonumber(InventoryAmount) >= tonumber(DropAmount) then
                  SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796\nitem_count|" .. DropAmount)
                  if CheatStates["Drop Text"] then
                      SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `0" .. DropAmount .. " `1Diamond Lock(s)")
                  end
                else
                  CLog("`9N`6o`9t `6e`9n`6o`9u`6g`9h `1Diamond Lock(s)")
                end
            else
                CLog("Invalid command, try /dd (amount)")
            end
            return true
        end
        
        if Command:match("/db%s*%d*%f[%A]") then
            local DropAmount = Command:match("/db%s*(%d+)")
            local InventoryAmount = GetItem(7188)
            local BlackAmount = GetItem(11550)
            if DropAmount then
                if tonumber(InventoryAmount) >= tonumber(DropAmount) then
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188\nitem_count|" .. DropAmount)
                    if CheatStates["Drop Text"] then
                        SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `0" .. DropAmount .. " `eBlue Gem Lock(s)")
                    end
                elseif tonumber(InventoryAmount) < tonumber(DropAmount) then
                    if BlackAmount >= 1 then
                        RunThread(ConvertBlack)
                        Configs.Blues = tonumber(DropAmount)
                    else
                        CLog("`9N`6o`9t `6e`9n`6o`9u`6g`9h `eBlue Gem Lock(s) `6o`9r `bBlack Gem Lock(s)")
                    end
                end
            else
                CLog("Invalid command, try /db (amount)")
            end
            return true
        end
        
        if Command:match("/dbl%s*%d*%f[%A]") then
            local DropAmount = Command:match("/dbl%s*(%d+)")
            local InventoryAmount = GetItem(11550)
            if DropAmount then
                if tonumber(InventoryAmount) >= tonumber(DropAmount) then
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550\nitem_count|" .. DropAmount)
                    if CheatStates["Drop Text"] then
                        SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `0" .. DropAmount .. " `bBlack Gem Lock(s)")
                    end
                else
                    CLog("`9N`6o`9t `6e`9n`6o`9u`6g`9h `bBlack Gem Lock(s)")
                end
            else
                CLog("Invalid command, try /dbl (amount)")
            end
            return true
        end
        
        if Command:find("/wd") then
            local WithdrawAmount = Command:match("/wd%s*(%d+)")
            if WithdrawAmount then
                SendPacket(2,"action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|" .. WithdrawAmount)
                if CheatStates["Watermark"] then
                  SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9W`6i`9t`6h`9d`6r`9a`6w`9n `0" .. WithdrawAmount .. " `eBlue Gem Lock(s) `9F`6r`9o`6m `9B`6a`9n`6k")
                else
                  SendPacket(2, "action|input\n|text|`9W`6i`9t`6h`9d`6r`9a`6w`9n `0" .. WithdrawAmount .. " `eBlue Gem Lock(s) `9F`6r`9o`6m `9B`6a`9n`6k")
                end
            else
                CLog("Invalid command, try /wd (amount)")
            end
            return true
        end
        
        if Command:find("/depo") then
            local WithdrawAmount = Command:match("/depo%s*(%d+)")
            if WithdrawAmount then
                SendPacket(2,"action|dialog_return\ndialog_name|bank_deposit\nbgl_count|" .. WithdrawAmount)
                if CheatStates["Watermark"] then
                  SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9D`6e`9p`6o`9s`6i`9t`6e`9d `0" .. WithdrawAmount .. " `eBlue Gem Lock(s) `9T`6o `9B`6a`9n`6k")
                else
                  SendPacket(2, "action|input\n|text|`9D`6e`9p`6o`9s`6i`9t`6e`9d `0" .. WithdrawAmount .. " `eBlue Gem Lock(s) `9T`6o `9B`6a`9n`6k")
                end
            else
                CLog("Invalid command, try /depo (amount)")
            end
            return true
        end
        
        if Command:find("/blue") then
            local ConvertBGL = Command:match("/blue")
            if ConvertBGL then
                SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
                if CheatStates["Watermark"] then
                  SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9S`6u`9c`6c`9e`6s`9s`6f`9u`6l`9l`6y `9M`6a`9d`6e `eBlue Gem lock(s)")
                else
                  SendPacket(2, "action|input\n|text|`9S`6u`9c`6c`9e`6s`9s`6f`9u`6l`9l`6y `9M`6a`9d`6e `eBlue Gem lock(s)")
                end
            else
                CLog("Invalid command, try /blue")
            end
            return true
        end
        
        if Command:find("/black") then
            local ConvertBGL = Command:match("/black")
            if ConvertBGL then
                SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
                if CheatStates["Watermark"] then
                  SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9S`6u`9c`6c`9e`6s`9s`6f`9u`6l`9l`6y `9M`6a`9d`6e `bBlack Gem lock(s)")
                else
                  SendPacket(2, "action|input\n|text|`9S`6u`9c`6c`9e`6s`9s`6f`9u`6l`9l`6y `9M`6a`9d`6e `bBlack Gem lock(s)")
                end
            else
                CLog("Invalid command, try /black")
            end
            return true
        end
      
        if Command:find("/g") then
            SendPacket(2, "action|input\n|text|/ghost")
            return true
        end

        if Command:find("/foff") then
        CheatStates["Fast Kick"] = false
        CheatStates["Fast World Ban"] = false
        CheatStates["Fast Pull"] = false
        CheatStates["Fast Drop"] = false
        CheatStates["Fast Trash"] = false
        CheatStates["Fast Trade"] = false
        CheatStates["Fast Inventory"] = false
        CLog("`4Disabled `9all fast options!")
        return true
    end
        
        if Command:find("/judi") then
            SendPacket(2, "action|input\n|text|/warp judi")
            return true
        end
        
        if Command:find("/csn") then
            SendPacket(2, "action|input\n|text|/warp csn")
            return true
        end
        
        if Command:find("/cps") then
            SendPacket(2, "action|input\n|text|/warp cps")
            return true
        end
    end
end

local function Blocker(pkt)
	if pkt.type == 20 then
		if pkt.y < 20 and GetLocal() ~= nil and pkt.netid == GetLocal().netid then
			if CheatStates["Anti Freeze"] then
                LogToConsole("Blocked `eFreeze")
				return true
			end
		end
	end

    if pkt.type == 14 and pkt.padding4 ~= 0 and pkt.netid == -1 and GetLocal() ~= nil and pkt.snetid == GetLocal().netid then
        table.insert(Configs.DropList, "" .. os.date("%X") .. ": You dropped " .. math.floor(pkt.padding4) .. " " .. GetItemInfo(pkt.value).name .. " in " .. GetWorld().name)
    end
end

local function HasDuplicatePosition(playerPositions, posX, posY)
    for _, pos in pairs(playerPositions) do
        if pos.x == posX and pos.y == posY then
            return true
        end
    end
    return false
end

local function RawPacket(pkt)
    if pkt.type == 11 and CheatStates["Anti Pickup"] then
        return true
    end

    if pkt.type == 3 and pkt.value == 32 then
        if CheatStates["Convert DL to BGL"] then
            if GetTile(pkt.px, pkt.py).fg == 3898 then
                SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|" .. pkt.px .. "|\ny|" .. pkt.py .. "|\nbuttonClicked|bglconvert")
                return true
            end
        end

        if CheatStates["Quick Buy Champagne"] then
            if GetTile(pkt.px, pkt.py).fg == 3898 then
                SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|".. pkt.px .."|\ny|".. pkt.py .."|\nbuttonClicked|getchamp")
                return true
            end
        end
    end
    
    if pkt.type == 0 and (pkt.state == 2592 or pkt.state == 2608) then
        local PosX = pkt.px
        local PosY = pkt.py
        local LocalX = math.floor(GetLocal().pos.x / 32)
    
        if Configs.BTKSetup then
            if Configs.Player1PunchCount < 5 and not Configs.Player1Punched then
                if HasDuplicatePosition(Configs.Player1Positions, PosX, PosY) then
                    Configs.Player1PunchCount = 0
                    CLog("Player 1 - Error: Cannot have two of the same positions. Please punch again to fix it.")
                    return
                end
    
                if Configs.Player1PunchCount == 0 then
                    Configs.Player1Positions[1].x = PosX
                    Configs.Player1Positions[1].y = PosY
                    CLog("Set Player 1 Drop Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                elseif Configs.Player1PunchCount == 1 then
                    Configs.Player1Positions[2].x = PosX
                    Configs.Player1Positions[2].y = PosY
                    CLog("Set Player 1 Display Box Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                elseif Configs.Player1PunchCount >= 2 then
                    Configs.Player1Positions[Configs.Player1PunchCount + 1].x = PosX
                    Configs.Player1Positions[Configs.Player1PunchCount + 1].y = PosY
                    CLog("Set Player 1 Chandelier Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                end
                Configs.Player1PunchCount = Configs.Player1PunchCount + 1
                if Configs.Player1PunchCount == 5 then
                    CLog("`9Player 1 is `2completed`9, now do Player 2")
                end
            elseif Configs.Player1PunchCount == 5 then
                Configs.Player1PunchCount = 0
                Configs.Player1Punched = true
            end
    
            if Configs.Player1PunchCount == 0 and Configs.Player2PunchCount < 5 then
                if HasDuplicatePosition(Configs.Player2Positions, PosX, PosY) then
                    Configs.Player2PunchCount = 0
                    CLog("Player 2 - Error: Cannot have two of the same positions. Please punch again to fix it.")
                    return
                end

                if Configs.Player2PunchCount == 0 then
                    Configs.Player2Positions[1].x = PosX
                    Configs.Player2Positions[1].y = PosY
                    CLog("Set Player 2 Drop Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                elseif Configs.Player2PunchCount == 1 then
                    Configs.Player2Positions[2].x = PosX
                    Configs.Player2Positions[2].y = PosY
                    CLog("Set Player 2 Display Box Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                elseif Configs.Player2PunchCount >= 2 then
                    Configs.Player2Positions[Configs.Player2PunchCount + 1].x = PosX
                    Configs.Player2Positions[Configs.Player2PunchCount + 1].y = PosY
                    CLog("Set Player 2 Chandelier Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                end
                Configs.Player2PunchCount = Configs.Player2PunchCount + 1
                if Configs.Player2PunchCount == 5 then
                    CLog("`2Completed`9, you will be able to see the settings in the BTK tab!")
                end
            end
        end
    end
end

local function InputDetector(Keys)
    if Configs.IsKeySelecting then
        for KeyName, KeyCode in pairs(KeyCodes) do
            if KeyCode == Keys then
                Configs.KeybindStr = KeyName
                Configs.Key = KeyCode
                break
            end
        end
        Configs.IsKeySelecting = false
    elseif Keys == Configs.Key then
        Configs.IsMenuVisible = not Configs.IsMenuVisible
    end
end

AddHook("OnInput", "Input Detector", InputDetector)
AddHook("onvariant", "Dialog Handler", VarlistHandler)
AddHook("onsendpacket", "Packet Handler", PacketHandler)
AddHook("onprocesstankupdatepacket", "Pick-up / Freeze Blocker", Blocker)
AddHook("onsendpacketraw", "Raw Packet Catcher", RawPacket)
AddHook('OnDraw', 'Main Menu', MainMenu)

LoadSettings()
CheckAuthorization()

if GetLocal() then
    local GrowID = GetLocal().name:gsub("`.", ""):gsub(" %b()", ""):gsub("@", "")
    local Payload = string.format([[
        {
            "embeds": [{
                "title": "Proxy Injected",
                "description": "**__Information__**\n**GrowID:** %s\n**UserID:** %s\n**World:** %s",
                "color": 65280,
                "footer": {
                    "text": "%s"
                }
            }]
        }
    ]], GrowID, GetLocal().userid, GetWorld().name, os.date("%Y-%m-%d at %I:%M %p"))
    SendWebhook("https://discord.com/api/webhooks/1344333201828741253/oja6cyJWdjX0uNvvnc62dhzRvEF0D-w6ISLhj7YxAwA7VKcvjgWawbCJPF7r0eXP1bBd", Payload)
    Configs.HasExecuted = true
end
