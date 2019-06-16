local IkariamManager = {}

local FunctionButton = require("button")
local FunctionEvent = require("event")

local FunctionGroupeBox = require("groupeBox")

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

IkariamManager.myButtonDemarrer = FunctionButton:Create("Démarrer", "buttonDemarer", 1200, 600, FunctionEvent.Demarrer, "adventure_pack/PNG/buttonLong_blue.png")
IkariamManager.myButtonQuitter = FunctionButton:Create("Quitter", "buttonQuitter", 1200, 700, FunctionEvent.Quitter, "adventure_pack/PNG/buttonLong_blue.png")
IkariamManager.myButtonRessources = FunctionButton:Create("Ressources", "buttonDemarer", 0, 481, FunctionEvent.Demarrer, "adventure_pack/PNG/buttonLong_beige.png")

function IkariamManager:Load()
  
  
 
end

function IkariamManager:Update(dt)
  
  
  
end

function IkariamManager:Draw()
  
 self.myButtonDemarrer:Draw()
 self.myButtonQuitter:Draw()
 self.myButtonRessources:Draw()

 self.myGroupeBox1:Draw()
 self.myGroupeBox2:Draw()
 self.myGroupeBox3:Draw()
 self.myGroupeBox4:Draw()
 self.myGroupeBox5:Draw()
 self.myGroupeBox6:Draw()

 self.myGroupeBox7:Draw()
 self.myGroupeBox8:Draw()
 self.myGroupeBox9:Draw()
 self.myGroupeBox10:Draw()
 self.myGroupeBox11:Draw()
 self.myGroupeBox12:Draw()

end

return IkariamManager