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
  buttons = {}
  buttonInit()

end
function love.update(dt)
  gero:update(dt)
  for i=1,#buttons do
    buttons[i]:update(dt)
  end
end
function love.draw()
  gero:draw()
  for i=1,#buttons do
    buttons[i]:draw()
  end
  love.graphics.print("FPS:"..tostring(love.timer.getFPS()))
end
function love.keypressed(key,scancode,isrepeat)
  if key == "up" then
    
  end
  if key == "down" then
    
  end
  if key == "left" then
    
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
  for i=1,#buttons do
    if x >buttons[i].x and
      x < buttons[i].x+buttons[i].width and
      y > buttons[i].y and
      y < buttons[i].y+buttons[i].width then
        buttons[i]:click()
    end
  end
end

function buttonInit()
  h=love.graphics.getHeight()
  but = Button(nil,0,h-512)
  but.action= function () gero:changeColor() end
  table.insert(buttons,but)
  but = Button("assets/button-morejeff.png",0,h-384)
  but.action= function () gero:changeColor() end
  table.insert(buttons,but)
  but = Button("assets/button-lessjeff.png",0,h-256)
  but.action= function () gero:changeColor() end
  table.insert(buttons,but)
  but = Button("assets/button-shower.png",0,h-128)
  but.action= function () gero:shower() end
  table.insert(buttons,but)
  --AUDIO BUTTONS
  but = Button("assets/button-pitchdown.png",128,h-128)
  but.action= function () modPitch(-0.1) end
  table.insert(buttons,but)
  but = Button("assets/button-pitchup.png",256,h-128)
  but.action= function () modPitch(0.1) end
  table.insert(buttons,but)
  but = Button("assets/button-echo.png",384,h-128)
  but.action= function () activateEffect("echo") end
  but.inaction = function() activateEffect("echo") end
  but.isSwitch = true
  table.insert(buttons,but)
end