local vue = {}
local FunctionPicture = require("picture")
local wiki = require("wiki")
local myTableauFunctions = require("tableau")

function couleurMaxMin()

  local key, max = 1, t[1]
  for k, v in ipairs(t) do
    if t[k] > max then
      key, max = k, v
    end
  end

  print(key, max)

end

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
  love.graphics.print("", 10, 80)
  love.graphics.print("", 10, 150)
  
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

  local imageVilleSouffre = love.graphics.newImage("Images/Souffre.png")
  local imageVilleMarbre = love.graphics.newImage("Images/Marbre.png")
  local imageVilleCristal = love.graphics.newImage("Images/Cristal.png")
  local imageVilleVin = love.graphics.newImage("Images/Vin.png")

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

    if i == 1 then 
      love.graphics.draw(imageVilleSouffre, 80, 70 + decalage)
    end

    if i == 2 or i == 5 or i == 6 then 
      love.graphics.draw(imageVilleMarbre, 80, 70 + decalage)
    end

    if i == 3 or i == 8 then 
      love.graphics.draw(imageVilleCristal, 80, 70 + decalage)
    end

    if i == 4 or i == 7 then 
      love.graphics.draw(imageVilleVin, 80, 70 + decalage)
    end

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
  local imageComptoir= FunctionPicture:Create("Comptoir", 1070, 70,  "Images/Comptoir.png",1,1)
  local imageAtelier= FunctionPicture:Create("Atelier", 1120, 70,  "Images/Atelier.png",1,1)

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
  imageAtelier:Draw()
  imageCachette:Draw()
  imageCaserne:Draw()
  imageChantier:Draw()
  imageComptoir:Draw()
  imageEntrepot:Draw()
  imageMur:Draw()
  imageMusee:Draw()
  imagePort:Draw()
  imageResidence:Draw()
  --imageTailleurDePierres:Draw()
  imageVerrier:Draw()
  --imagePressoirAVin:Draw()

  local imageVilleSouffre = love.graphics.newImage("Images/Souffre.png")
  local imageVilleMarbre = love.graphics.newImage("Images/Marbre.png")
  local imageVilleCristal = love.graphics.newImage("Images/Cristal.png")
  local imageVilleVin = love.graphics.newImage("Images/Vin.png")

  local r,g,b = love.graphics.getColor() 

  love.graphics.setColor(0,0,0)
  
  love.graphics.line(0, 70, 1162, 70)
  love.graphics.print("VILLES", 65, 79)
  love.graphics.line(0, 100, 1162, 100)
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
   
   for i = 1, nombreVilles do 
    
    local nombreBatiments = #listeData.Villes[i]._listeBatiments
    local r,g,b = love.graphics.getColor() 
  
    if i == 1 then 
      love.graphics.draw(imageVilleSouffre, 30, 70 + decalage)
    end
  
    if i == 2 or i == 5 or i == 6 then 
      love.graphics.draw(imageVilleMarbre, 30, 70 + decalage)
    end
  
    if i == 3 or i == 8 then 
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

        love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 180, 79 + decalage)
        local lvlTempo = tonumber(listeData.Villes[i]._listeBatiments[j].level)
        table.insert(listeLvlHdv, lvlTempo)
        
      elseif listeData.Villes[i]._listeBatiments[j].name == 'Résidence du gouverneur' or 
             listeData.Villes[i]._listeBatiments[j].name == 'Palais' 
      then

      if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.residence.levelMax then
        love.graphics.setColor(0.9, 0.5, 0, 0.7) 
        love.graphics.print("Max", 225, 65 + decalage)
      end
        table.insert(listeLvlResidence,listeData.Villes[i]._listeBatiments[j].level)
        love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 230, 79 + decalage)
        love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Menuisier' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.menuisier.levelMax then
          
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 275, 65 + decalage)
        end
          table.insert(listeLvlMenuisier,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 280, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Bureau de l`architecte' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.architecte.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 325, 65 + decalage)
        end
          table.insert(listeLvlBureau,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 330, 79 + decalage)
          love.graphics.setColor(0,0,0)
      
      elseif listeData.Villes[i]._listeBatiments[j].name == 'Cave à vin' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.cave.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 375, 65 + decalage)
        end
          table.insert(listeLvlCave,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 380, 79 + decalage) 
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Opticien' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.opticien.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 425, 65 + decalage)
        end
          table.insert(listeLvlOpticien,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 430, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Zone de test des artificiers' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.artificier.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 475, 65 + decalage)
        end
          table.insert(listeLvlArtificiers,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 480, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Cachette' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.cachette.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 525, 65 + decalage)
        end
          table.insert(listeLvlCachette,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 530, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Tour des alchimistes' or 
      listeData.Villes[i]._listeBatiments[j].name == 'Pressoir à vin' or 
      listeData.Villes[i]._listeBatiments[j].name == 'Tailleur de pierres' or
      listeData.Villes[i]._listeBatiments[j].name == 'Verrier'
      then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.alchimiste.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 575, 65 + decalage)
        end
          table.insert(listeLvlVerrier,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 580, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Maison forestière' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.forestiere.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 625, 65 + decalage)
        end
        table.insert(listeLvlMaison,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 630, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Taverne' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.taverne.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 675, 65 + decalage)
        end
        table.insert(listeLvlTaverne,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 680, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Académie' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.academie.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 725, 65 + decalage)
        end
          table.insert(listeLvlAcademie,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 730, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Port commercial' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.port.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 775, 65 + decalage)
        end
          table.insert(listeLvlPort,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 780, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'mur d`enceinte' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.mur.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 825, 65 + decalage)
        end
          table.insert(listeLvlMur,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 830, 79 + decalage)
          love.graphics.setColor(0,0,0)

      elseif listeData.Villes[i]._listeBatiments[j].name == 'Entrepôt' then

        nombreEntrepot.Nombre = nombreEntrepot.Nombre + 1
       -- print(nombreEntrepot.Nombre)
        local pos = nombreEntrepot.Nombre
        nombreEntrepot.Level[pos] = listeData.Villes[i]._listeBatiments[j].level
        table.insert(listeLvlEntrepot,listeData.Villes[i]._listeBatiments[j].level)
      elseif listeData.Villes[i]._listeBatiments[j].name == 'Caserne' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.caserne.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 925, 65 + decalage)
        end
          table.insert(listeLvlCaserne,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 930, 79 + decalage)
          love.graphics.setColor(0,0,0)

        elseif listeData.Villes[i]._listeBatiments[j].name == 'Musée' then

          if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.musee.levelMax then
            love.graphics.setColor(0.9, 0.5, 0, 0.7) 
            love.graphics.print("Max", 975, 65 + decalage)
          end
            table.insert(listeLvlMusee,listeData.Villes[i]._listeBatiments[j].level)
            love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 980, 79 + decalage)
            love.graphics.setColor(0,0,0)

        elseif listeData.Villes[i]._listeBatiments[j].name == 'Chantier naval' then
          if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.chantier.levelMax then
            love.graphics.setColor(0.9, 0.5, 0, 0.7) 
            love.graphics.print("Max", 1025, 65 + decalage)
          end
            table.insert(listeLvlChantier,listeData.Villes[i]._listeBatiments[j].level)
            love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 1030, 79 + decalage)
            love.graphics.setColor(0,0,0)

        elseif listeData.Villes[i]._listeBatiments[j].name == 'Comptoir' then
          if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.comptoir.levelMax then
            love.graphics.setColor(0.9, 0.5, 0, 0.7) 
            love.graphics.print("Max", 1075, 65 + decalage)
          end
            table.insert(listeLvlComptoir,listeData.Villes[i]._listeBatiments[j].level)
            love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 1080, 79 + decalage)
            love.graphics.setColor(0,0,0)
      elseif listeData.Villes[i]._listeBatiments[j].name == 'Atelier' then

        if tonumber(listeData.Villes[i]._listeBatiments[j].level) == wiki.atelier.levelMax then
          love.graphics.setColor(0.9, 0.5, 0, 0.7) 
          love.graphics.print("Max", 1125, 65 + decalage)
        end
          table.insert(listeLvlAtelier,listeData.Villes[i]._listeBatiments[j].level)
          love.graphics.print(listeData.Villes[i]._listeBatiments[j].level, 1130, 79 + decalage)
          love.graphics.setColor(0,0,0)
       
      end


    end
    
  local levelEntrepot = 0
  for i = 1, nombreEntrepot.Nombre do

    levelEntrepot = levelEntrepot + tonumber(nombreEntrepot.Level[i])

  end


    love.graphics.print(tostring(levelEntrepot), 875, 79 + decalage)

    -- Dessine la ligne après la ville
    love.graphics.setColor(0,0,0) -- noir
    love.graphics.line(0, decalage + 100, 1162, decalage + 100)
    love.graphics.setColor(r,g,b)
    decalage = decalage+ 50

   end

   
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
  love.graphics.line(1162, 70, 1162, decalage +50)
  --love.graphics.line(1212, 70, 1212, decalage +50)
  --love.graphics.line(1262, 70, 1262, decalage +50)
  --love.graphics.line(1312, 70, 1312, decalage +50)
  --love.graphics.line(1362, 70, 1362, decalage +50)

  love.graphics.setColor(r,g,b)

  local dataTableau = {} 
  dataTableau = myTableauFunctions:initVariable(50, 50, 5, 5, 50, 50)
  local myTableau = myTableauFunctions:nouveauTableau(dataTableau)
  myTableau:afficheValeur()

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
    love.graphics.print(listeData.Iles[i]._lvlScierie , 179, 79 + decalage)
    love.graphics.print(listeData.Iles[i]._lvlResourceLuxe, 270, 79 + decalage)

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

end

function vue:Cachette()

end

function vue:Plans()

end

function vue:IA()

end

return vue