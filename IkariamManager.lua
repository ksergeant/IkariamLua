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
listeJson.Villes = {}
listeJson.Iles = {}

listeJson.Villes[1] = "Villes/Ville1.json"
listeJson.Villes[2] = "Villes/Ville2.json"
listeJson.Villes[3] = "Villes/Ville3.json"
listeJson.Villes[4] = "Villes/Ville4.json"
listeJson.Villes[5] = "Villes/Ville5.json"
listeJson.Villes[6] = "Villes/Ville6.json"
--listeJson.Villes[7] = "Villes/Ville7.json"

listeJson.Iles[1] = "Island/Island1.json"
listeJson.Iles[2] = "Island/Island2.json"
listeJson.Iles[3] = "Island/Island3.json"
listeJson.Iles[4] = "Island/Island4.json"
listeJson.Iles[5] = "Island/Island5.json"
listeJson.Iles[6] = "Island/Island6.json"
--listeJson.Iles[7] = "Island/Island7.json"

IkariamManager.myTraitement = FunctionTraitement:Create(listeJson)

IkariamManager.myVueCourante = ""
IkariamManager.myVueAccueil = FunctionVue:Create("Accueil")
IkariamManager.myVueDemarrer = FunctionVue:Create("Demarrer")
IkariamManager.myVueRessources = FunctionVue:Create("Ressources")
IkariamManager.myVueBatiments = FunctionVue:Create("Batiments") 
IkariamManager.myVueIles = FunctionVue:Create("Iles")
IkariamManager.myVueCachette = FunctionVue:Create("Cachette")
IkariamManager.myVuePlans = FunctionVue:Create("Plans")

IkariamManager.myButtonDemarrer = FunctionButton:Create("Démarrer", "buttonDemarrer", 1200, 600, FunctionEvent.Demarrer, 
ImageButtonBlue, ImageButtonBluePressed, ImageCurseur, 70, 15)

IkariamManager.myButtonQuitter = FunctionButton:Create("Quitter", "buttonQuitter", 1200, 700, FunctionEvent.Quitter,
ImageButtonBlue, ImageButtonBluePressed, ImageCurseur, 77, 15)

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

function IkariamManager:Load()
  
  self.myVueCourante = "Accueil"

end

function IkariamManager:Update(dt)
  
  self.myButtonDemarrer:Update()
  self.myButtonQuitter:Update()
  self.myButtonRessources:Update()
  self.myButtonBatiments:Update()
  self.myButtonIles:Update()
  self.myButtonCachette:Update()
  self.myButtonPlans:Update()
   
end

function IkariamManager:Draw()
  
  self.myButtonDemarrer:Draw()
  self.myButtonQuitter:Draw()
  self.myButtonRessources:Draw()
  self.myButtonBatiments:Draw()
  self.myButtonIles:Draw()
  self.myButtonCachette:Draw()
  self.myButtonPlans:Draw()

 if (self.myVueCourante =="Accueil") then
    self.myVueAccueil:Draw()
 elseif (self.myVueCourante == "Ressources") then
    FunctionVue:Ressources(self.myTraitement)
 elseif (self.myVueCourante == "Batiments") then
    self.myVueBatiments:Draw()
 elseif (self.myVueCourante == "Iles") then
    self.myVueIles:Draw()
 elseif (self.myVueCourante == "Cachette") then
    self.myVueCachette:Draw()
 elseif (self.myVueCourante == "Plans") then
    self.myVuePlans:Draw()
 end

end

return IkariamManager