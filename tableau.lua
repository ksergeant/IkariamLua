local tableau = {}

function tableau:initVariable(pPointDepartX, pPointDepartY, pNbCol, pNbLig, pDecalX, pDecalY) 
  
  print ("Initialisation des données pour le tableau")
  local data = {}
  local pointDepart = {}
  local dimensions = {}
  local decalage = {}

  pointDepart.x = pPointDepartX
  pointDepart.y = pPointDepartY

  dimensions.nbrCol = pNbCol
  dimensions.nbrLig = pNbLig

  decalage.x = pDecalX
  decalage.y = pDecalY

  data[1] = pointDepart
  data[2] = dimensions
  data[3] = decalage

  return data
end

function tableau:nouveauTableau(pParaTableau, pDataTableau)
  

    print ("Création d'un tableau")

    local tableauTempo = {}
    tableauTempo.listeCases = {}
    
    local pointDepartTempo = {}
    tableauTempo.dimensions = {}
    local finColonne = {}
    local finLigne = {}
    local caseTempo = {}
    local pDecalage = {}
    local nbrCases = {}

    nbrCases = 1;
    pointDepartTempo = pParaTableau[1]
    tableauTempo.dimensions = pParaTableau[2]

    finColonne = pointDepartTempo.x + (pParaTableau[3].x * tableauTempo.dimensions.nbrCol)
    finLigne = pointDepartTempo.y + (pParaTableau[3].y * tableauTempo.dimensions.nbrLig)

    local decalageTempo = {}
    decalageTempo.y = 0
    -- Boucle nombre de Lignes
    for i = 1, tableauTempo.dimensions.nbrLig do

        decalageTempo.x = 0
        
     -- Boucle nombre de Colonnes
        for i = 1, tableauTempo.dimensions.nbrCol do

            -- Création d'une case avec ses diffèrents caractéristiques
            local caseTempo = {}
            caseTempo.value = pDataTableau[nbrCases]
            caseTempo.x = pointDepartTempo.x + decalageTempo.x /2
            caseTempo.y = pointDepartTempo.y + decalageTempo.y /2
            caseTempo.max = false
            caseTempo.min = false

            decalageTempo.x = decalageTempo.x + pParaTableau[3].x
            table.insert(tableauTempo.listeCases, caseTempo)
            nbrCases = nbrCases +1
        end
    
        decalageTempo.y = decalageTempo.y + pParaTableau[3].y
       -- print("fin boucle2")

    end

    function tableauTempo:afficheValeur()
        for i = 1, #self.listeCases do
        
           -- print("Case N°"..tostring(i))
          --  print("Value:"..tostring(self.listeCases[i].value))
          --  print("X:"..tostring(self.listeCases[i].x))
           -- print("Y:"..tostring(self.listeCases[i].y).."\n")
        
         end
    end

    function tableauTempo:draw()

        local r,g,b = love.graphics.getColor() 

        for i = 1, #self.listeCases do
        
            if self.listeCases[i].max == true then
                love.graphics.setColor(0, 0.5, 0)   -- vert           
            elseif self.listeCases[i].min == true then
                love.graphics.setColor(1,0,0)  -- rouge
            else              
                love.graphics.setColor(0,0,0) -- noir
            end

            love.graphics.print(self.listeCases[i].value, self.listeCases[i].x, self.listeCases[i].y)
            love.graphics.setColor(r,g,b)
        end
       
    end

    function tableauTempo:SearchValueMaxMinColoum()
        
       -- print("Nombre de Colonnes :"..tostring(self.dimensions.nbrCol))
        --print("Nombre de lignes:"..tostring(self.dimensions.nbrLig))
        
        local max = 0
        local min = {}
        local posCase = {}
        local nbrTour = 1

        -- Boucle qui recherche la valeur max et min dans chaque colonne du tableau
        for i = 1, self.dimensions.nbrCol do
        
            local max = 0
            local min = {}
            local listePosCases = {}
            posCase = i

            -- Boucle qui recherche dans la colonne
            for i2 = 1, self.dimensions.nbrLig do

               -- print("posCase :"..tostring(posCase))
              --  print("Nombre de Tour :"..tostring(nbrTour))
                if i2 == 1 then 
                    min = self.listeCases[posCase].value
                end

                if self.listeCases[posCase].value <min then
                    min = self.listeCases[posCase].value
                end

                if self.listeCases[posCase].value > max then
                    max = self.listeCases[posCase].value
                end

                table.insert(listePosCases, posCase)
                posCase = posCase + self.dimensions.nbrCol
                nbrTour = nbrTour + 1
               
            end

            -- Boucle qui recherche si les attributs ont max ou min à true pour la gestion des couleurs
            for i = 1, #listePosCases do

                posTempo = listePosCases[i]
                if self.listeCases[posTempo].value  == max then
                    self.listeCases[posTempo].max = true           
                end

                if self.listeCases[posTempo].value == min then
                    self.listeCases[posTempo].min = true
                end

            end

        end

    end

    return tableauTempo

