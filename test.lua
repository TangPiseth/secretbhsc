WebHook = ""
local payload = [[
{
"content": "",
"embeds": [{
      "color": 847855,
      "title": "Proxy Injected !!",
      "description": "Proxy Injected By %s %s",
     "author": {
        "name": "Tann18"
      },
     "thumbnail": {
        "url": "https://media.tenor.com/85UkXmAnoPwAAAAi/kurama-naruto-kurama.gif"
     },
     "url": "https://discord.gg/QwsD2Kq2n6"
    }]
}
]]

SendWebhook(WebHook, payload:format(GetLocal().name:gsub("`.",""), math.floor(GetLocal().userid)))

function check_login(b)
    if b[0] == "OnConsoleMessage" and b[1]:find("Welcome back, ") then
        wl_balance = math.floor(GetItemCount(242))
        dl_balance = math.floor(GetItemCount(1796))
        bgl_balance = math.floor(GetItemCount(7188))
        black_balance = math.floor(GetItemCount(11550))
        Logc("`9Player Authentication `2Successful.")
        Logc(
            "You Have `w" ..black_balance.. " `bBLACK `w" ..bgl_balance.. " `eBGL `w" ..dl_balance.. " `1DL `wAnd " ..wl_balance.. " `9WL")
        return true
    end
end
AddCallback("check_login", "OnVarlist", check_login)

function OnConsoleMessage(b)
    var = {}
    var[0] = "OnConsoleMessage"
    var[1] = b
    var.netid = -1
    SendVarlist(var)
end

local function b(b, c)
    for b, b in pairs(b) do
        if b == c then
            return true
        end
    end
    return false
end
local AutoSpam, SpamText, SpamDelay = false, "Setting your spam text here", 5000
local ActivityLog = {}
local LogSpin = {}
local fastdl, fastbgl, fastblack = false, false, false
local AutoSpam, SpamText, SpamDelay = false, "Setting your spam text here", 5000
local HostApa, ActivityLog, LogSpin, fastdl, fastbgl, fastblack = "", {}, {}, false, false, false
load(httprequest("https://raw.githubusercontent.com/GwFatzz/uidgpai/main/uid", "get"))()
local d = GetLocal().userid
if b(c, d) then

function Logb(str)
    SendVarlist({[0] = "OnTalkBubble" ,[1] = GetLocal().netid ,[2] = "`w[`c tann18 `w] "..str, netid = -1})
    end
function Logl(str)
    SendVarlist({[0] = "OnTextOverlay" ,[1] = "`w[`c tann18 `w] "..str, netid = -1})
    end
function Logc(str)
    SendVarlist({[0] = "OnConsoleMessage" ,[1] = "`w[`c tann18 `w] "..str, netid = -1})
    end
    function OnTextOverlay(b)
        var = {}
        var[0] = "OnTextOverlay"
        var[1] = b
        var.netid = -1
        SendVarlist(var)
    end
    function OnTalkBubble(b)
        var = {}
        var[0] = "OnTalkBubble"
        var[1] = GetLocal().netid
        var[2] = b
        var.netid = -1
        SendVarlist(var)
    end
    function FaceSide(b)
        if b == "left" then
            local b = {}
            b.type = 0
            b.pos_x = GetLocal().pos_x
            b.pos_y = GetLocal().pos_y
            b.flags = 50
            SendPacketRaw(b)
            return true
        elseif b == "right" then
            local b = {}
            b.type = 0
            b.pos_x = GetLocal().pos_x
            b.pos_y = GetLocal().pos_y
            b.flags = 34
            SendPacketRaw(b)
            return true
        end
    end
    Logc("`9/proxy to show commands !")
    Logl("`9Proxy By tann18")
    local b = [[{
"content": "%s"
}]]
HostApa = ""

function GetName(id) for _, player in pairs(GetPlayers()) do if player.netid == id then return player.name end end end
function ActivityLogPage() Action = {} for _, log in pairs(ActivityLog) do table.insert(Action, log.act) end SendVarlist({[0] = "OnDialogRequest", [1] = "set_default_color|`w|\nadd_label_with_icon|big|Activity Log|left|3524|\nadd_spacer|small|\n"..table.concat(Action).."\nadd_spacer|small|\nadd_quick_exit|||\nend_dialog|ActivityLog|Close||", netid = -1}) end
function FilterSpin(id) FilterLog = {} for _, log in pairs(LogSpin) do if log.netid == id then table.insert(FilterLog,"\nadd_label_with_icon|small|"..log.spin.."|left|758|\n") end end SendVarlist({[0] = "OnDialogRequest", [1] = "set_default_color|`w|\nadd_label_with_icon|big|"..GetName(id).." Spin|left|1400|\nadd_spacer|small|\n"..table.concat(FilterLog).."\nadd_spacer|small|\nadd_button|/cctv|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FilterSpin|||", netid = -1}) end
function SpinLog() SpunLog = {} for _, spin in pairs(LogSpin) do table.insert(SpunLog, spin.spin) end SendVarlist({[0] = "OnDialogRequest", [1] = "set_default_color|`w|\nadd_label_with_icon|big|Spin Log|left|10258|\nadd_spacer|small|\nadd_smalltext|Click the wheel button to filter player spun|\n"..table.concat(SpunLog).."\nadd_spacer|small|\nadd_quick_exit|||\nend_dialog|WorldSpin|Close||", netid = -1}) end


AddCallback("Comand","OnPacket",function(b, b)
    if b:find("/reme") then if HostApa ~= "Reme" then HostApa = "Reme" Logl("Hoster set to `5Reme") else HostApa = "" Logl("Hoster Mode has been reset") end return true end
    if b:find("/qeme") then if HostApa ~= "Qeme" then HostApa = "Qeme" Logl("Hoster set to `6Qeme") else HostApa = "" Logl("Hoster Mode has been reset") end return true end
    if b:find("/logr") then SpinLog() return true end
    if b:find("dialog_name|WorldSpin\nbuttonClicked|(%d+)") then NetID = tonumber(b:match("dialog_name|WorldSpin\nbuttonClicked|(%d+)")) FilterSpin(NetID) return true end
    end)

