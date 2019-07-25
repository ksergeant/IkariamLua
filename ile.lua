local ile = {}

function ile:Create()
  
  local ileTempo = {}
  ileTempo._nom = {}
  ileTempo._lvlScierie = {}
  ileTempo._lvlResourceLuxe = {}
  ileTempo._numeroResourceLuxe = {} 
  ileTempo._ListeImages = {}
  ileTempo._ListeImages[1] = love.graphics.newImage("Images/Vin.png")
  ileTempo._ListeImages[2] = love.graphics.newImage("Images/Marbre.png")
  ileTempo._ListeImages[3] = love.graphics.newImage("Images/Cristal.png")
  ileTempo._ListeImages[4] = love.graphics.newImage("Images/Souffre.png")
  
  return ileTempo
  
end

return ile