local Input = {
  down = {}
}

function Input:isDown(key)
  return true == self.down[key]
end

function Input:keypressed(key)
  self.down[key] = true
end

function Input:keyreleased(key)
  self.down[key] = false
end

return Input
