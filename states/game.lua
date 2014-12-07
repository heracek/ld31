local Player = require "Player"
local state = class("GameState")

function state:initialize()
  self.player = Player()
end

function state:draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.clear()

  self.player:draw()
end

function state:update(dt)
  self.player:update(dt)
end

return state
