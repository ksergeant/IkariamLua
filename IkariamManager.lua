local IkariamManager = {}

local FunctionButton = require("button")
local FunctionEvent = require("event")
local FunctionPicture = require("picture")

local FunctionGroupeBox = require("groupeBox")

local ImageButtonBlue = "adventure_pack/PNG/buttonLong_blue.png"
local ImageButtonBluePressed = "adventure_pack/PNG/buttonLong_blue_pressed.png"
local ImageButtonBeige = "adventure_pack/PNG/buttonLong_beige.png"
local ImageButtonBeigePressed = "adventure_pack/PNG/buttonLong_beige_pressed.png"
local ImageCurseur = "adventure_pack/PNG/arrowSilver_right.png"

IkariamManager.myGroupeBox1 = FunctionGroupeBox:Create("Ville1", 1, 1)
IkariamManager.myGroupeBox2 = FunctionGroupeBox:Create("Ville2", 240, 1)
IkariamManager.myGroupeBox3 = FunctionGroupeBox:Create("Ville3", 480, 1)
IkariamManager.myGroupeBox4 = FunctionGroupeBox:Create("Ville4", 720, 1)
IkariamManager.myGroupeBox5 = FunctionGroupeBox:Create("Ville5", 960, 1)
IkariamManager.myGroupeBox6 = FunctionGroupeBox:Create("Ville6", 1200, 1)

IkariamManager.myGroupeBox7 = FunctionGroupeBox:Create("Ville7", 1, 241)
IkariamManager.myGroupeBox8 = FunctionGroupeBox:Create("Ville8", 240, 241)
IkariamManager.myGroupeBox9 = FunctionGroupeBox:Create("Ville9", 480, 241)
IkariamManager.myGroupeBox10 = FunctionGroupeBox:Create("Ville10", 720, 241)
IkariamManager.myGroupeBox11 = FunctionGroupeBox:Create("Ville11", 960, 241)
IkariamManager.myGroupeBox12 = FunctionGroupeBox:Create("Ville12", 1200, 241)

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

--IkariamManager.myCurseur = FunctionPicture:Create("Curseur", 28, 18, ImageCurseur, 1, 1)

function IkariamManager:Load()
  
  
 
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

 --self.myGroupeBox1:Draw()
 --self.myGroupeBox2:Draw()
 --self.myGroupeBox3:Draw()
 --self.myGroupeBox4:Draw()
 --self.myGroupeBox5:Draw()
 --self.myGroupeBox6:Draw()

 --self.myGroupeBox7:Draw()
 --self.myGroupeBox8:Draw()
 --self.myGroupeBox9:Draw()
 --self.myGroupeBox10:Draw()
 --self.myGroupeBox11:Draw()
 --self.myGroupeBox12:Draw()

end

return IkariamManager