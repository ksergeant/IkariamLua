local vue = {}
local FunctionPicture = require("picture")

-- Fonction qui separe les nombres permettant les groupements suivants millions, milliers, unités
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
  love.graphics.print("Appuyez sur le bouton Charger les données pour lancer le script. Il va se connecter au site et récupèrer les informations des villes et des îles", 10, 80)
  love.graphics.print("La vue Ressources va être chargée automatiquement. Pour naviguer entre les différentes vues, appuyez sur les boutons correspondants à celle-ci.", 10, 150)
  
  love.graphics.setColor(r,g,b)
end

-- ######## VUE RESSOURCES #########
function vue:Ressources(pListeData)

  local r,g,b = love.graphics.getColor() 
  love.graphics.setColor(0,0,0)

  love.graphics.line(0, 70, 980, 70)
  love.graphics.print("VILLES", 115, 78)
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
    love.graphics.print(listeData.Villes[i]._nom, 115, 79 + decalage)
    
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
    
    love.graphics.line(0, decalage + 110, 980, decalage + 110)

    love.graphics.setColor(r,g,b)
    decalage = decalage+ 50

   end

   love.graphics.setColor(0,0,0) -- noir
   love.graphics.print("TOTAL", 115, decalage + 73)
   --love.graphics.line(0, decalage + 50, 980, decalage + 50)
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

  --Formatage des nombres
   TotalBois = separateurNombre(TotalBois)
   TotalVin = separateurNombre(TotalVin)
   TotalMarbre = separateurNombre(TotalMarbre)
   TotalCristal = separateurNombre(TotalCristal)
   TotalSouffre = separateurNombre(TotalSouffre)

   love.graphics.print(TotalBois.milliers ..tostring(" ") ..tostring(TotalBois.unites), 300, decalage + 70)
   if (TotalVin.unites <100) then

    love.graphics.print(TotalVin.milliers ..tostring(" ") ..tostring("0") ..tostring(TotalVin.unites), 400, decalage + 70)

   else
    love.graphics.print(TotalVin.milliers ..tostring(" ") ..tostring(TotalVin.unites), 400, decalage + 70)
   end

   love.graphics.print(TotalMarbre.milliers ..tostring(" ") ..tostring(TotalMarbre.unites), 500, decalage + 70)
   love.graphics.print(TotalCristal.milliers ..tostring(" ") ..tostring(TotalCristal.unites), 600, decalage + 70)
   love.graphics.print(TotalSouffre.milliers ..tostring(" ") ..tostring(TotalSouffre.unites), 700, decalage + 70)

   love.graphics.setColor(r,g,b)

end

