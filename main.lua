io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

myIkariamManager = require("IkariamManager")
myBackground = love.graphics.newImage("background.png")

function love.load()
  
  myIkariamManager:Load()

end

function love.update(dt)
  
  myIkariamManager:Update(dt)

end

function love.draw()
    
  love.graphics.draw(myBackground, 0, 0, 0)
  myIkariamManager:Draw()

end

function love.mousepressed(x, y, button, istouch)
  
  local bLaunch = myIkariamManager.myButtonDemarrer
  local bQuit = myIkariamManager.myButtonQuitter
  local bRessources = myIkariamManager.myButtonRessources
  local bBatiments = myIkariamManager.myButtonBatiments
  local bIles = myIkariamManager.myButtonIles
  local bCachette = myIkariamManager.myButtonCachette
  local bPlans = myIkariamManager.myButtonPlans

    -- Bouton Demarrer
   if (button == 1) and 
       (x >= bLaunch.x) and (x <= bLaunch.x + bLaunch.width) and 
       (y >= bLaunch.y) and (y <= bLaunch.y + bLaunch.height) then
       bLaunch.Function()
       
        myIkariamManager.myButtonDemarrer.pressed = true

        myIkariamManager.myButtonQuitter.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
    
   end
  
   -- Bouton Quitter
   if (button == 1) and 
       (x >= bQuit.x) and (x <= bQuit.x + bQuit.width) and 
       (y >= bQuit.y) and (y <= bQuit.y + bQuit.height) then 

        myIkariamManager.myButtonQuitter.pressed = true

        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
     
     bQuit.Function()
    
   end

   -- Bouton Ressources
   if (button == 1) and 
       (x >= bRessources.x) and (x <= bRessources.x + bRessources.width) and 
       (y >= bRessources.y) and (y <= bRessources.y + bRessources.height) then 

        myIkariamManager.myButtonRessources.pressed = true

        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonQuitter.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false

        bRessources.Function()
        myIkariamManager.myVueCourante = "Ressources"
       
    end

  -- Bouton Batiments
  if (button == 1) and 
       (x >= bBatiments.x) and (x <= bBatiments.x + bBatiments.width) and 
       (y >= bBatiments.y) and (y <= bBatiments.y + bBatiments.height) then 
        
        myIkariamManager.myButtonBatiments.pressed = true

        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonQuitter.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
        bBatiments.Function()
        myIkariamManager.myVueCourante = "Batiments"

    end

  -- Bouton Iles
  if (button == 1) and 
       (x >= bIles.x) and (x <= bIles.x + bIles.width) and 
       (y >= bIles.y) and (y <= bIles.y + bIles.height) then 

        myIkariamManager.myButtonIles.pressed = true

        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonQuitter.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
     
        bIles.Function()
        myIkariamManager.myVueCourante = "Iles"
    end

  -- Bouton Cachette
  if (button == 1) and 
       (x >= bCachette.x) and (x <= bCachette.x + bCachette.width) and 
       (y >= bCachette.y) and (y <= bCachette.y + bCachette.height) then 
     
        myIkariamManager.myButtonCachette.pressed = true
        
        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonQuitter.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
        bCachette.Function()
        myIkariamManager.myVueCourante = "Cachette"
        
    end

  -- Bouton Plans
  if (button == 1) and 
       (x >= bPlans.x) and (x <= bPlans.x + bPlans.width) and 
       (y >= bPlans.y) and (y <= bPlans.y + bPlans.height) then 
     
        myIkariamManager.myButtonPlans.pressed = true
        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonQuitter.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        
        bPlans.Function()
        myIkariamManager.myVueCourante = "Plans"
        
    end

end
