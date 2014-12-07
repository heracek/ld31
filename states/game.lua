local Scene = require "Scene"
local Player = require "Player"
local state = class("GameState")

function state:initialize()
  self.scene = Scene()
  self.scene:addEntry(Player())
end

function state:draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.clear()

  self.scene:draw()
end

function state:update(dt)
  self.scene:update(dt)
end

return state
