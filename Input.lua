local Input = {
  down = {},
  pressed = {},
}

function Input:isDown(key)
  return true == self.down[key]
end

function Input:wasPressed(key)
  return true == self.pressed[key]
end

function Input:keypressed(key)
  self.down[key] = true
  self.pressed[key] = true
end

function Input:keyreleased(key)
  self.down[key] = false
end

function Input:resetAllPressedKeys()
  for key, _ in pairs(self.pressed) do
    self.pressed[key] = false
  end
end

return Input
