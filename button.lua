local button = {}

function button:Create(pLabel, pNom, pX, pY, pFunction, pImage)
  
  local buttonTempo = {}
  buttonTempo.label = pLabel
  buttonTempo.nom = pNom
  buttonTempo.x = pX
  buttonTempo.y = pY
  buttonTempo.Function = pFunction
  buttonTempo.image = love.graphics.newImage(pImage)
  buttonTempo.width = buttonTempo.image:getWidth()
  buttonTempo.height = buttonTempo.image:getHeight()
  
  function buttonTempo:Draw()
    
    love.graphics.draw(self.image, self.x, self.y)
    love.graphics.print(self.label, self.x + 70, self.y+ 15)
    
  end
  
  return buttonTempo
  
end

return button