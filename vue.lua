local vue = {}
local FunctionPicture = require("picture")

function separateurNombre(pNombre)

  local nombreFormate = {}
  nombreFormate.millions = 0
  nombreFormate.milliers = 0
  nombreFormate.unites = 0

  local milliers = {}
  local millions = {}
  local unites = {}

  a = tonumber(pNombre)

  if (a >= 1000) then

   milliers = math.floor (a / 1000)

   unites = a - (milliers * 1000)

   --print(pNombre)
   --print(milliers)
   --print(unites)
   nombreFormate.milliers = milliers
   nombreFormate.unites = unites

  else 

    nombreFormate.unites = pNombre

  end
  
  

  return nombreFormate

end

function vue:Create(pNom)
  
  local vueTempo = {}
  vueTempo.nom = pNom
 
  function vueTempo:Draw()

    local r,g,b = love.graphics.getColor() 
    love.graphics.setColor(0,0,0)
    love.graphics.print("Voici la vue "..self.nom,40,100)
    love.graphics.setColor(r,g,b)
    --print("affichage"..self.nom)
  
  end

  function vueTempo:Update()
    
  end

return vueTempo
  
end

function vue:Ressources(pListeData)

  local r,g,b = love.graphics.getColor() 
  love.graphics.setColor(0,0,0)

  love.graphics.line(0, 70, 980, 70)
  love.graphics.print("VILLES", 85, 79)
  love.graphics.line(0, 100, 980, 100)
 
  love.graphics.setColor(r,g,b)

  local imageBois = FunctionPicture:Create("Bois", 313, 70,  "Images/Bois.png", 1,1)
  local imageVin = FunctionPicture:Create("Vin", 413, 70,  "Images/Vin.png",1,1)
  local imageMarbre = FunctionPicture:Create("Marbre", 513, 70,  "Images/Marbre.png",1,1)
  local imageCristal = FunctionPicture:Create("Cristal", 613, 70,  "Images/Cristal.png", 1,1)
  local imageSouffre = FunctionPicture:Create("Souffre", 713, 70,  "Images/Souffre.png",1,1)
  local imageUpdate = FunctionPicture:Create("Update", 813, 70,  "Images/Update.png",1,1)
  local imageOr = FunctionPicture:Create("Or", 913, 70,  "Images/Or.png",1,1)

  local listeData = pListeData
  
  imageBois:Draw()
  imageVin:Draw()
  imageMarbre:Draw()
  imageCristal:Draw()
  imageSouffre:Draw()
  imageOr:Draw()
  imageUpdate:Draw()

   local nombreVilles = #listeData.Villes
   local decalage = 40
   local TotalBois = 0
   local TotalVin = 0
   local TotalMarbre = 0
   local TotalCristal = 0
   local TotalSouffre = 0





   for i = 1, nombreVilles do 

    local r,g,b = love.graphics.getColor() 
    love.graphics.setColor(1,0,0)
    love.graphics.print(listeData.Villes[i]._nom, 85, 79 + decalage)
    
    love.graphics.setColor(0.3,0,0)
    love.graphics.print(listeData.Villes[i]._nbBois, 300, 79 + decalage)
    love.graphics.print(listeData.Villes[i]._nbVin, 400, 79 + decalage)
    love.graphics.print(listeData.Villes[i]._nbMarbre, 500, 79 + decalage)
    love.graphics.print(listeData.Villes[i]._nbCristal, 600, 79 + decalage)
    love.graphics.print(listeData.Villes[i]._nbSouffre, 700, 79 + decalage)
    --love.graphics.print(listeData.Villes[i]._update, 800, 79 + decalage)

    if (listeData.Villes[i]._update > 0) then
      local ts = os.time()
      ts = listeData.Villes[i]._update - ts - 3600
      love.graphics.print(os.date('%H:%M:%S', ts), 800, 79 + decalage)

    else 
      
      love.graphics.print("Aucune", 800, 79 + decalage)
    end

    TotalBois = TotalBois + listeData.Villes[i]._nbBois
    TotalVin = TotalVin + listeData.Villes[i]._nbVin
    TotalMarbre = TotalMarbre + listeData.Villes[i]._nbMarbre
    TotalCristal = TotalCristal + listeData.Villes[i]._nbCristal
    TotalSouffre = TotalSouffre + listeData.Villes[i]._nbSouffre
    
    love.graphics.setColor(r,g,b)

    decalage = decalage+ 50

   end

   love.graphics.setColor(0,0,0) -- noir
   love.graphics.print("TOTAL", 85, decalage + 70)
   love.graphics.line(0, decalage + 50, 980, decalage + 50)
   love.graphics.line(0, decalage + 100, 980, decalage + 100)

    -- Dessine le Tableau
  love.graphics.line(280, 70, 280, decalage + 100)
  love.graphics.line(380, 70, 380, decalage + 100)
  love.graphics.line(480, 70, 480, decalage + 100)
  love.graphics.line(580, 70, 580, decalage + 100)
  love.graphics.line(680, 70, 680, decalage + 100)
  love.graphics.line(780, 70, 780, decalage + 100)
  love.graphics.line(880, 70, 880, decalage + 100)
  love.graphics.line(980, 70, 980, decalage + 100)

   love.graphics.setColor(0.3,0,0) -- bleu foncé

  --formatage des nombres
   TotalBois = separateurNombre(TotalBois)
   TotalVin = separateurNombre(TotalVin)
   TotalMarbre = separateurNombre(TotalMarbre)
   TotalCristal = separateurNombre(TotalCristal)
   TotalSouffre = separateurNombre(TotalSouffre)

   love.graphics.print(TotalBois.milliers ..tostring(" ") ..tostring(TotalBois.unites), 300, decalage + 70)
   love.graphics.print(TotalVin.milliers ..tostring(" ") ..tostring(TotalVin.unites), 400, decalage + 70)
   love.graphics.print(TotalMarbre.milliers ..tostring(" ") ..tostring(TotalMarbre.unites), 500, decalage + 70)
   love.graphics.print(TotalCristal.milliers ..tostring(" ") ..tostring(TotalCristal.unites), 600, decalage + 70)
   love.graphics.print(TotalSouffre.milliers ..tostring(" ") ..tostring(TotalSouffre.unites), 700, decalage + 70)

   love.graphics.setColor(r,g,b)


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