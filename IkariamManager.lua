local IkariamManager = {}
local FunctionButton = require("button")



function eventDemarrer()
  
  os.execute("perl Ikariam.pl")
  
end


function eventQuitter()
  
  love.event.quit()
  
end

IkariamManager.myButtonDemarrer = FunctionButton:Create("Démarrer", "buttonDemarer", 1200, 600, eventDemarrer, "adventure_pack/PNG/buttonLong_blue.png")
IkariamManager.myButtonQuitter = FunctionButton:Create("Quitter", "buttonQuitter", 1200, 700, eventQuitter, "adventure_pack/PNG/buttonLong_blue.png")


function IkariamManager:Load()
  
  
 
end

function IkariamManager:Update(dt)
  
  
  
end

function IkariamManager:Draw()
  
 IkariamManager.myButtonDemarrer:Draw()
 IkariamManager.myButtonQuitter:Draw()
end

return IkariamManager