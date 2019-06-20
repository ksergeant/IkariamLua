local ville = {}
local FunctionPicture = require("picture")

function ville:Create(pFichierJson, pGroupeBoxX, pGroupeBoxY)
  
  local villeTempo = {}
  villeTempo._nom = ""
  villeTempo.x = pGroupeBoxX
  villeTempo.y = pGroupeBoxY
  villeTempo._nbBois = 0
  villeTempo._nbVin = 0
  villeTempo._nbMarbre = 0
  villeTempo._nbCristal = 0
  villeTempo._nbSouffre = 0
  villeTempo._update = "Aucune"

  villeTempo._ImageBois = FunctionPicture:Create("Bois", (10 + pGroupeBoxX), (10 + pGroupeBoxY),  "Images/Bois.png", 1,1)
  villeTempo._ImageVin = FunctionPicture:Create("Vin", (10 + pGroupeBoxX), (40 + pGroupeBoxY),  "Images/Vin.png",1,1)
  villeTempo._ImageMarbre = FunctionPicture:Create("Marbre", (10 + pGroupeBoxX), (70 + pGroupeBoxY),  "Images/Marbre.png",1,1)
  villeTempo._ImageCristal = FunctionPicture:Create("Cristal", (10 + pGroupeBoxX), (100 + pGroupeBoxY),  "Images/Cristal.png", 1,1)
  villeTempo._ImageSouffre = FunctionPicture:Create("Souffre", (10 + pGroupeBoxX), (130 + pGroupeBoxY),  "Images/Souffre.png",1,1)
  villeTempo._ImageUpdate = FunctionPicture:Create("Update", (10 + pGroupeBoxX), (165 + pGroupeBoxY),  "Images/Update.png",1,1)

  villeTempo._listeBatiments = {}

    function villeTempo:Traitement()
    

    end

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

        self._ImageBois:Draw()
        self._ImageVin:Draw()
        self._ImageMarbre:Draw()
        self._ImageCristal:Draw()
        self._ImageSouffre:Draw()
        self._ImageUpdate:Draw()

    end
  
  return villeTempo
  
end

return ville