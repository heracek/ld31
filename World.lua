local Entry = require "Entry"
local World = class("World", Entry)

function World:initialize()
  Entry.initialize(self)
  self.zindex = 0
  self.name   = World.DEFAULT_NAME
end

function World:draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.clear()
end

return World
