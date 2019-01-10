function modPitch(num)
  local pitch = song:getPitch()+num
  if pitch < 0.2 then
    pitch = 0.2
  end
  song:setPitch(pitch)
  changeGerardSpeed(pitch)
end
function multiply(mult)

end

function findFX(name)
  local pos = -1
  for i=1,#appliedFX do
    if name==appliedFX[i] then
      pos = i
    end
  end
  return pos
end

function getAnimations(sprite,width,height)
  local spritesheet = {}
  local i = 1
  local y = 0
  local x = 0
  while x < sprite:getWidth() do
    spritesheet[i] = love.graphics.newQuad(x,y,width,height,sprite:getDimensions())
    x = x+width
    i = i+1
  end
  return spritesheet
end

function addGerard()
  local x = math.random(128,love.graphics.getWidth()-128);
  local y = math.random(0,love.graphics.getHeight()-128);
  local ger = Gerard(img,x,y)
  ger:changeSpeed(song:getPitch()*20)
  ger:changeColor()
  ger.isMoving = buttons[4].isPressed
  table.insert(gerards,ger)
end

function lessGerard()
  table.remove(gerards,#gerards)
end

function changeColor()
  for i=1,#gerards do
    gerards[i]:changeColor()
  end
end

function changeGerardSpeed(pitch)
  local speed = pitch *20
  for i=1,#gerards do
    gerards[i]:changeSpeed(speed)
  end
end

function moveGerards()
  for i = 1, #gerards do
    gerards[i]:activateMovement()
  end
end