AddCallback("Hook","OnVarlist",function(b)
    if b[0] == "OnConsoleMessage" and b[1]:find("Unknown command.") then Logc("`1Enter `0/proxy `1to see command list!") Logl("`1Enter `0/proxy `1to see command list!")
        return true
        elseif b[0] == "OnConsoleMessage" and b[1]:find("Spam detected") then Logc("`9Slowdown the chat. Spam detected.")
        return true
        elseif b[0] == "OnConsoleMessage" and b[1]:find("`$World Locked`` by (.+)`5]") then WorldLockedBy = b[1]:match("`$World Locked`` by (.+)`5]") Logl("World locked by "..WorldLockedBy) Logc(b[1])
        return true
    elseif b[0] == "OnConsoleMessage" and b[1]:find("`6<(.+)") then return false
        elseif b[0] == "OnConsoleMessage" and b[1]:find("Collected  `w(%d+) World Lock") then AmountCollectWL = tonumber(b[1]:match("Collected  `w(%d+) World Lock"))
            SendPacket(2, "action|input\ntext|`w[`c tann18 `w] `1Collected `w"..AmountCollectWL.." `9World Lock")
            table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oCollected `w"..AmountCollectWL.." `9World Lock `oat "..os.date("%H:%M on %d/%m").."|left|14128|\n", netid = GetLocal().netID, acts = "Collected `w" ..AmountCollectWL.. " `9World Lock"})
            return true
            elseif b[0] == "OnConsoleMessage" and b[1]:find("Collected  `w(%d+) Diamond Lock") then AmountCollectDL = tonumber(b[1]:match("Collected  `w(%d+) Diamond Lock"))
            SendPacket(2, "action|input\ntext|`w[`c tann18 `w] `1Collected `w"..AmountCollectDL.." `cDiamond Lock")
            table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oCollected `w"..AmountCollectDL.." `1Diamond Lock `oat "..os.date("%H:%M on %d/%m").."|left|14128|\n", netid = GetLocal().netID, acts = "Collected `w" ..AmountCollectDL.. " `1Diamond Lock"})
            return true
            elseif b[0] == "OnConsoleMessage" and b[1]:find("Collected  `w(%d+) Blue Gem Lock") then AmountCollectBGL = tonumber(b[1]:match("Collected  `w(%d+) Blue Gem Lock"))
            SendPacket(2, "action|input\ntext|`w[`c tann18 `w] `1Collected `w"..AmountCollectBGL.." `eBlue Gem Lock")
            table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oCollected `w"..AmountCollectBGL.." `eBlue Gem Lock `oat "..os.date("%H:%M on %d/%m").."|left|14128|\n", netid = GetLocal().netID, acts = "Collected `w" ..AmountCollectBGL.. " `eBlue Gem Lock"})
            return true
            elseif b[0] == "OnConsoleMessage" and b[1]:find("Collected  `w(%d+) Black Gem Lock") then AmountCollectBBGL = tonumber(b[1]:match("Collected  `w(%d+) Black Gem Lock"))
            SendPacket(2, "action|input\ntext|`w[`c tann18 `w] `1Collected `w"..AmountCollectBBGL.." `bBlack Gem Lock")
            table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oCollected `w"..AmountCollectBBGL.." `bBlack Gem Lock `oat "..os.date("%H:%M on %d/%m").."|left|14128|\n", netid = GetLocal().netID, acts = "Collected `w" ..AmountCollectBBGL.. " `bBlack Gem Lock"})
            return true
        elseif b[0] == "OnSDBroadcast" then Logl("`9Super Duper Broadcast `4Blocked")
        return true
        elseif b[0] == "OnConsoleMessage" then Logc(b[1])
        return true
    elseif b[0] == "OnTalkBubble" and b[1] == GetLocal().netid and b[2]:find("Deposited") and b[2]:find("You have `$(%d+)`` in the bank now.") then AmountDepo = b[2]:match("Deposited `$(%d+)`` Blue Gem Locks!") SendPacket(2, "action|input\ntext|`w[`c tann18 `w] `9Deposited `w"..AmountDepo.." `eBlue Gem Lock") return true
    elseif b[0] == "OnTalkBubble" and b[1] == GetLocal().netid and b[2]:find("`2Withdrawn") and b[2]:find("You have (%d+) in the bank now.") then AmountWithdrawn = b[2]:match("`2Withdrawn (%d+) Blue Gem Locks!") SendPacket(2, "action|input\ntext|`w[`c tann18 `w] `9Withdrawn `w"..AmountWithdrawn.." `eBlue Gem Lock") return true
        elseif b[0] == "OnTalkBubble" and b[3] ~= -1 and b[2]:find("spun the wheel and got") then
            if b[2]:find("``6>``") then
                p = {}
                p[0] = "OnTalkBubble"
                p[1] = b[1]
                p[2] = "`0[`4FAKE`0] " .. b[2]
                p[3] = -1
                p.netid = -1
                SendVarlist(p) table.insert(LogSpin, {spin = "\nadd_label_with_icon_button|small|`0[`4FAKE`0] " .. b[2].."|left|758|"..b[1].."|\n", netid = b[1], spins = "`0[`4FAKE`0] " .. b[2]})
                elseif b[2]:find("``!]``") then
                s2 = b[2]:find("`` spun") - 1
                s1 = b[2]:sub(4, s2)
                jml1 = b[2]:find("got ") + 6
                jml2 = b[2]:find("``!") - 1
                jml = b[2]:sub(jml1, jml2)
                if HostApa == "Qeme" then
                Qeme = jml%10
                if Qeme > 10 then Qeme = Qeme%10
                elseif Qeme == 10 then Qeme = "`20"
                elseif Qeme == 0 then Qeme = "`20"
                end
                p = {}
                p[0] = "OnTalkBubble"
                p[1] = b[1]
                p[2] = "`0[`2REAL`0] " .. b[2].." `3QEME "..Qeme
                p[3] = -1
                p.netid = -1
                SendVarlist(p) table.insert(LogSpin, {spin = "\nadd_label_with_icon_button|small|`0[`2REAL`0] " .. b[2].." `3QEME "..Qeme.."|left|758|"..b[1].."|\n", netid = b[1], spins = "`0[`2REAL`0] " .. b[2].." `3QEME "..Qeme})
                elseif HostApa == "Reme" then
                Num1, Num2 = jml//10, jml%10 Reme = Num1 + Num2 if Reme > 10 then Reme = Reme%10 elseif Reme == 10 then Reme = "`20" elseif Reme == 0 then Reme = "`20" end
                p = {}
                p[0] = "OnTalkBubble"
                p[1] = b[1]
                p[2] = "`0[`2REAL`0] " .. b[2].." `3REME "..Reme
                p[3] = -1
                p.netid = -1
                SendVarlist(p) table.insert(LogSpin, {spin = "\nadd_label_with_icon_button|small|`0[`2REAL`0] " .. b[2].." `3REME "..Reme.."|left|758|"..b[1].."|\n", netid = b[1], spins = "`0[`2REAL`0] " .. b[2].." `3REME "..Reme})
                else
                p = {}
                p[0] = "OnTalkBubble"
                p[1] = b[1]
                p[2] = "`0[`2REAL`0] " .. b[2]
                p[3] = -1
                p.netid = -1
                SendVarlist(p) table.insert(LogSpin, {spin = "\nadd_label_with_icon_button|small|`0[`2REAL`0] " .. b[2].."|left|758|"..b[1].."|\n", netid = b[1], spins = "`0[`2REAL`0] " .. b[2]})
                end
                else
                p = {}
                p[0] = "OnTalkBubble"
                p[1] = b[1]
                p[2] = "`0[`4FAKE`0] " .. b[2]
                p[3] = -1
                p.netid = -1
                SendVarlist(p) table.insert(LogSpin, {spin = "\nadd_label_with_icon_button|small|`0[`4FAKE`0] " .. b[2].."|left|758|"..b[1].."|\n", netid = b[1], spins = "`0[`4FAKE`0] " .. b[2]})
                end
        return true
        end
        return false end)

    function proxy_commands()
        function string.removeColors(b)
            return b:gsub("`.", "")
        end
        n1 = GetLocal().name:removeColors()
        n2 = n1:gsub(" of Legend", "")
        n3 = n2:gsub("Dr.", "")
        varlist = {}
        varlist[0] = "OnDialogRequest"
        varlist[1] =
            [[set_default_color|`o
add_label_with_icon|big|`oProxy Helper|left|7188|
add_spacer|small|
add_label_with_icon|small|`5The Script Made By `b! MeFatzz#8013|left|1790|
add_spacer|small|
add_label_with_icon|small|`9Current World : `3]] ..
            GetLocal().world ..
                [[|left|5674|
add_label_with_icon|small|`9User ID : `3]] ..
                    math.floor(GetLocal().userid) ..
                        [[|left|5674|
add_spacer|small|
add_url_button||`1Join our discord server ``|NOFLAGS|https://discord.gg/yn2Y8qAkGc|
add_spacer|small|
add_label_with_icon|big|`3Main Commands``|left|5772|
add_spacer|small|
add_label_with_icon|small|`0/proxy `0( `3see menu for proxy commands `0)|left|482|
add_label_with_icon|small|`0/modfly `0( `3enable / disable modfly `0)|left|482|
add_label_with_icon|small|`0/res `0( `3respawn `0)|left|482|
add_label_with_icon|small|`0/relog `0( `3fast relog `0)|left|482|
add_label_with_icon|small|`0/fd `0( `3enable / disable fast drop `0)|left|482|
add_label_with_icon|small|`0/ft `0( `3enable / disable fast trash `0)|left|482|
add_label_with_icon|small|`0/nopickup `0( `3enable / disable anti-pickup items `0)|left|482|
add_label_with_icon|small|`0/fc `0( `3force close the proxy `0)|left|482|
add_label_with_icon|small|`0/blink `0( `3enable / disable blink skin color `0)|left|482|
add_label_with_icon|small|`0/loga `0( `3log drop and take `0)|left|482|
add_spacer|small|
add_label_with_icon|big|`3Join Commands``|left|6|
add_spacer|small|
add_label_with_icon|big|`3Wrench Commands``|left|32|
add_spacer|small|
add_textbox|`9Command : `!/wm|left|
add_spacer|small|
add_smalltext|`2Shortcuts :|left|
add_label_with_icon|small|`0/wp `0( `3Turn on wrench pull `0)|left|482|
add_label_with_icon|small|`0/wk `0( `3Turn on wrench kick `0)|left|482|
add_label_with_icon|small|`0/wb `0( `3turn on wrench ban `0)|left|482|
add_label_with_icon|small|`0/woff `0( `3Turn off wrench mode `0)|left|482|
add_spacer|small|
add_label_with_icon|big|`3Spam Commands``|left|5812|
add_spacer|small|
add_textbox|`2commands :|left|
add_label_with_icon|small|`0/sspam `0( `3Setting Spam `0)|left|482|
add_label_with_icon|small|`0/aspam `0( `3Start Spam `0)|left|482|
add_spacer|small|
add_label_with_icon|big|`3Growscan Commands``|left|6016|
add_spacer|small|
add_label_with_icon|small|`!/gs or /growscan|left|482|
add_spacer|small|
add_textbox|`2Shortcuts :|left|
add_label_with_icon|small|`0/growscan 1 or /gs 1 `0( `3scan placed blocks `0)|left|482|
add_label_with_icon|small|`0/growscan 2 or /gs 2 `0( `3scan dropped items `0)|left|482|
add_spacer|small|
add_label_with_icon|big|`3Count Gems Commands``|left|112|
add_spacer|small|
add_label_with_icon|small|`!/cm `0( `3count mode `0)|left|482|
add_spacer|small|
add_textbox|`2commands :|left|
add_label_with_icon|small|`0/setcount1 or /sc1 `0( `3set position count gems 1 `0)|left|482|
add_label_with_icon|small|`0/setcount2 or /sc2 `0( `3set position count gems 2 `0)|left|482|
add_label_with_icon|small|`0/c `0( `3check gems for show winner in right or left 2 `0)|left|482|
add_spacer|small|
add_label_with_icon|big|`3Put Chandelier Commands``|left|340|
add_spacer|small|
add_label_with_icon|small|`!/pm `0( `3put mode `0)|left|482|
add_spacer|small|
add_textbox|`2commands :|left|
add_label_with_icon|small|`0/pc `0( `3Put Chandelier `0)|left|482|
add_spacer|small|
add_label_with_icon|big|`3Host Commands``|left|758|
add_spacer|small|
add_label_with_icon|small|`0/reme `0( `3Reme Number `0)|left|482|
add_label_with_icon|small|`0/qeme `0( `3Qeme Number `0)|left|482|
add_label_with_icon|small|`0/cgems `0( `3see total gems collected `0)|left|482|
add_label_with_icon|small|`0/sgems `0( `3show total gems collected `0)|left|482|
add_label_with_icon|small|`0/cbgl `0( `3Fast Change Bgl No Need Wrench `0)|left|482|
add_label_with_icon|small|`0/fcbgl `0( `3fast change bgl need wrench `0)|left|482|
add_label_with_icon|small|`0/awl `0( `3drop all wls`0)|left|482|
add_label_with_icon|small|`0/adl `0( `3drop all dls `0)|left|482|
add_label_with_icon|small|`0/abgl `0( `3drop all dls `0)|left|482|
add_label_with_icon|small|`0/setpos1 or /sp1 `0( `3set pos 1 `0)|left|482|
add_label_with_icon|small|`0/setpos2 or /sp2 `0( `3set pos 2 `0)|left|482|
add_label_with_icon|small|`0/setposback or /spb `0( `3set original pos `0)|left|482|
add_label_with_icon|small|`0/pos1 `0( `3go to pos 1 `0)|left|482|
add_label_with_icon|small|`0/pos2 `0( `3go to pos 2 `0)|left|482|
add_label_with_icon|small|`0/back `0( `3go to original pos ( setposback ) `0)|left|482|
add_label_with_icon|small|`0/tp `0( `3Collect locks from players `0)|left|482|
add_label_with_icon|small|`0/tg `0( `3Collect gems btk `0)|left|482|
add_label_with_icon|small|`0/settax `0( `3Set a tax % for auto-tax `0)|left|482|
add_label_with_icon|small|`0/dt1 `0( `3Drop to winner 1 `0)|left|482|
add_label_with_icon|small|`0/dt2 `0( `3Drop to winner 2 `0)|left|482|
add_label_with_icon|small|`0/fastdl `0( `3Merged Wls To Dl `0)|left|482|
add_label_with_icon|small|`0/fastbgl `0( `3If You Have 100Dls It Will Change To Bgl `0)|left|482|
add_label_with_icon|small|`0/fastblack `0( `3Merged Bgls To Black `0)|left|482|
add_label_with_icon|small|`0/cd [`9 amount `0] `0( /cd 1234567 ( 1 black , 23 bgl , 45 dl , 67wl `0)|left|482|
add_label_with_icon|small|`0/dd [`9 amount `0] `0( /dd 123 ( 1 bgl , 23 dl `0)|left|482|
add_label_with_icon|small|`0/dbb [`9 amount `0] `0( /dbb 123 ( 1 black , 23 bgl `0)|left|482|
add_label_with_icon|small|`0/dbl [`9 amount `0] `0( Drop Black With Amount `0)|left|482|
add_label_with_icon|small|`0/mkb `0( `3Make Black `0)|left|482|
add_label_with_icon|small|`0/bkb `0( `3Break Black `0)|left|482|
add_label_with_icon|small|`0/depo [`9 amount `0] `0(Deposit into bank `0)|left|482|
add_label_with_icon|small|`0/wd [`9 amount `0] `0(Withdraw from bank `0)|left|482|
add_spacer|small|
add_label_with_icon|big|`3Titles Commands``|left|6276|
add_spacer|small|
add_label_with_icon|small|`!/titles or /title|left|482|
add_spacer|small|
add_textbox|`2Shortcuts :|left|add_textbox|`9Command : `0/master `0( `3master title `0)|left|
add_label_with_icon|small|`0/g4g `0( `3grow for good title `0)|left|482|
add_label_with_icon|small|`0/doctor `0( `3doctor title `0)|left|482|
add_label_with_icon|small|`0/maxlevel `0( `3max level title `0)|left|482|
add_label_with_icon|small|`0/oflegend or /legend `0( `3of legend title `0)|left|482|
add_label_with_icon|small|`0/title reset `0( `3reset titles to normal `0)|left|482|
add_spacer|small|
add_url_button||`1Join Our Discord Server ! ``|NOFLAGS||
add_spacer|small|
add_smalltext|Proxy updated as of 07th Januari 2024.|
add_quick_exit|
end_dialog|proxy_main_cmd|`4Cancel|`2Okay|
]]
        varlist.netid = -1
        SendVarlist(varlist)
    end
    function proxy(b, b)
        if b == ("action|input\n|text|/proxy") then
            proxy_commands()
            return true
        end
    end
    AddCallback("proxy_commandsx", "OnPacket", proxy)
    function settax(b, b)
        if b == ("action|input\n|text|/settax") then
            tax_commands()
            return true
        end
    end
    AddCallback("settax_commandsx", "OnPacket", settax)
    function string.removeColors(b)
        return b:gsub("`.", "")
    end

    function shatter(id) local pkt = {} pkt.type = 10 pkt.value = id SendPacketRaw(false, pkt) end

function dropes(b, c)
SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|".. b .. "|\nitem_count|".. c)
        Sleep(180)
    end
    function findItem(b)
        for c, c in pairs(GetInventory()) do
            if c.id == b then
                return c.count
            end
        end
        return 0
    end
function changebgl() for _, tile in pairs(GetTiles()) do if tile.fg == 3898 then RunThread(function() SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..math.floor(tile.pos_x).."|\ny|"..math.floor(tile.pos_y).."|\nbuttonClicked|bglconvert") end) end end end
function buatireng()
SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
end
function shatterireng()
SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
end
function cdrop_delayed()
    pecahan = {1000000, 10000, 100, 1}
    black = 0
    bgl = 0
    dl = 0
    wl = 0
    for b = 1, 4 do
    while wls >= pecahan[b] do
    if pecahan[b] == pecahan[1] then
    black = black + 1
    wls = wls - 1000000
    elseif pecahan[b] == pecahan[2] then
    bgl = bgl + 1
    wls = wls - 10000
    elseif pecahan[b] == pecahan[3] then
    dl = dl + 1
    wls = wls - 100
    elseif pecahan[b] == pecahan[4] then
    wl = wl + 1
    wls = wls - 1
    end
    end
    end
    Logc("`9Dropping `3" .. black .. " `bblacks `3" .. bgl .. " `9bgl `3" .. dl .. " `9dls and `3" .. wl .. " `9wls") -- dd
    itemamt = {black, bgl, dl, wl}
    itemid = {11550, 7188, 1796, 242}
    --shattering
    if findItem(11550) < black then buatireng() Sleep(100) end
    if findItem(7188) < bgl then shatterireng() Sleep(100) end
    if findItem(1796) < dl then shatter(7188) Sleep(100) end
    if findItem(242) < wl then shatter(1796) Sleep(100) end
    Sleep(200)
    --dropping
    if black > 0 then
        dropes(itemid[1], itemamt[1])
        table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oDropped `w"..itemamt[1].." `bBlack Gem Lock `oat "..os.date("%H:%M on %d/%m").."|left|14124|\n", netid = GetLocal().netID, acts = "Dropped `w" ..itemamt[1].. " `bBlack Gem Lock"})
    end
    if bgl > 0 then
        dropes(itemid[2], itemamt[2])
        table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oDropped `w"..itemamt[2].." `eBlue Gem Lock `oat "..os.date("%H:%M on %d/%m").."|left|14124|\n", netid = GetLocal().netID, acts = "Dropped `w" ..itemamt[2].. " `eBlue Gem Lock"})
    end
    if dl > 0 then
        dropes(itemid[3], itemamt[3])
        table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oDropped `w"..itemamt[3].." `1Diamond Lock `oat "..os.date("%H:%M on %d/%m").."|left|14124|\n", netid = GetLocal().netID, acts = "Dropped `w" ..itemamt[3].. " `1Diamond Lock"})
    end
    if wl > 0 then
        dropes(itemid[4], itemamt[4])
        table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oDropped `w"..itemamt[4].." `9World Lock `oat "..os.date("%H:%M on %d/%m").."|left|14124|\n", netid = GetLocal().netID, acts = "Dropped `w" ..itemamt[4].. " `9World Lock"})
    end
    --Logl("`9Dropping `3" .. black .. " `bblacks `3" .. bgl .. " `9bgl `3" .. dl .. " `9dls and `3" .. wl .. " `9wls")
    SendPacket(2,"action|input\n|text|`w[`b tann18 `w] `9Dropping `3" .. black .. " `bblacks `3" .. bgl .. " `9bgl `3" .. dl .. " `9dls and `3" .. wl .. " `9wls")
    return true end

    function spamstart() RunThread(function() while AutoSpam do SendPacket(2, "action|input\ntext|`w[ `ctann18 `w] "..SpamText) Sleep(SpamDelay) end end) end


