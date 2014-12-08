local Entry = require "Entry"
local World = class("World", Entry)

World.static.DEFAULT_NAME = 'world'
World.static.WORLD_WIDTH  = 320

function World:initialize()
  Entry.initialize(self)
  self.zindex = 0
  self.name   = World.DEFAULT_NAME
end

function World:draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.clear()
  love.graphics.setColor(0, 0, 0)
  love.graphics.line(0, 100.5, self.class.WORLD_WIDTH, 100.5)
end

function World:isInCollisionWith(x, y, w, h)
  if (y + h) >= 100 then return true end
  if x < 0 then return true end
  if (x + w) > self.class.WORLD_WIDTH then return true end
  return false
end

return World
