local picture = {}

function picture:Create(pNom, pX, pY, pImage)
  
  local pictureTempo = {}
  pictureTempo.nom = pNom
  pictureTempo.x = pX
  pictureTempo.y = pY
  pictureTempo.image = love.graphics.newImage(pImage)
  pictureTempo.width = pictureTempo.image:getWidth()
  pictureTempo.height = pictureTempo.image:getHeight()
  
  function pictureTempo:Draw()
    
    love.graphics.draw(self.image, self.x, self.y)
    
  end
  
  return pictureTempo
  
end

return picture