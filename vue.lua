local vue = {}
local FunctionPicture = require("picture")

function vue:Create(pNom)
  
  local vueTempo = {}
  vueTempo.nom = pNom
 
  function vueTempo:Draw()

    love.graphics.print("Voici la vue "..self.nom,40,100)
    print("affichage"..self.nom)
  
  end

  function vueTempo:Update()
    
  end

return vueTempo
  
end

function vue:Ressources()

  love.graphics.print("Villes", 85, 70)
  local imageBois = FunctionPicture:Create("Bois", 300, 70,  "Images/Bois.png", 1,1)
  local imageVin = FunctionPicture:Create("Vin", 400, 70,  "Images/Vin.png",1,1)
  local imageMarbre = FunctionPicture:Create("Marbre", 500, 70,  "Images/Marbre.png",1,1)
  local imageCristal = FunctionPicture:Create("Cristal", 600, 70,  "Images/Cristal.png", 1,1)
  local imageSouffre = FunctionPicture:Create("Souffre", 700, 70,  "Images/Souffre.png",1,1)
  local imageUpdate = FunctionPicture:Create("Update", 800, 70,  "Images/Update.png",1,1)
  local imageOr = FunctionPicture:Create("Or", 900, 70,  "Images/Or.png",1,1)
  
  

  imageBois:Draw()
  imageVin:Draw()
  imageMarbre:Draw()
  imageCristal:Draw()
  imageSouffre:Draw()
  imageUpdate:Draw()
  imageOr:Draw()
end

function vue:Batiments()


end

function vue:Iles()

end

function vue:Cachette()

end

function vue:Plans()

end

return vue