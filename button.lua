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
  
  function buttonTempo:Draw()
    
    if (self.pressed == false) then
      love.graphics.draw(self.image, self.x, self.y)
    else
      love.graphics.draw(self.image2, self.x, self.y)
    end

    love.graphics.print(self.label, (self.x + self.labelX), (self.y + self.labelY))
    
  end
  
  return buttonTempo
  
end

return button