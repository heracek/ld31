require "lib.TLfres"

function love.load()
  TLfres.setScreen({w=640, h=480, full=false, vsync=true, aa=0}, 320, false, false)
end

function love.update(dt)
end

function love.draw()
  TLfres.transform()

  TLfres.letterbox(4,3)
end

function love.keypressed(key)
  if (key == 'escape') then
    love.event.quit()
  end
end
