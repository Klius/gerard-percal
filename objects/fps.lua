FPSbar = Object:extend()

function FPSbar:new()
  self.x = love.graphics.getWidth()--32  
  self.y = love.graphics.getHeight()--128
  self.width = 32
  self.height = 128
  self.size = 1
end
function FPSbar:draw()
  love.graphics.setColor(0,0,0,1)
  love.graphics.rectangle("fill",self.x,self.y,-self.width,-self.height)
  if self.size > 0.25 then
    love.graphics.setColor(1,1,0,1)
  else
    love.graphics.setColor(1,0,0,1)
  end
  love.graphics.rectangle("fill",self.x,self.y,-self.width,-self.height*self.size)
  
  love.graphics.setColor(0,0,0,1)
  local x = self.x -self.width
  local y = self.y -self.height
  local w = self.width
  local h = 4
  for i=0,self.height do
    love.graphics.rectangle("line",x,y,w,h)
    y = y+h
  end
  love.graphics.setColor(1,1,1,1)
  
  
end
function FPSbar:update(dt)
  local fps = love.timer.getFPS()/60
  if fps >= 1 then
    self.size = 1
  else
    self.size = fps
  end
end