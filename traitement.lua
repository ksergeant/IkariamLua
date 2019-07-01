local traitement = {}

json = require("json") -- librairie qui lit le json

local fichierVilleJson1 = assert(io.open("Villes/Ville1.json", "r"))
local fichierVilleJson2 = assert(io.open("Villes/Ville2.json", "r"))
local fichierVilleJson3 = assert(io.open("Villes/Ville3.json", "r"))
local fichierVilleJson4 = assert(io.open("Villes/Ville4.json", "r"))
local fichierVilleJson5 = assert(io.open("Villes/Ville5.json", "r"))
local fichierVilleJson6 = assert(io.open("Villes/Ville6.json", "r"))

local fichierLireVilleJson1 = fichierVilleJson1:read("*all")
local fichierLireVilleJson2 = fichierVilleJson2:read("*all")
local fichierLireVilleJson3 = fichierVilleJson3:read("*all")
local fichierLireVilleJson4 = fichierVilleJson4:read("*all")
local fichierLireVilleJson5 = fichierVilleJson5:read("*all")
local fichierLireVilleJson6 = fichierVilleJson6:read("*all")

local ville1Decode = json.decode(fichierLireVilleJson1)
local ville2Decode = json.decode(fichierLireVilleJson2)
local ville3Decode = json.decode(fichierLireVilleJson3)
local ville4Decode = json.decode(fichierLireVilleJson4)
local ville5Decode = json.decode(fichierLireVilleJson5)
local ville6Decode = json.decode(fichierLireVilleJson6)

-- Infos par ville 
local bois= ville1Decode[1][2]['headerData']['currentResources']['resource']
local vin = ville1Decode[1][2]['headerData']['currentResources']['1']
local marbre = ville1Decode[1][2]['headerData']['currentResources']['2']
local cristal = ville1Decode[1][2]['headerData']['currentResources']['3']
local souffre = ville1Decode[1][2]['headerData']['currentResources']['4']
local nomVille = ville1Decode[1][2]['backgroundData']['name']

local entrepotMax = ville1Decode[1][2]['headerData']['maxResources']['resource']
local LvlHotel = ville1Decode[1][2]['backgroundData']['position'][1]['level'] 
local endUpdateTime = ville1Decode[1][2]['backgroundData']['endUpgradeTime']
--local entrepotLvl = ville1Decode[1][2]['backgroundData']['position']['Entrep\\u00f4t']['level']
local entrepotLvl = ville1Decode[1][2]['backgroundData']['position'][1].level


-- Infos Global
local nomJoueur = ville1Decode[1][2]['backgroundData']['ownerName']           
local bateauMarchand = ville1Decode[1][2]['headerData']['freeTransporters']

for j = 1, #ville1Decode[1][2]['backgroundData']['position'] do
  
  print (ville1Decode[1][2]['backgroundData']['position'][j].name)

end

local nombreDeBatiment = #ville1Decode[1][2]['backgroundData']['position']

if entrepotLvl == 'Hôtel de ville' then
    print(entrepotLvl)
end

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

return traitement