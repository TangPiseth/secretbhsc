OvenCOUNT = 50
OvenID = 4618




-- [DO NOT TOUCH ANYTHING] --

IDList = {{3472,1},{4602,1},{4588,1},{962,1},{4568,1},{4570,2}}
Island = type(GetTile(199,99)) == "table"

function Place(x, y, z)
  SendPacketRaw(false, {type=3,px=x,py=y,x=x*32,y=y*32,value=z})
end

function Notification(x)
local var = {}
var.v0 = "OnAddNotification"
var.v1 = "game/sun.rttex" -- asset game
var.v2 = x -- text
var.v3 = "audio/gauntlet_spawn.wav" -- audio
var.netid = -1
SendVariant(var)
end

function Tolay(x)
local var = {}
var.v0 = "OnTextOverlay"
var.v1 = x
var.netid = -1
SendVariant(var)
end

function POven(x, y, z, t)
  SendPacket(2, "action|dialog_return\ndialog_name|homeoven_edit\nx|"..x.."|\ny|"..y.."|\ncookthis|"..z.."|\nbuttonClicked|"..t)
end

function Amount(x)
for _, a in pairs(GetInventory()) do
if a.id==x then return a.amount end
end return 0
end

function GetCook()
  local r = {}
  local p = {GetLocal().posX//32, GetLocal().posY//32}
  local t = 1
  for x=p[1]-4,p[1]+4,1 do
    for y=p[2]-4,p[2]+4,1 do
      if(x > -1 and y > -1 and ((Island and x < 200 and y < 200) or (not Island and x < 100 and y < 60)) and GetTile(x,y).fg == OvenID and not (t > OvenCOUNT)) then
          t = t+1
        table.insert(r, {x, y})
      end
    end
  end
  return r
end

c = GetCook()
local oven = {["count"]=OvenCOUNT, ["type"]="low", ["time"]=1}
function Rice()
    for _, a in pairs(c) do
        POven(a[1], a[2], 3472, "low")
        Sleep(300)
    end
end


function OnionChicken()
    for _, a in pairs(c) do
            Place(a[1], a[2], 4602)
            Sleep(150)
            Place(a[1], a[2], 4588)
            Sleep(150)
    end
end


function Tomato()
    for _, a in pairs(c) do
            Place(a[1], a[2], 962)
            Sleep(300)
    end
end


function Punch()
    for _, a in pairs(c) do
            Place(a[1], a[2], 18)
            Sleep(300)
    end
end


function Salt()
    for _, a in pairs(c) do
            Place(a[1], a[2], 4568)
            Sleep(300)
    end
end


function Pepper()
    for _, a in pairs(c) do
            Place(a[1], a[2], 4570)
            Sleep(300)
    end
end


function Run()
Rice()
Salt()
Sleep(((33700-(oven.count*300))/oven.time) - (oven.count*300))
OnionChicken()
Pepper()
Sleep(((36300-(oven.count*300))/oven.time) - (oven.count*300))
Tomato()
Pepper()
Sleep(((30000-(oven.count*300))/oven.time) - (oven.count*300))
Punch()
end


if (OvenCOUNT > 50) then
    Notification("Max 50 Ovens...")
else
    local deezalog = ""
    for _, i in pairs(IDList) do
        local am = Amount(i[1])
        if (am < i[2]*OvenCOUNT) then
            deezalog = deezalog.."add_label_with_icon|small|`wMissing `4"..tostring(i[2]*OvenCOUNT).."`` this ingredient``|left|"..i[1].."|\n"
        end
    end

SendPacket(2,"action|input/ntext|`0Thanks To `cLaster#2447") 
Sleep(800) 
SendPacket(2,"action|input/ntext|`0Script By `9Lantas#6854") 
while true do
Run() 
end
end