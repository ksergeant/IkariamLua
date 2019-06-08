local groupeBox = {}

function groupeBox:Create(pNom, pX, pY)
  
  local groupeBoxTempo = {}
  groupeBoxTempo.nom = pNom
  groupeBoxTempo.x = pX
  groupeBoxTempo.y = pY
  groupeBoxTempo.width = 240
  groupeBoxTempo.height = 240


    function groupeBoxTempo:Traitement()
    
        
    
    end

    function groupeBoxTempo:Draw()
    
        
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    
    end
  
  return groupeBoxTempo
  
end

return groupeBox