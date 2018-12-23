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
    if name==appliedFX then
      pos = i
    end
  end
end