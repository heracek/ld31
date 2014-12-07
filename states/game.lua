local Scene = require "Scene"
local Player = require "Player"
local World = require "World"
local state = class("GameState")

function state:initialize()
  self.scene = Scene()
  self.scene:addEntry(Player())
  self.scene:addEntry(World())
end

function state:draw()
  self.scene:draw()
end

function state:update(dt)
  self.scene:update(dt)
end

return state
