-- Made by Duxii#0001 | 1290360210711380062

local OwnName = GetLocal().name
OwnName = OwnName:gsub("%b()", ""):gsub(" ", "")

-- Do not touch
tiles = {}

W1 = ""
W2 = ""
GS = 0
SS = 0
WD = 0

function WorldHook(type, packet)
  if packet:find('action|dialog_return\ndialog_name|hello') then
    W1 = string.match(packet, 'world1|(%S+)')
    W2 = string.match(packet, 'world2|(%S+)')
    GS = tonumber(string.match(packet, 'gs|(%d+)'))
    SS = tonumber(string.match(packet, 'ss|(%d+)'))
    WD = tonumber(string.match(packet, 'wd|(%d+)'))
    Start()
    return true
  end
end

AddCallback("Worlds", "OnPacket", WorldHook)

function Check(x,y)
  if CheckPath(x,y - 1) then
    FindPath(x,y - 1)
    return
  end

  if CheckPath(x,y + 1) then
    FindPath(x,y + 1)
    return
  end

  if CheckPath(x - 1,y) then
    FindPath(x - 1)
    return
  end

  if CheckPath(x + 1,y) then
    FindPath(x + 1)
    return
  end
end

local function Place(x, y,id)
  local player = GetLocal()
  local pkt_punch = {
    type = 3,
    int_data = id,
    pos_x = player.pos_x,
    pos_y = player.pos_y,
    int_x = x,
    int_y = y,
  }
  SendPacketRaw(pkt_punch)
end

function Dialog(varlist)
  if varlist[0]:find("OnDialogRequest") then
    return true
  end
end

AddCallback("BlockDialog", "OnVarlist", Dialog)

function Main()
  local var = {}
  var[0] = "OnDialogRequest"
  var.netid = -1

  var[1] = [[
set_default_color|`o
add_label_with_icon|big|`9Copy Any World````|left|32|
add_smalltext|`9Made by @Duxii|
add_spacer|small|
add_smalltext|Hello ]] .. OwnName .. [[, here are your configurations:|
add_spacer|small|
add_smalltext|Target World:|
add_text_input|world1|||18|
add_spacer|small|
add_smalltext|Your World:|
add_text_input|world2|||18|
add_spacer|small|
add_smalltext|Delay between entering worlds (Set at 3000 by Default)|
add_text_input|wd||3000|10|
add_spacer|small|
add_smalltext|Delay between placing blocks (Set at 50 by Default|
add_text_input|d||50|3|
end_dialog|hello||Start!|
  ]]
  SendVarlist(var)
end

function Start()
  RunThread(function()
    SendPacket(3, "action|join_request\nname|" .. W1 .. "\ninvitedWorld|0")
    Sleep(WD)
      for y = 99, 0, -1 do
          for x = 0, 99 do
              local pos = {}
              pos['f'] = GetTile(x,y).fg
              pos['b'] = GetTile(x,y).bg
              pos['x'] = x
              pos['y'] = y
              table.insert(tiles, pos)
          end
      end

    SendPacket(3, "action|join_request\nname|" .. W2 .. "\ninvitedWorld|0")
    Sleep(WD)
      for _,tile in pairs(tiles) do
          fill = true
          local fg = math.floor(tonumber(tile['f']))
          local bg = math.floor(tonumber(tile['b']))
          local xx = math.floor(tonumber(tile['x']))
          local yy = math.floor(tonumber(tile['y']))
          
          if GetTile(xx,yy).fg == 0 and (fg ~= 0 or bg ~= 0) then

          if fg == 6 then
          fg = 1404
          end

          if fg ~= 0 then
            if GetItemCount(fg) == 0 or GetItemCount(fg) == 1 then
                SendPacket(2, "action|dialog_return\ndialog_name|item_search\n" .. fg .. "|1")
                Sleep(1500)
            end
          end

          if bg ~= 0 then
            if GetItemCount(bg) == 0 or GetItemCount(bg) == 1 then
              SendPacket(2, "action|dialog_return\ndialog_name|item_search\n" .. bg .. "|1")
              Sleep(1500)
            end
          end
        
          if bg ~= 0 and GetTile(xx,yy).bg == 0 then
            Place(xx,yy, bg)
            Sleep(100)
          end

          if fg ~= 0 and GetTile(xx,yy).fg == 0 then
            Place(xx,yy, fg)
            Sleep(100)
            if fg == 1404 then
              Sleep(WD)
            end
          end
        end
      end
  end)
end


Main()

