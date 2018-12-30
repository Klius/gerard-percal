Object = require "libs/classic"
require "libs/fx"
require "libs/actions"
--OBJECTS
require "objects/gerard"
require "objects/button"

function love.load()
  love.audio.setEffect('echo', 
    {
      type = 'echo',
      delay = 1,
      tapdelay = 5,
      damping = 0,
      feedback = 1,
      spread = 3
    })
  love.audio.setEffect('distor', {
    type = 'distortion',
    gain = .5,
    edge = .50,
  })
  img = love.graphics.newImage('assets/ger1.png')
  gero = Gerard(img)
  appliedFX = {}
  gerards = {}
  --todofor i=0,2
  song = love.audio.newSource( "assets/hola.ogg", "static" )
  song:setLooping(true)
  song:play()
  testButton = Button()
  testButton.action= function () gero:changeColor() end
end
function love.update(dt)
  gero:update(dt)
  testButton:update(dt)
end
function love.draw()
  gero:draw()
  testButton:draw()
  love.graphics.print("FPS:"..tostring(love.timer.getFPS()))
end
function love.keypressed(key,scancode,isrepeat)
  if key == "up" then
    modPitch(0.1)
  end
  if key == "down" then
    modPitch(-0.1)
  end
  if key == "left" then
    activateEffect("echo")
  end
  if key == "right" then
    activateEffect("distor")
  end
  if key == "space" then
    gero:changeColor()
  end
end

function activateEffect(name)
  if findFX(name) > 0 then
    love.audio.setEffect(name,false)
    table.remove(appliedFX,(findFX(name)))
  else
    table.insert(appliedFX,name)
    love.audio.setEffect(name,fx[name]) 
    song:setEffect(name)
  end
end

function love.mousepressed(x,y,button,istouch)
  checkCollisions(x,y)
end
function checkCollisions(x,y)
  if x >testButton.x and
    x < testButton.x+128 and
    y > testButton.y and
    y < testButton.y+128 then
      testButton:click()
    
  end
end

function buttonInit()

end