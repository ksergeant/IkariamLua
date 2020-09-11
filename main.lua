io.stdout:setvbuf('no')

myIkariamManager = require("IkariamManager")
myBackground = love.graphics.newImage("background.jpg")

function love.load()
  
  myIkariamManager:Load()

end

function love.update(dt)
  
  myIkariamManager:Update(dt)
  love.timer.sleep(0.07)
  
end

function love.draw()
    
  love.graphics.draw(myBackground, 0, 0, 0)
  myIkariamManager:Draw()
  
end

function love.mousepressed(x, y, button, istouch)
  
  local bLaunch = myIkariamManager.myButtonDemarrer
  local bRessources = myIkariamManager.myButtonRessources
  local bBatiments = myIkariamManager.myButtonBatiments
  local bIles = myIkariamManager.myButtonIles
  local bCachette = myIkariamManager.myButtonCachette
  local bPlans = myIkariamManager.myButtonPlans
  local bIA = myIkariamManager.myButtonIA
  local bQuitter = myIkariamManager.myButtonQuitter

    -- Bouton Demarrer
   if (button == 1) and 
       (x >= bLaunch.x) and (x <= bLaunch.x + bLaunch.width) and 
       (y >= bLaunch.y) and (y <= bLaunch.y + bLaunch.height) then
       bLaunch.Function()
       
        myIkariamManager.myButtonDemarrer.pressed = true
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
        myIkariamManager.myButtonIA.pressed = false
    
   end
  
    -- Bouton Quitter
    if (button == 1) and 
    (x >= bQuitter.x) and (x <= bQuitter.x + bQuitter.width) and 
    (y >= bQuitter.y) and (y <= bQuitter.y + bQuitter.height) then
      bQuitter.Function()
    
     myIkariamManager.myButtonQuitter.pressed = true
     myIkariamManager.myButtonDemarrer.pressed = false
     myIkariamManager.myButtonRessources.pressed = false
     myIkariamManager.myButtonBatiments.pressed = false
     myIkariamManager.myButtonIles.pressed = false
     myIkariamManager.myButtonCachette.pressed = false
     myIkariamManager.myButtonPlans.pressed = false
     myIkariamManager.myButtonIA.pressed = false
 
end

   -- Bouton Ressources
   if (button == 1) and 
       (x >= bRessources.x) and (x <= bRessources.x + bRessources.width) and 
       (y >= bRessources.y) and (y <= bRessources.y + bRessources.height) then 

        myIkariamManager.myButtonRessources.pressed = true

        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
        myIkariamManager.myButtonIA.pressed = false

        bRessources.Function()
        myIkariamManager.myVueCourante = "Ressources"
       
    end

  -- Bouton Batiments
  if (button == 1) and 
       (x >= bBatiments.x) and (x <= bBatiments.x + bBatiments.width) and 
       (y >= bBatiments.y) and (y <= bBatiments.y + bBatiments.height) then 
        
        myIkariamManager.myButtonBatiments.pressed = true

        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
        myIkariamManager.myButtonIA.pressed = false

        bBatiments.Function()
        myIkariamManager.myVueCourante = "Batiments"

    end

  -- Bouton Iles
  if (button == 1) and 
       (x >= bIles.x) and (x <= bIles.x + bIles.width) and 
       (y >= bIles.y) and (y <= bIles.y + bIles.height) then 

        myIkariamManager.myButtonIles.pressed = true

        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
        myIkariamManager.myButtonIA.pressed = false
     
        bIles.Function()
        myIkariamManager.myVueCourante = "Iles"
    end

  -- Bouton Cachette
  if (button == 1) and 
       (x >= bCachette.x) and (x <= bCachette.x + bCachette.width) and 
       (y >= bCachette.y) and (y <= bCachette.y + bCachette.height) then 
     
        myIkariamManager.myButtonCachette.pressed = true
        
        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonPlans.pressed = false
        myIkariamManager.myButtonIA.pressed = false
        bCachette.Function()
        myIkariamManager.myVueCourante = "Cachette"
        
    end

  -- Bouton Plans
  if (button == 1) and 
       (x >= bPlans.x) and (x <= bPlans.x + bPlans.width) and 
       (y >= bPlans.y) and (y <= bPlans.y + bPlans.height) then 
     
        myIkariamManager.myButtonPlans.pressed = true
        myIkariamManager.myButtonDemarrer.pressed = false
        myIkariamManager.myButtonRessources.pressed = false
        myIkariamManager.myButtonIles.pressed = false
        myIkariamManager.myButtonCachette.pressed = false
        myIkariamManager.myButtonBatiments.pressed = false
        myIkariamManager.myButtonIA.pressed = false
        
        bPlans.Function()
        myIkariamManager.myVueCourante = "Plans"
         
    end

    -- Bouton IA
  if (button == 1) and 
  (x >= bIA.x) and (x <= bIA.x + bIA.width) and 
  (y >= bIA.y) and (y <= bIA.y + bIA.height) then 

   myIkariamManager.myButtonIA.pressed = true
   myIkariamManager.myButtonPlans.pressed = false
   myIkariamManager.myButtonDemarrer.pressed = false
   myIkariamManager.myButtonRessources.pressed = false
   myIkariamManager.myButtonIles.pressed = false
   myIkariamManager.myButtonCachette.pressed = false
   myIkariamManager.myButtonBatiments.pressed = false
   
   bIA.Function()
   myIkariamManager.myVueCourante = "IA"
  end

end
