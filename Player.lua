local Player = class("Player")

function Player:initialize()
  self.x, self.y  = 0, 0
  self.move_speed = 100

  self.sprite = Image.characters.character01
end

function Player:update(dt)
  if Input:isDown("d") then
    self.x = self.x + dt * self.move_speed
  elseif Input:isDown("a") then
    self.x = self.x - dt * self.move_speed
  end
end

function Player:draw()
  love.graphics.draw(self.sprite, self.x, self.y)
end

return Player
