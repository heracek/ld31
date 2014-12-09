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

return Tile
