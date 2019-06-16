io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

json = require("json")

myIkariamManager = require("IkariamManager")
myBackground = love.graphics.newImage("background.png")

local k = assert(io.open("Villes/Ville6.json", "r"))
local n = k:read("*all")

--print(n)

ville1Decode = json.decode(n)
--print(ville1Decode)

local bois= ville1Decode[1][2]['headerData']['currentResources']['resource']
local vin = ville1Decode[1][2]['headerData']['currentResources']['1']
local marbre = ville1Decode[1][2]['headerData']['currentResources']['2']
local cristal = ville1Decode[1][2]['headerData']['currentResources']['3']
local souffre = ville1Decode[1][2]['headerData']['currentResources']['4']
local nomVille = ville1Decode[1][2]['backgroundData']['name']

local nomJoueur = ville1Decode[1][2]['backgroundData']['ownerName']           
local BateauMarchand = ville1Decode[1][2]['headerData']['freeTransporters']

local entrepotMax = ville1Decode[1][2]['headerData']['maxResources']['resource']
local LvlHotel = ville1Decode[1][2]['backgroundData']['position'][1]['level'] 
local endUpdateTime = ville1Decode[1][2]['backgroundData']['endUpgradeTime']
--local entrepotLvl = ville1Decode[1][2]['backgroundData']['position']['Entrep\\u00f4t']['level']


local entrepotLvl = ville1Decode[1][2]['backgroundData']['position'][1].level

for j = 1, #ville1Decode[1][2]['backgroundData']['position'] do
  
  print (ville1Decode[1][2]['backgroundData']['position'][j].name)

end

local nombreDeBatiment = #ville1Decode[1][2]['backgroundData']['position']


print(bois)
print(vin)
print(marbre)
print(cristal)
print(souffre)
print(nomVille)
print(nomJoueur)
print(BateauMarchand)
print(entrepotMax)
print(LvlHotel)
print(endUpdateTime)
print(nombreDeBatiment)


--local b = assert(io.open("/Island1.json", "r"))
--local j = b:read("*all")

--island1Decode = json.decode(j)

--print(j)

if entrepotLvl == 'Hôtel de ville' then
  print(entrepotLvl)
end

function love.load()
  
  myIkariamManager:Load()

end

function love.update(dt)
  
  myIkariamManager:Update(dt)

end

function love.draw()
    
  love.graphics.draw(myBackground, 0, 0, 0)
  myIkariamManager:Draw()
  
end

function love.mousepressed(x, y, button, istouch)
  
  local bQuit = myIkariamManager.myButtonQuitter
  local bLaunch = myIkariamManager.myButtonDemarrer
  
   if (button == 1) and 
       (x >= bLaunch.x) and (x <= bLaunch.x + bLaunch.width) and 
       (y >= bLaunch.y) and (y <= bLaunch.y + bLaunch.height) then
       bLaunch.Function()
    print("Demarre")
   end
  
   if (button == 1) and 
       (x >= bQuit.x) and (x <= bQuit.x + bQuit.width) and 
       (y >= bQuit.y) and (y <= bQuit.y + bQuit.height) then 
     
     bQuit.Function()
    print("quit")
   end
   
end

function love.keypressed(key)
  
  derniereKey = key
  
  print(key)
  
end