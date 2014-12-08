local Entry = require "Entry"
local Player = class("Player", Entry)

Player.static.WORLD_MOVE_BORDER = 16
Player.static.WORLD_WIDTH       = 320
Player.static.GRAVITY           = 600
Player.static.MAX_FALL_SPEED    = 200

function Player:initialize()
  Entry.initialize(self)
  self.x, self.y  = 0, 0
  self.zindex     = 100
  self.xspeed     = 0
  self.yspeed     = 0
  self.move_speed = 100

  self.sprite = Image.characters.character01
end

function Player:update(dt)
  self.xspeed = 0
  if Input:isDown("d") then
    self.xspeed = self.move_speed
  elseif Input:isDown("a") then
    self.xspeed = - self.move_speed
  end

  self.x = self.x + self.xspeed * dt
  self.x = math.max(0, math.min(Player.WORLD_WIDTH - Player.WORLD_MOVE_BORDER, self.x))

  self.yspeed = self.yspeed + Player.GRAVITY * dt
  self.yspeed = math.min(Player.MAX_FALL_SPEED, self.yspeed)
  self.y = self.y + self.yspeed * dt

  -- ground collision
  self.y = math.min(100, self.y)
end

function Player:draw()
  love.graphics.draw(self.sprite, self.x, self.y)
end

return Player
