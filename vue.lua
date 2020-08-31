local vue = {}
local FunctionPicture = require("picture")
local wiki = require("wiki")
local myTableauFunctions = require("tableau")

-- Fonction qui separe les nombres permettant les groupements suivants millions, milliers, unités
function separateurNombre(pNombre)

  local nombreFormate = {}
  nombreFormate.millions = 0
  nombreFormate.milliers = 0
  nombreFormate.unites = 0

  local millionTempo = 0
  local millierTempo = 0
  local milliers = 0
  local millions = 0
  local unites = 0

  a = tonumber(pNombre)

  if a >= 1000 then

   millierTempo = math.floor (a / 1000) -- 2394

    if millierTempo >= 1000 then
    
      millions = math.floor(millierTempo /1000) -- 2
  
      millionTempo = millions * 1000 -- 2000
  
      milliers = millierTempo - millionTempo -- 2394 - 2000
    
      unites = a - (millierTempo * 1000) 
      nombreFormate.millions = millions
      nombreFormate.unites = unites
      nombreFormate.milliers = milliers
    else 
      unites = a - (millierTempo * 1000)
      nombreFormate.millions =""
      nombreFormate.unites = unites
      nombreFormate.milliers = millierTempo
    end
   
  else 

    nombreFormate.unites = pNombre

  end
  
  return nombreFormate

end

function affichageDesZeros(pData)

  local stringData = {}

  if (pData.unites <100) then

   -- ..tostring("0") ..tostring(TotalVin.unites), 400, decalage + 70)

  else

   --love.graphics.print(TotalVin.milliers ..tostring(" ") ..tostring(TotalVin.unites), 400, decalage + 70)

  end

  return Data

end

function vue:Accueil()
  local r,g,b = love.graphics.getColor() 
  love.graphics.setColor(0,0,0)
  love.graphics.print("", 10, 80)
  love.graphics.print("", 10, 150)
  
  love.graphics.setColor(r,g,b)
end