-- ######## VUE BATIMENTS #########
function vue:Batiments(pListeData)

  local r,g,b = love.graphics.getColor() 

  local imageHDV = FunctionPicture:Create("HDV", 170, 70,  "Images/vueBatiments/Original/HDV.png", 1,1)
  local imageMenuisier = FunctionPicture:Create("Menuisier", 220, 70,  "Images/vueBatiments/Original/Menuisier.png",1,1)
  local imageArchitecte = FunctionPicture:Create("Architecte", 270, 70,  "Images/vueBatiments/Original/Architecte.png",1,1)
  local imageCave = FunctionPicture:Create("Cave", 320, 70,  "Images/vueBatiments/Original/CaveAVin.png", 1,1)
  local imageOpticien = FunctionPicture:Create("Opticien", 370, 70,  "Images/vueBatiments/Original/Opticien.png",1,1)
  local imageForestiere = FunctionPicture:Create("Forestiere", 420, 70,  "Images/vueBatiments/Original/MaisonForestiere.png",1,1)
  local imageTaverne= FunctionPicture:Create("Taverne", 470, 70,  "Images/vueBatiments/Original/Taverne.png",1,1)
  local imageAcademie= FunctionPicture:Create("Academie", 520, 70,  "Images/vueBatiments/Original/Academie.png",1,1)
  local imageAlchimiste= FunctionPicture:Create("Alchimiste", 570, 70,  "Images/vueBatiments/Original/Alchimiste.png",1,1)
  local imageArtificier= FunctionPicture:Create("Artificier", 620, 70,  "Images/vueBatiments/Original/Artificier.png",1,1)
  local imageAtelier= FunctionPicture:Create("Atelier", 670, 70,  "Images/vueBatiments/Original/Atelier.png",1,1)
  local imageCachette= FunctionPicture:Create("Cachette", 720, 70,  "Images/vueBatiments/Original/Cachette.png",1,1)
  local imageCaserne= FunctionPicture:Create("Caserne", 770, 70,  "Images/vueBatiments/Original/Caserne.png",1,1)
  local imageCaveAVin= FunctionPicture:Create("CaveAVin", 820, 70,  "Images/vueBatiments/Original/CaveAVin.png",1,1)
  local imageChantier= FunctionPicture:Create("Chantier", 870, 70,  "Images/vueBatiments/Original/Chantier.png",1,1)
  local imageComptoir= FunctionPicture:Create("Comptoir", 920, 70,  "Images/vueBatiments/Original/Comptoir.png",1,1)
  local imageDepot= FunctionPicture:Create("Depot", 970, 70,  "Images/vueBatiments/Original/Depot.png",1,1)
  local imageEntrepot= FunctionPicture:Create("Entrepot", 1020, 70,  "Images/vueBatiments/Original/Entrepot.png",1,1)
  local imageMur= FunctionPicture:Create("Mur", 1070, 70,  "Images/vueBatiments/Original/Mur.png",1,1)
  local imageMusee= FunctionPicture:Create("Musee", 1120, 70,  "Images/vueBatiments/Original/Musee.png",1,1)
  local imagePort= FunctionPicture:Create("Port", 1170, 70,  "Images/vueBatiments/Original/Port.png",1,1)
  local imageResidence= FunctionPicture:Create("Residence", 1220, 70,  "Images/vueBatiments/Original/Residence.png",1,1)
  local imageTailleurDePierres= FunctionPicture:Create("TailleurDePierres", 1270, 70,  "Images/vueBatiments/Original/TailleurDePierres.png",1,1)
  local imageVerrier= FunctionPicture:Create("Verrier", 1320, 70,  "Images/vueBatiments/Original/Verrier.png",1,1)

  -- Affichage des images
  imageHDV:Draw()
  imageMenuisier:Draw()
  imageArchitecte:Draw()
  imageCave:Draw()
  imageOpticien:Draw()
  imageForestiere:Draw()
  imageTaverne:Draw()
  imageAcademie:Draw()
  imageAlchimiste:Draw()
  imageArtificier:Draw()
  imageAtelier:Draw()
  imageCachette:Draw()
  imageCaserne:Draw()
  imageCaveAVin:Draw()
  imageChantier:Draw()
  imageComptoir:Draw()
  imageDepot:Draw()
  imageEntrepot:Draw()
  imageMur:Draw()
  imageMusee:Draw()
  imagePort:Draw()
  imageResidence:Draw()
  imageTailleurDePierres:Draw()
  imageVerrier:Draw()

  love.graphics.setColor(0,0,0)

  love.graphics.line(0, 70, 1440, 70)
  love.graphics.print("VILLES", 85, 79)
  love.graphics.line(0, 100, 1440, 100)

  -- Dessine le Tableau
  love.graphics.line(165, 70, 165, 800)
  love.graphics.line(212, 70, 212, 800)
 
  love.graphics.setColor(r,g,b)

  local listeData = pListeData
  
   local nombreVilles = #listeData.Villes
   local decalage = 40

   for i = 1, nombreVilles do 

    local nombreBatiments = #listeData.Villes[i]._listeBatiments
    local r,g,b = love.graphics.getColor() 
    love.graphics.setColor(1,0,0)
    love.graphics.print(listeData.Villes[i]._nom, 85, 79 + decalage)

    print(listeData.Villes[i]._nom)
    for j = 1, nombreBatiments do
      print(listeData.Villes[i]._listeBatiments[j].name)
      print(listeData.Villes[i]._listeBatiments[j].level)
    end

    love.graphics.setColor(r,g,b)
    decalage = decalage+ 50

   end

end

function vue:Iles()

end

function vue:Cachette()

end

function vue:Plans()

end

function vue:IA()

end

return vue