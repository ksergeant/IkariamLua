local groupeBox = {}
local FunctionVille = require("ville")
function groupeBox:Create(pFichierJson, pX, pY)
  
  local groupeBoxTempo = {}
  groupeBoxTempo.nom = pFichierJson
  groupeBoxTempo.x = pX
  groupeBoxTempo.y = pY
  groupeBoxTempo.width = 238
  groupeBoxTempo.height = 238
  groupeBoxTempo.ville = FunctionVille:Create(pFichierJson, pX, pY)

    function groupeBoxTempo:Traitement()
    
        
    
    end

    function groupeBoxTempo:Draw()
    
        local r,g,b = love.graphics.getColor() 
        
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
        
        love.graphics.setColor(1,0,0)
        love.graphics.print(self.nom, self.x + 110, self.y)
        love.graphics.setColor(r,g,b)
        


        self.ville:Draw()
    
    end
  
  return groupeBoxTempo
  
end

return groupeBox