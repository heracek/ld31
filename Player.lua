local Entry = require "Entry"
local World = require "World"
local Player = class("Player", Entry)

Player.static.GRAVITY        = 600
Player.static.JUMP_SPEED     = 200
Player.static.MAX_FALL_SPEED = 200
Player.static.KEYS = {
  JUMP  = "w",
  LEFT  = "a",
  RIGHT = "d",
}

function Player:initialize()
  Entry.initialize(self)
  self.zindex     = 100
  self.name       = 'player'

  self.x, self.y  = 10, 10
  self.width      = 16
  self.height     = 32
  self.xspeed     = 0
  self.yspeed     = 0
  self.move_speed = 100
  self.world      = nil
  self.grounded   = false

  self.sprite = Image.characters.character01
end

function Player:update(dt)
  local oldX, oldY = self.x, self.y
  if nil == self.world then
    self.world = self.scene:findEntryWithName(World.DEFAULT_NAME)
  end

  self.xspeed = 0
  if Input:isDown(self.class.KEYS.RIGHT) then
    self.xspeed = self.move_speed
  elseif Input:isDown(self.class.KEYS.LEFT) then
    self.xspeed = - self.move_speed
  end

  if Input:wasPressed(self.class.KEYS.JUMP) and self.grounded then
    self.yspeed = -self.class.JUMP_SPEED
  end

  self.yspeed = self.yspeed + Player.GRAVITY * dt
  self.yspeed = math.min(Player.MAX_FALL_SPEED, self.yspeed)
  self.y = self.y + self.yspeed * dt
  if self.world:isInCollisionWith(self.x, self.y, self.width, self.height) then
    self.y = oldY
    self.yspeed = self.yspeed / 2
    self.grounded = true
  else
    self.grounded = false
  end

  self.x = self.x + self.xspeed * dt
  if self.world:isInCollisionWith(self.x, self.y, self.width, self.height) then
    self.x = oldX
  end
end

function Player:draw()
  love.graphics.draw(self.sprite, self.x, self.y)
end

return Player
