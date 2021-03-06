require "lib.TLfres"
class = require "lib.middleclass.middleclass"
GS = require "lib.hump.gamestate" -- GS is Gamestate
Input = require "Input"

function love.load()
  TLfres.setScreen({w=640, h=480, full=false, vsync=true, aa=0}, 320, false, false)
  love.graphics.setDefaultFilter('nearest')
  love.graphics.setLineStyle('rough')

  GS.registerEvents()
  GS.switch(State.game())
end

local gamestateDraw = GS.draw
GS.draw = function()
  TLfres.transform()

  Input:resetAllPressedKeys()

  gamestateDraw()

  TLfres.letterbox(4,3)
end

function love.keypressed(key)
  if ('escape' == key or 'q' == key) then
    love.event.quit()
  end
  Input:keypressed(key)
end

function love.keyreleased(key)
  Input:keyreleased(key)
end

local function LazyValueTable(getValueForKeyCallback)
  return setmetatable({}, {
    __index = function(table, key)
      local value = getValueForKeyCallback(key)
      table[key] = value
      return value
    end
  })
end

State = LazyValueTable(function(state) return require('states.'..state) end)
Image = LazyValueTable(function(directory)
  return LazyValueTable(function(filename) return love.graphics.newImage('img/'..directory..'/'..filename..'.png') end)
end)
