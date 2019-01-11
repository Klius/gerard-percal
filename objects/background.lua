Background = Object:extend()

function Background:new()
  self.canvas = love.graphics.newCanvas(love.graphics.getWidth(),love.graphics.getHeight())
  self.speed = 0.352
  self.counter = 0
  self:canvasDraw()
  self.pitch = 1
end
function Background:update(dt)
  self.counter = self.counter+dt
  if self.counter > self.speed /self.pitch then
    self:hexagonDraw()
    self.counter = 0
  end
end
function Background:draw()
  love.graphics.draw(self.canvas,0,0)
end

function Background:canvasDraw()
  love.graphics.setCanvas(self.canvas)
    for i=0,love.graphics.getHeight()/8 do
      love.graphics.setColor(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,1)
      love.graphics.rectangle("fill",0,i*8,love.graphics.getWidth(),8)
    end
    love.graphics.setColor(1,1,1,1)
    love.graphics.setCanvas()
end

function Background:squareDraw()
  local sWidth = 32
  love.graphics.setCanvas(self.canvas)
  for y=0,love.graphics.getHeight()/sWidth do
    for x=0,love.graphics.getWidth()/sWidth do
        love.graphics.setColor(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,1)
        love.graphics.rectangle("fill",x*sWidth,y*sWidth,sWidth,sWidth)
      end
  end
    love.graphics.setColor(1,1,1,1)
    love.graphics.setCanvas()
end

function Background:hexagonDraw()
    local sWidth = 32
  love.graphics.setCanvas(self.canvas)
  for y=0,love.graphics.getHeight()/sWidth do
    for x=0,love.graphics.getWidth()/sWidth do
        love.graphics.setColor(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,1)
        love.graphics.circle("fill",x*sWidth,y*sWidth,sWidth,8)
      end
  end
    love.graphics.setColor(1,1,1,1)
    love.graphics.setCanvas()
end