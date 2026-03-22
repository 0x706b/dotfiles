local M = {}

M.lushToHex = function (colors)
  local hex = {}
  for k, v in pairs(colors) do
    local h = v.hex
    if h ~= nil then
      hex[k] = h
    else
      hex[k] = M.lushToHex(v)
    end
  end
  return hex
end

return M
