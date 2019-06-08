local IkariamManager = {}

local FunctionButton = require("button")
local FunctionPicture = require("picture")
local FunctionEvent = require("event")
local FunctionGroupeBox = require("groupeBox")

IkariamManager.myGroupeBox1 = FunctionGroupeBox:Create("Ville1", 0, 0)
IkariamManager.myGroupeBox2 = FunctionGroupeBox:Create("Ville2", 240, 0)
IkariamManager.myGroupeBox3 = FunctionGroupeBox:Create("Ville3", 480, 0)
IkariamManager.myGroupeBox4 = FunctionGroupeBox:Create("Ville4", 720, 0)
IkariamManager.myGroupeBox5 = FunctionGroupeBox:Create("Ville5", 960, 0)
IkariamManager.myGroupeBox6 = FunctionGroupeBox:Create("Ville6", 1200, 0)


IkariamManager.myButtonDemarrer = FunctionButton:Create("Démarrer", "buttonDemarer", 1200, 600, FunctionEvent.Demarrer, "adventure_pack/PNG/buttonLong_blue.png")
IkariamManager.myButtonQuitter = FunctionButton:Create("Quitter", "buttonQuitter", 1200, 700, FunctionEvent.Quitter, "adventure_pack/PNG/buttonLong_blue.png")

IkariamManager.myImageBois = FunctionPicture:Create("Bois", 10, 10,  "Images/Bois.png")
IkariamManager.myImageVin = FunctionPicture:Create("Vin", 10, 40,  "Images/Vin.png")
IkariamManager.myImageMarbre = FunctionPicture:Create("Marbre", 10, 70,  "Images/Marbre.png")
IkariamManager.myImageCristal = FunctionPicture:Create("Cristal", 10, 100,  "Images/Cristal.png")
IkariamManager.myImageSouffre = FunctionPicture:Create("Souffre", 10, 130,  "Images/Souffre.png")
IkariamManager.myImageUpdate = FunctionPicture:Create("Update", 10, 165,  "Images/Update.png")

function IkariamManager:Load()
  
  
 
end

function IkariamManager:Update(dt)
  
  
  
end

function IkariamManager:Draw()
  
 self.myButtonDemarrer:Draw()
 self.myButtonQuitter:Draw()
 self.myImageBois:Draw()
 self.myImageVin:Draw()
 self.myImageMarbre:Draw()
 self.myImageCristal:Draw()
 self.myImageSouffre:Draw()
 self.myImageUpdate:Draw()
 self.myGroupeBox1:Draw()
 self.myGroupeBox2:Draw()
 self.myGroupeBox3:Draw()
 self.myGroupeBox4:Draw()
 self.myGroupeBox5:Draw()
 self.myGroupeBox6:Draw()


end

return IkariamManager