-- ######## VUE RESSOURCES #########
function vue:Ressources(pListeData)

  local r,g,b = love.graphics.getColor() 
  love.graphics.setColor(0,0,0)

  love.graphics.line(0, 70, 1165, 70)
  love.graphics.print("VILLES", 115, 78)
  love.graphics.line(0, 100, 1165, 100)
 
  love.graphics.setColor(r,g,b)

  local imageBois = FunctionPicture:Create("Bois", 313, 70,  "Images/Bois.png", 1,1)
  local imageEntrepotBois= FunctionPicture:Create("Entrepot", 356, 70,  "Images/Entrepot.png",1,1)
  local imageVin = FunctionPicture:Create("Vin", 713, 70,  "Images/Vin.png",1,1)
  local imageMarbre = FunctionPicture:Create("Marbre", 813, 70,  "Images/Marbre.png",1,1)
  local imageCristal = FunctionPicture:Create("Cristal", 913, 70,  "Images/Cristal.png", 1,1)
  local imageSouffre = FunctionPicture:Create("Souffre", 1013, 70,  "Images/Souffre.png",1,1)
  local imageUpdate = FunctionPicture:Create("Update", 1113, 72,  "Images/Update.png",1,1)
  
  
  local listeData = pListeData

  local imageVilleSouffre = love.graphics.newImage("Images/Souffre.png")
  local imageVilleMarbre = love.graphics.newImage("Images/Marbre.png")
  local imageVilleCristal = love.graphics.newImage("Images/Cristal.png")
  local imageVilleVin = love.graphics.newImage("Images/Vin.png")

  imageBois:Draw()
  imageEntrepotBois:Draw()
  
  imageVin:Draw()
  imageMarbre:Draw()
  imageCristal:Draw()
  imageSouffre:Draw()
  imageUpdate:Draw()
  

   local nombreVilles = #listeData.Villes
   local decalage = 40
   
   local TotalBois = 0
   local TotalVin = 0
   local TotalMarbre = 0
   local TotalCristal = 0
   local TotalSouffre = 0
   
   local TotalBoisProduction = 0
   local TotalVinProduction = 0
   local TotalMarbreProduction = 0
   local TotalCristalProduction = 0
   local TotalSouffreProduction = 0
   local TotalVinConso = 0

   for i = 1, nombreVilles do 


    local r,g,b = love.graphics.getColor() 

    if i == 1 then 
      love.graphics.draw(imageVilleSouffre, 80, 70 + decalage)
    end

    if i == 2 or i == 5 or i == 6 then 
      love.graphics.draw(imageVilleMarbre, 80, 70 + decalage)
    end

    if i == 3 or i == 8 or i == 9 then 
      love.graphics.draw(imageVilleCristal, 80, 70 + decalage)
    end

    if i == 4 or i == 7 then 
      love.graphics.draw(imageVilleVin, 80, 70 + decalage)
    end

    love.graphics.setColor(1,0,0)

    love.graphics.print(listeData.Villes[i]._nom, 115, 79 + decalage)

    love.graphics.setColor(0.3,0,0)
    
    nbrBois = separateurNombre(listeData.Villes[i]._nbBois)
    nbrVin = separateurNombre(listeData.Villes[i]._nbVin)
    nbrMarbre = separateurNombre(listeData.Villes[i]._nbMarbre)
    nbrCristal = separateurNombre(listeData.Villes[i]._nbCristal)
    nbrSouffre = separateurNombre(listeData.Villes[i]._nbSouffre)
    
    -- Calcul pourcentage
    
    maxRessource = tonumber(listeData.Villes[i]._entrepotMax)
    pourcentageBois = math.floor((tonumber(listeData.Villes[i]._nbBois) / maxRessource)*100)
    ManqueBois= maxRessource - tonumber(listeData.Villes[i]._nbBois)
    
    pourcentageVin = math.floor((tonumber(listeData.Villes[i]._nbVin) / maxRessource)*100)
    ManqueVin= maxRessource - tonumber(listeData.Villes[i]._nbVin)
    
    pourcentageMarbre = math.floor((tonumber(listeData.Villes[i]._nbMarbre) / maxRessource)*100)
    ManqueMarbre= maxRessource - tonumber(listeData.Villes[i]._nbMarbre)
    
    pourcentageCristal = math.floor((tonumber(listeData.Villes[i]._nbCristal) / maxRessource)*100)
    ManqueCristal= maxRessource - tonumber(listeData.Villes[i]._nbCristal)
    
    pourcentageSouffre = math.floor((tonumber(listeData.Villes[i]._nbSouffre) / maxRessource)*100)
    ManqueSouffre= maxRessource - tonumber(listeData.Villes[i]._nbSouffre)
    
    --print("affiche luxe id : "..listeData.Villes[i]._luxeId)
    
    local luxeId = tonumber(listeData.Villes[i]._luxeId)
    if luxeId == 1 then -- Ville vin
      
      local r,g,b = love.graphics.getColor() 
      local productionVin = math.floor(listeData.Villes[i]._productionLuxe * 3600) - listeData.Villes[i]._consoVin
      
      love.graphics.setColor(0, 0.5, 0) -- vert
      love.graphics.print("+ "..tostring(productionVin).."/h", 800, 60 + decalage)
      love.graphics.setColor(r,g,b)
      
      TotalVinProduction = TotalVinProduction + productionVin
      
    elseif luxeId == 2 then -- Ville marbre
      
      local r,g,b = love.graphics.getColor() 
      local productionMarbre = math.floor(listeData.Villes[i]._productionLuxe * 3600)
      
      love.graphics.setColor(0, 0.5, 0) -- vert
      love.graphics.print("+ "..tostring(productionMarbre).."/h", 900, 60 + decalage)
      TotalMarbreProduction = TotalMarbreProduction + productionMarbre
      
      local consoVin = listeData.Villes[i]._consoVin
      
      TotalVinConso = TotalVinConso + consoVin
      love.graphics.setColor(1,0,0) -- rouge
      love.graphics.print("- "..tostring(consoVin).."/h", 800, 60 + decalage)
      love.graphics.setColor(r,g,b)
    
    elseif luxeId == 3 then -- Ville Cristal
      
      local r,g,b = love.graphics.getColor() 
      local productionCristal = math.floor(listeData.Villes[i]._productionLuxe * 3600)
      
      love.graphics.setColor(0, 0.5, 0) -- vert
      love.graphics.print("+ "..tostring(productionCristal).."/h", 1000, 60 + decalage)
      TotalCristalProduction = TotalCristalProduction + productionCristal
      
      local consoVin = listeData.Villes[i]._consoVin
      TotalVinConso = TotalVinConso + consoVin
      
      love.graphics.setColor(1,0,0) -- rouge
      love.graphics.print("- "..tostring(consoVin).."/h", 800, 60 + decalage)
      love.graphics.setColor(r,g,b)
      
    elseif luxeId == 4 then-- Ville souffre
      
      local r,g,b = love.graphics.getColor() 
      local productionSouffre = math.floor(listeData.Villes[i]._productionLuxe * 3600)
      
      love.graphics.setColor(0, 0.5, 0) -- vert
      love.graphics.print("+ "..tostring(productionSouffre).."/h", 1100, 60 + decalage)
      TotalSouffreProduction = TotalSouffreProduction + productionSouffre
      
      local consoVin = listeData.Villes[i]._consoVin
      TotalVinConso = TotalVinConso + consoVin
      
      love.graphics.setColor(1,0,0) -- rouge
      love.graphics.print("- "..tostring(consoVin).."/h", 800, 60 + decalage)
      love.graphics.setColor(r,g,b)
      
    end
  
  -- Affichage des données de production des villes 
  local r2,g2,b2 = love.graphics.getColor() 
  local productionBois = math.floor(listeData.Villes[i]._productionBois * 3600)
  love.graphics.setColor(0, 0.5, 0) -- vert
  love.graphics.print("+ "..tostring(productionBois).."/h", 300, 60 + decalage)
  
  TotalBoisProduction = TotalBoisProduction + productionBois
  
  love.graphics.setColor(r2,g2,b2)
  
  love.graphics.print(pourcentageBois ..tostring("%"), 385, 62 + decalage)
  
  love.graphics.print(tostring("-")..tostring(ManqueBois), 380, 95 +decalage)
    if (nbrBois.unites < 100) then
      love.graphics.print(nbrBois.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrBois.unites), 300, 79 + decalage)
      
    else
      love.graphics.print(nbrBois.milliers ..tostring(" ") ..tostring(nbrBois.unites), 300, 79 + decalage)
    end
    
    if (nbrVin.unites < 100) then
      love.graphics.print(nbrVin.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrVin.unites), 700, 79 + decalage)
      
    else
      love.graphics.print(nbrVin.milliers ..tostring(" ") ..tostring(nbrVin.unites), 700, 79 + decalage)
    end
    
    if (nbrMarbre.unites < 100) then
      love.graphics.print(nbrMarbre.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrMarbre.unites), 800, 79 + decalage)
      
    else
      love.graphics.print(nbrMarbre.milliers ..tostring(" ") ..tostring(nbrMarbre.unites), 800, 79 + decalage)
    end
    
    if (nbrCristal.unites < 100 ) then
      love.graphics.print(nbrCristal.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrCristal.unites), 900, 79 + decalage)
      
    else
      if (nbrCristal.milliers < 1) then
      love.graphics.print(tostring(nbrCristal.unites), 900, 79 + decalage)
      
      else
      love.graphics.print(nbrCristal.milliers ..tostring(" ") ..tostring(nbrCristal.unites), 900, 79 + decalage)
      end
    end
    
    if (nbrSouffre.unites < 100) then
      love.graphics.print(nbrSouffre.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrSouffre.unites), 1000, 79 + decalage)
      
    else
      love.graphics.print(nbrSouffre.milliers ..tostring(" ") ..tostring(nbrSouffre.unites), 1000, 79 + decalage)
    end
    
    --love.graphics.print(listeData.Villes[i]._nbVin, 400, 79 + decalage)
    --love.graphics.print(listeData.Villes[i]._nbMarbre, 500, 79 + decalage)
    --love.graphics.print(listeData.Villes[i]._nbCristal, 600, 79 + decalage)
    --love.graphics.print(listeData.Villes[i]._nbSouffre, 700, 79 + decalage)

    if (listeData.Villes[i]._update > 0) then
      local ts = os.time()
      ts = listeData.Villes[i]._update - ts - 3600
      
      if (ts > 0) then
        love.graphics.print(os.date('%H:%M:%S', ts), 1100, 79 + decalage)
      else
        love.graphics.print("Aucune", 1100, 79 + decalage)
      end

    else 
      love.graphics.print("Aucune", 1100, 79 + decalage)
    end

    TotalBois = TotalBois + listeData.Villes[i]._nbBois
    TotalVin = TotalVin + listeData.Villes[i]._nbVin
    TotalMarbre = TotalMarbre + listeData.Villes[i]._nbMarbre
    TotalCristal = TotalCristal + listeData.Villes[i]._nbCristal
    TotalSouffre = TotalSouffre + listeData.Villes[i]._nbSouffre
    
    love.graphics.line(0, decalage + 110, 1113, decalage + 110)

    love.graphics.setColor(r,g,b)
    
   
   -- GESTION JAUGE 
   
    local imageJaugeVideBasBois = love.graphics.newImage("adventure_pack/PNG/barBack_verticalBottom.png")
    local imageJaugeVideMidBois = love.graphics.newImage("adventure_pack/PNG/barBack_verticalMid.png")
    local imageJaugeVideTopBois = love.graphics.newImage("adventure_pack/PNG/barBack_verticalTop.png")
  
    love.graphics.draw(imageJaugeVideTopBois, 360, 61 + decalage, 0)
    love.graphics.draw(imageJaugeVideMidBois, 360, 70 + decalage, 0, 1, 1.639, 0)
    love.graphics.draw(imageJaugeVideBasBois, 360, 100 + decalage,0)
    
   local pourcentageJaugeBois = tonumber(pourcentageBois)
   --local pourcentageTest = 100
   local pourcentageQuad = pourcentageJaugeBois * 0.36
   
   local posXDepartQuad = 0
   local posYDepartQuad = 36 - pourcentageQuad -- Max 36
  
   local largeurQuad = 18
   local hauteurQuad = pourcentageQuad -- Max 36
   
  if(pourcentageJaugeBois >= 50) then 
       imageJaugeFullBois = love.graphics.newImage("adventure_pack/modif/FullJaugeVert.png")
  elseif(pourcentageJaugeBois >= 20) then
       imageJaugeFullBois = love.graphics.newImage("adventure_pack/modif/FullJaugeJaune.png")
  else
       imageJaugeFullBois = love.graphics.newImage("adventure_pack/modif/FullJaugeRouge.png")
  end
   
   local quadJauge = love.graphics.newQuad(posXDepartQuad, posYDepartQuad, largeurQuad, hauteurQuad, imageJaugeFullBois:getDimensions())
   
   if (pourcentageJaugeBois == 1) then
      posJauge = 48
   elseif(pourcentageJaugeBois == 2)then
       posJauge = 48
   elseif(pourcentageJaugeBois == 3)then
       posJauge = 48
   elseif(pourcentageJaugeBois == 4)then
       posJauge = 48
   elseif(pourcentageJaugeBois == 5)then
       posJauge = 47
     elseif(pourcentageJaugeBois == 6)then
       posJauge = 47
     elseif(pourcentageJaugeBois == 7)then
       posJauge = 47
        elseif(pourcentageJaugeBois == 8)then
       posJauge = 47
        elseif(pourcentageJaugeBois == 9)then
       posJauge = 47
        elseif(pourcentageJaugeBois == 10)then
       posJauge = 47
        elseif(pourcentageJaugeBois == 11)then
       posJauge = 47
        elseif(pourcentageJaugeBois == 12)then
       posJauge = 47
        elseif(pourcentageJaugeBois == 13)then
       posJauge = 47
        elseif(pourcentageJaugeBois == 14)then
       posJauge = 46
        elseif(pourcentageJaugeBois == 15)then
       posJauge = 46
        elseif(pourcentageJaugeBois == 16)then
       posJauge = 46
        elseif(pourcentageJaugeBois == 17)then
       posJauge = 46
        elseif(pourcentageJaugeBois == 18)then
       posJauge = 46
        elseif(pourcentageJaugeBois == 19)then
       posJauge = 46
        elseif(pourcentageJaugeBois == 20)then
       posJauge = 46
        elseif(pourcentageJaugeBois == 21)then
       posJauge = 46
        elseif(pourcentageJaugeBois == 22)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 23)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 24)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 25)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 26)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 27)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 28)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 29)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 30)then
       posJauge = 45
        elseif(pourcentageJaugeBois == 31)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 32)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 33)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 34)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 35)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 36)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 37)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 38)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 39)then
       posJauge = 44
        elseif(pourcentageJaugeBois == 40)then
       posJauge = 43
        elseif(pourcentageJaugeBois == 41)then
       posJauge = 43
        elseif(pourcentageJaugeBois == 42)then
       posJauge = 43
        elseif(pourcentageJaugeBois == 43)then
       posJauge = 43
        elseif(pourcentageJaugeBois == 44)then
       posJauge = 43
        elseif(pourcentageJaugeBois == 45)then
       posJauge = 43
        elseif(pourcentageJaugeBois == 46)then
       posJauge = 43
        elseif(pourcentageJaugeBois == 47)then
       posJauge = 43
        elseif(pourcentageJaugeBois == 48)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 49)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 50)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 51)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 52)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 53)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 54)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 55)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 56)then
       posJauge = 42
        elseif(pourcentageJaugeBois == 57)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 58)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 59)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 60)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 61)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 62)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 63)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 64)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 65)then
       posJauge = 41
        elseif(pourcentageJaugeBois == 66)then
       posJauge = 40
        elseif(pourcentageJaugeBois == 67)then
       posJauge = 40
        elseif(pourcentageJaugeBois == 68)then
       posJauge = 40
        elseif(pourcentageJaugeBois == 69)then
       posJauge = 40
        elseif(pourcentageJaugeBois == 70)then
       posJauge = 40
        elseif(pourcentageJaugeBois == 71)then
       posJauge = 40
        elseif(pourcentageJaugeBois == 72)then
       posJauge = 40
        elseif(pourcentageJaugeBois == 73)then
       posJauge = 40
        elseif(pourcentageJaugeBois == 74)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 75)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 76)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 77)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 78)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 79)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 80)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 81)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 82)then
       posJauge = 39
        elseif(pourcentageJaugeBois == 83)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 84)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 85)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 86)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 87)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 88)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 89)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 90)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 91)then
       posJauge = 38
        elseif(pourcentageJaugeBois == 92)then
       posJauge = 37
        elseif(pourcentageJaugeBois == 93)then
       posJauge = 37
        elseif(pourcentageJaugeBois == 94)then
       posJauge = 37
        elseif(pourcentageJaugeBois == 95)then
       posJauge = 37
        elseif(pourcentageJaugeBois == 96)then
       posJauge = 37
        elseif(pourcentageJaugeBois == 97)then
       posJauge = 37
        elseif(pourcentageJaugeBois == 98)then
       posJauge = 37
        elseif(pourcentageJaugeBois == 99)then
       posJauge = 37
        elseif(pourcentageJaugeBois == 100)then
       posJauge = 36
       
     else 
       posJauge = 36
   end
   
   local maxPosJauge = posJauge - pourcentageQuad
   love.graphics.draw(imageJaugeFullBois, quadJauge, 360, 61 + decalage + maxPosJauge, 0, 1, 1.32)
    
    
    
    decalage = decalage + 50

   end

   love.graphics.setColor(0,0,0) -- noir
   love.graphics.print("TOTAL", 115, decalage + 73)
   --love.graphics.line(0, decalage + 50, 980, decalage + 50)
   love.graphics.line(0, decalage + 100, 980, decalage + 100)

    -- Dessine le Tableau
  love.graphics.line(280, 70, 280, decalage + 100)
  --love.graphics.line(380, 70, 380, decalage + 100)
  --love.graphics.line(480, 70, 480, decalage + 100)
  --love.graphics.line(580, 70, 580, decalage + 100)
  --love.graphics.line(680, 70, 680, decalage + 100)
  --love.graphics.line(780, 70, 780, decalage + 100)
  --love.graphics.line(880, 70, 880, decalage + 100)
  --love.graphics.line(980, 70, 980, decalage + 100)

   love.graphics.setColor(0.3,0,0) -- bleu foncé

  --Formatage des nombres
   TotalBois = separateurNombre(TotalBois)
   TotalVin = separateurNombre(TotalVin)
   TotalMarbre = separateurNombre(TotalMarbre)
   TotalCristal = separateurNombre(TotalCristal)
   TotalSouffre = separateurNombre(TotalSouffre)

 -- Affichage de production total
  local r3,g3,b3 = love.graphics.getColor() 
  
  love.graphics.setColor(0, 0.5, 0) -- vert
  love.graphics.print("+ "..tostring(TotalBoisProduction).. "/h", 300, decalage + 60)
  love.graphics.print("+ "..tostring(TotalMarbreProduction).. "/h", 900, decalage + 60)
  love.graphics.print("+ "..tostring(TotalCristalProduction).. "/h", 1000, decalage + 60)
  love.graphics.print("+ "..tostring(TotalSouffreProduction).. "/h", 1100, decalage + 60)
  
  local ValeurFinalProductionVin = TotalVinProduction - TotalVinConso
  
  print(TotalVinProduction)
  print(TotalVinConso)
  print(ValeurFinalProductionVin)
  if ValeurFinalProductionVin > 0 then
    love.graphics.print("+ "..tostring(ValeurFinalProductionVin).. "/h", 800, decalage + 60)
  else
    love.graphics.setColor(1,0,0)  -- rouge
    love.graphics.print(""..tostring(ValeurFinalProductionVin).. "/h", 800, decalage + 60)
  end
  love.graphics.setColor(r3,g3,b3)
  
  if TotalBois.unites <100 then
    love.graphics.print(tostring(TotalBois.millions) ..tostring(" ") ..tostring(TotalBois.milliers) ..tostring(" ") ..tostring("0") ..tostring(TotalBois.unites) , 300, decalage + 79)
  else
    love.graphics.print(tostring(TotalBois.millions) ..tostring(" ") ..tostring(TotalBois.milliers) ..tostring(" ") ..tostring(TotalBois.unites) , 300, decalage + 79)
  end
  
  if TotalVin.unites <100 then
    love.graphics.print(tostring(TotalVin.millions) ..tostring(" ") ..tostring(TotalVin.milliers) ..tostring(" ") ..tostring(TotalVin.unites) , 800, decalage + 79)
  elseif TotalVin.milliers < 100 then
     love.graphics.print(tostring(TotalVin.millions) ..tostring(" ") ..tostring("0") ..tostring(TotalVin.milliers) ..tostring(" ") ..tostring(TotalVin.unites) , 800, decalage + 79)
  else
    love.graphics.print(tostring(TotalVin.millions) ..tostring(" ") ..tostring(TotalVin.milliers) ..tostring(" ") ..tostring(TotalVin.unites) , 800, decalage + 79)
  end
  --[[
   if (TotalVin.unites <100) then
    love.graphics.print(TotalVin.milliers ..tostring(" ") ..tostring("0") ..tostring(TotalVin.unites), 400, decalage + 70)
   else
    love.graphics.print(TotalVin.milliers ..tostring(" ") ..tostring(TotalVin.unites), 400, decalage + 70)
   end
   ]]--
   
   if (TotalMarbre.unites < 100) then
    love.graphics.print(TotalMarbre.milliers ..tostring(" ") ..tostring("0") ..tostring(TotalMarbre.unites), 900, decalage + 79)
  else
    love.graphics.print(TotalMarbre.milliers ..tostring(" ") ..tostring(TotalMarbre.unites), 900, decalage + 79)
  end
  
  
  if (TotalCristal.unites < 100) then
    love.graphics.print(TotalCristal.milliers ..tostring(" ") ..tostring("0") ..tostring(TotalCristal.unites), 1000, decalage + 79)
  else
    love.graphics.print(TotalCristal.milliers ..tostring(" ") ..tostring(TotalCristal.unites), 1000, decalage + 79)
  end
  
  if (TotalSouffre.unites < 100) then
    love.graphics.print(TotalSouffre.milliers ..tostring(" ") ..tostring("0") ..tostring(TotalSouffre.unites), 1100, decalage + 79)
  else
    love.graphics.print(TotalSouffre.milliers ..tostring(" ") ..tostring(TotalSouffre.unites), 1100, decalage + 79)
  end

   love.graphics.setColor(r,g,b)

