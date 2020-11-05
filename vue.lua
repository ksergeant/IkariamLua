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
  
  -- 167 le decalage image
  -- 50 le decalge entrepot

  local imageBois = FunctionPicture:Create("Bois", 330, 70,  "Images/Bois.png", 1,1)
  --local imageEntrepotBois = FunctionPicture:Create("Entrepot", 363, 70,  "Images/Entrepot.png",1,1)
  
  local imageVin = FunctionPicture:Create("Vin", 475, 70,  "Images/Vin.png",1,1)
 -- local imageEntrepotVin = FunctionPicture:Create("Entrepot", 525, 70,  "Images/Entrepot.png",1,1)
  
  local imageMarbre = FunctionPicture:Create("Marbre", 620, 70,  "Images/Marbre.png",1,1)
  --local imageEntrepotMarbre = FunctionPicture:Create("Entrepot", 692, 70,  "Images/Entrepot.png",1,1)
  
  local imageCristal = FunctionPicture:Create("Cristal", 765, 70,  "Images/Cristal.png", 1,1)
  --local imageEntrepotCristal = FunctionPicture:Create("Entrepot", 859, 70,  "Images/Entrepot.png",1,1)
  
  local imageSouffre = FunctionPicture:Create("Souffre", 910, 70,  "Images/Souffre.png",1,1)
 -- local imageEntrepotSouffre = FunctionPicture:Create("Entrepot", 1026, 70,  "Images/Entrepot.png",1,1)
  
  local imageUpdate = FunctionPicture:Create("Update", 1055, 72,  "Images/Update.png",1,1)
  
  
  local listeData = pListeData

  local imageVilleSouffre = love.graphics.newImage("Images/Souffre.png")
  local imageVilleMarbre = love.graphics.newImage("Images/Marbre.png")
  local imageVilleCristal = love.graphics.newImage("Images/Cristal.png")
  local imageVilleVin = love.graphics.newImage("Images/Vin.png")

  imageBois:Draw()
  --imageEntrepotBois:Draw()
  
  imageVin:Draw()
  --imageEntrepotVin:Draw()
  
  imageMarbre:Draw()
  --imageEntrepotMarbre:Draw()
  
  imageCristal:Draw()
  --imageEntrepotCristal:Draw()
  
  imageSouffre:Draw()
  --imageEntrepotSouffre:Draw()
  
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

    if i == 3 or i == 8 or i == 9 or i == 10 then 
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
    ManqueBois = maxRessource - tonumber(listeData.Villes[i]._nbBois)
    --ManqueBois = separateurNombre(ManqueBois)
    
    pourcentageVin = math.floor((tonumber(listeData.Villes[i]._nbVin) / maxRessource)*100)
    ManqueVin= maxRessource - tonumber(listeData.Villes[i]._nbVin)
   -- ManqueVin= separateurNombre(ManqueVin)
    
    pourcentageMarbre = math.floor((tonumber(listeData.Villes[i]._nbMarbre) / maxRessource)*100)
    ManqueMarbre= maxRessource - tonumber(listeData.Villes[i]._nbMarbre)
    --ManqueMarbre = separateurNombre(ManqueMarbre)
    
    pourcentageCristal = math.floor((tonumber(listeData.Villes[i]._nbCristal) / maxRessource)*100)
    ManqueCristal= maxRessource - tonumber(listeData.Villes[i]._nbCristal)
   -- ManqueCristal = separateurNombre(ManqueCristal)
    
    pourcentageSouffre = math.floor((tonumber(listeData.Villes[i]._nbSouffre) / maxRessource)*100)
    ManqueSouffre= maxRessource - tonumber(listeData.Villes[i]._nbSouffre)
    --ManqueSouffre = separateurNombre(ManqueSouffre)
    
    --print("affiche luxe id : "..listeData.Villes[i]._luxeId)
    
    local luxeId = tonumber(listeData.Villes[i]._luxeId)
    if luxeId == 1 then -- Ville vin
      
      local r,g,b = love.graphics.getColor() 
      local productionVin = math.floor(listeData.Villes[i]._productionLuxe * 3600) - listeData.Villes[i]._consoVin
      
      love.graphics.setColor(0, 0.5, 0) -- vert
      love.graphics.print("+ "..tostring(productionVin).."/h", 490, 60 + decalage)
      love.graphics.setColor(r,g,b)
      
      TotalVinProduction = TotalVinProduction + productionVin
      
    elseif luxeId == 2 then -- Ville marbre
      
      local r,g,b = love.graphics.getColor() 
      local productionMarbre = math.floor(listeData.Villes[i]._productionLuxe * 3600)
      
      love.graphics.setColor(0, 0.5, 0) -- vert
      love.graphics.print("+ "..tostring(productionMarbre).."/h", 635, 60 + decalage)
      TotalMarbreProduction = TotalMarbreProduction + productionMarbre
      
      local consoVin = listeData.Villes[i]._consoVin
      
      TotalVinConso = TotalVinConso + consoVin
      love.graphics.setColor(1,0,0) -- rouge
      love.graphics.print("- "..tostring(consoVin).."/h", 490, 60 + decalage)
      love.graphics.setColor(r,g,b)
    
    elseif luxeId == 3 then -- Ville Cristal
      
      local r,g,b = love.graphics.getColor() 
      local productionCristal = math.floor(listeData.Villes[i]._productionLuxe * 3600)
      
      love.graphics.setColor(0, 0.5, 0) -- vert
      love.graphics.print("+ "..tostring(productionCristal).."/h", 780, 60 + decalage)
      TotalCristalProduction = TotalCristalProduction + productionCristal
      
      local consoVin = listeData.Villes[i]._consoVin
      TotalVinConso = TotalVinConso + consoVin
      
      love.graphics.setColor(1,0,0) -- rouge
      love.graphics.print("- "..tostring(consoVin).."/h", 490, 60 + decalage)
      love.graphics.setColor(r,g,b)
      
    elseif luxeId == 4 then-- Ville souffre
      
      local r,g,b = love.graphics.getColor() 
      local productionSouffre = math.floor(listeData.Villes[i]._productionLuxe * 3600)
      
      love.graphics.setColor(0, 0.5, 0) -- vert
      love.graphics.print("+ "..tostring(productionSouffre).."/h", 925, 60 + decalage)
      TotalSouffreProduction = TotalSouffreProduction + productionSouffre
      
      local consoVin = listeData.Villes[i]._consoVin
      TotalVinConso = TotalVinConso + consoVin
      
      love.graphics.setColor(1,0,0) -- rouge
      love.graphics.print("- "..tostring(consoVin).."/h", 490, 60 + decalage)
      love.graphics.setColor(r,g,b)
      
    end
  
  -- Affichage des données de production des villes 
  local r2,g2,b2 = love.graphics.getColor() 
  local productionBois = math.floor(listeData.Villes[i]._productionBois * 3600)
  love.graphics.setColor(0, 0.5, 0) -- vert
  love.graphics.print("+ "..tostring(productionBois).."/h", 345, 60 + decalage)
 
  
  TotalBoisProduction = TotalBoisProduction + productionBois
  
  
  -- Affichage du manque de ressources
  love.graphics.setColor(0.2,0.1,1) -- bleu
  
  --[[
   if (ManqueBois.unites < 100) then
      love.graphics.print("-"..tostring(ManqueBois.milliers) ..tostring(" ") ..tostring("0") ..tostring(ManqueBois.unites), 342, 96 + decalage)
      
  else
      love.graphics.print("-"..tostring(ManqueBois.milliers) ..tostring(" ") ..tostring(ManqueBois.unites), 342, 96 + decalage)
  end
    ]]-- 
    
   --[[
  if (ManqueVin.unites < 100) then
    love.graphics.print("-"..tostring(ManqueVin.milliers) ..tostring(" ") ..tostring("0") ..tostring(ManqueVin.unites), 487, 96 + decalage)
  else
    love.graphics.print("-"..tostring(ManqueVin.milliers) ..tostring(" ") ..tostring(ManqueVin.unites), 487, 96 + decalage)
  end
  ]]-- 
  
  love.graphics.print("-"..tostring(ManqueBois), 342, 96 + decalage)
  love.graphics.print("-"..tostring(ManqueVin), 487, 96 + decalage)
  love.graphics.print("-"..tostring(ManqueMarbre), 632, 96 + decalage)
  love.graphics.print("-"..tostring(ManqueCristal), 777, 96 + decalage)
  love.graphics.print("-"..tostring(ManqueSouffre), 922, 96 + decalage)
 
  love.graphics.setColor(r2,g2,b2)
  
  -- Affichage des ressouces disponibles
  -- 120 de decalage entre chaque ressource
  
    if (nbrBois.unites < 100) then
      love.graphics.print(nbrBois.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrBois.unites), 345, 79 + decalage)
      
    else
      love.graphics.print(nbrBois.milliers ..tostring(" ") ..tostring(nbrBois.unites), 345, 79 + decalage)
    end
    
    if (nbrVin.unites < 100) then
      love.graphics.print(nbrVin.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrVin.unites), 490, 79 + decalage)
      
    else
      love.graphics.print(nbrVin.milliers ..tostring(" ") ..tostring(nbrVin.unites), 490, 79 + decalage)
    end
    
    if (nbrMarbre.unites < 100) then
      love.graphics.print(nbrMarbre.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrMarbre.unites), 635, 79 + decalage)
      
    else
      love.graphics.print(nbrMarbre.milliers ..tostring(" ") ..tostring(nbrMarbre.unites), 635, 79 + decalage)
    end
    
    if (nbrCristal.unites < 100 ) then
      love.graphics.print(nbrCristal.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrCristal.unites), 780, 79 + decalage)
      
    else
      if (nbrCristal.milliers < 1) then
      love.graphics.print(tostring(nbrCristal.unites), 780, 79 + decalage)
      
      else
      love.graphics.print(nbrCristal.milliers ..tostring(" ") ..tostring(nbrCristal.unites), 780, 79 + decalage)
      end
    end
    
    if (nbrSouffre.unites < 100) then
      love.graphics.print(nbrSouffre.milliers ..tostring(" ") ..tostring("0") ..tostring(nbrSouffre.unites), 925, 79 + decalage)
      
    else
      love.graphics.print(nbrSouffre.milliers ..tostring(" ") ..tostring(nbrSouffre.unites), 925, 79 + decalage)
    end
    
    --love.graphics.print(listeData.Villes[i]._nbVin, 400, 79 + decalage)
    --love.graphics.print(listeData.Villes[i]._nbMarbre, 500, 79 + decalage)
    --love.graphics.print(listeData.Villes[i]._nbCristal, 600, 79 + decalage)
    --love.graphics.print(listeData.Villes[i]._nbSouffre, 700, 79 + decalage)

    if (listeData.Villes[i]._update > 0) then
      local ts = os.time()
      ts = listeData.Villes[i]._update - ts - 3600
      
      if (ts > 0) then
        love.graphics.print(os.date('%H:%M:%S', ts), 1045, 79 + decalage)
      else
        love.graphics.print("Aucune", 1045, 79 + decalage)
      end

    else 
      love.graphics.print("Aucune", 1045, 79 + decalage)
    end

    TotalBois = TotalBois + listeData.Villes[i]._nbBois
    TotalVin = TotalVin + listeData.Villes[i]._nbVin
    TotalMarbre = TotalMarbre + listeData.Villes[i]._nbMarbre
    TotalCristal = TotalCristal + listeData.Villes[i]._nbCristal
    TotalSouffre = TotalSouffre + listeData.Villes[i]._nbSouffre
    
    love.graphics.line(0, decalage + 110, 1165, decalage + 110)

    love.graphics.setColor(r,g,b)
    
   
   -- GESTION JAUGE 
   
    local imageJaugeVideBasBois = love.graphics.newImage("adventure_pack/PNG/barBack_verticalBottom.png")
    local imageJaugeVideMidBois = love.graphics.newImage("adventure_pack/PNG/barBack_verticalMid.png")
    local imageJaugeVideTopBois = love.graphics.newImage("adventure_pack/PNG/barBack_verticalTop.png")
    
    local imageJaugeVideBasVin = love.graphics.newImage("adventure_pack/PNG/barBack_verticalBottom.png")
    local imageJaugeVideMidVin = love.graphics.newImage("adventure_pack/PNG/barBack_verticalMid.png")
    local imageJaugeVideTopVin = love.graphics.newImage("adventure_pack/PNG/barBack_verticalTop.png")
    
    local imageJaugeVideBasMarbre = love.graphics.newImage("adventure_pack/PNG/barBack_verticalBottom.png")
    local imageJaugeVideMidMarbre = love.graphics.newImage("adventure_pack/PNG/barBack_verticalMid.png")
    local imageJaugeVideTopMarbre = love.graphics.newImage("adventure_pack/PNG/barBack_verticalTop.png")
    
    local imageJaugeVideBasCristal = love.graphics.newImage("adventure_pack/PNG/barBack_verticalBottom.png")
    local imageJaugeVideMidCristal = love.graphics.newImage("adventure_pack/PNG/barBack_verticalMid.png")
    local imageJaugeVideTopCristal = love.graphics.newImage("adventure_pack/PNG/barBack_verticalTop.png")
    
    local imageJaugeVideBasSouffre = love.graphics.newImage("adventure_pack/PNG/barBack_verticalBottom.png")
    local imageJaugeVideMidSouffre = love.graphics.newImage("adventure_pack/PNG/barBack_verticalMid.png")
    local imageJaugeVideTopSouffre = love.graphics.newImage("adventure_pack/PNG/barBack_verticalTop.png")
  
    love.graphics.draw(imageJaugeVideTopBois, 300, 61 + decalage, 0)
    love.graphics.draw(imageJaugeVideMidBois, 300, 70 + decalage, 0, 1, 1.639, 0)
    love.graphics.draw(imageJaugeVideBasBois, 300, 100 + decalage,0)
    
    love.graphics.draw(imageJaugeVideTopVin, 445, 61 + decalage, 0)
    love.graphics.draw(imageJaugeVideMidVin, 445, 70 + decalage, 0, 1, 1.639, 0)
    love.graphics.draw(imageJaugeVideBasVin, 445, 100 + decalage,0)
    
    love.graphics.draw(imageJaugeVideTopMarbre, 590, 61 + decalage, 0)
    love.graphics.draw(imageJaugeVideMidMarbre, 590, 70 + decalage, 0, 1, 1.639, 0)
    love.graphics.draw(imageJaugeVideBasMarbre, 590, 100 + decalage,0)
    
    love.graphics.draw(imageJaugeVideTopCristal, 735, 61 + decalage, 0)
    love.graphics.draw(imageJaugeVideMidCristal, 735, 70 + decalage, 0, 1, 1.639, 0)
    love.graphics.draw(imageJaugeVideBasCristal, 735, 100 + decalage,0)
    
    love.graphics.draw(imageJaugeVideTopSouffre, 880, 61 + decalage, 0)
    love.graphics.draw(imageJaugeVideMidSouffre, 880, 70 + decalage, 0, 1, 1.639, 0)
    love.graphics.draw(imageJaugeVideBasSouffre, 880, 100 + decalage,0)
    
    
   local pourcentageJaugeBois = tonumber(pourcentageBois)
   local pourcentageJaugeVin = tonumber(pourcentageVin)
   local pourcentageJaugeMarbre = tonumber(pourcentageMarbre)
   local pourcentageJaugeCristal = tonumber(pourcentageCristal)
   local pourcentageJaugeSouffre = tonumber(pourcentageSouffre)
   
   --local pourcentageTest = 100
   local pourcentageBoisQuad = pourcentageJaugeBois * 0.36
   local pourcentageVinQuad = pourcentageJaugeVin * 0.36
   local pourcentageMarbreQuad = pourcentageJaugeMarbre * 0.36
   local pourcentageCristalQuad = pourcentageJaugeCristal * 0.36
   local pourcentageSouffreQuad = pourcentageJaugeSouffre * 0.36
   
   local posXDepartBoisQuad = 0
   local posYDepartBoisQuad = 36 - pourcentageBoisQuad -- Max 36
   
   local posXDepartVinQuad = 0
   local posYDepartVinQuad = 36 - pourcentageVinQuad
   
   local posXDepartMarbreQuad = 0
   local posYDepartMarbreQuad = 36 - pourcentageMarbreQuad
   
   local posXDepartCristalQuad = 0
   local posYDepartCristalQuad = 36 - pourcentageCristalQuad
   
   local posXDepartSouffreQuad = 0
   local posYDepartSouffreQuad = 36 - pourcentageSouffreQuad
  
   local largeurBoisQuad = 18
   local hauteurBoisQuad = pourcentageBoisQuad -- Max 36
   
   local largeurVinQuad = 18
   local hauteurVinQuad = pourcentageVinQuad -- Max 36
   
   local largeurMarbreQuad = 18
   local hauteurMarbreQuad = pourcentageMarbreQuad -- Max 36
   
   local largeurCristalQuad = 18
   local hauteurCristalQuad = pourcentageCristalQuad -- Max 36
   
   local largeurSouffreQuad = 18
   local hauteurSouffreQuad = pourcentageSouffreQuad -- Max 36
   
  if(pourcentageJaugeBois >= 50) then 
       imageJaugeFullBois = love.graphics.newImage("adventure_pack/modif/FullJaugeVert.png")
  elseif(pourcentageJaugeBois >= 20) then
       imageJaugeFullBois = love.graphics.newImage("adventure_pack/modif/FullJaugeJaune.png")
  else
       imageJaugeFullBois = love.graphics.newImage("adventure_pack/modif/FullJaugeRouge.png")
  end
  
  if(pourcentageJaugeVin >= 50) then 
       imageJaugeFullVin = love.graphics.newImage("adventure_pack/modif/FullJaugeVert.png")
  elseif(pourcentageJaugeVin >= 20) then
       imageJaugeFullVin = love.graphics.newImage("adventure_pack/modif/FullJaugeJaune.png")
  else
       imageJaugeFullVin = love.graphics.newImage("adventure_pack/modif/FullJaugeRouge.png")
  end
  
  if(pourcentageJaugeMarbre >= 50) then 
       imageJaugeFullMarbre = love.graphics.newImage("adventure_pack/modif/FullJaugeVert.png")
  elseif(pourcentageJaugeMarbre >= 20) then
       imageJaugeFullMarbre = love.graphics.newImage("adventure_pack/modif/FullJaugeJaune.png")
  else
       imageJaugeFullMarbre = love.graphics.newImage("adventure_pack/modif/FullJaugeRouge.png")
  end
   
   if(pourcentageJaugeCristal >= 50) then 
       imageJaugeFullCristal = love.graphics.newImage("adventure_pack/modif/FullJaugeVert.png")
  elseif(pourcentageJaugeCristal >= 20) then
       imageJaugeFullCristal = love.graphics.newImage("adventure_pack/modif/FullJaugeJaune.png")
  else
       imageJaugeFullCristal = love.graphics.newImage("adventure_pack/modif/FullJaugeRouge.png")
  end
   
   if(pourcentageJaugeSouffre >= 50) then 
       imageJaugeFullSouffre = love.graphics.newImage("adventure_pack/modif/FullJaugeVert.png")
  elseif(pourcentageJaugeSouffre >= 20) then
       imageJaugeFullSouffre = love.graphics.newImage("adventure_pack/modif/FullJaugeJaune.png")
  else
       imageJaugeFullSouffre = love.graphics.newImage("adventure_pack/modif/FullJaugeRouge.png")
  end
   
   local quadBoisJauge = love.graphics.newQuad(posXDepartBoisQuad, posYDepartBoisQuad, largeurBoisQuad, hauteurBoisQuad, imageJaugeFullBois:getDimensions())
   local quadVinJauge = love.graphics.newQuad(posXDepartVinQuad, posYDepartVinQuad, largeurVinQuad, hauteurVinQuad, imageJaugeFullVin:getDimensions())
   local quadMarbreJauge = love.graphics.newQuad(posXDepartMarbreQuad, posYDepartMarbreQuad, largeurMarbreQuad, hauteurMarbreQuad, imageJaugeFullMarbre:getDimensions())
   local quadCristalJauge = love.graphics.newQuad(posXDepartCristalQuad, posYDepartCristalQuad, largeurCristalQuad, hauteurCristalQuad, imageJaugeFullCristal:getDimensions())
   local quadSouffreJauge = love.graphics.newQuad(posXDepartSouffreQuad, posYDepartSouffreQuad, largeurSouffreQuad, hauteurSouffreQuad, imageJaugeFullSouffre:getDimensions())
   
   
   function calculPosJauge(pPourcentageJauge)
   
    local poourcentageTempo = {}
    local posTempoJauge = {}
    poourcentageTempo = pPourcentageJauge
   
   if (poourcentageTempo == 1) then
      posTempoJauge = 48
   elseif(poourcentageTempo == 2)then
       posTempoJauge = 48
   elseif(poourcentageTempo == 3)then
       posTempoJauge = 48
   elseif(poourcentageTempo == 4)then
       posTempoJauge = 48
   elseif(poourcentageTempo == 5)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 6)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 7)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 8)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 9)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 10)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 11)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 12)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 13)then
       posTempoJauge = 47
   elseif(poourcentageTempo == 14)then
       posTempoJauge = 46
   elseif(poourcentageTempo == 15)then
       posTempoJauge = 46
   elseif(poourcentageTempo == 16)then
       posTempoJauge = 46
   elseif(poourcentageTempo == 17)then
       posTempoJauge = 46
   elseif(poourcentageTempo == 18)then
       posTempoJauge = 46
   elseif(poourcentageTempo == 19)then
       posTempoJauge = 46
   elseif(poourcentageTempo == 20)then
       posTempoJauge = 46
   elseif(poourcentageTempo == 21)then
       posTempoJauge = 46
   elseif(poourcentageTempo == 22)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 23)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 24)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 25)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 26)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 27)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 28)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 29)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 30)then
       posTempoJauge = 45
   elseif(poourcentageTempo == 31)then
       posTempoJauge = 44
   elseif(poourcentageTempo == 32)then
       posTempoJauge = 44
   elseif(poourcentageTempo == 33)then
       posTempoJauge = 44
   elseif(poourcentageTempo == 34)then
       posTempoJauge = 44
        elseif(poourcentageTempo == 35)then
       posTempoJauge = 44
        elseif(poourcentageTempo == 36)then
       posTempoJauge = 44
        elseif(poourcentageTempo == 37)then
       posTempoJauge = 44
        elseif(poourcentageTempo == 38)then
       posTempoJauge = 44
        elseif(poourcentageTempo == 39)then
       posTempoJauge = 44
        elseif(poourcentageTempo == 40)then
       posTempoJauge = 43
        elseif(poourcentageTempo == 41)then
       posTempoJauge = 43
        elseif(poourcentageTempo == 42)then
       posTempoJauge = 43
        elseif(poourcentageTempo == 43)then
       posTempoJauge = 43
        elseif(poourcentageTempo == 44)then
       posTempoJauge = 43
        elseif(poourcentageTempo == 45)then
       posTempoJauge = 43
        elseif(poourcentageTempo == 46)then
       posTempoJauge = 43
        elseif(poourcentageTempo == 47)then
       posTempoJauge = 43
        elseif(poourcentageTempo == 48)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 49)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 50)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 51)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 52)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 53)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 54)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 55)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 56)then
       posTempoJauge = 42
        elseif(poourcentageTempo == 57)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 58)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 59)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 60)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 61)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 62)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 63)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 64)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 65)then
       posTempoJauge = 41
        elseif(poourcentageTempo == 66)then
       posTempoJauge = 40
        elseif(poourcentageTempo == 67)then
       posTempoJauge = 40
        elseif(poourcentageTempo == 68)then
       posTempoJauge = 40
        elseif(poourcentageTempo == 69)then
       posTempoJauge = 40
        elseif(poourcentageTempo == 70)then
       posTempoJauge = 40
        elseif(poourcentageTempo == 71)then
       posTempoJauge = 40
        elseif(poourcentageTempo == 72)then
       posTempoJauge = 40
        elseif(poourcentageTempo == 73)then
       posTempoJauge = 40
        elseif(poourcentageTempo == 74)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 75)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 76)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 77)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 78)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 79)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 80)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 81)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 82)then
       posTempoJauge = 39
        elseif(poourcentageTempo == 83)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 84)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 85)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 86)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 87)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 88)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 89)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 90)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 91)then
       posTempoJauge = 38
        elseif(poourcentageTempo == 92)then
       posTempoJauge = 37
        elseif(poourcentageTempo == 93)then
       posTempoJauge = 37
        elseif(poourcentageTempo == 94)then
       posTempoJauge = 37
        elseif(poourcentageTempo == 95)then
       posTempoJauge = 37
        elseif(poourcentageTempo == 96)then
       posTempoJauge = 37
        elseif(poourcentageTempo == 97)then
       posTempoJauge = 37
        elseif(poourcentageTempo == 98)then
       posTempoJauge = 37
        elseif(poourcentageTempo == 99)then
       posTempoJauge = 37
        elseif(poourcentageTempo == 100)then
       posTempoJauge = 36
       
     else 
       posTempoJauge = 36
   end
   
    return posTempoJauge
  end
  
   local posBoisJauge = calculPosJauge(pourcentageJaugeBois)
   local posVinJauge = calculPosJauge(pourcentageJaugeVin)
   local posMarbreJauge = calculPosJauge(pourcentageJaugeMarbre)
   local posCristalJauge = calculPosJauge(pourcentageJaugeCristal)
   local posSouffreJauge = calculPosJauge(pourcentageJaugeSouffre)
  
   local maxPosBoisJauge = posBoisJauge - pourcentageBoisQuad
   local maxPosVinJauge = posVinJauge - pourcentageVinQuad
   local maxPosMarbreJauge = posMarbreJauge - pourcentageMarbreQuad
   local maxPosCristalJauge = posCristalJauge - pourcentageCristalQuad
   local maxPosSouffreJauge = posSouffreJauge - pourcentageSouffreQuad
   
   love.graphics.draw(imageJaugeFullBois, quadBoisJauge, 300, 61 + decalage + maxPosBoisJauge, 0, 1, 1.32)
   love.graphics.draw(imageJaugeFullVin, quadVinJauge, 445, 61 + decalage + maxPosVinJauge, 0, 1, 1.32)
   love.graphics.draw(imageJaugeFullMarbre, quadMarbreJauge, 590, 61 + decalage + maxPosMarbreJauge, 0, 1, 1.32)
   love.graphics.draw(imageJaugeFullCristal, quadCristalJauge, 735, 61 + decalage + maxPosCristalJauge, 0, 1, 1.32)
   love.graphics.draw(imageJaugeFullSouffre, quadSouffreJauge, 880, 61 + decalage + maxPosSouffreJauge, 0, 1, 1.32)
   
   love.graphics.setColor(0,0,0) -- noir
   
   love.graphics.print(pourcentageBois ..tostring("%"), 300, 78 + decalage)
   love.graphics.print(pourcentageVin ..tostring("%"), 445, 78 + decalage)
   love.graphics.print(pourcentageMarbre ..tostring("%"), 590, 78 + decalage)
   love.graphics.print(pourcentageCristal ..tostring("%"), 735, 78 + decalage)
   love.graphics.print(pourcentageSouffre ..tostring("%"), 880, 78 + decalage)
    
   love.graphics.setColor(r,g,b)
    
   decalage = decalage + 50

   end

   love.graphics.setColor(0,0,0) -- noir
   love.graphics.print("TOTAL", 115, decalage + 73)
   --love.graphics.line(0, decalage + 50, 980, decalage + 50)
   love.graphics.line(0, decalage + 100, 1165, decalage + 100)

    -- Dessine le Tableau
  love.graphics.line(280, 70, 280, decalage + 100)
  love.graphics.line(420, 70, 420, decalage + 100)
  love.graphics.line(565, 70, 565, decalage + 100)
  love.graphics.line(710, 70, 710, decalage + 100)
  love.graphics.line(855, 70, 855, decalage + 100)
  love.graphics.line(1015, 70, 1015, decalage + 100)
  love.graphics.line(1165, 70, 1165, decalage + 100)
 
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
  love.graphics.print("+ "..tostring(TotalBoisProduction).. "/h", 310, decalage + 63)
  love.graphics.print("+ "..tostring(TotalMarbreProduction).. "/h", 600, decalage + 60)
  love.graphics.print("+ "..tostring(TotalCristalProduction).. "/h", 745, decalage + 60)
  love.graphics.print("+ "..tostring(TotalSouffreProduction).. "/h", 890, decalage + 60)
  
  local ValeurFinalProductionVin = TotalVinProduction - TotalVinConso
  
  --print(TotalVinProduction)
  --print(TotalVinConso)
  --print(ValeurFinalProductionVin)
  
  if ValeurFinalProductionVin > 0 then
    love.graphics.print("+ "..tostring(ValeurFinalProductionVin).. "/h", 455, decalage + 60)
  else
    love.graphics.setColor(1,0,0)  -- rouge
    love.graphics.print(""..tostring(ValeurFinalProductionVin).. "/h", 455, decalage + 60)
  end
  
  
  love.graphics.setColor(r3,g3,b3)
  
  if TotalBois.unites <100 then
    love.graphics.print(tostring(TotalBois.millions) ..tostring(" ") ..tostring(TotalBois.milliers) ..tostring(" ") ..tostring("0") ..tostring(TotalBois.unites) , 310, decalage + 83)
  else
    love.graphics.print(tostring(TotalBois.millions) ..tostring(" ") ..tostring(TotalBois.milliers) ..tostring(" ") ..tostring(TotalBois.unites) , 310, decalage + 83)
  end
  
  if TotalVin.unites < 100 then
    love.graphics.print(tostring(TotalVin.millions) ..tostring(" ") ..tostring(TotalVin.milliers) ..tostring(" ") ..tostring(TotalVin.unites) , 455, decalage + 79)
  elseif TotalVin.milliers < 100 then
     love.graphics.print(tostring(TotalVin.millions) ..tostring(" ") ..tostring("0") ..tostring(TotalVin.milliers) ..tostring(" ") ..tostring(TotalVin.unites) , 455, decalage + 79)
  else
    love.graphics.print(tostring(TotalVin.millions) ..tostring(" ") ..tostring(TotalVin.milliers) ..tostring(" ") ..tostring(TotalVin.unites) , 455, decalage + 79)
  end
  --[[
   if (TotalVin.unites <100) then
    love.graphics.print(TotalVin.milliers ..tostring(" ") ..tostring("0") ..tostring(TotalVin.unites), 400, decalage + 70)
   else
    love.graphics.print(TotalVin.milliers ..tostring(" ") ..tostring(TotalVin.unites), 400, decalage + 70)
   end
   ]]--
   
   if (TotalMarbre.unites < 100) then
    love.graphics.print(tostring(TotalMarbre.millions) ..tostring(" ") ..tostring(TotalMarbre.milliers) ..tostring(" ") ..tostring("0") ..tostring(TotalMarbre.unites), 600, decalage + 79)
  elseif TotalMarbre.milliers < 100 then
    love.graphics.print(tostring(TotalMarbre.millions) ..tostring(" ") ..tostring("0") ..tostring(TotalMarbre.milliers) ..tostring(" ") ..tostring(TotalMarbre.unites), 600, decalage + 79)
   else
   love.graphics.print(tostring(TotalMarbre.millions) ..tostring(" ") ..tostring(TotalMarbre.milliers) ..tostring(" ") ..tostring(TotalMarbre.unites), 600, decalage + 79)
  end
  
  
  if (TotalCristal.unites < 100) then
    love.graphics.print(tostring(TotalCristal.millions) ..tostring(" ") ..tostring(TotalCristal.milliers) ..tostring(" ") ..tostring("0") ..tostring(TotalCristal.unites), 745, decalage + 79)
  elseif TotalCristal.milliers < 100 then
    love.graphics.print(tostring(TotalCristal.millions) ..tostring(" ") ..tostring("0") ..tostring(TotalCristal.milliers) ..tostring(" ") ..tostring(TotalCristal.unites), 745, decalage + 79)
  else
    love.graphics.print(tostring(TotalCristal.millions) ..tostring(" ") ..tostring(TotalCristal.milliers) ..tostring(" ") ..tostring(TotalCristal.unites), 745, decalage + 79)
  end
  
  if (TotalSouffre.unites < 100) then
    love.graphics.print(tostring(TotalSouffre.millions) ..tostring(" ") ..tostring(TotalSouffre.milliers) ..tostring(" ") ..tostring("0") ..tostring(TotalSouffre.unites), 890, decalage + 79)
  elseif TotalSouffre.milliers < 100 then
     love.graphics.print(tostring(TotalSouffre.millions) ..tostring(" ") ..tostring("0") ..tostring(TotalSouffre.milliers) ..tostring(" ") ..tostring(TotalSouffre.unites), 890, decalage + 79)
  else
    love.graphics.print(tostring(TotalSouffre.millions) ..tostring(" ") ..tostring(TotalSouffre.milliers) ..tostring(" ") ..tostring(TotalSouffre.unites), 890, decalage + 79)
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
  local imageEntrepot= FunctionPicture:Create("Entrepot", 870, 70, "Images/Entrepot.png",1,1)
  local imageCaserne= FunctionPicture:Create("Caserne", 920, 70, "Images/Caserne.png",1,1)
  local imageMusee= FunctionPicture:Create("Musee", 970, 70, "Images/Musee.png",1,1)
  local imageChantier= FunctionPicture:Create("Chantier", 1020, 70, "Images/Chantier.png",1,1)
  --local imageComptoir= FunctionPicture:Create("Comptoir", 1070, 70,  "Images/Comptoir.png",1,1)
  --local imageAtelier= FunctionPicture:Create("Atelier", 1120, 70,  "Images/Atelier.png",1,1)
  local imageDepot= FunctionPicture:Create("Depot", 1070, 70, "Images/Depot.png", 1,1)
  
  local imageUpBatiment = FunctionPicture:Create("UpBatiment", 0, 0, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)

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
  
    if i == 3 or i == 8 or i == 9 or i == 10 then 
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

         if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentHDV = FunctionPicture:Create("UpBatiment", 180, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentHDV:Draw()
          
        end
        
        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressBatimentHDV = FunctionPicture:Create("InProgressBatiment", 180, 65 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressBatimentHDV:Draw()
        end
        
        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then

          love.graphics.setColor(0, 0.5, 0, 0.7) 
          love.graphics.print("Max", 180, 65 + decalage)
          
        end
        
        --love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 180, 79 + decalage)
        local valeurHdvTempo = {}
        valeurHdvTempo.level = tonumber(listeData.Villes[i]._listeBatiments[j].level)
        valeurHdvTempo.idVille = i
        table.insert(listeLvlHdv, valeurHdvTempo)
        
      elseif listeData.Villes[i]._listeBatiments[j].name == 'Résidence du gouverneur' or 
             listeData.Villes[i]._listeBatiments[j].name == 'Palais' 
      then

      if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
        imageUpBatimentPalais = FunctionPicture:Create("UpBatiment", 230, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
        imageUpBatimentPalais:Draw()
          
      end
      
      if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressPalais = FunctionPicture:Create("InProgressBatiment", 227, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressPalais:Draw()
        end

        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then

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
      
      if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
        imageUpBatimentMenusiner = FunctionPicture:Create("UpBatiment", 280, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
        imageUpBatimentMenusiner:Draw()
          
      end
      
      if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressMenusiner = FunctionPicture:Create("InProgressBatiment", 277, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressMenusiner:Draw()
        end
        
      if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
      
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
      
        if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentBureau = FunctionPicture:Create("UpBatiment", 330, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentBureau:Draw()
          
      end

        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressBureau = FunctionPicture:Create("InProgressBatiment", 327, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressBureau:Draw()
        end
        
        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then 
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

        if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentCave = FunctionPicture:Create("UpBatiment", 380, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentCave:Draw()
          
        end
        
        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressCave = FunctionPicture:Create("InProgressBatiment", 377, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressCave:Draw()
        end
        
         if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
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
      
      if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentOpti = FunctionPicture:Create("UpBatiment", 430, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentOpti:Draw()
          
      end


        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressOpti = FunctionPicture:Create("InProgressBatiment", 427, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressOpti:Draw()
        end
        
        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
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

          if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentZone = FunctionPicture:Create("UpBatiment", 480, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentZone:Draw()
          
        end
        
        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressBatimentZone = FunctionPicture:Create("InProgressBatiment", 477, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressBatimentZone:Draw()
        end
        
        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
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

          if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
            imageUpBatimentCachette = FunctionPicture:Create("UpBatiment", 530, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
            imageUpBatimentCachette:Draw()
          
        end
        
        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressCachette = FunctionPicture:Create("InProgressBatiment", 527, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressCachette:Draw()
        end

        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
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

        if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentVerrier = FunctionPicture:Create("UpBatiment", 580, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentVerrier:Draw()
          
        end
        
        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressVerrier = FunctionPicture:Create("InProgressBatiment", 577, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressVerrier:Draw()
        end

        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
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
      
      
      if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentForet = FunctionPicture:Create("UpBatiment", 630, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentForet:Draw()
          
      end
      
      if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressForet = FunctionPicture:Create("InProgressBatiment", 627, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressForet:Draw()
        end

        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
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
      
      if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
        imageUpBatimentTaverne = FunctionPicture:Create("UpBatiment", 680, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
        imageUpBatimentTaverne:Draw()
          
      end

        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressTaverne = FunctionPicture:Create("InProgressBatiment", 677, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressTaverne:Draw()
        end

        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
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
      
      if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentAcademie = FunctionPicture:Create("UpBatiment", 730, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentAcademie:Draw()
        
      end

        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressBatimentAcademie= FunctionPicture:Create("InProgressBatiment", 727, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressBatimentAcademie:Draw()
        end


        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then

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
      
      
      if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
        imageUpBatimentPort = FunctionPicture:Create("UpBatiment", 880, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
        imageUpBatimentPort:Draw()
          
      end

        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressPort = FunctionPicture:Create("InProgressBatiment", 877, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressPort:Draw()
        end

        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
  
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

        if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentMur = FunctionPicture:Create("UpBatiment", 830, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentMur:Draw()
          
        end

        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressBatimentMur = FunctionPicture:Create("InProgressBatiment", 827, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressBatimentMur:Draw()
        end

      if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then

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
        
        if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentCaserne = FunctionPicture:Create("UpBatiment", 930, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentCaserne:Draw()
          
        end
        
        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressCaserne = FunctionPicture:Create("InProgressBatiment", 927, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressCaserne:Draw()
        end

        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then
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
        
        if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentMusee = FunctionPicture:Create("UpBatiment", 980, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentMusee:Draw()
          
        end

        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressMusee = FunctionPicture:Create("InProgressBatiment", 977, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressMusee:Draw()
        end


          if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then

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
        
        if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentChantier = FunctionPicture:Create("UpBatiment", 1030, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentChantier:Draw()
          
        end
        
        if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressChantier = FunctionPicture:Create("InProgressBatiment", 1027, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressChantier:Draw()
        end

          if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then

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
          
          if listeData.Villes[i]._listeBatiments[j].canUpdate == true then
          
          imageUpBatimentDepot = FunctionPicture:Create("UpBatiment", 1080, 65 + decalage, "adventure_pack/PNG/iconCheck_blue.png", 1, 1)
          imageUpBatimentDepot:Draw()
          
          end

          if listeData.Villes[i]._listeBatiments[j].completed ~=nil then
          imageInProgressDepot = FunctionPicture:Create("InProgressBatiment", 1077, 60 + decalage, "adventure_pack/PNG/iconCircle_blue.png", 1, 1)
          imageInProgressDepot:Draw()
        end

        if listeData.Villes[i]._listeBatiments[j].isMaxLevel == true then

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