local gl = require "galaxyline"
local colors = require 'colors.current'

gl.short_line_list = { 'coc-explorer' }

local gls = gl.section

local vcs = require "galaxyline.provider_vcs"

local condition = require('galaxyline.condition')

local modes = {
  n = "normal",
  v = "visual (char)",
  V = "visual (line)",
  [""] = "visual (block)",
  s = "select (char)",
  S = "select (line)",
  [""] = "select (block)",
  i = "insert",
  ic = "completion",
  ix = "completion",
  R = "replace",
  Rc = "completion",
  Rx = "completion",
  c = "command",
  cv = "ex",
  ce = "normal ex",
  r = "hit enter",
  ["r?"] = "confirm",
  ["!"] = "command",
  t = "terminal"
}

local mode_color = {
  n = colors.fg2,
  i = colors.n.green,
  v = colors.n.blue,
  [""] = colors.n.blue,
  V = colors.n.blue,
  c = colors.n.red,
  no = colors.n.magenta,
  s = colors.n.yellow,
  S = colors.n.yellow,
  [""] = colors.n.yellow,
  ic = colors.n.yellow,
  R = colors.n.magenta,
  Rv = colors.n.magenta,
  cv = colors.n.red,
  ce = colors.n.red,
  r = colors.n.blue,
  rm = colors.n.blue,
  ["r?"] = colors.n.blue,
  ["!"] = colors.n.red,
  t = colors.n.red
}

local buf_icon = {
  help             = '  ',
  defx             = '  ',
  nerdtree         = '  ',
  denite           = '  ',
  ['vim-plug']     = '  ',
  dbui             = '  ',
  magit            = '  ',
  NvimTree         = '  ',
  ['coc-explorer'] = '  ',
}

local icons = {
  lock = '',
  pencil = ''
}

local hi_normal = { colors.fg2, colors.bg1 }
local hi_reversed = { colors.bg, colors.fg2 }

local hi_separator = { colors.fg2, colors.bg1 }

local path_separator = '/'

local path_to_matching_str = function (path)
  return path:gsub('(%-)', '(%%-)'):gsub('(%.)', '(%%.)'):gsub('(%_)', '(%%_)')
end

local path_add_trailing = function (path)
  if path:sub(-1) == path_separator then
    return path
  end

  return path..path_separator
end

local path_relative = function (path, relative_to)
  local p, _ = path:gsub("^" .. path_to_matching_str(path_add_trailing(relative_to)), "")
  return p
end

gls.short_line_left[1] = {
  BufferType = {
    provider = function ()
      return vim.bo.filetype
    end,
    separator = ' ',
    separator_highlight = hi_separator,
    highlight = {colors.fg1, colors.bg1, 'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = function ()
      return buf_icon[vim.bo.filetype] or ''
    end,
    highlight = {colors.fg1, colors.bg1, 'bold'}
  }
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

local function file_readonly(readonly_icon)
  if vim.bo.filetype == 'help' then
    return ''
  end
  local icon = readonly_icon or ''
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ''
end

gls.left[1] = {
  Edge = {
    provider = function()
      local mode = vim.fn.mode()
      vim.api.nvim_command("hi GalaxyEdge guifg=" .. mode_color[mode])
      return "▊ "
    end,
    highlight = {colors.n.blue, colors.bg1}
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local mode = vim.fn.mode()
      -- auto change color according the vim mode
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[mode])
      return modes[mode]
    end,
    separator = ' ',
    separator_highlight = hi_separator,
    highlight = {colors.fg2, colors.bg1, "bold"}
  }
}

gls.left[3] = {
  Slant_1 = {
    provider = function () return '' end,
    condition = condition.check_git_workspace,
    highlight = { colors.fg2, colors.bg1 }
  }
}

gls.left[4] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = '<-',
    separator_highlight = { colors.bg, colors.fg2, 'bold' },
    highlight = { colors.bg, colors.fg2, 'bold' },
  }
}

gls.left[5] = {
  GitBranch = {
    provider = function ()
      local branch = vcs.get_git_branch()
      if branch then
        return branch .. ' '
      end
      return
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.bg, colors.fg2, 'bold'},
  }
}

gls.left[6] = {
  Slant_2 = {
    provider = function () return ' ' end,
    condition = condition.check_git_workspace,
    highlight = { colors.fg2, colors.bg1 }
  }
}

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.git.add, colors.bg1},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = {colors.git.change, colors.bg1},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.git.delete, colors.bg1},
  }
}

gls.left[10] = {
  FilePath = {
    provider = function ()
      local squeeze_width = vim.fn.winwidth(0) / 3
      local path = path_relative(vim.fn.expand('%:p'), vim.fn.getcwd())
      if string.len(path) > squeeze_width then
        path = '<' .. string.sub(path, string.len(path) - squeeze_width - 1)
      end
      if vim.fn.empty(path) == 1 then return '' end
      if string.len(file_readonly(icons.lock)) ~= 0 then
        return ' ' .. path .. file_readonly(icons.pencil)
      end
      if vim.bo.modifiable then
        if vim.bo.modified then
          return ' ' .. path .. ' ' .. icons.pencil .. '  '
        end
      end
      return ' ' .. path .. ' '
    end,
    condition = buffer_not_empty,
    highlight = hi_normal
  }
}

gls.mid[0] = {
  ShowLspClient = {
    provider = function ()
      return (vim.g.coc_status or '') .. (vim.b.coc_current_function or '')
    end,
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP: ',
    highlight = {colors.n.blue, colors.bg1, 'bold'}
  }
}

gls.right[1] = {
  FileEncoding = {
    provider = function ()
      local encoding = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
      local format = vim.bo.fileformat
      return format .. ' ' .. encoding .. ' '
    end,
    condition = buffer_not_empty,
    highlight = hi_normal
  }
}

gls.right[2] = {
  FileSize = {
    provider = 'FileSize',
    separator = ' ',
    condition = buffer_not_empty,
    highlight = hi_normal,
    separator_highlight = hi_separator
  }
}

gls.right[3] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg1},
  },
}

gls.right[4] = {
  FileType = {
    provider = function ()
      return vim.bo.filetype .. ' '
    end,
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg1 }
  }
}

gls.right[5] = {
  Slant_3 = {
    provider = function () return '' end,
    highlight = { colors.fg2, colors.bg1 }
  }
}

gls.right[6] = {
  LineInfo = {
    provider = function ()
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return string.format("  %3d : %2d ", line, column)
    end,
    highlight = hi_reversed,
  },
}

gls.right[7] = {
  Slant_4 = {
    provider = function () return '' end,
    highlight = { colors.fg2, colors.bg1 }
  }
}

gls.right[8] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = hi_separator,
    highlight = { colors.fg2, colors.bg1, 'bold' },
  }
}

gls.right[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
    highlight = {colors.bg, colors.b.red},
    separator = '',
    separator_highlight = { colors.bg1, colors.b.red }
  }
}
gls.right[10] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ',
    highlight = {colors.bg, colors.b.yellow},
    separator = '',
    separator_highlight = { colors.b.red, colors.b.yellow }
  }
}

gls.right[11] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = ' ',
    highlight = { colors.b.blue, colors.bg1 },
    separator = '',
    separator_highlight = { colors.b.yellow, colors.bg1 }
  }
}