end

-- ######## VUE BATIMENTS #########
function vue:Batiments(pListeData)

  local myTableau = {}
  local imageHDV = FunctionPicture:Create("HDV", 170, 70,  "Images/vueBatiments/Original/HDV.png", 1,1)
  local imageResidence= FunctionPicture:Create("Residence", 220, 70,  "Images/Residence.png",1,1)
  local imageMenuisier = FunctionPicture:Create("Menuisier", 270, 70,  "Images/Menuisier.png",1,1)
  local imageArchitecte = FunctionPicture:Create("Architecte", 320, 70,  "Images/Architecte.png",1,1)
  local imageCave = FunctionPicture:Create("Cave", 370, 70,  "Images/CaveAVin.png", 1,1)
  local imageOpticien = FunctionPicture:Create("Opticien", 420, 70,  "Images/Opticien.png",1,1)
  local imageArtificier= FunctionPicture:Create("Artificier", 470, 70,  "Images/Artificier.png",1,1)
  local imageCachette= FunctionPicture:Create("Cachette", 520, 70,  "Images/Cachette.png",1,1)
  local imageVerrier= FunctionPicture:Create("Verrier", 570, 70,  "Images/Verrier.png",1,1)
  local imageForestiere = FunctionPicture:Create("Forestiere", 620, 70,  "Images/MaisonForestiere.png",1,1)
  --local imageAlchimiste= FunctionPicture:Create("Alchimiste", 620, 70,  "Images/vueBatiments/Original/Alchimiste.png",1,1)
  --local imageTailleurDePierres= FunctionPicture:Create("TailleurDePierres", 670, 70,  "Images/vueBatiments/Original/TailleurDePierres.png",1,1)
  --local imagePressoirAVin= FunctionPicture:Create("PressoirAVin", 770, 70,  "Images/vueBatiments/Original/PressoirAVin.png",1,1)
  local imageTaverne= FunctionPicture:Create("Taverne", 670, 70,  "Images/Taverne.png",1,1)
  local imageAcademie= FunctionPicture:Create("Academie", 720, 70,  "Images/Academie.png",1,1)
  local imagePort= FunctionPicture:Create("Port", 770, 70,  "Images/Port.png",1,1)
  local imageMur= FunctionPicture:Create("Mur", 820, 70,  "Images/Mur.png",1,1)
  local imageEntrepot= FunctionPicture:Create("Entrepot", 870, 70,  "Images/Entrepot.png",1,1)
  local imageCaserne= FunctionPicture:Create("Caserne", 920, 70,  "Images/Caserne.png",1,1)
  local imageMusee= FunctionPicture:Create("Musee", 970, 70,  "Images/Musee.png",1,1)
  local imageChantier= FunctionPicture:Create("Chantier", 1020, 70,  "Images/Chantier.png",1,1)
  --local imageComptoir= FunctionPicture:Create("Comptoir", 1070, 70,  "Images/Comptoir.png",1,1)
  --local imageAtelier= FunctionPicture:Create("Atelier", 1120, 70,  "Images/Atelier.png",1,1)
  local imageDepot= FunctionPicture:Create("Depot", 1070, 70, "Images/Depot.png", 1,1)

  -- Affichage des images
  imageHDV:Draw()
  imageMenuisier:Draw()
  imageArchitecte:Draw()
  imageCave:Draw()
  imageOpticien:Draw()
  imageForestiere:Draw()
  imageTaverne:Draw()
  imageAcademie:Draw()
  --imageAlchimiste:Draw()
  imageArtificier:Draw()
 -- imageAtelier:Draw()
  imageCachette:Draw()
  imageCaserne:Draw()
  imageChantier:Draw()
 -- imageComptoir:Draw()
  imageEntrepot:Draw()
  imageMur:Draw()
  imageMusee:Draw()
  imagePort:Draw()
  imageResidence:Draw()
  --imageTailleurDePierres:Draw()
  imageVerrier:Draw()
  imageDepot:Draw()
  --imagePressoirAVin:Draw()

  local imageVilleSouffre = love.graphics.newImage("Images/Souffre.png")
  local imageVilleMarbre = love.graphics.newImage("Images/Marbre.png")
  local imageVilleCristal = love.graphics.newImage("Images/Cristal.png")
  local imageVilleVin = love.graphics.newImage("Images/Vin.png")

  local r,g,b = love.graphics.getColor() 

  love.graphics.setColor(0,0,0)
  
  love.graphics.line(0, 70, 1112, 70)
  love.graphics.print("VILLES", 65, 79)
  love.graphics.line(0, 100, 1112, 100)
  love.graphics.setColor(r,g,b)
  local listeData = pListeData
  
   local nombreVilles = #listeData.Villes
   local decalage = 40

   local listeLvlHdv = {}
   local listeLvlResidence = {}
   local listeLvlMenuisier = {}
   local listeLvlBureau = {}
   local listeLvlCave = {}
   local listeLvlOpticien = {}
   local listeLvlArtificiers = {}
   local listeLvlCachette = {}
   local listeLvlVerrier = {}
   local listeLvlMaison = {}
   local listeLvlTaverne = {}
   local listeLvlAcademie = {}
   local listeLvlPort = {}
   local listeLvlMur = {}
   local listeLvlEntrepot = {}
   local listeLvlCaserne = {}
   local listeLvlMusee = {}
   local listeLvlChantier = {}
   local listeLvlComptoir = {}
   local listeLvlAtelier = {}
   local listeLvlDepot = {}
   
   for i = 1, nombreVilles do 
    
    local nombreBatiments = #listeData.Villes[i]._listeBatiments
    local r,g,b = love.graphics.getColor() 
  
    if i == 1 then 
      love.graphics.draw(imageVilleSouffre, 30, 70 + decalage)
    end
  
    if i == 2 or i == 5 or i == 6 then 
      love.graphics.draw(imageVilleMarbre, 30, 70 + decalage)
    end
  
    if i == 3 or i == 8 or i == 9 then 
      love.graphics.draw(imageVilleCristal, 30, 70 + decalage)
    end
  
    if i == 4 or i == 7 then 
      love.graphics.draw(imageVilleVin, 30, 70 + decalage)
    end

    love.graphics.setColor(1,0,0)
    love.graphics.print(listeData.Villes[i]._nom, 65, 79 + decalage)

   -- Orbre affichage batiments 
   -- hdv, menuisier, architecte, cave a vin , opticien, maison foret, taverne, académie, alchimiste, artificier, 
   -- atelier, cachette, caserne, pressoir a vin, chantier naval, comptoir, depot, entrepôt, mur, musée, port commercial, 
   -- RDV, tailleurPierre, Verrier
   
   local nombreEntrepot = {}
   nombreEntrepot.Level = {}
   nombreEntrepot.Nombre = 0
   
    -- Boucle qui traitement les données des batiments
    for j = 1, nombreBatiments do
      love.graphics.setColor(0,0,0)
      --print(listeData.Villes[i]._listeBatiments[j].name)
      --print(listeData.Villes[i]._listeBatiments[j].level)
      
      if listeData.Villes[i]._listeBatiments[j].name == 'Hôtel de ville' then

        --love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 180, 79 + decalage)
        local valeurHdvTempo = {}
        valeurHdvTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
        valeurHdvTempo.idVille = i
        table.insert(listeLvlHdv, valeurHdvTempo)
        
      elseif listeData.Villes[i]._listeBatiments[j].name == 'Résidence du gouverneur' or 
             listeData.Villes[i]._listeBatiments[j].name == 'Palais' 
      then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.residence.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 225, 65 + decalage)
        end
      
        local valeurRDGTempo = {}
        valeurRDGTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
        valeurRDGTempo.idVille = i 
        table.insert(listeLvlResidence, valeurRDGTempo)
       -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 230, 79 + decalage)
        love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Menuisier' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.menuisier.levelMax then
          
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 275, 65 + decalage)
        end
        
          local valeurMenuisierTempo = {}
          valeurMenuisierTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurMenuisierTempo.idVille = i
          table.insert(listeLvlMenuisier, valeurMenuisierTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 280, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Bureau de l`architecte' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.architecte.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 325, 65 + decalage)
        end
        
          local valeurBureauTempo = {}
          valeurBureauTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurBureauTempo.idVille = i
          table.insert(listeLvlBureau, valeurBureauTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 330, 79 + decalage)
          love.graphics.setColor(0,0,0)
      
      elseif listeData.Villes[i]._listeBatiments[j].name == 'Cave à vin' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.cave.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 375, 65 + decalage)
        end
        
          local valeurCaveTempo = {}
          valeurCaveTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurCaveTempo.idVille = i
          table.insert(listeLvlCave, valeurCaveTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 380, 79 + decalage) 
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Opticien' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.opticien.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7)  
          love.graphics.print("Max", 425, 65 + decalage)
        end
        
          local valeurOpticienTempo = {}
          valeurOpticienTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurOpticienTempo.idVille = i
          table.insert(listeLvlOpticien, valeurOpticienTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 430, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Zone de test des artificiers' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.artificier.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 475, 65 + decalage)
        end
        
          local valeurArtificierTempo = {}
          valeurArtificierTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurArtificierTempo.idVille = i
          table.insert(listeLvlArtificiers, valeurArtificierTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 480, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Cachette' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.cachette.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 525, 65 + decalage)
        end
        
          local valeurCachetteTempo = {}
          valeurCachetteTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurCachetteTempo.idVille = i
          table.insert(listeLvlCachette, valeurCachetteTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 530, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Tour des alchimistes' or 
      listeData.Villes[i]._listeBatiments[j].name == 'Pressoir à vin' or 
      listeData.Villes[i]._listeBatiments[j].name == 'Tailleur de pierres' or
      listeData.Villes[i]._listeBatiments[j].name == 'Verrier'
      then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.alchimiste.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 575, 65 + decalage)
        end
        
          local valeurVerrierTempo = {}
          valeurVerrierTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurVerrierTempo.idVille = i 
          table.insert(listeLvlVerrier, valeurVerrierTempo)
          --love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 580, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Maison forestière' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.forestiere.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7)  
          love.graphics.print("Max", 625, 65 + decalage)
        end
        
          local valeurMaisonTempo = {}
          valeurMaisonTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurMaisonTempo.idVille = i
          table.insert(listeLvlMaison, valeurMaisonTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 630, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Taverne' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.taverne.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7)  
          love.graphics.print("Max", 675, 65 + decalage)
        end
          local valeurTaverneTempo = {}
          valeurTaverneTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurTaverneTempo.idVille = i
          table.insert(listeLvlTaverne, valeurTaverneTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 680, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Académie' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.academie.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 725, 65 + decalage)
        end
        
          local valeurAcademieTempo = {}
          valeurAcademieTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurAcademieTempo.idVille = i 
          table.insert(listeLvlAcademie, valeurAcademieTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 730, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Port commercial' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.port.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 775, 65 + decalage)
        end
        
          local valeurPortTempo = {}
          valeurPortTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurPortTempo.idVille = i 
          table.insert(listeLvlPort, valeurPortTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 780, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'mur d`enceinte' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.mur.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 825, 65 + decalage)
        end
          
          local valeurMurTempo = {}
          valeurMurTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurMurTempo.idVille = i
          table.insert(listeLvlMur, valeurMurTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 830, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Entrepôt' then

        nombreEntrepot.Nombre = nombreEntrepot.Nombre + 1
       -- print(nombreEntrepot.Nombre)
        local pos = nombreEntrepot.Nombre
        nombreEntrepot.Level[pos] = listeData.Villes[i]._listeBatiments[j].level
        
      elseif listeData.Villes[i]._listeBatiments[j].name == 'Caserne' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.caserne.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7)  
          love.graphics.print("Max", 925, 65 + decalage)
        end
        
          local valeurCaserneTempo = {}
          valeurCaserneTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurCaserneTempo.idVille = i
          table.insert(listeLvlCaserne, valeurCaserneTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 930, 79 + decalage)
          love.graphics.setColor(0,0,0)

        elseif listeData.Villes[i]._listeBatiments[j].name == 'Musée' then

          if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.musee.levelMax then
            love.graphics.setColor(0, 0.5, 0, 0.7)  
            love.graphics.print("Max", 975, 65 + decalage)
          end
          
            local valeurMuseeTempo = {}
            valeurMuseeTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
            valeurMuseeTempo.idVille = i
            table.insert(listeLvlMusee, valeurMuseeTempo)
           -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 980, 79 + decalage)
            love.graphics.setColor(0,0,0)

        elseif listeData.Villes[i]._listeBatiments[j].name == 'Chantier naval' then
          if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.chantier.levelMax then
            love.graphics.setColor(0, 0.5, 0, 0.7) 
            love.graphics.print("Max", 1025, 65 + decalage)
          end
          
            local valeurChantierTempo = {}
            valeurChantierTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
            valeurChantierTempo.idVille = i
            table.insert(listeLvlChantier, valeurChantierTempo)
          --  love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 1030, 79 + decalage)
            love.graphics.setColor(0,0,0)
            
        elseif listeData.Villes[i]._listeBatiments[j].name == 'Dépôt' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.depot.levelMax then
          love.graphics.setColor(0, 0.5, 0, 0.7)  
          love.graphics.print("Max", 1075, 65 + decalage)
        end
        
          local valeurDepotTempo = {}
          valeurDepotTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
          valeurDepotTempo.idVille = i
          table.insert(listeLvlDepot, valeurDepotTempo)
         -- love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 1080, 79 + decalage)
          love.graphics.setColor(0,0,0)
       
      end

    end
    
    local levelEntrepot = 0
    for i = 1, nombreEntrepot.Nombre do

      levelEntrepot = levelEntrepot + tonumber(nombreEntrepot.Level[i])

    end
  
    local valeurEntreTempo = {}
    
    valeurEntreTempo.level = levelEntrepot
    valeurEntreTempo.idVille = i
   -- love.graphics.print(tostring(levelEntrepot), 875, 79 + decalage)
    
    table.insert(listeLvlEntrepot, valeurEntreTempo)

    -- Dessine la ligne après la ville
    love.graphics.setColor(0,0,0) -- noir
    love.graphics.line(0, decalage + 100, 1112, decalage + 100)
    love.graphics.setColor(r,g,b)
    decalage = decalage + 50

   end

   listeLvlHdv =          myTableauFunctions:OrdonnerListe(listeLvlHdv)
   listeLvlResidence =    myTableauFunctions:OrdonnerListe(listeLvlResidence)
   listeLvlMenuisier =    myTableauFunctions:OrdonnerListe(listeLvlMenuisier)
   listeLvlBureau =       myTableauFunctions:OrdonnerListe(listeLvlBureau)
   listeLvlCave =         myTableauFunctions:OrdonnerListe(listeLvlCave)
   listeLvlOpticien =     myTableauFunctions:OrdonnerListe(listeLvlOpticien)
   listeLvlArtificiers =  myTableauFunctions:OrdonnerListe(listeLvlArtificiers)
   listeLvlCachette =     myTableauFunctions:OrdonnerListe(listeLvlCachette)
   listeLvlVerrier =      myTableauFunctions:OrdonnerListe(listeLvlVerrier)
   listeLvlMaison =       myTableauFunctions:OrdonnerListe(listeLvlMaison)
   listeLvlTaverne =      myTableauFunctions:OrdonnerListe(listeLvlTaverne)
   listeLvlAcademie =     myTableauFunctions:OrdonnerListe(listeLvlAcademie)
   listeLvlPort =         myTableauFunctions:OrdonnerListe(listeLvlPort)
   listeLvlMur =          myTableauFunctions:OrdonnerListe(listeLvlMur)
   listeLvlEntrepot =     myTableauFunctions:OrdonnerListe(listeLvlEntrepot)
   listeLvlCaserne =      myTableauFunctions:OrdonnerListe(listeLvlCaserne)
   listeLvlMusee =        myTableauFunctions:OrdonnerListe(listeLvlMusee)
   listeLvlChantier =     myTableauFunctions:OrdonnerListe(listeLvlChantier)
   listeLvlDepot =        myTableauFunctions:OrdonnerListe(listeLvlDepot)
   
   local tabListe = {}
   local finalDataTableau ={}
   local parametesTableau = {}
   
   tabListe[1] = listeLvlHdv
   tabListe[2] = listeLvlResidence
   tabListe[3] = listeLvlMenuisier
   tabListe[4] = listeLvlBureau
   tabListe[5] = listeLvlCave
   tabListe[6] = listeLvlOpticien
   tabListe[7] = listeLvlArtificiers
   tabListe[8] = listeLvlCachette
   tabListe[9] = listeLvlVerrier
   tabListe[10] = listeLvlMaison
   tabListe[11] = listeLvlTaverne
   tabListe[12] = listeLvlAcademie
   tabListe[13] = listeLvlPort
   tabListe[14] = listeLvlMur
   tabListe[15] = listeLvlEntrepot
   tabListe[16] = listeLvlCaserne
   tabListe[17] = listeLvlMusee
   tabListe[18] = listeLvlChantier
   tabListe[19] = listeLvlDepot
   
   finalDataTableau = myTableauFunctions:fusionListe(tabListe)
   
   parametesTableau = myTableauFunctions:initVariable(180, 120, 19, nombreVilles, 100, 100)
   
   myTableau = myTableauFunctions:nouveauTableau(parametesTableau, finalDataTableau)
  
   myTableau:SearchValueMaxMinColoum()
   myTableau:draw()
   
  -- Dessine le Tableau
  love.graphics.setColor(0,0,0) -- noir
  love.graphics.line(165, 70, 165, decalage +50)
  love.graphics.line(212, 70, 212, decalage +50)
  love.graphics.line(262, 70, 262, decalage +50)
  love.graphics.line(312, 70, 312, decalage +50)
  love.graphics.line(362, 70, 362, decalage +50)
  love.graphics.line(412, 70, 412, decalage +50)
  love.graphics.line(462, 70, 462, decalage +50)
  love.graphics.line(512, 70, 512, decalage +50)
  love.graphics.line(562, 70, 562, decalage +50)
  love.graphics.line(612, 70, 612, decalage +50)
  love.graphics.line(662, 70, 662, decalage +50)
  love.graphics.line(712, 70, 712, decalage +50)
  love.graphics.line(762, 70, 762, decalage +50)
  love.graphics.line(812, 70, 812, decalage +50)
  love.graphics.line(862, 70, 862, decalage +50)
  love.graphics.line(912, 70, 912, decalage +50)
  love.graphics.line(962, 70, 962, decalage +50)
  love.graphics.line(1012, 70, 1012, decalage +50)
  love.graphics.line(1062, 70, 1062, decalage +50)
  love.graphics.line(1112, 70, 1112, decalage +50)

  love.graphics.setColor(r,g,b)

