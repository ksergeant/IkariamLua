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

  villeTempo._ImageBois = FunctionPicture:Create("Bois", (10 + pGroupeBoxX), (10 + pGroupeBoxY),  "Images/Bois.png")
  villeTempo._ImageVin = FunctionPicture:Create("Vin", (10 + pGroupeBoxX), (40 + pGroupeBoxY),  "Images/Vin.png")
  villeTempo._ImageMarbre = FunctionPicture:Create("Marbre", (10 + pGroupeBoxX), (70 + pGroupeBoxY),  "Images/Marbre.png")
  villeTempo._ImageCristal = FunctionPicture:Create("Cristal", (10 + pGroupeBoxX), (100 + pGroupeBoxY),  "Images/Cristal.png")
  villeTempo._ImageSouffre = FunctionPicture:Create("Souffre", (10 + pGroupeBoxX), (130 + pGroupeBoxY),  "Images/Souffre.png")
  villeTempo._ImageUpdate = FunctionPicture:Create("Update", (10 + pGroupeBoxX), (165 + pGroupeBoxY),  "Images/Update.png")

  villeTempo._listeBatiments = {}

    function villeTempo:Traitement()
    

    end

    function villeTempo:Draw()
        
    
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