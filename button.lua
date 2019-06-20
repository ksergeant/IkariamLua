local button = {}

function button:Create(pLabel, pNom, pX, pY, pFunction, pImage, pImage2, pLabelX, pLabelY)
  
  local buttonTempo = {}
  buttonTempo.label = pLabel
  buttonTempo.nom = pNom
  buttonTempo.x = pX
  buttonTempo.y = pY
  buttonTempo.labelX = pLabelX
  buttonTempo.labelY = pLabelY
  buttonTempo.Function = pFunction
  buttonTempo.image = love.graphics.newImage(pImage)
  buttonTempo.image2 = love.graphics.newImage(pImage2)
  buttonTempo.width = buttonTempo.image:getWidth()
  buttonTempo.height = buttonTempo.image:getHeight()
  buttonTempo.pressed = false
  buttonTempo.focus = false
  
  function buttonTempo:Draw()
    
    local r,g,b = love.graphics.getColor() 

    if (self.pressed == false) then
      love.graphics.draw(self.image, self.x, self.y)
    else
      love.graphics.draw(self.image2, self.x, self.y)
    end

    love.graphics.print(self.label, (self.x + self.labelX), (self.y + self.labelY))
    
    print(self.nom)
    print(self.pressed)
    print(self.focus)

    if (self.focus == true ) then 
      love.graphics.setColor(1,0,0,0.2) -- rouge
      love.graphics.rectangle("fill", self.x+4, self.y+4, self.width-8, self.height-10)
      love.graphics.setColor(r,g,b) -- couleur précedente
      print("pressé")

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