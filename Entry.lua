local Entry = class("Entry")

function Entry:initialize()
  self.scene = nil
end

function Entry:update(dt)
end

function Entry:draw()
end

function Entry:setScene(scene)
  self.scene = scene
end

return Entry