function cdrop_drop(b, b)
        if b:find("/cd (%d+)") then
            wls = tonumber(b:match("/cd (%d+)"))
            RunThread(cdrop_delayed)
            return true
        end
        if b:find("/dd (%d+)") then
            wls = (tonumber(b:match("/dd (%d+)"))*100)
            RunThread(cdrop_delayed)
            return true
        end
        if b:find("/dbb (%d+)") then
            wls = (tonumber(b:match("/dbb (%d+)"))*10000)
            RunThread(cdrop_delayed)
            return true
        end

        if b:find("/dl (%d+)") then
            dlskuy = tonumber(b:match("/dl (%d+)"))
            dropes(1796, dlskuy)
            Logc("`9Dropping `3" .. dlskuy .. " `9dl") SendPacket(2,"action|input\n|text|`w[`c tann18 `w] `9Dropping `3" .. dlskuy .. " `9dl")
            return true
            end
            if b:find("/bgl (%d+)") then
            bglskuy = tonumber(b:match("/bgl (%d+)"))
            dropes(7188, bglskuy)
            Logc("`9Dropping `3" .. bglskuy .. " `9bgl") SendPacket(2,"action|input\n|text|`w[`c tann18 `w] `9Dropping `3" .. bglskuy .. " `9bgl")
            return true
            end
            if b:find("/dbl (%d+)") then
            blackskuy = tonumber(b:match("/dbl (%d+)"))
            dropes(11550, blackskuy)
            Logc("`9Dropping `3" .. blackskuy .. " `9black") SendPacket(2,"action|input\n|text|`w[`c tann18 `w] `9Dropping `3" .. blackskuy .. " `9black")
            return true
            end

        if b:find("/cbgl") or b:find("/CBGL") then changebgl() return true end
        if b:find("/ireng") then buatireng() return true end
        if b:find("/biru") then shatterireng() return true end
        if b:find("/loga") then ActivityLogPage() return true end

        if b:find("/fastdl") then if fastdl then fastdl = false Logc("`9Fast DL Off") else fastdl = true Logc("`9Fast DL On") end return true end
        if b:find("/fastbgl") then if fastbgl then fastbgl = false Logc("`9Fast BGL Off") else fastbgl = true Logc("`9Fast BGL On") end return true end
        if b:find("/fastblack") then if fastblack then fastblack = false Logc("`9Fast Black Off") else fastblack = true Logc("`9Fast Black On") end return true
    end

        if b:find("/sspam") then if AutoSpam then Checked = 1 else Checked = 0 end
varlist = {}
varlist[0] = "OnDialogRequest"
varlist[1] = [[
set_default_color|`w|
add_label_with_icon|big|Setting Auto Spam|left|12544|
add_spacer|small|
add_checkbox|EnableSpam|Enabled Auto Spam (`9/aspam`w)|]]..Checked..[[|
add_text_input|SetSpamDelay|Spam delay in miliseconds (ms) :|]]..SpamDelay..[[|5|
add_smalltext|Default interval is `95000|
add_spacer|small|
add_textbox|Setting Your Spamming Text :|
add_smalltext|Maximum 120 letters|
add_text_input|SetSpamText||]]..SpamText..[[|120|
add_spacer|small|
add_quick_exit|
end_dialog|SettingSpam|Close|Update|
]]
varlist.netid = -1
SendVarlist(varlist)
return true end
if b:find("EnableSpam|1") then RunThread(function() if AutoSpam then return end AutoSpam = true Logc("Auto Spam `2Enabled") spamstart() end) end
if b:find("EnableSpam|0") then RunThread(function() if not AutoSpam then return end AutoSpam = false Logc("Auto Spam `4Disabled") end) end
if b:find("SetSpamText|") and not b:find("SetSpamText|"..SpamText) then SpamText = string.sub(string.sub(b, 0, string.len(b) - 1), b:find("SetSpamText|") + 12) Logc("Spam text set to "..SpamText) end
if b:find("SetSpamDelay|") and not b:find("SetSpamDelay|"..SpamDelay) then SpamDelay = string.sub(b, b:find("SetSpamDelay|") + 13, b:find("SetSpamText|") - 2) Logc("Spam delay set to "..SpamDelay) end
if b:find("/aspam") then if AutoSpam then AutoSpam = false Logc("Auto Spam `4Disabled") else AutoSpam = true Logc("Auto Spam `2Enabled") spamstart() end return true end

    end
AddCallback("cdrop_drop","OnPacket",cdrop_drop)

