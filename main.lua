io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

json = require("json")


file ='{"glossary": {"title": "example glossary","GlossDiv": {"title": "S","GlossList": {"GlossEntry": {"ID": "SGML","SortAs": "SGML","GlossTerm": "Standard Generalized Markup Language","Acronym": "SGML","Abbrev": "ISO 8879:1986","GlossDef": {"para": "A meta-markup language, used to create markup languages such as DocBook.","GlossSeeAlso": ["GML", "XML"]},"GlossSee": "markup"}}}}}'
ville1Decode = json.decode(file)
myIkariamManager = require("IkariamManager")
myBackground = love.graphics.newImage("background.png")
--print(ville1Decode)
--print(ville1Decode['glossary']['GlossDiv']['title'])

local f = assert(io.open("Villes/test.json", "r"))
local t = f:read("*all")

--print(t)

f:close()

ville2Decode = json.decode(t)
--print(ville2Decode)
--print(ville2Decode['glossary']['GlossDiv']['GlossList']['GlossEntry'])

local k = assert(io.open("Villes/Ville1.json", "r"))
local n = k:read("*all")
--print(n)

ville3Decode = json.decode(n)
--print(ville3Decode)

local bois= ville3Decode[1][2]['headerData']['currentResources']['resource']
local vin = ville3Decode[1][2]['headerData']['currentResources']['1']
local marbre = ville3Decode[1][2]['headerData']['currentResources']['2']
local cristal = ville3Decode[1][2]['headerData']['currentResources']['3']
local souffre = ville3Decode[1][2]['headerData']['currentResources']['4']



--print(ville3Decode[1][2]['headerData']['currentResources']['1'])
print(bois)
print(vin)
print(marbre)
print(cristal)
print(souffre)
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