local M = {}
M.initialized = false

local set_hl = vim.api.set_hl

local function everforest_custom()
  local configuration = vim.fn["everforest#get_configuration"]()
  local palette = vim.fn["everforest#get_palette"](configuration.background, configuration.colors_override)

  local everforest_highlight = vim.fn["everforest_highlight"]

  everforest_highlight('CursorLineNr', palette.grey2, palette.bg1)
  everforest_highlight('typescriptCall', palette.fg, palette.none, 'italic')
  everforest_highlight('typescriptOperator', palette.orange, palette.none)

  set_hl(0, "Delimiter", { link = "Orange" })
  set_hl(0, "Type", { link = "Blue" })
  set_hl(0, "typescriptTypeReference", { link = "Type" })
  set_hl(0, "typescriptTypeParameter", { link = "Blue" })
  set_hl(0, "typescriptFuncType", { link = "Fg" })
  set_hl(0, "typescriptFuncTypeArrow", { link = "Orange" })
  set_hl(0, "typescriptArrowFunc", { link = "Orange" })
  set_hl(0, "typescriptArrowFuncArg", { link = "typescriptCall" })
  set_hl(0, "typescriptTypeBrackets", { link = "Delimiter" })
  set_hl(0, "typescriptDotNotation", { link = "Delimiter" })
  set_hl(0, "typescriptTypeAnnotation", { link = "Delimiter" })
  set_hl(0, "typescriptBinaryOp", { link = "typescriptOperator" })
  set_hl(0, "typescriptTernaryOp", { link = "typescriptOperator" })
  set_hl(0, "typescriptTypeQuery", { link = "typescriptOperator" })
  set_hl(0, "typescriptMappedIn", { link = "typescriptOperator" })
  set_hl(0, "typescriptAssign", { link = "typescriptOperator" })
  set_hl(0, "typescriptUnaryOp", { link = "typescriptOperator" })
  set_hl(0, "typescriptBracket", { link = "Delimiter" })
  set_hl(0, "typescriptPredefinedType", { link = "Type" })
  set_hl(0, "typescriptTypeArguments", { link = "Delimiter" })
  set_hl(0, "typescriptInterfaceName", { link = "Type" })
  set_hl(0, "typescriptClassName", { link = "Type" })
  set_hl(0, "typescriptAliasDeclaration", { link = "Type" })
  set_hl(0, "typescriptNull", { link = "Number" })
  set_hl(0, "typescriptBoolean", { link = "Number" })
  set_hl(0, "tsxIntrinsicTagName", { link = "Special" })
  set_hl(0, "tsxTagName", { link = "Type" })
  set_hl(0, "tsxTag", { link = "Delimiter" })
  set_hl(0, "tsxCloseTag", { link = "Delimiter" })
  set_hl(0, "tsxCloseString", { link = "Delimiter" })
  set_hl(0, "tsxAttrib", { link = "Normal" })
  set_hl(0, "tsxEqual", { link = "Delimiter" })
  set_hl(0, "typescriptExport", { link = "Purple" })
  set_hl(0, "typescriptFuncKeyword", { link = "Red" })
  set_hl(0, "Conditional", { link = "Red" })
  set_hl(0, "Repeat", { link = "Red" })
  set_hl(0, "typescriptVariableDeclaration", { link = "Normal" })
  set_hl(0, "typescriptParens", { link = "Delimiter" })
  set_hl(0, "typescriptBraces", { link = "Delimiter" })
end

M.init = function ()
  vim.cmd.colorscheme("everforest")

  everforest_custom()

  local configuration = vim.fn["everforest#get_configuration"]()
  local palette = vim.fn["everforest#get_palette"](configuration.background, configuration.colors_override)


  M.galaxyline_colors = {
    bg = palette.bg0[1],
    bg0 = palette.bg1[1],
    bg1 = palette.bg1[1],
    bg2 = palette.bg3[1],
    fg = palette.fg[1],
    fg0 = palette.grey2[1],
    fg1 = palette.grey1[1],
    fg2 = palette.grey0[1],
    b = {
      red = palette.red[1],
      yellow = palette.yellow[1],
      blue = palette.blue[1]
    },
    n = {
      yellow = palette.yellow[1],
      red = palette.red[1],
      blue = palette.blue[1],
      green = palette.green[1],
      magenta = palette.purple[1]
    },
    git = {
      add = palette.green[1],
      change = palette.blue[1],
      delete = palette.red[1]
    }
  }

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M