end

function vue:Iles(pListeData)

  local imageBois = FunctionPicture:Create("Bois", 173, 72,  "Images/Bois.png", 1,1)
  local imageVin = FunctionPicture:Create("Vin", 220, 70,  "Images/Vin.png",1,1)
  local imageMarbre = FunctionPicture:Create("Marbre", 250, 70,  "Images/Marbre.png",1,1)
  local imageCristal = FunctionPicture:Create("Cristal", 280, 70,  "Images/Cristal.png", 1,1)
  local imageSouffre = FunctionPicture:Create("Souffre", 310, 70,  "Images/Souffre.png",1,1)

  imageBois:Draw()
  imageVin:Draw()
  imageMarbre:Draw()
  imageCristal:Draw()
  imageSouffre:Draw()
  
  local listeLvlScierie = {}
  local listeLvlLuxe = {}

  local r,g,b = love.graphics.getColor() 

  local listeData = pListeData
  
   local nombreIles = #listeData.Iles
   local decalage = 40

   for i = 1, nombreIles do 

    local r,g,b = love.graphics.getColor() 
    love.graphics.setColor(1,0,0)

    local typeRessources = tonumber(listeData.Iles[i]._numeroResourceLuxe)
    love.graphics.print(listeData.Iles[i]._nom, 65, 79 + decalage)
    
    love.graphics.setColor(0,0,0)
    
    local valeurScierieTempo = {}
      valeurScierieTempo.level = tonumber(listeData.Iles[i]._lvlScierie)
      valeurScierieTempo.idVille = i
      table.insert(listeLvlScierie, valeurScierieTempo)
          
    local valeurLuxeTempo = {}
      valeurLuxeTempo.level = tonumber(listeData.Iles[i]._lvlResourceLuxe )
      valeurLuxeTempo.idVille = i 
      table.insert(listeLvlLuxe, valeurLuxeTempo)
    --love.graphics.print(listeData.Iles[i]._lvlScierie , 179, 79 + decalage)
    --love.graphics.print(listeData.Iles[i]._lvlResourceLuxe, 270, 79 + decalage)

    love.graphics.line(0, decalage + 100, 350, decalage + 100)
    love.graphics.setColor(r,g,b)
    love.graphics.draw(listeData.Iles[i]._ListeImages[typeRessources], 25, 70 + decalage)
    
    decalage = decalage + 50

   end

  love.graphics.setColor(0,0,0)

  love.graphics.line(0, 70, 350, 70)
  love.graphics.print("ILES", 65, 79)
  love.graphics.line(0, 100, 350, 100)

  -- Dessine le Tableau
  love.graphics.line(165, 70, 165, decalage + 50)
  love.graphics.line(212, 70, 212, decalage + 50)
  love.graphics.line(350, 70, 350, decalage + 50)
  love.graphics.line(0, decalage + 50, 350, decalage + 50)
  love.graphics.setColor(r,g,b)
  
  local tabListe = {}
  local finalDataTableau ={}
  local parametesTableau = {}
  
  tabListe[1] = listeLvlScierie
  tabListe[2] = listeLvlLuxe
  
  finalDataTableau = myTableauFunctions:fusionListe(tabListe)
   
   parametesTableau = myTableauFunctions:initVariable(180, 120, 2, nombreIles, 100, 100)
   
   myTableau = myTableauFunctions:nouveauTableau(parametesTableau, finalDataTableau)
  
   myTableau:SearchValueMaxMinColoum()
   myTableau:draw()

end

function vue:Cachette()

end

function vue:Plans()

end

function vue:IA()

end

return vue