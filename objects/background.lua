Background = Object:extend()

function Background:new()
  self.canvas = love.graphics.newCanvas(love.graphics.getWidth(),love.graphics.getHeight())
  self.mode = 1
  self.speed = 0.352
  self.counter = 0
  self:canvasDraw()
  self.pitch = 1
end
function Background:update(dt)
  self.counter = self.counter+dt
  if self.counter > self.speed /self.pitch then
    self:canvasDraw()
    self.counter = 0
  end
end

function Background:canvasDraw()
  if self.mode == 2 then
    self:tileDraw()
  elseif self.mode == 3 then
    self:hexagonDraw()
  else
    self:lineDraw()
  end
end

function Background:draw()
  love.graphics.draw(self.canvas,0,0)
end

function Background:lineDraw()
  love.graphics.setCanvas(self.canvas)
    for i=0,love.graphics.getHeight()/8 do
      love.graphics.setColor(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,1)
      love.graphics.rectangle("fill",0,i*8,love.graphics.getWidth(),8)
      love.graphics.rectangle("fill",i*8,0,8,love.graphics.getHeight())
    end
    love.graphics.setColor(1,1,1,1)
    love.graphics.setCanvas()
end

function Background:tileDraw()
  local sWidth = 32
  love.graphics.setCanvas(self.canvas)
  for y=0,love.graphics.getHeight()/sWidth do
    for x=0,love.graphics.getWidth()/sWidth do
        love.graphics.setColor(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,1)
        love.graphics.rectangle("fill",x*sWidth,y*sWidth,sWidth,sWidth)
        love.graphics.setColor(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,0.5)
        love.graphics.rectangle("fill",x*sWidth,y*sWidth,sWidth-2,sWidth-2)
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
        love.graphics.setColor(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,0.5)
        love.graphics.circle("fill",x*sWidth,y*sWidth,sWidth,8)
      end
  end
    love.graphics.setColor(1,1,1,1)
    love.graphics.setCanvas()
end
function Background:changeMode()
  local mode = self.mode +1
  if mode > 3 then
    mode = 1
  end
  self.mode = mode
end