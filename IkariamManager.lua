local IkariamManager = {}

local FunctionButton = require("button")
local FunctionEvent = require("event")
local FunctionPicture = require("picture")
local FunctionVue = require("vue")
local FunctionTraitement = require("traitement")

local ImageButtonBlue = "adventure_pack/PNG/buttonLong_blue.png"
local ImageButtonBluePressed = "adventure_pack/PNG/buttonLong_blue_pressed.png"
local ImageButtonBeige = "adventure_pack/PNG/buttonLong_beige.png"
local ImageButtonBeigePressed = "adventure_pack/PNG/buttonLong_beige_pressed.png"
local ImageCurseur = "adventure_pack/PNG/arrowSilver_right.png"

local listeJson = {}

local infoScript = {}

function IkariamManager:getLastReloadScript()
  
  local info = love.filesystem.getInfo("Villes/Ville1.json")
  
  local temp = os.date("*t", info.modtime)
  
  local valueVueDay = tostring(temp.day)
  local valueVueMonth = tostring(temp.month)
  local valueVueHour = tostring(temp.hour)
  local valueVueYear = tostring(temp.year)
  
  local allValueScript = {}
  
  if (temp.day <10) then
    valueVueDay = "0"..tostring(valueVueDay)
  end

  if (temp.month <10) then
    valueVueMonth = "0"..tostring(valueVueMonth)
  end

  if (temp.hour <10) then
    valueVueHour ="0"..tostring(valueVueHour)
  end
  
  allValueScript.valueDay = valueVueDay
  allValueScript.valueMonth = valueVueMonth
  allValueScript.valueHour = valueVueHour
  allValueScript.valueYear = valueVueYear
  
  return allValueScript
  
end

listeJson.Villes = {}
listeJson.Iles = {}

listeJson.Villes[1] = "Villes/Ville1.json"
listeJson.Villes[2] = "Villes/Ville2.json"
listeJson.Villes[3] = "Villes/Ville3.json"
listeJson.Villes[4] = "Villes/Ville4.json"
listeJson.Villes[5] = "Villes/Ville5.json"
listeJson.Villes[6] = "Villes/Ville6.json"
listeJson.Villes[7] = "Villes/Ville7.json"
listeJson.Villes[8] = "Villes/Ville8.json"
listeJson.Villes[9] = "Villes/Ville9.json"

listeJson.Iles[1] = "Island/Island1.json"
listeJson.Iles[2] = "Island/Island2.json"
listeJson.Iles[3] = "Island/Island3.json"
listeJson.Iles[4] = "Island/Island4.json"
listeJson.Iles[5] = "Island/Island5.json"
listeJson.Iles[6] = "Island/Island6.json"
listeJson.Iles[7] = "Island/Island7.json"
listeJson.Iles[8] = "Island/Island8.json"
listeJson.Iles[9] = "Island/Island9.json"

IkariamManager.myVueCourante = ""

IkariamManager.myButtonDemarrer = FunctionButton:Create("Charger Données", "buttonDemarrer", 1208, 5, FunctionEvent.Demarrer, 
ImageButtonBlue, ImageButtonBluePressed, ImageCurseur, 45, 15)

IkariamManager.myButtonRessources = FunctionButton:Create("Ressources", "buttonRessources", 5, 5, FunctionEvent.Ressources, 
ImageButtonBeige, ImageButtonBeigePressed, ImageCurseur, 62, 15)

IkariamManager.myButtonBatiments = FunctionButton:Create("Batîments", "buttonBatiments", 200, 5, FunctionEvent.Batiments, 
ImageButtonBeige, ImageButtonBeigePressed, ImageCurseur, 67, 15)

IkariamManager.myButtonIles = FunctionButton:Create("Îles", "buttonIles", 395, 5, FunctionEvent.Iles, 
ImageButtonBeige, ImageButtonBeigePressed, ImageCurseur, 86, 15)

IkariamManager.myButtonCachette = FunctionButton:Create("Cachette", "buttonCachette", 590, 5, FunctionEvent.Cachette, 
ImageButtonBeige, ImageButtonBeigePressed, ImageCurseur, 71, 15)

IkariamManager.myButtonPlans = FunctionButton:Create("Plans", "buttonPlans", 785, 5, FunctionEvent.Plans, 
ImageButtonBeige, ImageButtonBeigePressed, ImageCurseur, 82, 15)

IkariamManager.myButtonIA = FunctionButton:Create("IA", "buttonIA", 980, 5, FunctionEvent.IA, 
ImageButtonBeige, ImageButtonBeigePressed, ImageCurseur, 82, 15)

IkariamManager.myButtonQuitter = FunctionButton:Create("Quitter", "buttonQuitter", 1208, 700, FunctionEvent.Quitter, 
ImageButtonBlue, ImageButtonBluePressed, ImageCurseur, 72, 15)


function IkariamManager:Load()
  
  self.myVueCourante = "Accueil"

end

function IkariamManager:Update(dt)
  
  self.myButtonDemarrer:Update()
  self.myButtonRessources:Update()
  self.myButtonBatiments:Update()
  self.myButtonIles:Update()
 -- self.myButtonCachette:Update()
 -- self.myButtonPlans:Update()
--  self.myButtonIA:Update()
  self.myButtonQuitter:Update()
  infoScript = self:getLastReloadScript()

end

function IkariamManager:Draw()
  
  self.myButtonDemarrer:Draw()
  self.myButtonRessources:Draw()
  self.myButtonBatiments:Draw()
  self.myButtonIles:Draw()
  self.myButtonQuitter:Draw()
 -- self.myButtonCachette:Draw()
 -- self.myButtonPlans:Draw()
 -- self.myButtonIA:Draw()
  
  local r,g,b = love.graphics.getColor() 
  love.graphics.setColor(0,0,0) -- noir
 -- love.graphics.rectangle("fill", 1210, 70, 186, 615)
  love.graphics.rectangle("fill", 1210, 70, 186, 45)
  love.graphics.setColor(0.5, 1, 0) -- vert slime
  love.graphics.print("Dernière exécution : ", 1245, 75)
  love.graphics.print(infoScript.valueDay.."/"..infoScript.valueMonth.."/"..infoScript.valueYear
  .." à "..infoScript.valueHour.."h", 1245, 93)

  love.graphics.setColor(r,g,b)
  
  love.graphics.print("by Moks", 1300, 770)
  
 if (self.myVueCourante =="Accueil") then
    FunctionVue:Accueil()

 elseif (self.myVueCourante == "Ressources") then

  self.myTraitement = FunctionTraitement:Create(listeJson)
    FunctionVue:Ressources(self.myTraitement)

 elseif (self.myVueCourante == "Batiments") then

  self.myTraitement = FunctionTraitement:Create(listeJson)
    FunctionVue:Batiments(self.myTraitement)

 elseif (self.myVueCourante == "Iles") then

  self.myTraitement = FunctionTraitement:Create(listeJson)
    FunctionVue:Iles(self.myTraitement)
  
 elseif (self.myVueCourante == "Cachette") then
    
  self.myTraitement = FunctionTraitement:Create(listeJson)
    FunctionVue:Cachette(self.myTraitement)

 elseif (self.myVueCourante == "Plans") then
    
  self.myTraitement = FunctionTraitement:Create(listeJson)
    FunctionVue:Plans(self.myTraitement)

 elseif (self.myVueCourante == "IA") then

  self.myTraitement = FunctionTraitement:Create(listeJson)
    FunctionVue:IA(self.myTraitement)
    
 end

end

return IkariamManager