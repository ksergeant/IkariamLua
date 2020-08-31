local traitement = {}
local FunctionVille = require("ville")
local FunctionIle = require("ile")

function traitement:Create(pListeJson)

json = require("json") -- librairie qui lit le json
local traitementTempo = {}
traitementTempo.Villes = {}
traitementTempo.Iles = {}

local listeJson = pListeJson

local nombreVilles = #listeJson.Villes
local nombreIles = #listeJson.Iles

-- Boucle qui crée les villes et qui ajoute les données de celle-ci dans un tableau villes
for i = 1, nombreVilles do

    local fichierVilleTempo = assert(io.open(listeJson.Villes[i],"r"))
    local fichierLireVilleJsonTempo = fichierVilleTempo:read("*all")
    local villeDecodeTempo = json.decode(fichierLireVilleJsonTempo)
    local villeTempo = FunctionVille:Create()

    -- Infos Global
    villeTempo._nomJoueur = villeDecodeTempo[1][2]['backgroundData']['ownerName']
    villeTempo._bateauMarchand = villeDecodeTempo[1][2]['headerData']['freeTransporters']

     -- Infos par ville 
    villeTempo._nom = villeDecodeTempo[1][2]['backgroundData']['name']
    villeTempo._nbBois = villeDecodeTempo[1][2]['headerData']['currentResources']['resource']
    villeTempo._nbVin = villeDecodeTempo[1][2]['headerData']['currentResources']['1']
    villeTempo._nbMarbre = villeDecodeTempo[1][2]['headerData']['currentResources']['2']
    villeTempo._nbCristal = villeDecodeTempo[1][2]['headerData']['currentResources']['3']
    villeTempo._nbSouffre = villeDecodeTempo[1][2]['headerData']['currentResources']['4']
    villeTempo._update = villeDecodeTempo[1][2]['backgroundData']['endUpgradeTime']
    villeTempo._entrepotMax = villeDecodeTempo[1][2]['headerData']['maxResources']['resource']
    villeTempo._listeBatiments = {}
    villeTempo._productionBois = villeDecodeTempo[1][2]['headerData']['resourceProduction']
    villeTempo._productionLuxe = villeDecodeTempo[1][2]['headerData']['tradegoodProduction']
    villeTempo._luxeId = villeDecodeTempo[1][2]['headerData']['producedTradegood']
    villeTempo._consoVin = villeDecodeTempo[1][2]['headerData']['wineSpendings']
  
    -- Boucle qui ajoute tous les batiments à la ville
    for j = 1, #villeDecodeTempo[1][2]['backgroundData']['position'] do
  
        local batimentTempo = {}
        batimentTempo.name = {}
        batimentTempo.level = {}

        batimentTempo.name = villeDecodeTempo[1][2]['backgroundData']['position'][j].name
        batimentTempo.level = villeDecodeTempo[1][2]['backgroundData']['position'][j].level
        villeTempo._listeBatiments[j] = batimentTempo
      
      end

    traitementTempo.Villes[i] = villeTempo
    
    --local entrepotLvl = villeDecodeTempo[1][2]['backgroundData']['position']['Entrep\\u00f4t']['level']
    --local entrepotLvl = villeDecodeTempo[1][2]['backgroundData']['position'][1].level
    --local LvlHotel = villeDecodeTempo[1][2]['backgroundData']['position'][1]['level'] 

end

-- ######### ILES #########

for i = 1, nombreIles do

    local fichierIleTempo = assert(io.open(listeJson.Iles[i],"r"))
    local fichierLireIleJsonTempo = fichierIleTempo:read("*all")
    local IleDecodeTempo = json.decode(fichierLireIleJsonTempo)
    local IleTempo = FunctionIle:Create()

    -- Infos Ile
    IleTempo._nom = IleDecodeTempo[1][2]['backgroundData']['name']
    IleTempo._lvlScierie = IleDecodeTempo[1][2]['backgroundData']['resourceLevel']  
    IleTempo._lvlResourceLuxe = IleDecodeTempo[1][2]['backgroundData']['tradegoodLevel']  
    IleTempo._numeroResourceLuxe = IleDecodeTempo[1][2]['backgroundData']['tradegood']  
    
    traitementTempo.Iles[i] = IleTempo

end

--print(lvlScierie)
--print(lvlResourceLuxe)
--print(numeroResourceLuxe)

--[[
if entrepotLvl == 'Hôtel de ville' then
    print(entrepotLvl)
end
]]--

return traitementTempo

end

return traitement