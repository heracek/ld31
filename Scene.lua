local Scene = class("Scene")

function Scene:initialize()
  self._entries = {}
end

function Scene:addEntry(entry)
  table.insert(self._entries, entry)
  entry:setScene(self)
  return entry
end

function Scene:update(dt)
  for _, entry in ipairs(self._entries) do
    entry:update(dt)
  end
end

function Scene:draw()
  for _, entry in ipairs(self._entries) do
    entry:draw()
  end
end

return Scene
