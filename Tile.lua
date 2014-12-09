local Entry = require "Entry"
local Tile = class("Tile", Entry)

function Tile:initialize(x, y, width, height)
  self.x      = x
  self.y      = y
  self.width  = width
  self.height = height
end

function Tile:draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Tile:isInCollisionWith(x, y, w, h)
  if x + w > self.x and x < self.x + self.width and
     y + h > self.y and y < self.y + self.height then
     return true
   end
  return false
end

return Tile
