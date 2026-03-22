local function split (inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

local M = {}

M.getHighlight = function (group)
  local output = vim.cmd('hi ' .. group)
  local list = split(output)
  local dict = {}
  for item in list do
    if string.match(item, '=') then
      local splitted = split(item, '=')
      dict[splitted[0]] = dict[splitted[1]]
    end
  end
  return dict
end

return M