end

function tableau:OrdonnerListe(plisteDesordonne)
  local ancienneListe = plisteDesordonne
  local listeTempo = plisteDesordonne
  local listeValideFinal = {}
  local listeInvalide = {}
  local listeIdVilleManque = {}
  local listeRepereVille = {1,2,3,4,5,6,7,8,9}
  
  for i = 1, #listeTempo do
    
    if listeTempo[i].idVille ~= i then
      
      local InvalideTempo = listeTempo[i]
      InvalideTempo.anciennePos = i
      table.insert(listeInvalide, InvalideTempo)
  
    else
      local valideTempo = listeTempo[i]
      table.insert(listeValideFinal, valideTempo)
      
    end
    -- Check si la ville à un repere
    for i2 = 1, #listeRepereVille do
      if listeTempo[i].idVille == listeRepereVille[i2] then
        table.remove(listeRepereVille, i2)
    end
      
    end

  end

  if #listeRepereVille ~=nil then
    for i = 1, #listeRepereVille do
     -- print("Aucun Repere à été trouvé pour cette ville : " ..tostring(listeRepereVille[i]))
      local miseAZero = {}
      miseAZero.level = 0
      miseAZero.idVille = listeRepereVille[i]
      listeValideFinal[miseAZero.idVille] = miseAZero
    end
  end
  
  if #listeInvalide ~=nil then
    for i = 1, #listeInvalide do
      --print("cette info est en position : " ..tostring(listeInvalide[i].anciennePos).." Hors son id de ville est "..tostring(listeInvalide[i].idVille))
      local infoValideTempo = {}
      infoValideTempo = listeInvalide[i]
      listeValideFinal[infoValideTempo.idVille] = infoValideTempo
    end
  end
  
  --print("\n--- Affichage de la liste Valide Après Formatage ---")
  for i = 1, #listeValideFinal do
    
   -- print("cette info est en position : " ..tostring(i).." ID de la ville "..tostring(listeValideFinal[i].idVille) .." son level " ..tostring(listeValideFinal[i].level)  )
  end
  
  return listeValideFinal
end

function tableau:fusionListe(pTabListe)
  
  local nbListe = #pTabListe
  local nbVille = #pTabListe[1]
  local listeDataFusionFinal = {}
  
  for i = 1, nbVille  do
    
    for i2 = 1, nbListe do
      local listeTempo = {}
      listeTempo = pTabListe[i2]
      local valeurTempo = {}
      valeurTempo = listeTempo[i]
      table.insert(listeDataFusionFinal, valeurTempo.level)
    end
  
  end
  
 -- print("\n--- Affichage de la liste Fusion Après Formatage ---")
  for i = 1, #listeDataFusionFinal do
    
   -- print("level " ..tostring(listeDataFusionFinal[i]) )
  end
  return listeDataFusionFinal
end

return tableau