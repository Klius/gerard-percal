Gerard = Object:extend()

function Gerard:new(img,x,y)
  self.x = x or 256
  self.y = y or love.graphics.getHeight()-256
  self.psystem = love.graphics.newParticleSystem(img, 500)
	self.psystem:setParticleLifetime(0.3, 10) -- Particles live at least 2s and at most 5s.
	self.psystem:setEmissionRate(20)
	self.psystem:setSizeVariation(1)
	self.psystem:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
	self.psystem:setColors(255, 0, 0, 255, 0, 255, 0, 0) -- Fade to transparency.
end

function Gerard:update(dt)
  self.psystem:update(dt)
end

function Gerard:draw()
  love.graphics.draw(self.psystem, self.x, self.y)
end

function Gerard:changeColor()
  local colors = {}
  local deb = ""
  for i=1,6 do
    table.insert(colors,math.random(0,1))
    deb = deb..i..": "..colors[i].."#"
  end
  self.psystem:setColors(colors[1],colors[2],colors[3],1,colors[4],colors[5],colors[6],0)
end
function Gerard:shower()
  self.psystem:emit(800)
  self.psystem:setLinearAcceleration(math.random(0,-20), math.random(0,-20), math.random(0,20), math.random(0,20))
end