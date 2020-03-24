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

function tableau:nouveauTableau(pData)

    print ("Création d'un tableau")

    local tableauTempo = {}
    tableauTempo.listeCases = {}
    local pointDepartTempo = {}
    local dimensionsTempo = {}
    local decalageTempo = {}
    local finColonne = {}
    local finLigne = {}
    local caseTempo = {}
    local pDecalage = {}
    local nbrCases = {}

    nbrCases = 1;
    pointDepartTempo = pData[1]
    dimensionsTempo = pData[2]

    finColonne = pointDepartTempo.x + (pData[3].x * dimensionsTempo.nbrCol)
    finLigne = pointDepartTempo.y + (pData[3].y * dimensionsTempo.nbrLig)

    local decalageTempo = {}
    decalageTempo.y = 0
    -- Boucle nombre de Lignes
    for i = 1, dimensionsTempo.nbrLig do

        decalageTempo.x = 0
        
     -- Boucle nombre de Colonnes
        for i = 1, dimensionsTempo.nbrCol do
            local caseTempo = {}
            caseTempo.x = pointDepartTempo.x + decalageTempo.x /2
            caseTempo.y = pointDepartTempo.y + decalageTempo.y /2
            decalageTempo.x = decalageTempo.x + pData[3].x
            table.insert(tableauTempo.listeCases, caseTempo)
            nbrCases = nbrCases +1
        end
    
        decalageTempo.y = decalageTempo.y + pData[3].y
        print("fin boucle2")

    end

    function tableauTempo:afficheValeur()
        for i = 1, #self.listeCases do
        
            print("Case N°"..tostring(i))
            print("X:"..tostring(self.listeCases[i].x))
            print("Y:"..tostring(self.listeCases[i].y).."\n")
        
         end
    end

    return tableauTempo
end



return tableau