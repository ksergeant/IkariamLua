local ville = {}

function ville:Create()
  
  local villeTempo = {}
  villeTempo._nomJoueur = ""
  villeTempo._bateauMarchand = 0
  villeTempo._nom = ""
  villeTempo._nbBois = 0
  villeTempo._nbVin = 0
  villeTempo._nbMarbre = 0
  villeTempo._nbCristal = 0
  villeTempo._nbSouffre = 0
  villeTempo._update = "Aucune"
  villeTempo._entrepotMax = 0
  villeTempo._listeBatiments = {}

    function villeTempo:Draw()
        
       local r,g,b = love.graphics.getColor() 

       love.graphics.setColor(0,0,0)

       love.graphics.print(self._nbBois, self.x + 60, self.y + 18) 
       love.graphics.print(self._nbVin, self.x + 60, self.y + 48) 
       love.graphics.print(self._nbMarbre, self.x + 60, self.y + 78) 
       love.graphics.print(self._nbCristal, self.x + 60, self.y + 108) 
       love.graphics.print(self._nbSouffre, self.x + 60, self.y + 138) 
       love.graphics.print(self._update, self.x + 100, self.y + 173) 

       love.graphics.setColor(r,g,b)

    end
  
  return villeTempo
  
end

return ville