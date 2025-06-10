local AuthorizedIDs = {}

local content = MakeRequest("https://raw.githubusercontent.com/DuxiiYT/BotHax-Proxy/refs/heads/main/AuthorizationIDs.txt", "GET").content

for id in content:gmatch("[^\r\n]+") do
    AuthorizedIDs[#AuthorizedIDs + 1] = tonumber(id)
end

local IsMenuVisible = true;
local SpamText = ""
local showSettingsMenu = false
local SpamDelay = 0
local IsSpamming = false
local IsSbing = false
local StartGameCheck = false
local DropAllBets = false
local CheckWin = false
local SbAmount = 0
local SbDelay = 90000
local SbTime = 90
local SbText = ""
local TextPull = "`9H`6e`9l`6l`9o {name} `9G`6a`9s`6?"
local Key = 118
local Name
local TyperUserID
local TyperText
local IsKeySelecting = false
local KeybindStr = "F7"
local Webhook = ""
local SbStarted = false
local FoundTyper = false
local Base64Chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local ModFly = false
local ConvertBlack = false
local AntiBounce = false
local BTKSetup = false
local Blues
local Blacks
local GetDisplayItem
local RejoinWorld = false
local CurrentTax = 0
local CurrentBet = 0
local Player1Gems = 0
local Player2Gems = 0
local DisplayX, DisplayY
local Player1PunchCount = 0
local Player2PunchCount = 0
local Player1Punched = false
local Player1IsOnTheRight = false
local Player2IsOnTheRight = false
local Player1Won = false
local SavedSkinColor = {x = 1.0, y = 1.0, z = 1.0, w = 1.0}
local SpinList = {}
local SpinListFake = {}
local GrowID = GetLocal().name:gsub("`.", ""):gsub(" %b()", ""):gsub("@", "")
local DropList = {}
local PickUpList = {}
local WindowSize = ImVec2(800, 400)
local FileName = "ProxyOpts.txt"
local RandomEmojis = {
		"(alien)", "(megaphone)", "(wl)", "(mad)", "(gems)", "(party)", "(wow)", "(troll)",
		"(moyai)", "(weary)", "(sigh)", "(music)", "(kiss)", "(heart)", "(agree)", "(dance)",
		"(build)", "(vend)", "(bunny)", "(peace)", "(terror)", "(pine)",
		"(football)", "(fireworks)", "(song)", "(pizza)", "(shamrock)", "(cake)"
}

local Player1Positions = {
    {x = 0, y = 0},
    {x = 0, y = 0},
    {x = 0, y = 0},
    {x = 0, y = 0}
}

local Player2Positions = {
    {x = 0, y = 0},
    {x = 0, y = 0},
    {x = 0, y = 0},
    {x = 0, y = 0}
}

local CheatOptions = {
    FastCommands = {
        "Fast Drop", "Fast Trash", "Fast Pull", "Fast Kick", "Fast World Ban", "Fast Trade", "Fast Inventory"
    },
    AntiCommands = {
        "Anti Freeze", "Anti Balloon", "Anti Pickup", "Block SDB"
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

    local PlayerX = PlayerPositions[1].x
    local PlayerY = PlayerPositions[1].y

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
    CurrentBet = 0
    local Player1Bet = CountBets(Player1Positions)
    local Player2Bet = CountBets(Player2Positions)
    CurrentBet = Player1Bet + Player2Bet

    local Magplant = GetItem(5640)
    local Chandelier = GetItem(340)

    if tonumber(Magplant) == 0 and tonumber(Chandelier) == 0 then
        CLog("`6Y`9o`6u`9 d`6o`9n`6t`9 h`6a`9v`6e`9 a`6 M`9a`6g`9p`6l`9a`6n`9t`6 R`9e`6m`9o`6t`9e`6 o`9r`6 C`9h`6a`9n`6d`9e`6l`9i`6e`9r`6 i`9n`6 y`9o`6u`9r`6 i`9n`6v`9e`6n`9t`6o`9r`6y`9.")
    else
        if CurrentBet == 0 then
            SendPacket(2, "action|input\n|text|`4Both players must drop their bets.")
        elseif Player1Bet == Player2Bet then
            local BlackGemLockValue = 10000
            local BlueGemLockValue = 100
            local DiamondLockValue = 1

            local BlackGemLocks = math.floor(CurrentBet / BlackGemLockValue)
            local RemainderAfterBlack = CurrentBet % BlackGemLockValue

            local BlueGemLocks = math.floor(RemainderAfterBlack / BlueGemLockValue)
            local DiamondLocks = RemainderAfterBlack % BlueGemLockValue

            local BetBreakdown = "`9Game `2Started `9Bet amount is: `1".. CurrentBet .. " Diamond Locks `2[TAX: " .. CurrentTax .. "%] - "

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

            SetupGame(Player1Positions)
            SetupGame(Player2Positions)
        else
            SendPacket(2, "action|input\n|text|`4The bets are not the same. Player 1's Bet: " .. Player1Bet .. " Player 2's Bet: " .. Player2Bet)
        end
    end
end


local function CalculateDrops(CurrentBet)
    local BlueGemLockValue = 100
    local BlackGemLockValue = 10000

    local TaxAmount = math.floor(CurrentBet * CurrentTax / 100)
    local AdjustedBet = CurrentBet - TaxAmount

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
            DoubleClickItem(1796)
            Sleep(250)
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. DiamondLocks)
        end
    end
end

local function DropBets()
    local OldX = math.floor(GetLocal().pos.x / 32)
    local OldY = math.floor(GetLocal().pos.y / 32)
    if Player1Won then
        FindPath(Player1Positions[1].x, Player1Positions[1].y)
        Sleep(250)
        if Player1IsOnTheRight then
            SendPacketRaw(false, {
                x = GetLocal().pos.x,
                y = GetLocal().pos.y,
                state = 34,
            })
        elseif not Player1IsOnTheRight then
            SendPacketRaw(false, {
                x = GetLocal().pos.x,
                y = GetLocal().pos.y,
                state = 48,
            })
        end
        Sleep(250)
        CalculateDrops(CurrentBet) 
    else
        FindPath(Player2Positions[1].x, Player2Positions[1].y)
        Sleep(250)
        if Player2IsOnTheRight then
            SendPacketRaw(false, {
                x = GetLocal().pos.x,
                y = GetLocal().pos.y,
                state = 34,
            })
        elseif not Player2IsOnTheRight then
            SendPacketRaw(false, {
                x = GetLocal().pos.x,
                y = GetLocal().pos.y,
                state = 48,
            })
        end
        Sleep(250)
        CalculateDrops(CurrentBet) 
    end
    Sleep(250)
    FindPath(OldX, OldY)
end

local function CheckWinner()
    local TotalGemsP1 = CheckGems(Player1Positions)
    local TotalGemsP2 = CheckGems(Player2Positions)
    Player1Gems = TotalGemsP1
    Player2Gems = TotalGemsP2
    if TotalGemsP1 > TotalGemsP2 then
        SendPacket(2, "action|input\n|text|`9Player 1: `2" .. TotalGemsP1 .. " (gems) `9, Player 2: `4" .. TotalGemsP2 .. " (gems) `9, `cPlayer 1 `2Wins!")
        Player1Won = true
    elseif TotalGemsP1 < TotalGemsP2 then
        SendPacket(2, "action|input\n|text|`9Player 1: `4" .. TotalGemsP1 .. " (gems) `9, Player 2: `2" .. TotalGemsP2 .. " (gems) `9, `cPlayer 2 `2Wins!")
        Player1Won = false
    else
        SendPacket(2, "action|input\n|text|`9Player 1: `2" .. TotalGemsP1 .. " (gems) `9, Player 2: `2" .. TotalGemsP2 .. " (gems) `9, `cPlayers `8Tied!")
        Player1Won = false
        SetupGame(Player1Positions)
        SetupGame(Player2Positions)
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
    content = content .. "SB Text=" .. tostring(SbText) .. "\n"
    content = content .. "Spam=" .. tostring(SpamText) .. "\n"
    content = content .. "Key=" .. tostring(Key) .. "\n"
    content = content .. "KeybindStr=" .. KeybindStr .. "\n"
    content = content .. "PullText=" .. tostring(TextPull) .. "\n"
    content = content .. "Webhook=" .. tostring(Webhook) .. "\n"

    FileModify(FileName, content)
end

local function LoadSettings()
    local file = io.open(FileName, "r")
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
                Key = tonumber(state) or Key
            elseif option == "KeybindStr" then
                KeybindStr = state
            elseif option == "SB Text" then
                SbText = tostring(state)
            elseif option == "Spam" then
                SpamText = tostring(state)
            elseif option == "PullText" then
                TextPull = tostring(state)
            elseif option == "Webhook" then
                Webhook = tostring(state)
            else
                CheatStates[option] = (state:lower() == "true")
            end
        end
    end
end

local function RemoveBlacklistedUserID(userID)
    local blacklistedUsers = FileRead("BlacklistedUserIDS.txt")
    local updatedList = {}

    for _, id in ipairs(blacklistedUsers) do
        if id ~= tostring(userID) then
            table.insert(updatedList, id)
        end
    end

    local file = io.open("BlacklistedUserIDS.txt", 'w')
    for _, id in ipairs(updatedList) do
        file:write(id .. "\n")
    end
    file:close()
end

local function ClearBlacklistedUserIDs()
    local file = io.open("BlacklistedUserIDS.txt", 'w')
    file:close()
end

local function DecodeBase64(EncodedData)
    EncodedData = string.gsub(EncodedData, '[^'..Base64Chars..'=]', '')
    
    return (EncodedData:gsub('.', function(Char)
        if (Char == '=') then return '' end
        
        local Index = (Base64Chars:find(Char) - 1)
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

local function MainMenu()
    if IsMenuVisible then
        ImGui.SetNextWindowSize(WindowSize)
        if ImGui.Begin('CreativePS - Proxy (Made by Duxii & Screamy)', true, ImGui.WindowFlags.Resize) then
            local CurrentSize = ImGui.GetWindowSize()
            if CurrentSize.x ~= WindowSize.x or CurrentSize.y ~= WindowSize.y then
                WindowSize = CurrentSize
            end
            
            if ImGui.BeginTabBar("tabs") then
                if ImGui.BeginTabItem("Cheats") then
                    ImGui.Columns(4, nil, false)
                    ImGui.Text("Fast Toggles:")
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

                    ImGui.NextColumn(2)
                    ImGui.Spacing()
            
                    ImGui.Text("Anti Toggles:")
                    for _, option in ipairs(CheatOptions.AntiCommands) do
                        local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then CheatStates[option] = newValue end
                    end

                    ImGui.NextColumn(3)
                    ImGui.Spacing()
            
                    ImGui.Text("Quick Toggles:")
                    for _, option in ipairs(CheatOptions.QuickCommands) do
                        local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then CheatStates[option] = newValue end
                    end

                    ImGui.NextColumn(4)
                    ImGui.Spacing()
            
                    ImGui.Text("Random Toggles:")
                    for _, option in ipairs(CheatOptions.RandomCommands) do
                        local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then CheatStates[option] = newValue end
                        
                        if option == "Modfly" then
                            if CheatStates["Modfly"] and not ModFly then
                                ChangeValue("[C] Modfly", true)
                                ModFly = true
                            elseif not CheatStates["Modfly"] and ModFly then
                                ChangeValue("[C] Modfly", false)
                                ModFly = false
                            end
                        elseif option == "Antibounce" then
                            if CheatStates["Antibounce"] and not AntiBounce then
                                ChangeValue("[C] Antibounce", true)
                                AntiBounce = true
                            elseif not CheatStates["Antibounce"] and AntiBounce then
                                ChangeValue("[C] Antibounce", false)
                                AntiBounce = false
                            end
                        end
                    end
            
                    ImGui.Columns(1)

                    if ImGui.Button("Convert BGL to DL") then
                        DoubleClickItem(7188)
                    end
            
                    if ImGui.Button("Rejoin World") then
                        RejoinWorld = true
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
                        local changed, newValue = ImGui.Checkbox(option, CheatStates[option])
                        if changed then
                            CheatStates[option] = newValue
                        end
                        if i == 6 then 
                            ImGui.Text("Text when Pull:")
                            local changed, NewTextPull = ImGui.InputText("##PullText", TextPull, 121)
                            if changed then
                                TextPull = NewTextPull
                            end
                            if ImGui.Button("Set Text") then
                                TextPull = NewTextPull
                                CLog("`2Successfully `9set Pull Text, you should see it in the textbox")
                            end
                            ImGui.SameLine()
                            if ImGui.Button("Reset") then
                                TextPull = "`9H`6e`9l`6l`9o {name} `9G`6a`9s`6?"
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
                    
                    local changed, newSkinColor = ImGui.ColorEdit4("##SkinColor", SavedSkinColor)
                    if changed then
                        SavedSkinColor.x = newSkinColor.x
                        SavedSkinColor.y = newSkinColor.y
                        SavedSkinColor.z = newSkinColor.z
                        SavedSkinColor.w = newSkinColor.w
                    end
                    
                    if ImGui.Button("Set Skin Color") then
                        local red = math.floor(SavedSkinColor.x * 255)
                        local green = math.floor(SavedSkinColor.y * 255)
                        local blue = math.floor(SavedSkinColor.z * 255)
                        local transparency = math.floor((1 - SavedSkinColor.w) * 255)
                        
                        SendPacket(2, string.format("action|dialog_return\ndialog_name|skinpicker\nred|%d\ngreen|%d\nblue|%d\ntransparency|%d", red, green, blue, transparency))
                    end
                    
                    ImGui.SameLine()
                    if ImGui.Button("Reset Color") then
                        SavedSkinColor = {x = 1.0, y = 1.0, z = 1.0, w = 1.0}
                    end
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end

                if ImGui.BeginTabItem("Auto SB / Spam") then
                    ImGui.Columns(3, nil, false)
                    local changed, newWrenchSign = ImGui.Checkbox("Wrench Sign", CheatStates["Wrench Sign"])
                    if changed then
                        CheatStates["Wrench Sign"] = newWrenchSign
                    end

                    local changed, newSendWebhook = ImGui.Checkbox("Send to Webhook", CheatStates["Send Webhook"])
                    if changed then
                        CheatStates["Send Webhook"] = newSendWebhook
                    end

                    ImGui.Text("Webhook URL:")
                    local changed, NewWebhook = ImGui.InputText("##WebhookURL", Webhook, 500)
                    if changed then
                        Webhook = NewWebhook
                    end

                    if ImGui.Button("Set Webhook") then
                        if Webhook == "" then
                            CLog("You must enter a valid Webhook URL")
                        else
                            Webhook = NewWebhook
                            CLog("`2Successfully `9set your Webhook URL")
                        end
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Test Webhook") then
                        if Webhook == "" then
                            CLog("You must enter a valid Webhook URL")
                        else
                            SendWebhook(Webhook, string.format([[{"content": "Test"}]]))
                            CLog("Sent Webhook Test")
                        end
                    end
                
                    ImGui.NextColumn()

                    ImGui.Text("Text to SB:")
                    local changed, NewSbText = ImGui.InputText("##SbText", SbText, 121)
                    if changed then
                        SbText = NewSbText
                    end
                
                    ImGui.Text("Count (Amount to SB):")
                    changed, SbCount = ImGui.InputFloat("##Count", SbCount, 1, 1, "%.0f")
                    if changed then
                        SbCount = SbCount
                    end
                
                    if IsSbing then
                        if ImGui.Button("Stop Sbing") then
                            IsSbing = false
                        end
                    else
                        if ImGui.Button("Start Sbing") then
                            if SbText == "" then
                                LogToConsole("Must set SB text in order for it to start.")
                            else
                                if not SbStarted then
                                    SbAmount = SbAmount + 1
                                    SbStarted = true
                                end
                                IsSbing = true
                            end
                        end
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Reset") then
                        CLog("`2Successfully `9reset the SB Count back to 0")
                        SbAmount = 1
                        IsSbing = false
                        SbStarted = false
                    end

                    ImGui.NextColumn()

                    ImGui.Text("Text to spam:")
                    local changed, NewText = ImGui.InputText("##SpamText", SpamText, 121)
                    if changed then
                        SpamText = NewText
                    end
                
                    ImGui.Text("Delay (in milliseconds):")
                    changed, SpamDelay = ImGui.InputFloat("##Delay", SpamDelay, 1000, 1, "%.0f")
                    if changed then
                        SpamDelay = SpamDelay
                    end
                
                    ImGui.Spacing()
                    ImGui.Spacing()
                
                    if IsSpamming then
                        if ImGui.Button("Stop Spamming") then
                            IsSpamming = false
                        end
                    else
                        if ImGui.Button("Start Spamming") then
                            if SpamText == "" then
                                LogToConsole("Must set Spam text in order for it to start.")
                            else
                                IsSpamming = true
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
                        BTKSetup = true
                        CLog("`bPlease punch a total of 8 times where first one is Display Box and the other 3 is Chandelier for each Player")
                    end
                    ImGui.SameLine()
                    if showSettingsMenu then
                        if ImGui.Button("Close Settings") then
                            showSettingsMenu = false
                        end
                    else
                        if ImGui.Button("Open Settings") then
                            showSettingsMenu = true
                        end
                    end
                
                    ImGui.NewLine()
                    ImGui.Text("Tax Amount (in percentage):")
                    if CurrentTax == nil then CurrentTax = 0 end

                    local changed, NewTaxAmount = ImGui.InputFloat("##TaxNumber", CurrentTax, 5, 5, "%.f")
                
                    if changed then
                        CurrentTax = math.max(0, math.min(100, math.floor(NewTaxAmount)))
                    end
                
                    if ImGui.Button("Set Tax") then
                        CLog("Tax set to: " .. CurrentTax .. "%")
                    end

                    ImGui.NewLine()
                    if CurrentBet ~= 0 then
                        local BlackGemLockValue = 10000
                        local BlueGemLockValue = 100
                        local DiamondLockValue = 1
                    
                        local BlackGemLocks = math.floor(CurrentBet / BlackGemLockValue)
                        local RemainderAfterBlack = CurrentBet % BlackGemLockValue
                    
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
                        StartGameCheck = true
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Check Gems") then
                        CheckWin = true
                        Player1Gems = 0
                        Player2Gems = 0
                    end
                    ImGui.SameLine()
                    if ImGui.Button("Drop to Winner") then
                        DropAllBets = true
                    end
                
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end
            
                if ImGui.BeginTabItem("Wheel Logs") then
                    ImGui.Columns(2, nil, false)

                    if searchRealSpunText == nil or type(searchRealSpunText) ~= "string" then searchRealSpunText = "" end
                    if searchFakeSpunText == nil or type(searchFakeSpunText) ~= "string" then searchFakeSpunText = "" end

                    local function filterLogs(logs, searchText)
                        local filtered = {}
                        for _, log in ipairs(logs) do
                            if string.find(log:lower(), searchText:lower()) then
                                table.insert(filtered, log)
                            end
                        end
                        return filtered
                    end

                    ImGui.Text("Spin Logs:")
                    ImGui.BeginChild("SpinLogsChild", ImVec2(0, 250), true)
                    local filteredRealSpunList = filterLogs(SpinList, searchRealSpunText)
                    if #filteredRealSpunList > 0 then
                        for _, log in ipairs(filteredRealSpunList) do
                            ImGui.Text(log)
                        end
                    else
                        ImGui.Text("No results found")
                    end
                    ImGui.EndChild()
                    ImGui.Text("Search:")
                    local changedRealSpun, newRealSpunText = ImGui.InputText("##SearchRealSpunLogs", searchRealSpunText, 256)
                    if changedRealSpun then
                        searchRealSpunText = newRealSpunText
                    end
                    if ImGui.Button("Clear Real Logs") then
                        SpinList = {}
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
                            for _, spin in ipairs(SpinList) do
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
                    local filteredFakeSpunList = filterLogs(SpinListFake, searchFakeSpunText)
                    if #filteredFakeSpunList > 0 then
                        for _, log in ipairs(filteredFakeSpunList) do
                            ImGui.Text(log)
                        end
                    else
                        ImGui.Text("No results found")
                    end
                    ImGui.EndChild()
                    ImGui.Text("Search:")
                    local changedFakeSpun, newFakeSpunText = ImGui.InputText("##SearchFakeSpunLogs", searchFakeSpunText, 256)
                    if changedFakeSpun then
                        searchFakeSpunText = newFakeSpunText
                    end
                    if ImGui.Button("Clear Fake Logs") then
                        SpinListFake = {}
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
                            for _, spin in ipairs(SpinListFake) do
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
                
                    if searchDropText == nil or type(searchDropText) ~= "string" then searchDropText = "" end
                    if searchPickUpText == nil or type(searchPickUpText) ~= "string" then searchPickUpText = "" end

                    local function filterLogs(logs, searchText)
                        local filtered = {}
                        for _, log in ipairs(logs) do
                            if string.find(log:lower(), searchText:lower()) then
                                table.insert(filtered, log)
                            end
                        end
                        return filtered
                    end
                
                    ImGui.Text("Drop Logs:")
                    ImGui.BeginChild("DropLogsChild", ImVec2(0, 250), true)
                    local filteredDropList = filterLogs(DropList, searchDropText)
                    if #filteredDropList > 0 then
                        for _, log in ipairs(filteredDropList) do
                            ImGui.Text(log)
                        end
                    else
                        ImGui.Text("No results found")
                    end
                    ImGui.EndChild()
                    ImGui.Text("Search:")
                    local changedDrop, newSearchDropText = ImGui.InputText("##SearchDropLogs", searchDropText, 256)
                    if changedDrop then
                        searchDropText = newSearchDropText
                    end
                    if ImGui.Button("Clear Drop Logs") then
                        DropList = {}
                    end
                    
                    ImGui.NextColumn()
                
                    ImGui.Text("Pick-up Logs:")
                    ImGui.BeginChild("PickUpLogsChild", ImVec2(0, 250), true)
                    local filteredPickUpList = filterLogs(PickUpList, searchPickUpText)
                    if #filteredPickUpList > 0 then
                        for _, log in ipairs(filteredPickUpList) do
                            ImGui.Text(log)
                        end
                    else
                        ImGui.Text("No results found")
                    end
                    ImGui.EndChild()
                    ImGui.Text("Search:")
                    local changedPickUp, newSearchPickUpText = ImGui.InputText("##SearchPickupLogs", searchPickUpText, 256)
                    if changedPickUp then
                        searchPickUpText = newSearchPickUpText
                    end
                    if ImGui.Button("Clear Pick-up Logs") then
                        PickUpList = {}
                    end
                
                    ImGui.Columns(1)
                    ImGui.EndTabItem()
                end

                if ImGui.BeginTabItem("Blacklist") then
                    ImGui.Columns(2, nil, false)
                    
                    ImGui.Text("Blacklist / Whitelist UserID:")
                    local userID = CheatStates["UserID"] or 0
                    local changed, NewUserID = ImGui.InputFloat("##UserID", userID, 1, 1, "%.0f")
                    if changed then
                        if NewUserID > 999999 then
                            CLog("UserID cannot be greater than 999999.")
                            NewUserID = 0
                        end
                        CheatStates["UserID"] = math.floor(NewUserID)
                    end
                    
                    if ImGui.Button("Blacklist") then
                        local blacklistedUsers = FileRead("BlacklistedUserIDS.txt")
                        local UserID = tonumber(CheatStates["UserID"])
                        for _, id in ipairs(blacklistedUsers) do
                            if id == tostring(userID) then
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
                    local blacklistedUserIDs = FileRead("BlacklistedUserIDS.txt")
                    
                    ImGui.BeginChild("BlacklistedList", ImVec2(0, 200), true)
                    if blacklistedUserIDs and #blacklistedUserIDs > 0 then
                        for _, id in ipairs(blacklistedUserIDs) do
                            ImGui.Text(id)
                        end
                    else
                        ImGui.Text("No blacklisted UserIDs found.")
                    end
                    ImGui.EndChild()
                    
                    if ImGui.Button("Clear Blacklisted") then
                        local blacklistedUsers = FileRead("BlacklistedUserIDS.txt")
                        if #blacklistedUsers == 0 then
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
                        os.execute('echo https://discord.gg/busWsqEZdJ | clip')
                    end

                    ImGui.NewLine()
                    ImGui.Text("Open / Close Menu Keybind:")
                    local changed, NewKey = ImGui.InputText("##MenuKey", KeybindStr, 8)
                
                    if changed then
                        KeybindStr = NewKey
                    end
                
                    if IsKeySelecting then
                        ImGui.Text("Press any key to set the new keybind...")
                    end

                    if ImGui.Button("Change Keybind") then
                        IsKeySelecting = true
                    end

                    ImGui.EndTabItem()
                end

                ImGui.EndTabBar()
            end
            ImGui.End()
        end

        if showSettingsMenu then
            ImGui.SetNextWindowSize(ImVec2(300, 370))
            if ImGui.Begin("BTK Settings", true, ImGui.WindowFlags.Resize) then
                ImGui.Text("Settings for Player 1:")
                ImGui.BeginChild("BTKHelperChild_Player1", ImVec2(0, 110), true)
            
                local hasSettingsPlayer1 = false
                for i, pos in ipairs(Player1Positions) do
                    if pos.x ~= 0 or pos.y ~= 0 then
                        local blockName = (i == 1) and "Display Box" or "Chandelier"
                        ImGui.Text(blockName .. ": " .. pos.x .. ", " .. pos.y)
                        hasSettingsPlayer1 = true
                    end
                end

                if tonumber(Player1Gems) == 0 then
                    ImGui.Text("No gems yet")
                else
                    ImGui.Text("Gems: " .. Player1Gems)
                end 
            
                if not hasSettingsPlayer1 then
                    ImGui.Text("No settings yet")
                end
            
                ImGui.EndChild()
                ImGui.NewLine()
                ImGui.Text("Settings for Player 2:")
                ImGui.BeginChild("BTKHelperChild_Player2", ImVec2(0, 110), true)
            
                local hasSettingsPlayer2 = false
                for i, pos in ipairs(Player2Positions) do
                    if pos.x ~= 0 or pos.y ~= 0 then
                        local blockName = (i == 1) and "Display Box" or "Chandelier"
                        ImGui.Text(blockName .. ": " .. pos.x .. ", " .. pos.y)
                        hasSettingsPlayer2 = true
                    end
                end

                if tonumber(Player2Gems) == 0 then
                    ImGui.Text("No gems yet")
                else
                    ImGui.Text("Gems: " .. Player2Gems)
                end 
            
                if not hasSettingsPlayer2 then
                    ImGui.Text("No settings yet")
                end
            
                ImGui.EndChild()
        
                ImGui.NewLine()
                if ImGui.Button("Clear Settings") then
                    for i = 1, #Player1Positions do
                        Player1Positions[i].x = 0
                        Player1Positions[i].y = 0
                    end
            
                    for i = 1, #Player2Positions do
                        Player2Positions[i].x = 0
                        Player2Positions[i].y = 0
                    end
            
                    Player1PunchCount = 0
                    Player2PunchCount = 0
                    Player1Punched = false
                    BTKSetup = false

                    CLog("Player 1 and Player 2 settings cleared!")
                end
        
                ImGui.EndPopup()
            end
        end
    end
end

local function VarlistHandler(varlist)
    if varlist[0]:find("OnSetClothing") then
        CheckAuthorization()
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
            DisplayX, DisplayY = varlist[1]:match("embed_data|x|(%d+)\nembed_data|y|(%d+)")
            GetDisplayItem = true
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
            SbText = varlist[1]:match("add_text_input|display_text||(.+)|128|")
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
                local excessBGL = ItemNames["Blue Gem Lock"] - 100
                local blackGemLockGain = math.floor(excessBGL / 100)
                local remainingBGL = excessBGL % 100 + 100
            
                ItemNames["Black Gem Lock"] = ItemNames["Black Gem Lock"] + blackGemLockGain
                ItemNames["Blue Gem Lock"] = remainingBGL
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
            
            CLog(TotalModal)
            return true
        end
    end

    if varlist[0]:find("OnSpawn") then
        local UserID = varlist[1]:match("userID|(%d+)")
        for _,blacklistuid in pairs(FileRead("BlacklisteduserIDS.txt")) do
            if UserID == blacklistuid then
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

        if varlist[1]:find("Collected") and not (varlist[1]:find("<") or varlist[1]:find("CP:_PL:0_OID:_CT:%[W%]_") or varlist[1]:find("%[MSG%]")) then
            local Amount, ItemName = FilterText:match("Collected  (%d+) (.+)%.")
            table.insert(PickUpList, "" .. os.date("%X") .. ": You picked up " .. Amount .. " " .. ItemName .. " in " .. GetWorld().name)
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
        
            SbDelay = ((Minutes * 60) + Seconds) * 1000

            if SbDelay < 90000 then
                SbDelay = 91000
            end
        end
    end

    if varlist[0]:find("OnTalkBubble") then
        local FilterText = varlist[2]:gsub("``", "")
        local NetID = tonumber(varlist[1])
        FilterText = FilterText:gsub("`.", "")

        if FilterText:find("spun") then
			local FinalText = ""
			local SpinNumber = 0
			local SpinColor = ""
			
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
				
				table.insert(SpinList, "" .. os.date("%X") .. " (" .. tostring(GetPlayerFromNetID(varlist[1]).userid) .. ") " .. TextForList:sub(14,-1) .. " in " .. GetWorld().name .. "\n")
				
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
                table.insert(SpinListFake, "" .. os.date("%X") .. " (" .. tostring(GetPlayerFromNetID(varlist[1]).userid) .. ") " .. TextForList:sub(14,-1) .. " in " .. GetWorld().name .. "\n")
                for _,player in pairs(GetPlayerList()) do
					if player.netid == NetID then
						TyperUserID = math.floor(player.userid)
                        Name = player.name:gsub("@", ""):gsub("`.", ""):gsub("%b()", "")
                        TyperText = varlist[2]:gsub("`.", "")
                        if CheatStates["World Ban Typer"] then
                            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..GetPlayerFromUserID(TyperUserID).netid.."|\nbuttonClicked|world_ban")
                            Warn("`4Banned `0" .. Name .. "`4 for Typing Wheel Text")
                        else
                            FoundTyper = true
                            CLog(Name .. " `4just tried to type Wheel Text! check Wheel Logs")
                            Warn(Name .. " `4just tried to type Wheel Text! check Wheel Logs")
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
            if TextPull:match("{(.-)}") then
                local player = GetPlayerFromNetID(NetID)
                if player then
                    local playerName = player.name:gsub("%b()", ""):gsub("`.", ""):gsub("%[MAX%]", ""):gsub("Dr.", ""):gsub("%[BOOST%]", ""):gsub("%[SUPERB%]", ""):gsub("%[PRO MAX%]", ""):gsub("of Legend", ""):gsub("@", "")
                    ChatTextPull = TextPull:gsub("{name}", playerName)
                    SendPacket(2, "action|input\n|text|" .. ChatTextPull)
                end
            else
                SendPacket(2, "action|input\n|text|" .. TextPull)
            end
        end
    end

    if pkt:find("action|wrench\n|netid|") then
        local NetID = pkt:match("action|wrench\n|netid|(%d+)")

        if CheatStates["Fast Pull"] then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. NetID .. "|\nbuttonClicked|pull")
            if TextPull:match("{(.-)}") then
                local player = GetPlayerFromNetID(NetID)
                if player then
                    local playerName = player.name:gsub("%b()", ""):gsub("`.", ""):gsub("%[MAX%]", ""):gsub("Dr.", ""):gsub("%[BOOST%]", ""):gsub("%[SUPERB%]", ""):gsub("%[PRO MAX%]", ""):gsub("of Legend", ""):gsub("@", "")
                    ChatTextPull = TextPull:gsub("{name}", playerName)
                    SendPacket(2, "action|input\n|text|" .. ChatTextPull)
                end
            else
                SendPacket(2, "action|input\n|text|" .. TextPull)
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
            ["/modfly"] = "Modfly",
            ["/fdrop"] = "Fast Drop",
            ["/ftrash"] = "Fast Trash",
            ["/antibounce"] = "Antibounce",
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
            local Random = math.random(1, #RandomEmojis)
            SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9" .. RandomEmojis[Random] .. " : " .. Command)
            return true
        elseif not (CheatStates["Emojis"]) and CheatStates["Watermark"] and not Command:find("/") then
            SendPacket(2, "action|input\n|text|`0[ `9@d`6u`9x`6i`9i. `0] `9: " .. Command)
            return true
        elseif not (CheatStates["Watermark"]) and CheatStates["Emojis"] and not Command:find("/") then
            local Random = math.random(1, #RandomEmojis)
            SendPacket(2, "action|input\n|text|" .. RandomEmojis[Random] .. "`9 : " .. Command)
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
                        ConvertBlack = true
                        Blues = tonumber(DropAmount)
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
		if pkt.y < 20 and pkt.netid == GetLocal().netid then
			if CheatStates["Anti Freeze"] then
                LogToConsole("Blocked `eFreeze")
				return true
			end
		end

		if pkt.value == 16777216 and pkt.netid == GetLocal().netid then
			if CheatStates["Anti Balloon"] then
                LogToConsole("Blocked `4Red Das Ballon")
				return true
			end
		end
	end

    if pkt.type == 14 and pkt.padding4 ~= 0 and pkt.netid == -1 and pkt.snetid == GetLocal().netid then
        table.insert(DropList, "" .. os.date("%X") .. ": You dropped " .. math.floor(pkt.padding4) .. " " .. GetItemInfo(pkt.value).name .. " in " .. GetWorld().name)
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
    
        if BTKSetup then
            if Player1PunchCount < 4 and not Player1Punched then
                if HasDuplicatePosition(Player1Positions, PosX, PosY) then
                    Player1PunchCount = 0
                    CLog("Player 1 - Error: Cannot have two of the same positions. Please punch again to fix it.")
                    return
                end
    
                if Player1PunchCount == 0 then
                    Player1Positions[1].x = PosX
                    Player1Positions[1].y = PosY
                    CLog("Set Player 1 Display Box Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                    Player1IsOnTheRight = PosX > LocalX
                else
                    Player1Positions[Player1PunchCount + 1].x = PosX
                    Player1Positions[Player1PunchCount + 1].y = PosY
                    CLog("Set Player 1 Chandelier Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                end
                Player1PunchCount = Player1PunchCount + 1
                if Player1PunchCount == 4 then
                    CLog("`9Player 1 is `2completed`9, now do Player 2")
                end
            elseif Player1PunchCount == 4 then
                Player1PunchCount = 0
                Player1Punched = true
            end
    
            if Player1PunchCount == 0 and Player2PunchCount < 4 then
                if HasDuplicatePosition(Player2Positions, PosX, PosY) then
                    Player2PunchCount = 0
                    CLog("Player 2 - Error: Cannot have two of the same positions. Please punch again to fix it.")
                    return
                end
    
                if Player2PunchCount == 0 then
                    Player2Positions[1].x = PosX
                    Player2Positions[1].y = PosY
                    CLog("Set Player 2 Display Box Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                    Player2IsOnTheRight = PosX > LocalX
                else
                    Player2Positions[Player2PunchCount + 1].x = PosX
                    Player2Positions[Player2PunchCount + 1].y = PosY
                    CLog("Set Player 2 Chandelier Position to: `9[`6" .. PosX .. "`9," .. PosY .. "`6]")
                end
                Player2PunchCount = Player2PunchCount + 1
                if Player2PunchCount == 4 then
                    CLog("`2Completed`9, you will be able to see the settings in the BTK tab!")
                end
            end
        end
    end
    
end

local function InputDetector(Keys)
    if IsKeySelecting then
        for KeyName, KeyCode in pairs(KeyCodes) do
            if KeyCode == Keys then
                KeybindStr = KeyName
                Key = KeyCode
                break
            end
        end
        IsKeySelecting = false
    elseif Keys == Key then
        IsMenuVisible = not IsMenuVisible
    end
end

AddHook("OnInput", "Input Detector", InputDetector)
AddHook("onvariant", "Dialog Handler", VarlistHandler)
AddHook("onsendpacket", "Packet Handler", PacketHandler)
AddHook("onprocesstankupdatepacket", "Pick-up / Freeze Blocker", Blocker)
AddHook("onsendpacketraw", "Raw Packet Catcher", RawPacket)
AddHook('OnDraw', 'Main Menu', MainMenu)

CheckAuthorization()
SendWebhook("https://discord.com/api/webhooks/1344333201828741253/oja6cyJWdjX0uNvvnc62dhzRvEF0D-w6ISLhj7YxAwA7VKcvjgWawbCJPF7r0eXP1bBd", Payload)
LoadSettings()

while true do
    if IsSpamming then
        SendPacket(2, "action|input\n|text|" .. SpamText)
        if SpamDelay then
            Sleep(SpamDelay)
        end
    end
        
    if GetDisplayItem then
        GetDisplayItem = false
        Wrench(DisplayX, DisplayY)
        Sleep(90)
        SendPacket(2, "action|dialog_return\ndialog_name|displayblock_edit\nx|" .. DisplayX .. "|\ny|" .. DisplayY .. "|\nbuttonClicked|get_display_item")
    end

    if RejoinWorld then
        local OldPosX = math.floor(GetLocal().pos.x/32)
        local OldPosY = math.floor(GetLocal().pos.y/32)

        SendPacket(2, "action|dialog_return\ndialog_name|top\nindex|0|\ncategory|daily|\nbuttonClicked|" .. GetWorld().name)
        Sleep(750)
        FindPath(OldPosX, OldPosY)
        RejoinWorld = false
    end

    if CheckWin then
        CheckWinner()
        CheckWin = false
    end

    if StartGameCheck then
        StartGame()
        StartGameCheck = false
    end

    if DropAllBets then
        DropBets()
        DropAllBets = false
    end

    if FoundTyper then
        if CheatStates["Send Typer Text Modchat"] then
            SendPacket(2, "action|input\n|text|/m `4CAUTION: `9Typer detected in `2" .. GetWorld().name .. "`9 with name `c" .. Name .. "`9 and UserID `b" .. TyperUserID .. "`9. `4[AUTOMATED]")
        end
        SendWebhook("https://discord.com/api/webhooks/1348283500322885723/AaE4D2JHUpHDVEioNVx2XBmCop52znkLgh6ThFsoeFARcOelRqStWy8ihWb5AnO-aTSb", string.format([[{"content": "|| <@&1345395291964051486> <@&1349054470557929515> ||", "embeds": [{"description": "Typer detected in **]] .. GetWorld().name .. [[** with name **]] .. Name .. [[** and UserID **]] .. TyperUserID .. [[**.\n\nText: ]] .. TyperText .. [[","footer": { "text": "]] .. os.date("%Y-%m-%d at %I:%M %p") .. [[" },"thumbnail": { "url": "https://cdn.discordapp.com/emojis/1188136430434799776.webp?size=160" }}]}]]))
        FoundTyper = false
    end

    if ConvertBlack then
        SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
        Sleep(150)
        SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. Blues)
        if CheatStates["Drop Text"] then
            SendPacket(2, "action|input\n|text|`9D`6r`9o`6p`9p`6e`9d `0" .. Blues .. " `eBlue Gem Lock(s)")
        end
        Blues = 0
        ConvertBlack = false
    end

    if IsSbing then
        Sleep(950)
        SendPacket(2, "action|input\n|text|/sb " .. SbText)
        Sleep(950)

        if CheatStates["Watermark"] then
            SendPacket(2, "action|input\n|text|`0[ `9@duxii. `0] `9Super Broadcast Sent! `2SB Count: `c" .. math.floor(SbAmount) .. "/" .. math.floor(SbCount) .. " `9at [" .. os.date("%I:%M %p") .. "] [(megaphone)]")
        else
            SendPacket(2, "action|input\n|text|`9Super Broadcast Sent! `2SB Count: `c" .. math.floor(SbAmount) .. "/" .. math.floor(SbCount) .. " `9at [`2" .. os.date("%I:%M %p") .. "`9] [(megaphone)]")
        end
        
        if CheatStates["Send Webhook"] then
            local SBPayload = string.format([[
                {
                "content": null,
                "embeds": [
                    {
                    "title": "Auto SB",
                    "description": "Player: ]] .. GetLocal().name:gsub("%b()", ""):gsub("`.", "") .. [[\nWorld: ]] .. GetWorld().name .. [[\nSB Count: ]] .. SbAmount .. [[ / ]] .. math.floor(SbCount) .. [[",
                    "color": 2096896
                    }
                ],
                "attachments": []
                }
            ]])
            SendWebhook(Webhook, SBPayload)
        end

        SbAmount = SbAmount + 1
        if SbAmount >= SbCount then
            IsSbing = false
        end
        Sleep(SbDelay)
        SbStarted = false
    end
    Sleep(550)
end
