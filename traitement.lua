local traitement = {}
local FunctionVille = require("ville")

function traitement:Create(pListeJson)

json = require("json") -- librairie qui lit le json
local traitementTempo = {}
traitementTempo.Villes = {}
traitementTempo.Iles = {}

local listeJson = pListeJson

local nombreVilles = #listeJson.Villes
local nombreIles = #listeJson.Iles

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

    traitementTempo.Villes[i] = villeTempo
    
    --local entrepotLvl = villeDecodeTempo[1][2]['backgroundData']['position']['Entrep\\u00f4t']['level']
    --local entrepotLvl = villeDecodeTempo[1][2]['backgroundData']['position'][1].level
    --local LvlHotel = villeDecodeTempo[1][2]['backgroundData']['position'][1]['level'] 

end

for i = 1, nombreIles do

end


--[[

for j = 1, #ville1Decode[1][2]['backgroundData']['position'] do
  
  print (ville1Decode[1][2]['backgroundData']['position'][j].name)

end

local nombreDeBatiment = #ville1Decode[1][2]['backgroundData']['position']

if entrepotLvl == 'Hôtel de ville' then
    print(entrepotLvl)
end
]]--


--[[
print(bois)
print(vin)
print(marbre)
print(cristal)
print(souffre)
print(nomVille)
print(nomJoueur)
print(BateauMarchand)
print(entrepotMax)
print(LvlHotel)
print(endUpdateTime)
print(nombreDeBatiment)
]]--


local fichierIleJson1 = assert(io.open("Island/Island1.json", "r"))
local fichierIleJson2 = assert(io.open("Island/Island2.json", "r"))
local fichierIleJson3 = assert(io.open("Island/Island3.json", "r"))
local fichierIleJson4 = assert(io.open("Island/Island4.json", "r"))
local fichierIleJson5 = assert(io.open("Island/Island5.json", "r"))
local fichierIleJson6 = assert(io.open("Island/Island6.json", "r"))

local fichierLireIleJson1 = fichierIleJson1:read("*all")
local fichierLireIleJson2 = fichierIleJson2:read("*all")
local fichierLireIleJson3 = fichierIleJson3:read("*all")
local fichierLireIleJson4 = fichierIleJson4:read("*all")
local fichierLireIleJson5 = fichierIleJson5:read("*all")
local fichierLireIleJson6 = fichierIleJson6:read("*all")

local ile1Decode = json.decode(fichierLireIleJson1)
local ile2Decode = json.decode(fichierLireIleJson2)
local ile3Decode = json.decode(fichierLireIleJson3)
local ile4Decode = json.decode(fichierLireIleJson4)
local ile5Decode = json.decode(fichierLireIleJson5)
local ile6Decode = json.decode(fichierLireIleJson6)

-- Infos Ile
local lvlScierie = ile1Decode[1][2]['backgroundData']['resourceLevel']  
local lvlResourceLuxe = ile1Decode[1][2]['backgroundData']['tradegoodLevel']  
local numeroResourceLuxe = ile1Decode[1][2]['backgroundData']['tradegood']  

--print(lvlScierie)
--print(lvlResourceLuxe)
--print(numeroResourceLuxe)

return traitementTempo

end

return traitement