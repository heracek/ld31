local state = {}

function state:init()
  character = Image.characters.character01
end

function state:draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.clear()

  love.graphics.draw(character, 0, 0)

  love.graphics.print("Hello World!", 150, 220)
end

return state
