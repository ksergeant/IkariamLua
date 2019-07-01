local button = {}
local FunctionPicture = require("picture")

function button:Create(pLabel, pNom, pX, pY, pFunction, pImage, pImage2, pImage3, pLabelX, pLabelY)
  
  local buttonTempo = {}
  buttonTempo.label = pLabel
  buttonTempo.nom = pNom
  buttonTempo.x = pX
  buttonTempo.y = pY
  buttonTempo.labelX = pLabelX
  buttonTempo.labelY = pLabelY
  buttonTempo.Function = pFunction
  buttonTempo.imageIdle = love.graphics.newImage(pImage)
  buttonTempo.imagePressed = love.graphics.newImage(pImage2)
  buttonTempo.imageCurseur = FunctionPicture:Create("Curseur", buttonTempo.x +23 , buttonTempo.y +13, pImage3, 1, 1)
  buttonTempo.width = buttonTempo.imageIdle:getWidth()
  buttonTempo.height = buttonTempo.imageIdle:getHeight()
  buttonTempo.pressed = false
  buttonTempo.focus = false
  
  function buttonTempo:Draw()
    
    local r,g,b = love.graphics.getColor() 

    if (self.pressed == false) then
      love.graphics.draw(self.imageIdle, self.x, self.y)
    else
      love.graphics.draw(self.imagePressed, self.x, self.y)
      self.imageCurseur:Draw()
    end

    love.graphics.print(self.label, (self.x + self.labelX), (self.y + self.labelY))
  

    if (self.focus == true ) then 
      love.graphics.setColor(1,0,0,0.2) -- rouge
      love.graphics.rectangle("fill", self.x+4, self.y+4, self.width-8, self.height-10)
      love.graphics.setColor(r,g,b) -- couleur précedente
      print("selection")

    end

    
   
  end

  function buttonTempo:Update()
    
    local x = love.mouse.getX()
    local y = love.mouse.getY()

    if (x >= self.x) and 
       (x <= self.x + self.width) and 
       (y >= self.y) and 
       (y <= self.y + self.height) then

        self.focus = true
        
    else
        self.focus = false
    end
    
  end

  return buttonTempo
  
end

return button