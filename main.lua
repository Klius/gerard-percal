Object = require "libs/classic"
require "objects/gerard"
require "libs/actions"
function love.load()
  love.audio.setEffect('echo', 
    {
      type = 'echo',
      delay = 1,
      tapdelay = 5,
      damping = 0,
      feedback = 1,
      spread = 3
    }
    )
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
end
function love.update(dt)
  gero:update(dt)
end
function love.draw()
  gero:draw()
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
  if key == "space" then
    gero:changeColor()
  end
end

function activateEffect(name)
  print(string.find(appliedFX,name))
  if string.find(appliedFX,name) then
    song:setEffect(name,false)
  else
    song:setEffect(name)
    table.insert(appliedFX,name)
  end
end
