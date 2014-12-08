local Scene = class("Scene")

function Scene:initialize()
  self._entries = {}
end

function Scene:addEntry(entry)
  table.insert(self._entries, entry)
  table.sort(self._entries, function(entry_a, entry_b)
    return entry_a.zindex < entry_b.zindex
  end)
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

function Scene:findEntryWithName(name)
  for _, entry in ipairs(self._entries) do
    if entry.name == name then
      return entry
    end
  end
  return nil
end

return Scene