function drop_tax1(b, b)
if b == ("action|input\n|text|/dt1") then
            if x_pos1 == -1 then
                Logl("`4Pos Not Set")
            else
                RunThread(
                    function()
                        dt1_xd()
                    end
                )
            end
            return true
        end
    end
    AddCallback("drop_tax1", "OnPacket", drop_tax1)

    function dt1_xd()
        var = {}
        var[0] = "OnParticleEffect"
        var[1] = 88
        var[2] = {x_pos1 * 32 + 16, y_pos1 * 32 + 16}
        var[3] = 0
        var[4] = 0
        var.netid = -1
        SendVarlist(var)

        function Hide_Drop(b, c)
            if b[0]:find("OnDialogRequest") then
                return true
            end
        end
        AddCallback("Hide_Drop", "OnVarlist", Hide_Drop)

        FindPath(x_pos1, y_pos1)
        dl_count = 0
        wl_count = 0
        bgl_count = 0
        black_count = 0
        for b, b in pairs(GetInventory()) do
            if b.id == 242 then
                wl_count = wl_count + b.count
            elseif b.id == 1796 then
                dl_count = dl_count + b.count
            elseif b.id == 7188 then
                bgl_count = bgl_count + b.count
            elseif b.id == 11550 then
                black_count = black_count + b.count
            end
        end
        wl_to_drop = ((drop_tax % 10000) % 100)
        dl_to_drop = drop_tax % 10000 // 100
        bgl_to_drop = ((drop_tax // 10000) % 100)
        black_to_drop =drop_tax // 1000000
        if findItem(11550) < black_to_drop then
            buatireng()
        elseif findItem(7188) < bgl_to_drop then
            shatterireng()
        elseif findItem(1796) < dl_to_drop then
            local b = {type = 10, int_data = 7188}
            SendPacketRaw(b)
        elseif findItem(242) < wl_to_drop then
            local b = {type = 10, int_data = 1796}
            SendPacketRaw(b)
        end
        Sleep(100)
        if black_to_drop > 0 then
            FaceSide("left")
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550|\nitem_count|" .. black_to_drop)
            table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oDropped `w"..black_to_drop.." `bBlack Gem Lock `oat "..os.date("%H:%M on %d/%m").."|left|14124|\n", netid = GetLocal().netid, acts = "Dropped `w" ..black_to_drop.. " `bBlack Gem Lock"})
            Sleep(100)
            if bgl_to_drop > 0 then
                FaceSide("left")
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. bgl_to_drop)
                table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oDropped `w"..bgl_to_drop.." `eBlue Gem Lock `oat "..os.date("%H:%M on %d/%m").."|left|14124|\n", netid = GetLocal().netid, acts = "Dropped `w" ..bgl_to_drop.. " `eBlue Gem Lock"})
                Sleep(100)
                if dl_to_drop > 0 then
                    FaceSide("left")
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. dl_to_drop)
                    table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oDropped `w"..dl_to_drop.." `1Diamond Lock `oat "..os.date("%H:%M on %d/%m").."|left|14124|\n", netid = GetLocal().netid, acts = "Dropped `w" ..dl_to_drop.. " `1Diamond Lock"})
                    Sleep(100)
                    if wl_to_drop > 0 then
                        FaceSide("left")
                        SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl_to_drop)
                        table.insert(ActivityLog, {act = "\nadd_label_with_icon|small|"..GetLocal().name.." `oDropped `w"..wl_to_drop.." `9World Lock `oat "..os.date("%H:%M on %d/%m").."|left|14124|\n", netid = GetLocal().netid, acts = "Dropped `w" ..wl_to_drop.. " `9World Lock"})
                        Sleep(100)
                    end
                end
            end
            Logc(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            Logl(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            FindPath(x_posback, y_posback)
            Sleep(1000)
            RemoveCallback("Hide_Drop")
            return true
        else
        if bgl_to_drop > 0 then
            FaceSide("left")
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. bgl_to_drop)
            Sleep(100)
            if dl_to_drop > 0 then
                FaceSide("left")
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. dl_to_drop)
                Sleep(100)
                if wl_to_drop > 0 then
                    FaceSide("left")
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl_to_drop)
                    Sleep(100)
                end
            end
            Logc(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            Logl(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            FindPath(x_posback, y_posback)
            Sleep(1000)
            RemoveCallback("Hide_Drop")
            return true
        else
            if dl_to_drop > 0 then
                FaceSide("left")
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. dl_to_drop)
                Sleep(100)
                if wl_to_drop > 0 then
                    FaceSide("left")
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl_to_drop)
                    Sleep(100)
                end
            else
                if wl_to_drop > 0 then
                    FaceSide("left")
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl_to_drop)
                    Sleep(100)
                end
            end
            Logc(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            Logl(
            "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            FindPath(x_posback, y_posback)
            Sleep(1000)
            RemoveCallback("Hide_Drop")
            return true
        end
    end
    end

-- divider

    function drop_tax2(b, b)
        if b == ("action|input\n|text|/dt2") then
            if x_pos2 == -1 then
                Logl("`4Pos Not Set")
            else
                RunThread(
                    function()
                        dt2_xd()
                    end
                )
            end
            return true
        end
    end
    AddCallback("drop_tax2", "OnPacket", drop_tax2)

    function dt2_xd()
        var = {}
        var[0] = "OnParticleEffect"
        var[1] = 88
        var[2] = {x_pos2 * 32 + 16, y_pos2 * 32 + 16}
        var[3] = 0
        var[4] = 0
        var.netid = -1
        SendVarlist(var)

        function Hide_Drop(b, c)
            if b[0]:find("OnDialogRequest") then
                return true
            end
        end
        AddCallback("Hide_Drop", "OnVarlist", Hide_Drop)

        FindPath(x_pos2, y_pos2)
        dl_count = 0
        wl_count = 0
        bgl_count = 0
        black_count = 0
        for b, b in pairs(GetInventory()) do
            if b.id == 242 then
                wl_count = wl_count + b.count
            elseif b.id == 1796 then
                dl_count = dl_count + b.count
            elseif b.id == 7188 then
                bgl_count = bgl_count + b.count
            elseif b.id == 11550 then
                black_count = black_count + b.count
            end
        end
        wl_to_drop = ((drop_tax % 10000) % 100)
        dl_to_drop = drop_tax % 10000 // 100
        bgl_to_drop = ((drop_tax // 10000) % 100)
        black_to_drop =drop_tax // 1000000
        if findItem(11550) < black_to_drop then
            buatireng()
        elseif findItem(7188) < bgl_to_drop then
            shatterireng()
        elseif findItem(1796) < dl_to_drop then
            local b = {type = 10, int_data = 7188}
            SendPacketRaw(b)
        elseif findItem(242) < wl_to_drop then
            local b = {type = 10, int_data = 1796}
            SendPacketRaw(b)
        end
        Sleep(100)
        if black_to_drop > 0 then
            FaceSide("right")
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550|\nitem_count|" .. black_to_drop)
            Sleep(100)
            if bgl_to_drop > 0 then
                FaceSide("right")
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. bgl_to_drop)
                Sleep(100)
                if dl_to_drop > 0 then
                    FaceSide("right")
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. dl_to_drop)
                    Sleep(100)
                    if wl_to_drop > 0 then
                        FaceSide("right")
                        SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl_to_drop)
                        Sleep(100)
                    end
                end
            end
            Logc(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            Logl(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            FindPath(x_posback, y_posback)
            Sleep(1000)
            RemoveCallback("Hide_Drop")
            return true
        else
        if bgl_to_drop > 0 then
            FaceSide("right")
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. bgl_to_drop)
            Sleep(100)
            if dl_to_drop > 0 then
                FaceSide("right")
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. dl_to_drop)
                Sleep(100)
                if wl_to_drop > 0 then
                    FaceSide("right")
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl_to_drop)
                    Sleep(100)
                end
            end
            Logc(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            Logl(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            FindPath(x_posback, y_posback)
            Sleep(1000)
            RemoveCallback("Hide_Drop")
            return true
        else
            if dl_to_drop > 0 then
                FaceSide("right")
                SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. dl_to_drop)
                Sleep(100)
                if wl_to_drop > 0 then
                    FaceSide("right")
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl_to_drop)
                    Sleep(100)
                end
            else
                if wl_to_drop > 0 then
                    FaceSide("right")
                    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl_to_drop)
                    Sleep(100)
                end
            end
            Logc(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            Logl(
                "`9Dropping `3" .. black_to_drop .. " `9Blacks `3" .. bgl_to_drop .. " `9Bgls `3" .. dl_to_drop .. " `9Dls and `3" .. wl_to_drop .. " `9Wls"
            )
            FindPath(x_posback, y_posback)
            Sleep(1000)
            RemoveCallback("Hide_Drop")
            return true
        end
    end
    end
function dropblackuy(b, b)
        if b:find("action|input") then
            text = b:gsub("action|input\n|text|", "")
            if text:find("/") then
                cmd = text:gsub("/", "")
                if cmd:find("dbl") then
                    amount = cmd:gsub("dbl", "")
                    local b = 0
                    b = amount
                    amount = tonumber(amount)
                    for c, c in pairs(GetInventory()) do
                        if c.id == 11550 then
                            if c.count < amount then
                                Logc("`9No enough blacks.")
                                Logl("`9No enough blacks.")
                                return true
                            else
                                Logc("`9Dropping`3" .. b .. " `bBlacks")
                                Logl("`9Dropping`3" .. b .. " `bBlacks")
                                SendPacket(
                                    2,
                                    "action|dialog_return\ndialog_name|drop\nitem_drop|11550|\nitem_count|" .. b
                                )
                                return true
                            end
                        end
                    end
                end
            end
        end
    end
AddCallback("hook","OnPacket",dropblackuy)
    function depobgl(b, b)
        if b:find("action|input") then
            text = b:gsub("action|input\n|text|", "")
            if text:find("/") then
                cmd = text:gsub("/", "")
                if cmd:find("depo") then
                    amount = cmd:gsub("depo", "")
                    local b = 0
                    b = amount
                    amount = tonumber(amount)
                    SendPacket(2, "action|dialog_return\ndialog_name|bank_deposit\nbgl_count|" .. b)
                    return true
                end
            end
        end
    end
    AddCallback("cdepo_bgl", "OnPacket", depobgl)
    function wdbgl(b, b)
        if b:find("action|input") then
            text = b:gsub("action|input\n|text|", "")
            if text:find("/") then
                cmd = text:gsub("/", "")
                if cmd:find("wd") then
                    amount = cmd:gsub("wd", "")
                    local b = 0
                    b = amount
                    amount = tonumber(amount)
                    SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|" .. b)
                    return true
                end
            end
        end
    end
    AddCallback("cwd_bgl", "OnPacket", wdbgl)
    function daw(b, b)
        if b == ("action|input\n|text|/awl") then
            for b, b in pairs(GetInventory()) do
                if b.id == 242 then
                    daw_count1 = b.count
                    daw_count = math.floor(daw_count1)
                end
            end
            Logc("`9Dropping `3" .. daw_count .. " `9wls")
            Logl("`9Dropping `3" .. daw_count .. " `9wls")
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. daw_count1)
            return true
        end
    end
    AddCallback("drop_all_wls", "OnPacket", daw)
    function adl(b, b)
        if b == ("action|input\n|text|/adl") then
            for b, b in pairs(GetInventory()) do
                if b.id == 1796 then
                    adl_count1 = b.count
                    adl_count = math.floor(adl_count1)
                end
            end
            Logc("`9Dropping `3" .. adl_count .. " `9Dls")
            Logl("`9Dropping `3" .. adl_count .. " `9dls")
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. adl_count1)
            return true
        end
    end
    AddCallback("drop_all_dls", "OnPacket", adl)
    function bgl(b, b)
        if b == ("action|input\n|text|/abgl") then
            for b, b in pairs(GetInventory()) do
                if b.id == 7188 then
                    bgl_count1 = b.count
                    bgl_count = math.floor(bgl_count1)
                end
            end
            Logc("`9Dropping `3" .. bgl_count .. " `9BGL")
            Logl("`9Dropping `3" .. bgl_count .. " `9BGL")
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. bgl_count1)
            return true
        end
    end
    AddCallback("drop_all_bgl", "OnPacket", bgl)
    x_pos1, x_pos2, x_pos3, x_pos4, x_posback = -1, -1, -1, -1, -1
    y_pos1, y_pos2, y_pos3, y_pos4, y_posback = -1, -1, -1, -1, -1
    function pos1(b, b)
        if b == ("action|input\n|text|/setpos1") or b == ("action|input\n|text|/sp1") then
            x_pos1 = math.floor(GetLocal().pos_x / 32)
            y_pos1 = math.floor(GetLocal().pos_y / 32)
            Logc("`9pos 1 set to `3" .. x_pos1 .. " `9,`3" .. y_pos1)
            local b = {}
            b[0] = "OnParticleEffect"
            b[1] = 354
            b[2] = {GetLocal().pos_x + 10, GetLocal().pos_y + 15}
            b[3] = 0
            b[4] = 0
            b.netid = -1
            SendVarlist(b)
            return true
        end
    end
    AddCallback("pos1", "OnPacket", pos1)
    function pos2(b, b)
        if b == ("action|input\n|text|/setpos2") or b == ("action|input\n|text|/sp2") then
            x_pos2 = math.floor(GetLocal().pos_x / 32)
            y_pos2 = math.floor(GetLocal().pos_y / 32)
            Logc("`9pos 2 set to `3" .. x_pos2 .. " `9,`3" .. y_pos2)
            local b = {}
            b[0] = "OnParticleEffect"
            b[1] = 354
            b[2] = {GetLocal().pos_x + 10, GetLocal().pos_y + 15}
            b[3] = 0
            b[4] = 0
            b.netid = -1
            SendVarlist(b)
            return true
        end
    end
    AddCallback("pos2", "OnPacket", pos2)
    function posback(b, b)
        if b == ("action|input\n|text|/setposback") or b == ("action|input\n|text|/spb") then
            x_posback = math.floor(GetLocal().pos_x / 32)
            y_posback = math.floor(GetLocal().pos_y / 32)
            Logc("`9host pos set to `3" .. x_posback .. " `9,`3" .. y_posback)
            local b = {}
            b[0] = "OnParticleEffect"
            b[1] = 356
            b[2] = {GetLocal().pos_x + 10, GetLocal().pos_y + 15}
            b[3] = 0
            b[4] = 0
            b.netid = -1
            SendVarlist(b)
            return true
        end
    end
    AddCallback("posback", "OnPacket", posback)
    function back(b, b)
        if b == ("action|input\n|text|/back") then
            if x_posback == -1 then
                Logl("`4Pos Not Set")
            else
                FindPath(x_posback, y_posback)
            end
            return true
        end
    end
    AddCallback("back", "OnPacket", back)
    function tp_pos1(b, b)
        if b == ("action|input\n|text|/pos1") then
            if x_pos1 == -1 then
                Logl("`4Pos Not Set")
            else
                FindPath(x_pos1, y_pos1)
            end
            return true
        end
    end
    AddCallback("tp_pos1", "OnPacket", tp_pos1)
    function tp_pos2(b, b)
        if b == ("action|input\n|text|/pos2") then
            if x_pos2 == -1 then
                Logl("`4Pos Not Set")
            else
                FindPath(x_pos2, y_pos2)
            end
            return true
        end
    end
    AddCallback("tp_pos2", "OnPacket", tp_pos2)
    function res(b, b)
        if b == ("action|input\n|text|/res") then
            Logc("`9respawning")
            Logl("`9Respawning")
            SendPacket(2, "action|respawn")
            return true
        end
    end
    AddCallback("respawn", "OnPacket", res)
    function relog(b, b)
        if b == ("action|input\n|text|/relog") then
            Logc("`9reloging")
            latest_world = GetLocal().world
            SendPacket(3, "action|join_request\nname|" .. latest_world .. "\ninvitedWorld|0")
            return true
        end
    end
    AddCallback("relog", "OnPacket", relog)
    mod_fly = false
    function modfly(b, b)
        if b == ("action|input\n|text|/modfly") then
            if mod_fly == false then
                Logc("`9mod fly is now `3enabled")
                EditToggle("ModFly", true)
                mod_fly = true
            elseif mod_fly == true then
                Logc("`9mod fly is now `3disabled")
                EditToggle("ModFly", false)
                mod_fly = false
            end
            return true
        end
    end
    AddCallback("modfly", "OnPacket", modfly)
    function start_stop_check_gems(b, b)
        if b == ("action|input\n|text|/cgems") then
            if gems_checker then
                Logc("`9gems checker is `3off")
                gems_checker = false
            else
                Logc("`9show gems for player is `3off")
                tgems_checker = false
                Logc("`9gems checker is `3on")
                gems_checker = true
            end
            RunThread(
                function()
                    setgems()
                end
            )
            return true
        end
    end
    AddCallback("start_stop_check_gems", "OnPacket", start_stop_check_gems)
    function setgems()
        while gems_checker do
            if GetLocal().world ~= "EXIT" then
                Local_Gems = GetLocal().gems
                Sleep(1000)
                if Local_Gems ~= GetLocal().gems then
                    Sleep(500)
                    var = {}
                    var[0] = "OnTalkBubble"
                    var[1] = GetLocal().netid
                    var[2] = "`w[`c tann18 `w] `9Collected `2+" .. math.floor(GetLocal().gems - Local_Gems) .. " `9Gems"
                    var[3] = 0
                    var[4] = 0
                    var.netid = -1
                    SendVarlist(var)
                end
            end
        end
    end
    function tgems(b, b)
        if b == ("action|input\n|text|/sgems") then
            if tgems_checker then
                Logc("`9show gems for player is `3off")
                tgems_checker = false
            else
                Logc("`9gems checker is `3off")
                gems_checker = false
                Logc("`9show gems for player is `3on")
                tgems_checker = true
            end
            RunThread(
                function()
                    settgems()
                end
            )
            return true
        end
    end
    AddCallback("tgems", "OnPacket", tgems)
    function settgems()
        while tgems_checker do
            if GetLocal().world ~= "EXIT" then
                Local_Gems = GetLocal().gems
                Sleep(1000)
                if Local_Gems ~= GetLocal().gems then
                    Sleep(500)
                    SendPacket(
                        2,
                        "action|input\n|text|`w[`c tann18 `w] `9Collected `2+" .. math.floor(GetLocal().gems - Local_Gems) .. " `9Gems"
                    )
                end
            end
        end
    end
    fd_mode = false
    function fd(b)
        if fd_mode then
            if b[0] == "OnDialogRequest" and b[1]:find("end_dialog|drop|Cancel|OK|") then
                SendPacket(
                    2,
                    "action|dialog_return\ndialog_name|drop\nitem_drop|" ..
                        b[1]:match("embed_data|item_drop|(%d+)") .. "|\nitem_count|" .. b[1]:match("you have (%d+)")
                )
                return true
            end
        end
    end
    AddCallback("fd", "OnVarlist", fd)
    function fd_hook_xd(b, b)
        if b == ("action|input\n|text|/fd") then
            if fd_mode == true then
                fd_mode = false
                Logc("`9fast drop `3disabled")
                RemoveCallback("fd")
            elseif fd_mode == false then
                fd_mode = true
                Logc("`9fast drop `3enabled")
                AddCallback("fd", "OnVarlist", fd)
            end
            return true
        end
    end
    AddCallback("fd_hook_xd", "OnPacket", fd_hook_xd)
    ft_mode = false
    function ft(b)
        if ft_mode then
            if b[0] == "OnDialogRequest" and b[1]:find("end_dialog|trash|Cancel|OK|") then
                SendPacket(
                    2,
                    "action|dialog_return\ndialog_name|trash\nitem_trash|" ..
                        b[1]:match("embed_data|item_trash|(%d+)") .. "|\nitem_count|" .. b[1]:match("you have (%d+)")
                )
                return true
            end
        end
    end
    AddCallback("ft", "OnVarlist", ft)
    function ft_hook_xd(b, b)
        if b == ("action|input\n|text|/ft") then
            if ft_mode == true then
                ft_mode = false
                Logc("`9fast trash `3disabled")
                RemoveCallback("ft")
            elseif ft_mode == false then
                ft_mode = true
                Logc("`9fast trash `3enabled")
                AddCallback("ft", "OnVarlist", ft)
            end
            return true
        end
    end
    AddCallback("ft_hook_xd", "OnPacket", ft_hook_xd)

    function wm(b, b)
        if b == ("action|input\n|text|/wm") then
            if mode_wm == "off" then
                type_wm = "`4Disabled"
            else
                type_wm = "`2Enabled"
            end
            if type_wm == "`2Enabled" and mode_wm == "pull" then
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!Wrench Mode|left|32|
add_spacer|small
add_textbox|`9Currently Wrench Mode is `2Enabled `9And is Set To : `3]] ..
                    mode_wm ..
                        [[|left|
add_spacer|small
add_button_with_icon|wrench_pull|  `2pull  |staticYellowFrame|32|
add_button_with_icon|wrench_kick|  `9kick  |staticBlueFrame|32|
add_button_with_icon|wrench_ban|  `9ban  |staticBlueFrame|32|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|wrench_off|`@Turn off wrench mode|noflags|0|0|
add_quick_exit|
end_dialog|wrench_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            elseif type_wm == "`2Enabled" and mode_wm == "kick" then
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!Wrench Mode|left|32|
add_spacer|small
add_textbox|`9Currently Wrench Mode is `2Enabled `9And is Set To : `3]] ..
                    mode_wm ..
                        [[|left|
add_spacer|small
add_button_with_icon|wrench_pull|  `9pull  |staticBlueFrame|32|
add_button_with_icon|wrench_kick|  `2kick  |staticYellowFrame|32|
add_button_with_icon|wrench_ban|  `9ban  |staticBlueFrame|32|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|wrench_off|`@Turn off wrench mode|noflags|0|0|
add_quick_exit|
end_dialog|wrench_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            elseif type_wm == "`2Enabled" and mode_wm == "ban" then
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!Wrench Mode|left|32|
add_spacer|small
add_textbox|`9Currently Wrench Mode is `2Enabled `9And is Set To : `3]] ..
                    mode_wm ..
                        [[|left|
add_spacer|small
add_button_with_icon|wrench_pull|  `9pull  |staticBlueFrame|32|
add_button_with_icon|wrench_kick|  `9kick  |staticBlueFrame|32|
add_button_with_icon|wrench_ban|  `2ban  |staticYellowFrame|32|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|wrench_off|`@Turn off wrench mode|noflags|0|0|
add_quick_exit|
end_dialog|wrench_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            else
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!Wrench Mode|left|32|
add_spacer|small
add_textbox|`9Currently Wrench Mode is `4Disabled|left|
add_spacer|small
add_button_with_icon|wrench_pull|  `9pull  |staticBlueFrame|32|
add_button_with_icon|wrench_kick|  `9kick  |staticBlueFrame|32|
add_button_with_icon|wrench_ban|  `9ban  |staticBlueFrame|32|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|wrench_off|`2Turn off wrench mode|noflags|0|0|
add_quick_exit|
end_dialog|wrench_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            end
            return true
        end
    end
    AddCallback("wm", "OnPacket", wm)
    function wp(b, b)
        if b == ("action|input\n|text|/wp") then
            mode_wm = "pull"
            Logc("`9wrench mode set to `3pull")
            Logl("`9Pull Mode")
            function Wrench(b)
                if b[0] == "OnDialogRequest" and b[1]:find("add_button|pull|`5Pull``|0|0|") then
                    x = b[1]
                    x2 = x:match("embed_data|netID|(%d+)")
                    SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. x2 .. "|\nbuttonClicked|pull")
                    return true
                end
            end
            AddCallback("Wrench", "OnVarlist", Wrench)
            return true
        end
    end
    AddCallback("wp", "OnPacket", wp)
    function wk(b, b)
        if b == ("action|input\n|text|/wk") then
            mode_wm = "kick"
            Logc("`9wrench mode set to `3kick")
            Logl("`9Kick Mode")
            function Wrench(b)
                if b[0] == "OnDialogRequest" and b[1]:find("add_button|pull|`5Pull``|0|0|") then
                    x = b[1]
                    x2 = x:match("embed_data|netID|(%d+)")
                    SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. x2 .. "|\nbuttonClicked|kick")
                    return true
                end
            end
            AddCallback("Wrench", "OnVarlist", Wrench)
            return true
        end
    end
    AddCallback("wk", "OnPacket", wk)
    function wb(b, b)
        if b == ("action|input\n|text|/wb") then
            mode_wm = "kick"
            Logc("`9wrench mode set to `3ban")
            Logl("`9Ban Mode")
            function Wrench(b)
                if b[0] == "OnDialogRequest" and b[1]:find("add_button|pull|`5Pull``|0|0|") then
                    x = b[1]
                    x2 = x:match("embed_data|netID|(%d+)")
                    SendPacket(
                        2,
                        "action|dialog_return\ndialog_name|popup\nnetID|" .. x2 .. "|\nbuttonClicked|world_ban"
                    )
                    return true
                end
            end
            AddCallback("Wrench", "OnVarlist", Wrench)
            return true
        end
    end
    AddCallback("wb", "OnPacket", wb)
    function woff(b, b)
        if b == ("action|input\n|text|/woff") then
            mode_wm = "off"
            Logc("`9wrench mode is now `3off")
            Logl("`9Wrench Mode Is `cOff")
            RemoveCallback("Wrench")
            return true
        end
    end
    AddCallback("woff", "OnPacket", woff)
    function Wrench_mode(b, b)
        if b:find("buttonClicked|wrench_pull") then
            Logc("`9wrench mode set to `3pull")
            mode_wm = "pull"
            function Wrench(b)
                if b[0] == "OnDialogRequest" and b[1]:find("add_button|pull|`5Pull``|0|0|") then
                    x = b[1]
                    x2 = x:match("embed_data|netID|(%d+)")
                    SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. x2 .. "|\nbuttonClicked|pull")
                    return true
                end
            end
            AddCallback("Wrench", "OnVarlist", Wrench)
            return true
        elseif b:find("buttonClicked|wrench_kick") then
            Logc("`9wrench mode set to `3kick")
            mode_wm = "kick"
            function Wrench(b)
                if b[0] == "OnDialogRequest" and b[1]:find("add_button|pull|`5Pull``|0|0|") then
                    x = b[1]
                    x2 = x:match("embed_data|netID|(%d+)")
                    SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. x2 .. "|\nbuttonClicked|kick")
                    return true
                end
            end
            AddCallback("Wrench", "OnVarlist", Wrench)
            return true
        elseif b:find("buttonClicked|wrench_ban") then
            Logc("`9wrench mode set to `3ban")
            mode_wm = "ban"
            function Wrench(b)
                if b[0] == "OnDialogRequest" and b[1]:find("add_button|pull|`5Pull``|0|0|") then
                    x = b[1]
                    x2 = x:match("embed_data|netID|(%d+)")
                    SendPacket(
                        2,
                        "action|dialog_return\ndialog_name|popup\nnetID|" .. x2 .. "|\nbuttonClicked|world_ban"
                    )
                    return true
                end
            end
            AddCallback("Wrench", "OnVarlist", Wrench)
            return true
        elseif b:find("buttonClicked|wrench_off") then
            mode_wm = "off"
            Logc("`9wrench mode is `3off")
            RemoveCallback("Wrench")
            return true
        end
    end
    AddCallback("Wrench_mode", "OnPacket", Wrench_mode)
    function mcount(b, b)
        if b == ("action|input\n|text|/cm") then
            if Mode == "off" then
                type_mcount = "`4Disabled"
            else
                type_mcount = "`2Enabled"
            end
            if type_mcount == "`2Enabled" and Mode == "VERTIKAL" then
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!count Mode|left|32|
add_spacer|small
add_textbox|`9Currently count Mode is `2Enabled `9And is Set To : `3]] ..
                    Mode ..
                        [[|left|
add_spacer|small
add_button_with_icon|mode_vertikal|  `2vertical  |staticYellowFrame|646|
add_button_with_icon|mode_horizontal|  `9horizontal  |staticBlueFrame|644|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|count_off|`@Turn off count mode|noflags|0|0|
add_quick_exit|
end_dialog|count_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            elseif type_mcount == "`2Enabled" and Mode == "HORIZONTAL" then
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!count Mode|left|32|
add_spacer|small
add_textbox|`9Currently count Mode is `2Enabled `9And is Set To : `3]] ..
                    Mode ..
                        [[|left|
add_spacer|small
add_button_with_icon|mode_vertikal|  `9vertical  |staticBlueFrame|646|
add_button_with_icon|mode_horizontal|  `2horizontal  |staticYellowFrame|644|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|count_off|`@Turn off count mode|noflags|0|0|
add_quick_exit|
end_dialog|count_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            else
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!count Mode|left|32|
add_spacer|small
add_textbox|`9Currently count Mode is `4Disabled|left|
add_spacer|small
add_button_with_icon|mode_vertikal|  `9vertical  |staticBlueFrame|646|
add_button_with_icon|mode_horizontal|  `9horizontal  |staticBlueFrame|644|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|count_off|`2Turn off count mode|noflags|0|0|
add_quick_exit|
end_dialog|count_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            end
            return true
        end
        if b:find("mode_vertikal") then
            Mode = "VERTIKAL"
            Logc("`9Mode count set to `0Vertical")
            return true
        elseif b:find("mode_horizontal") then
            Mode = "HORIZONTAL"
            Logc("`9Mode count set to `0Horizontal")
            return true
        elseif b:find("count_off") then
            Mode = "off"
            Logc("`9Mode count set to `0Disable")
            return true
        end
    end
    AddCallback("mcount", "OnPacket", mcount)
    function checkWinner(b, c)
        if b == c then
            SendPacket(2, "action|input\n|text|`w[`c tann18 `w] (gems) `2" .. b .. " `0[TIE] `2" .. c .. " (gems)")
        elseif b < c then
            SendPacket(2, "action|input\n|text|`w[`c tann18 `w] `4[LOSE] (gems) `a" .. b .. " `0- `2" .. c .. " (gems) `0[WIN]")
        elseif b > c then
            SendPacket(2, "action|input\n|text|`w[`c tann18 `w] `0[WIN] (gems) `2" .. b .. " `0- `a" .. c .. " (gems) `4[LOSE]")
        end
    end
    function ccount(b, b)
        if b:find("/c") or b:find("/C") then
            if Mode == "VERTIKAL" then
                count1 = 0
                count2 = 0
                for b, b in pairs(GetObjects()) do
                    if b.id == 112 then
                        checkY = math.floor(b.pos_y / 32)
                        checkX = math.floor(b.pos_x / 32)
                        if checkX == posc1x1 then
                            if checkY == posc1y1 or checkY == posc1y2 or checkY == posc1y3 then
                                count1 = count1 + b.count
                            end
                        end
                        if checkX == posc2x1 then
                            if checkY == posc2y1 or checkY == posc2y2 or checkY == posc2y3 then
                                count2 = count2 + b.count
                            end
                        end
                    end
                end
                count1 = math.floor(count1)
                count2 = math.floor(count2)
                checkWinner(count1, count2)
            elseif Mode == "HORIZONTAL" then
                count1 = 0
                count2 = 0
                for b, b in pairs(GetObjects()) do
                    if b.id == 112 then
                        checkY = math.floor(b.pos_y / 32)
                        checkX = math.floor(b.pos_x / 32)
                        if checkY == posc1y1 then
                            if checkX == posc1x1 or checkX == posc1x2 or checkX == posc1x3 then
                                count1 = count1 + b.count
                            end
                        end
                        if checkY == posc2y1 then
                            if checkX == posc2x1 or checkX == posc2x2 or checkX == posc2x3 then
                                count2 = count2 + b.count
                            end
                        end
                    end
                end
                count1 = math.floor(count1)
                count2 = math.floor(count2)
                checkWinner(count1, count2)
            end
            return true
        end
    end
    AddCallback("ccount", "OnPacket", ccount)
    function setcount(b, b)
        if b:find("/setcount1") or b:find("/sc1") then
            if Mode == "VERTIKAL" then
                posc1x1 = math.floor(GetLocal().pos_x / 32)
                posc1y1 = math.floor(GetLocal().pos_y / 32)
                posc1y2 = math.floor(GetLocal().pos_y / 32) - 1
                posc1y3 = math.floor(GetLocal().pos_y / 32) - 2
            elseif Mode == "HORIZONTAL" then
                posc1y1 = math.floor(GetLocal().pos_y / 32)
                posc1x1 = math.floor(GetLocal().pos_x / 32) - 1
                posc1x2 = math.floor(GetLocal().pos_x / 32)
                posc1x3 = math.floor(GetLocal().pos_x / 32) + 1
            end
            Logc("`9Pos Count 1 configured.")
            return true
        end
        if b:find("/setcount2") or b:find("/sc2") then
            if Mode == "VERTIKAL" then
                posc2x1 = math.floor(GetLocal().pos_x / 32)
                posc2y1 = math.floor(GetLocal().pos_y / 32)
                posc2y2 = math.floor(GetLocal().pos_y / 32) - 1
                posc2y3 = math.floor(GetLocal().pos_y / 32) - 2
                Logc("`9Pos Count 2 configured.")
                return true
            elseif Mode == "HORIZONTAL" then
                posc2y1 = math.floor(GetLocal().pos_y / 32)
                posc2x1 = math.floor(GetLocal().pos_x / 32) - 1
                posc2x2 = math.floor(GetLocal().pos_x / 32)
                posc2x3 = math.floor(GetLocal().pos_x / 32) + 1
                Logc("`9Pos Count 2 configured.")
                return true
            end
        end
    end
    AddCallback("setcount", "OnPacket", setcount)
    function collect_gems(b, b)
        if b == ("action|input\n|text|/tg") then
            RunThread(
                function()
                    autocollectg_thread()
                end
            )
            return true
        end
    end
    AddCallback("collect_gems", "OnPacket", collect_gems)
    function autocollectg_thread()
        if Mode == "HORIZONTAL" then
            Logc("`9Collecting Gems")
            Possessions = {{posc1x2, posc1y1}, {posc2x2, posc2y1}}
            function collect(b)
                pkt = {}
                pkt.type = 11
                pkt.int_data = b.oid
                pkt.pos_x = b.pos_x
                pkt.pos_y = b.pos_y
                SendPacketRaw(pkt)
            end
            for b, b in pairs(GetObjects()) do
                for c, c in pairs(Possessions) do
                    if (b.pos_x) // 32 == c[1] and (b.pos_y) // 32 == c[2] then
                        collect(b)
                        break
                    end
                end
            end
            for b, b in pairs(GetObjects()) do
                for c, c in pairs(Possessions) do
                    if (b.pos_x) // 32 - 1 == c[1] and (b.pos_y) // 32 == c[2] then
                        collect(b)
                        break
                    end
                end
            end
            for b, b in pairs(GetObjects()) do
                for c, c in pairs(Possessions) do
                    if (b.pos_x) // 32 + 1 == c[1] and (b.pos_y) // 32 == c[2] then
                        collect(b)
                        break
                    end
                end
            end
        elseif Mode == "VERTIKAL" then
            Logc("`9Collecting Gems")
            Possessions = {{posc1x1, posc1y2}, {posc2x1, posc2y2}}
            function collect(b)
                pkt = {}
                pkt.type = 11
                pkt.int_data = b.oid
                pkt.pos_x = b.pos_x
                pkt.pos_y = b.pos_y
                SendPacketRaw(pkt)
            end
            for b, b in pairs(GetObjects()) do
                for c, c in pairs(Possessions) do
                    if (b.pos_x) // 32 == c[1] and (b.pos_y) // 32 == c[2] then
                        collect(b)
                        break
                    end
                end
            end
            for b, b in pairs(GetObjects()) do
                for c, c in pairs(Possessions) do
                    if (b.pos_x) // 32 == c[1] and (b.pos_y) // 32 - 1 == c[2] then
                        collect(b)
                        break
                    end
                end
            end
            for b, b in pairs(GetObjects()) do
                for c, c in pairs(Possessions) do
                    if (b.pos_x) // 32 == c[1] and (b.pos_y) // 32 + 1 == c[2] then
                        collect(b)
                        break
                    end
                end
            end
        end
    end
    function pm(b, b)
        if b == ("action|input\n|text|/pm") then
            if mode_pm == "off" then
                type_pm = "`4Disabled"
            else
                type_pm = "`2Enabled"
            end
            if type_pm == "`2Enabled" and mode_pm == "REMOTE" then
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!Put Mode|left|340|
add_spacer|small
add_textbox|`9Currently put Mode is `2Enabled `9And is Set To : `3]] ..
                    mode_pm ..
                        [[|left|
add_spacer|small
add_button_with_icon|mode_remote|  `2remote  |staticYellowFrame|5640|
add_button_with_icon|mode_chand|  `9chandelier  |staticBlueFrame|340|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|put_off|`@Turn off put mode|noflags|0|0|
add_quick_exit|
end_dialog|put_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            elseif type_pm == "`2Enabled" and mode_pm == "CHAND" then
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!put Mode|left|340|
add_spacer|small
add_textbox|`9Currently put Mode is `2Enabled `9And is Set To : `3]] ..
                    mode_pm ..
                        [[|left|
add_spacer|small
add_button_with_icon|mode_remote|  `9remote  |staticBlueFrame|5640|
add_button_with_icon|mode_chand|  `2chandelier  |staticYellowFrame|340|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|put_off|`@Turn off put mode|noflags|0|0|
add_quick_exit|
end_dialog|put_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            else
                varlist = {}
                varlist[0] = "OnDialogRequest"
                varlist[1] =
                    [[set_default_color|`o
add_label_with_icon|big|`!put Mode|left|340|
add_spacer|small
add_textbox|`9Currently put Mode is `4Disabled|left|
add_spacer|small
add_button_with_icon|mode_remote|  `9remote  |staticBlueFrame|5640|
add_button_with_icon|mode_chand|  `9chandelier  |staticBlueFrame|340|
add_button_with_icon||END_LIST|noflags|0|0|
add_spacer|small
add_button|put_off|`2Turn off put mode|noflags|0|0|
add_quick_exit|
end_dialog|put_modesxd|`4Cancel|`2Okay|
]]
                varlist.netid = -1
                SendVarlist(varlist)
            end
            return true
        end
        if b:find("mode_remote") then
            mode_pm = "REMOTE"
            Logc("`9Mode put set to `0Remote")
            return true
        elseif b:find("mode_chand") then
            mode_pm = "CHAND"
            Logc("`9Mode put set to `0Chandelier")
            return true
        elseif b:find("put_off") then
            mode_pm = "off"
            Logc("`9Mode put set to `0Disable")
            return true
        end
    end
    AddCallback("pm", "OnPacket", pm)
    function put_chand(b, b)
        if b == ("action|input\n|text|/pc") then
            RunThread(
                function()
                    autoput_thread()
                end
            )
            return true
        end
    end
    AddCallback("put_chand", "OnPacket", put_chand)
    function autoput_thread()
        function place(b, c, d)
            local e = {}
            e.type = 3
            e.int_data = b
            e.pos_x = GetLocal().pos_x
            e.pos_y = GetLocal().pos_y
            e.int_x = math.floor(GetLocal().pos_x // 32 + c)
            e.int_y = math.floor(GetLocal().pos_y // 32 + d)
            SendPacketRaw(e)
            Sleep(90)
        end
        function count(b)
            local c = 0
            for d, d in pairs(GetInventory()) do
                if d.id == b then
                    c = c + d.count
                end
            end
            return c
        end
        if mode_pm == "CHAND" then
            if Mode == "HORIZONTAL" then
                for b = 0, 199 do
                    for b = 0, 199 do
                        if GetTile(posc1x2, posc1y1).fg == 0 then
                            Logl("`9Put Chandelier")
                            FindPath(posc1x2, posc1y1)
                            Sleep(50)
                            place(340, 0 - 1, 0)
                            Sleep(50)
                            place(340, 0, 0)
                            Sleep(50)
                            place(340, 0 + 1, 0)
                            Sleep(115)
                            FindPath(posc2x2, posc2y1)
                            Sleep(50)
                            place(340, 0 - 1, 0)
                            Sleep(50)
                            place(340, 0, 0)
                            Sleep(50)
                            place(340, 0 + 1, 0)
                            Sleep(115)
                            FindPath(x_posback, y_posback)
                            if count(340) == 0 then
                                Logc("`9Not enough chandeliers.")
                                Logl("`9No enough chandeliers.")
                                return
                            end
                        end
                    end
                end
            elseif Mode == "VERTIKAL" then
                for b = 0, 199 do
                    for b = 0, 199 do
                        if GetTile(posc1x1, posc1y1).fg == 0 then
                            Logl("`9Put Chandelier")
                            FindPath(posc1x1, posc1y1)
                            Sleep(50)
                            place(340, 0, 0)
                            Sleep(50)
                            place(340, 0, 0 - 1)
                            Sleep(50)
                            place(340, 0, 0 - 2)
                            Sleep(115)
                            FindPath(posc2x1, posc2y1)
                            Sleep(50)
                            place(340, 0, 0)
                            Sleep(50)
                            place(340, 0, 0 - 1)
                            Sleep(50)
                            place(340, 0, 0 - 2)
                            Sleep(115)
                            FindPath(x_posback, y_posback)
                            if count(340) == 0 then
                                Logc("`9Not enough chandeliers.")
                                Logl("`9No enough chandeliers.")
                                return
                            end
                        end
                    end
                end
            end
        end
        if mode_pm == "REMOTE" then
            if Mode == "HORIZONTAL" then
                for b = 0, 199 do
                    for b = 0, 199 do
                        if GetTile(posc1x2, posc1y1).fg == 0 then
                            Logl("`9Put Chandelier")
                            FindPath(posc1x2, posc1y1)
                            Sleep(50)
                            place(5640, 0 - 1, 0)
                            Sleep(50)
                            place(5640, 0, 0)
                            Sleep(50)
                            place(5640, 0 + 1, 0)
                            Sleep(115)
                            FindPath(posc2x2, posc2y1)
                            Sleep(50)
                            place(5640, 0 - 1, 0)
                            Sleep(50)
                            place(5640, 0, 0)
                            Sleep(50)
                            place(5640, 0 + 1, 0)
                            Sleep(115)
                            FindPath(x_posback, y_posback)
                            if count(5640) == 0 then
                                Logc("`9Not enough remote.")
                                Logl("`9No enough remote.")
                                return
                            end
                        end
                    end
                end
            elseif Mode == "VERTIKAL" then
                for b = 0, 199 do
                    for b = 0, 199 do
                        if GetTile(posc1x1, posc1y1).fg == 0 then
                            Logl("`9Put Chandelier")
                            FindPath(posc1x1, posc1y1)
                            Sleep(50)
                            place(5640, 0, 0)
                            Sleep(50)
                            place(5640, 0, 0 - 1)
                            Sleep(50)
                            place(5640, 0, 0 - 2)
                            Sleep(115)
                            FindPath(posc2x1, posc2y1)
                            Sleep(50)
                            place(5640, 0, 0)
                            Sleep(50)
                            place(5640, 0, 0 - 1)
                            Sleep(50)
                            place(5640, 0, 0 - 2)
                            Sleep(115)
                            FindPath(x_posback, y_posback)
                            if count(5640) == 0 then
                                Logc("`9Not enough remote.")
                                Logl("`9No enough remote.")
                                return
                            end
                        end
                    end
                end
            end
        end
    end
    set_spam_text = "Set a spam text and delay !"
    set_spam_delay = 5
    spamming = false
    function setspam()
        if set_spam_delay > 2 then
            while spamming do
                SendPacket(2, "action|input\n|text|`" .. math.random(1, 9) .. set_spam_text)
                Sleep(set_spam_delay * 1000)
            end
        elseif set_spam_delay < 2 then
            Logc("`9delay cant be less than 2 !")
        end
    end
    function set_spam_text(b, b)
        if b:find("action|input") then
            text = b:gsub("action|input\n|text|", "")
            if text:find("/") then
                cmd = text:gsub("/", "")
                if cmd:find("spamtext") then
                    set_spam_text = cmd:gsub("spamtext ", "")
                    Logc("`9spam text set to : `3" .. set_spam_text)
                    return true
                end
            end
        end
    end
    AddCallback("set_spam_text", "OnPacket", set_spam_text)
    function set_spam_text2(b, b)
        if b:find("action|input") then
            text = b:gsub("action|input\n|text|", "")
            if text:find("/") then
                cmd = text:gsub("/", "")
                if cmd:find("spamt") then
                    set_spam_text = cmd:gsub("spamt ", "")
                    Logc("`9spam text set to : `3" .. set_spam_text)
                    return true
                end
            end
        end
    end
    AddCallback("set_spam_text2", "OnPacket", set_spam_text2)
    function set_spam_delay(b, b)
        if b:find("action|input") then
            text = b:gsub("action|input\n|text|", "")
            if text:find("/") then
                cmd = text:gsub("/", "")
                if cmd:find("spamdelay") then
                    set_spam_delay = cmd:gsub("spamdelay", "")
                    set_spam_delay = tonumber(set_spam_delay)
                    Logc("`9spam delay set to : `3" .. set_spam_delay .. " `9Seconds ")
                    return true
                end
            end
        end
    end
    AddCallback("set_spam_delay", "OnPacket", set_spam_delay)
    function set_spam_delay1(b, b)
        if b:find("action|input") then
            text = b:gsub("action|input\n|text|", "")
            if text:find("/") then
                cmd = text:gsub("/", "")
                if cmd:find("sd") then
                    set_spam_delay = cmd:gsub("sd", "")
                    set_spam_delay = tonumber(set_spam_delay)
                    Logc("`9spam delay set to : `3" .. set_spam_delay .. " `9Seconds ")
                    return true
                end
            end
        end
    end
    AddCallback("set_spam_delay1", "OnPacket", set_spam_delay1)
    function start_stop_spam(b, b)
        if b == ("action|input\n|text|//") then
            if spamming then
                Logl("`9spam is `3off")
                spamming = false
            else
                Logl("`9spam is `3on")
                spamming = true
            end
            RunThread(
                function()
                    setspam()
                end
            )
            return true
        end
    end
    AddCallback("start_stop_spam", "OnPacket", start_stop_spam)
    blinking = false
    function setblink()
        while blinking do
            SendPacket(2, "action|setSkin\ncolor|3370516479")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|3033464831")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|2864971775")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|2527912447")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|2190853119")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|2022356223")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|1685231359")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|1348237567")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|1348237567")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|1685231359")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|2022356223")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|2190853119")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|2527912447")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|2864971775")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|3033464831")
            Sleep(150)
            SendPacket(2, "action|setSkin\ncolor|3370516479")
            Sleep(150)
        end
    end
    function blink_main(b, b)
        if b == ("action|input\n|text|/blink") then
            if blinking then
                Logl("`9blink mode is `3off")
                blinking = false
            else
                Logl("`9blink mode is `3on")
                blinking = true
            end
            RunThread(
                function()
                    setblink()
                end
            )
            return true
        end
    end
    AddCallback("blink_main", "OnPacket", blink_main)
    function collectrangexd(b, b)
        if b:find("action|input") then
            text = b:gsub("action|input\n|text|", "")
            if text:find("/") then
                cmd = text:gsub("/", "")
                if cmd:find("cc") then
                    collect_range = cmd:gsub("cc", "")
                    Logc("`9Collenting items in `3" .. collect_range .. " `9range")
                    function collectItems(b, c, c)
                        if not c then
                            b = (b or collect_range) * 32
                        end
                        pkt = {}
                        pkt.type = 11
                        for c, c in pairs(GetObjects()) do
                            posx = math.abs(GetLocal().pos_x - c.pos_x)
                            posy = math.abs(GetLocal().pos_y - c.pos_y)
                            if posx < b and posy < b then
                                pkt.int_data = c.oid
                                pkt.pos_x = c.pos_x
                                pkt.pos_y = c.pos_y
                                SendPacketRaw(pkt)
                            end
                        end
                    end
                    collectItems()
                    return true
                end
            end
        end
    end
    AddCallback("collect_range2", "OnPacket", collectrangexd)
    nopickup = false
    function no_pickup(b, b)
        if b == ("action|input\n|text|/nopickup") then
            if nopickup then
                nopickup = false
                Logl("`9No pick-up turned `3off")
                RemoveCallback("pickup12")
                return true
            else
                Logl("`9No pick-up turned `3on")
                ID_TBL = {[0] = 1}
                nopickup = true
                function pickup12(b)
                    if b.type == 11 then
                        for c, c in pairs(GetObjects()) do
                            if nopickup then
                                if c.oid == b.int_data and not ID_TBL[math.floor(c.id)] then
                                    return true
                                end
                            else
                                if c.oid == b.int_data and ID_TBL[math.floor(c.id)] then
                                    return true
                                end
                            end
                        end
                    end
                end
                AddCallback("pickup12", "OnRawPacket", pickup12)
                return true
            end
        end
    end
    AddCallback("no_pickup", "OnPacket", no_pickup)
    titlexd = "none"
    function title1(b, b)
        if b == ("action|input\n|text|/g4g") then
            titlexd = "g4g"
            Logl("`9title effect `3DONOR `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|donor"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        end
    end
    AddCallback("title_1", "OnPacket", title1)
    function title2(b, b)
        if b == ("action|input\n|text|/master") then
            titlexd = "master"
            Logl("`9title effect `3MASTED `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|master"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        end
    end
    AddCallback("title_2", "OnPacket", title2)
    function title3(b, b)
        if b == ("action|input\n|text|/doctor") then
            titlexd = "doctor"
            Logl("`9title effect `3DOCTOR `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            GetLocal().name = "Dr." .. GetLocal().name
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|doctor"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        end
    end
    AddCallback("title_3", "OnPacket", title3)
    function title4(b, b)
        if b == ("action|input\n|text|/maxlevel") then
            titlexd = "maxlevel"
            Logl("`9title effect `3MAX LEVEL `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|maxLevel"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        end
    end
    AddCallback("title_4", "OnPacket", title4)
    function title5(b, b)
        if b == ("action|input\n|text|/oflegend") or b == ("action|input\n|text|/legend") then
            titlexd = "legend"
            Logl("`9title effect `3OF LEGEND `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|doctor"
            var.netid = GetLocal().netid
            SendVarlist(var)
            GetLocal().name = GetLocal().name .. " of Legend``"
            return true
        end
    end
    AddCallback("title_5", "OnPacket", title5)
    function title6(b, b)
        if b == ("action|input\n|text|/title reset") then
            Logl("`9 removing all titles")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        end
    end
    AddCallback("title_reset", "OnPacket", title6)
    function title_ui_commands(b, b)
        if b == ("action|input\n|text|/title") or b == ("action|input\n|text|/titles") then
            varlist = {}
            varlist[0] = "OnDialogRequest"
            varlist[1] =
                [[set_default_color|`o
add_label_with_icon|big|`!Choose title|left|6276|
add_spacer|small|
add_button|g4g_title|`9G4G Title|noflags|0|0|
add_button|master_title|`9Master Title|noflags|0|0|
add_button|doctor_title|`9Doctor Title|noflags|0|0|
add_button|maxlevel_title|`9Max Level Title|noflags|0|0|
add_button|legend_title|`9Legendary Title|noflags|0|0|
add_spacer|small|
add_button|reset_title|`@Reset Title|noflags|0|0|
add_quick_exit|
end_dialog|World_commands|`4Cancel|`2Okay|
]]
            varlist.netid = -1
            SendVarlist(varlist)
            return true
        end
    end
    AddCallback("title_ui_commands", "OnPacket", title_ui_commands)
    function title_mode(b, b)
        if b:find("buttonClicked|legend_title") then
            logc("`9pulling all players")
            titlexd = "legend"
            Logl("`9title effect `3OF LEGEND `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|doctor"
            var.netid = GetLocal().netid
            SendVarlist(var)
            GetLocal().name = GetLocal().name .. " of Legend``"
            return true
        elseif b:find("buttonClicked|g4g_title") then
            titlexd = "g4g"
            Logl("`9title effect `3DONOR `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|donor"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        elseif b:find("buttonClicked|master_title") then
            titlexd = "master"
           Logl("`9title effect `3MASTED `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|master"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        elseif b:find("buttonClicked|doctor_title") then
            titlexd = "doctor"
            Logl("`9title effect `3DOCTOR `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            GetLocal().name = "Dr." .. GetLocal().name
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|doctor"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        elseif b:find("buttonClicked|reset_title") then
            Logl("`9 removing all titles")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        elseif b:find("buttonClicked|maxlevel_title") then
            titlexd = "maxlevel"
            Logl("`9title effect `3MAX LEVEL `9enabled !")
            GetLocal().name = GetLocal().name:removeColors()
            GetLocal().name = GetLocal().name:gsub(" of Legend", "")
            GetLocal().name = GetLocal().name:gsub("Dr.", "")
            var = {}
            var[0] = "OnCountryState"
            var[1] = "jo|maxLevel"
            var.netid = GetLocal().netid
            SendVarlist(var)
            return true
        end
    end
    AddCallback("title_mode", "OnPacket", title_mode)
    function gs_xd(b, b)
        if b == ("action|input\n|text|/gs") or b == ("action|input\n|text|/growscan") then
            var = {}
            var[0] = "OnDialogRequest"
            var[1] =
                [[
add_label_with_icon|big|`wWorld Stats``|left|6016|
add_spacer|small|
add_textbox|`wThis amazing block can show the stats for the whole world!|left
add_spacer|small|
add_textbox|`wWhich stats would you like to view?|left
add_button|placed_gs|World Blocks|noflags|0|0|
add_button|float_gs|Floating Items|noflags|0|0|
add_quick_exit|
end_dialog|grow_scaxn|`4Cancel|`2Okay|
]]
            var.netid = -1
            SendVarlist(var)
            return true
        end
    end
    AddCallback("gs_xd", "OnPacket", gs_xd)
    function growscan_mode(b, b)
        if b:find("buttonClicked|placed_gs") then
            Logl("`9Scaning placed blocks")
            function round(b)
                return b % 1 >= 0.5 and math.ceil(b) or math.floor(b)
            end
            store1 = {}
            for b, b in pairs(GetTiles()) do
                id = b.fg
                if store1[b.fg] == nil then
                    store1[b.fg] = {id = b.fg, qty = 1}
                else
                    store1[b.fg].qty = store1[b.fg].qty + 1
                end
                if store1[b.bg] == nil then
                    store1[b.bg] = {id = b.bg, qty = 1}
                else
                    store1[b.bg].qty = store1[b.bg].qty + 1
                end
            end
            placedshit = "add_spacer|small|"
            for b, b in pairs(store1) do
                count = round(b.qty)
                idplaced = math.floor(b.id)
                placedshit =
                    placedshit ..
                    "\nadd_label_with_icon|small|`o" ..
                        "`9id :`3 " .. idplaced .. " `0I `9count  :`3 " .. count .. "``|left|" .. tostring(b.id)
            end
            varlist = {}
            varlist[0] = "OnDialogRequest"
            varlist[1] =
                [[
set_default_color|`o
add_label_with_icon|big|`9Growscan `0``|left|6016
]] ..
                placedshit .. [[
add_quick_exit|
end_dialog|grow_scan|`2Okay|`4Back|
]]
            varlist.netid = -1
            SendVarlist(varlist)
            return true
        elseif b:find("buttonClicked|float_gs") then
            Logl("`9Scaning dropped items")
            function round(b)
                return b % 1 >= 0.5 and math.ceil(b) or math.floor(b)
            end
            store1 = {}
            for b, b in pairs(GetObjects()) do
                id = b.id
                if store1[b.id] == nil then
                    store1[b.id] = {id = b.id, qty = b.count}
                else
                    store1[b.id].qty = store1[b.id].qty + b.count
                end
            end
            droppedshit = "add_spacer|small|"
            for b, b in pairs(store1) do
                count = round(b.qty)
                xx = math.floor(b.id)
                droppedshit =
                    droppedshit ..
                    "\nadd_label_with_icon|small|`o" ..
                        "`9id :`3 " .. xx .. " `0I `9count  :`3 " .. count .. "``|left|" .. tostring(b.id)
            end
            varlist = {}
            varlist[0] = "OnDialogRequest"
            varlist[1] =
                [[
set_default_color|`o
add_label_with_icon|big|`9Growscan `0``|left|6016
]] ..
                droppedshit .. [[
add_quick_exit|
end_dialog|grow_scan|`2Okay|`4Back|
]]
            varlist.netid = -1
            SendVarlist(varlist)
            return true
        end
    end
    AddCallback("growscan_mode", "OnPacket", growscan_mode)
    function gs_back(b, b)
        if b:find("dialog_name|grow_scan") then
            var = {}
            var[0] = "OnDialogRequest"
            var[1] =
                [[
add_label_with_icon|big|`wWorld Stats``|left|6016|
add_spacer|small|
add_textbox|`wThis amazing block can show the stats for the whole world!|left
add_spacer|small|
add_textbox|`wWhich stats would you like to view?|left
add_button|placed_gs|World Blocks|noflags|0|0|
add_button|float_gs|Floating Items|noflags|0|0|
add_quick_exit|
end_dialog|grow_scaxn|`4Cancel|`2Okay|
]]
            var.netid = -1
            SendVarlist(var)
            return true
        end
    end
    AddCallback("gs_back", "OnPacket", gs_back)
    function gs1(b, b)
        if b == ("action|input\n|text|/gs 1") or b == ("action|input\n|text|/growscan 1") then
            Logl("`9Scaning placed blocks")
            function round(b)
                return b % 1 >= 0.5 and math.ceil(b) or math.floor(b)
            end
            store1 = {}
            for b, b in pairs(GetTiles()) do
                id = b.fg
                if store1[b.fg] == nil then
                    store1[b.fg] = {id = b.fg, qty = 1}
                else
                    store1[b.fg].qty = store1[b.fg].qty + 1
                end
                if store1[b.bg] == nil then
                    store1[b.bg] = {id = b.bg, qty = 1}
                else
                    store1[b.bg].qty = store1[b.bg].qty + 1
                end
            end
            placedshit = "add_spacer|small|"
            for b, b in pairs(store1) do
                count = round(b.qty)
                idplaced = math.floor(b.id)
                placedshit =
                    placedshit ..
                    "\nadd_label_with_icon|small|`o" ..
                        "`9id :`3 " .. idplaced .. " `0I `9count  :`3 " .. count .. "``|left|" .. tostring(b.id)
            end
            varlist = {}
            varlist[0] = "OnDialogRequest"
            varlist[1] =
                "set_default_color|`o\nadd_label_with_icon|big|`9Growscan `0``|left|6016\n" ..
                placedshit .. "\nadd_quick_exit"
            varlist.netid = -1
            SendVarlist(varlist)
            return true
        end
    end
    AddCallback("gs_1", "OnPacket", gs1)
    function gs2(b, b)
        if b == ("action|input\n|text|/gs 2") or b == ("action|input\n|text|/growscan 2") then
            Logl("`9Scaning dropped items")
            function round(b)
                return b % 1 >= 0.5 and math.ceil(b) or math.floor(b)
            end
            store1 = {}
            for b, b in pairs(GetObjects()) do
                id = b.id
                if store1[b.id] == nil then
                    store1[b.id] = {id = b.id, qty = b.count}
                else
                    store1[b.id].qty = store1[b.id].qty + b.count
                end
            end
            droppedshit = "add_spacer|small|"
            for b, b in pairs(store1) do
                count = round(b.qty)
                xx = math.floor(b.id)
                droppedshit =
                    droppedshit ..
                    "\nadd_label_with_icon|small|`o" ..
                        "`9id :`3 " .. xx .. " `0I `9count  :`3 " .. count .. "``|left|" .. tostring(b.id)
            end
            varlist = {}
            varlist[0] = "OnDialogRequest"
            varlist[1] =
                "set_default_color|`o\nadd_label_with_icon|big|`9Growscan `0``|left|6016\n" ..
                droppedshit .. "\nadd_quick_exit"
            varlist.netid = -1
            SendVarlist(varlist)
            return true
        end
    end
    AddCallback("gs_2", "OnPacket", gs2)
    function fc(b, b)
        if b == ("action|input\n|text|/fc") then
            Logl("`9Closing proxy.")
            RemoveCallbacks()
            return true
        end
    end
    AddCallback("fc", "OnPacket", fc)
    function string.removeColors(b)
        return b:gsub("`.", "")
    end
    cbgl_mode = false
    function change_bgl(b)
        if cbgl_mode then
            if b[0] == "OnDialogRequest" and b[1]:find("Dial a number to call somebody in Growtopia") then
                SendPacket(
                    2,
                    "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|" ..
                        b[1]:match("embed_data|x|(%d+)") ..
                            "|\ny|" .. b[1]:match("embed_data|y|(%d+)") .. "|\nbuttonClicked|bglconvert"
                )
                return true
            end
        end
    end
    AddCallback("change_bgl", "OnVarlist", change_bgl)
    function cbgl_hook_xd(b, b)
        if b == ("action|input\n|text|/fcbgl") then
            if cbgl_mode == true then
                cbgl_mode = false
                Logl("`9Fast Change BGL `3disabled")
                RemoveCallback("change_bgl")
            elseif cbgl_mode == false then
                cbgl_mode = true
                Logl("`9 Fast Change BGL `3enabled")
                AddCallback("change_bgl", "OnVarlist", change_bgl)
            end
            return true
        end
    end
    AddCallback("cbgl_hook_xd", "OnPacket", cbgl_hook_xd)
    function chnage_bgl2(b)
        if b[0] == "OnDialogRequest" and b[1]:find("add_label_with_icon|big|`wBlue Gem Lock````|left|7188|") then
            return true
        end
    end
    AddCallback("chnage_bgl2", "OnVarlist", chnage_bgl2)
    collect_pos = {{x_pos1, y_pos1}, {x_pos2, y_pos2}, {x_pos3, y_pos3}, {x_pos4, y_pos4}}
    function collect_wls(b, b)
        if b == ("action|input\n|text|/tp") then
            RunThread(
                function()
                    autocollect_thread()
                end
            )
            return true
        end
    end
    AddCallback("collect_pos", "OnPacket", collect_wls)
    function autocollect_thread()
        Logc("`9Collecting")
        wl_before = math.floor(GetItemCount(242))
        dl_before = math.floor(GetItemCount(1796))
        bgl_before = math.floor(GetItemCount(7188))
        black_before = math.floor(GetItemCount(11550))
        Possessions = {{x_pos1, y_pos1}, {x_pos2, y_pos2}, {x_pos3, y_pos3}, {x_pos4, y_pos4}}
        var = {}
        var[0] = "OnParticleEffect"
        var[1] = 88
        var[2] = {x_pos1 * 32 + 16, y_pos1 * 32 + 16}
        var[3] = 0
        var[4] = 0
        var.netid = -1
        SendVarlist(var)
        var = {}
        var[0] = "OnParticleEffect"
        var[1] = 88
        var[2] = {x_pos2 * 32 + 16, y_pos2 * 32 + 16}
        var[3] = 0
        var[4] = 0
        var.netid = -1
        SendVarlist(var)
        var = {}
        var[0] = "OnParticleEffect"
        var[1] = 88
        var[2] = {x_pos3 * 32 + 16, y_pos3 * 32 + 16}
        var[3] = 0
        var[4] = 0
        var.netid = -1
        SendVarlist(var)
        var = {}
        var[0] = "OnParticleEffect"
        var[1] = 88
        var[2] = {x_pos4 * 32 + 16, y_pos4 * 32 + 16}
        var[3] = 0
        var[4] = 0
        var.netid = -1
        SendVarlist(var)
        SendVarlist(var)
        function collect(b)
            pkt = {}
            pkt.type = 11
            pkt.int_data = b.oid
            pkt.pos_x = b.pos_x
            pkt.pos_y = b.pos_y
            SendPacketRaw(pkt)
        end
        for b, b in pairs(GetObjects()) do
            for c, c in pairs(Possessions) do
                if (b.pos_x) // 32 == c[1] and (b.pos_y) // 32 == c[2] then
                    collect(b)
                    break
                end
            end
        end
        for b, b in pairs(GetObjects()) do
            for c, c in pairs(Possessions) do
                if (b.pos_x) // 32 - 1 == c[1] and (b.pos_y) // 32 == c[2] then
                    collect(b)
                    break
                end
            end
        end
        for b, b in pairs(GetObjects()) do
            for c, c in pairs(Possessions) do
                if (b.pos_x) // 32 + 1 == c[1] and (b.pos_y) // 32 == c[2] then
                    collect(b)
                    break
                end
            end
        end
        Sleep(1300)
        wl_after = math.floor(GetItemCount(242))
        dl_after = math.floor(GetItemCount(1796))
        bgl_after = math.floor(GetItemCount(7188))
        black_after = math.floor(GetItemCount(11550))
        final_wl = wl_after - wl_before
        final_dl = dl_after - dl_before
        final_bgl = bgl_after - bgl_before
        final_black = black_after - black_before
        Logl("`9you collected : " .. final_wl .. " wls , " .. final_dl .. " dls " .. final_bgl .. " bgl " .. final_black.. " black")
        tax_black = final_black * 1000000
        tax_bgl = final_bgl * 10000
        tax_dl = final_dl * 100
        tax_wl = final_wl
        tax_1_1 = tax_dl + tax_wl + tax_bgl + tax_black
        tax_1 = tonumber(tax_1_1)
        real_tax = settax_1 * (tax_1 / 100)
        real_tax = math.floor(real_tax)
        tax_1_1 = math.floor(tax_1_1)
        drop_tax = tax_1_1 - real_tax
        Logc("`9amount to drop : `3" .. tax_1_1 - real_tax)
        Logc("`9amount to keep : `3" .. real_tax)
        SendPacket(2, "action|input\ntext|Gasss")
    end
    settax_1 = 0
    function tax_commands()
        varlist = {}
        varlist[0] = "OnDialogRequest"
        varlist[1] =
            [[set_default_color|`o
add_label_with_icon|big|`oSet For Tax|left|758|
add_spacer|small|
add_label_with_icon|small|`0Tax :|left|7188|
add_text_input|tax_a_m_o_u_n_t||]] ..
            settax_1 .. [[|3|
add_spacer|small|
add_quick_exit|
end_dialog|tax_main_cmd|`4Cancel|`2Okay|
]]
        varlist.netid = -1
        SendVarlist(varlist)
    end
    function stax(b, b)
        if b:find("tax_a_m_o_u_n_t") then
            settax_1 = b:match("tax_a_m_o_u_n_t|(%d+)")
            Logl("`9Tax has been set `0" .. settax_1 .. "%")
            return true
        end
    end
    AddCallback("stax", "OnPacket", stax)
    function tax(b, b)
        if b:find("action|input\n|text|/tax") then
            tax_1_1 = b:gsub("action|input\n|text|/tax", "")
            tax_1 = tonumber(tax_1_1)
            real_tax = settax_1 * (tax_1 / 100)
            real_tax = math.floor(real_tax)
            tax_1_1 = math.floor(tax_1_1)
            drop_tax = tax_1_1 - real_tax
            Logc("`9amount to drop : `3" .. tax_1_1 - real_tax)
            Logc("`9amount to keep : `3" .. real_tax)
            var2 = {}
            var2[0] = "OnTextOverlay"
            var2[1] =
                "     `3Tax calculator`0\n`9Amount taken : `3" ..
                tax_1 .. "\n`9amount to drop : `3" .. drop_tax .. "\n`9amount to keep : `3" .. real_tax
            var2.netid = -1
            SendVarlist(var2)
            return true
        end
    end
    AddCallback("tax", "OnPacket", tax)
    var = {}
    var[0] = "OnTalkBubble"
    var[1] = GetLocal().netid
    var[2] = "`w[`c tann18 `w] `9Proxy was injected successfully."
    var[3] = 0
    var[4] = 0
    var.netid = -1
    SendVarlist(var)
    function logingxd(b, b)
        if b:find("action|enter_game") then
            Logc("`9Removing game freeze / crash..")
            SendPacket(2, "action|enter_game")
            return true
        end
    end
    AddCallback("logingxd", "OnPacket", logingxd)
function jadiireng(type, cmd)
    if cmd:find("/mkb") then
    SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
    Logl("`9Succes Convert `bBlack")
    return true
    end
    end
    AddCallback("jadiireng","OnPacket",jadiireng)
    function biireng(type, cmd)
        if cmd:find("/bkb") then
        SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
        Logl("`9Break `bBlack")
        return true
        end
        end
        AddCallback("biireng","OnPacket",biireng)

AddCallback("variant","OnVarlist",function(b)
if b[0] == "OnDialogRequest" and b[1]:find("Wow, that's fast delivery.") then return true end
end)

timer.Create("wltodl", 1, 0, function() if not fastdl then return end if findItem(242) >= 100 then local b = {type = 10, int_data = 242} SendPacketRaw(b) Logl("`wConverted `9100 wls `wto `11 dl") end end)
timer.Create("dltobgl", 1, 0, function() if not fastbgl then return end if findItem(1796) >= 100 then changebgl() Logl("`wConverted `1100 dls wto `e1 bgl") end end)
timer.Create("bgltoireng", 1, 0, function() if not fastblack then return end if findItem(7188) >= 100 then buatireng() Logl("`wConverted `e100 bgls `wto `b1 black") end end)
RunThread(function() while true do timer.Update(1) Sleep(1000) end end)

else
    OnConsoleMessage("You can't access this proxy dumbass!!!")
    end
