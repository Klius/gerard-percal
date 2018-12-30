function modPitch(num)
  local pitch = song:getPitch()+num
  if pitch < 0.2 then
    pitch = 0.2
  end
  song:setPitch(pitch)
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