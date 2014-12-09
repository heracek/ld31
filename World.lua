local Entry = require "Entry"
local Tile = require "Tile"
local World = class("World", Entry)

World.static.DEFAULT_NAME = 'world'
World.static.WORLD_WIDTH  = 320

World.static.TILE_SIZE = 16
World.static.DATA_ROWS = 20
World.static.DATA      = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
}

function World:initialize()
  Entry.initialize(self)
  self.zindex = 0
  self.name   = World.DEFAULT_NAME
  self._tiles = {}

  local col, row = 0, 0
  local tileSize = self.class.TILE_SIZE
  for i,tileId in ipairs(self.class.DATA) do
    if 0 ~= tileId then
      table.insert(self._tiles, Tile(col * tileSize, row * tileSize, tileSize, tileSize))
    end
    col = col + 1
    row = row + math.floor(col / self.class.DATA_ROWS)
    col = col % self.class.DATA_ROWS
  end
end

function World:draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.clear()
  for _,tile in ipairs(self._tiles) do
    tile:draw()
  end
end

function World:isInCollisionWith(x, y, w, h)
  if (y + h) >= 100 then return true end
  if x < 0 then return true end
  if (x + w) > self.class.WORLD_WIDTH then return true end
  return false
end

return World
