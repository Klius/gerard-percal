Background = Object:extend()

function Background:new()
  self.canvas = love.graphics.newCanvas(love.graphics.getWidth(),love.graphics.getHeight())
end
function Background:update(dt)
  love.graphics.setCanvas(self.canvas)
  for i=0,love.graphics.getHeight()/8 do
    love.graphics.setColor(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,1)
    love.graphics.rectangle("fill",0,i*8,love.graphics.getWidth(),8)
  end
  love.graphics.setColor(1,1,1,1)
  love.graphics.setCanvas()
end
function Background:draw()
  love.graphics.draw(self.canvas,0,0)
end