require'indent_blankline'.setup {
  char = '│',
  buftype_exclude = { 'nofile' },
  -- show_current_context = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  context_patterns = {
    'class',
    'function',
    'method',
    '^if',
    'switch',
    'case',
    'while',
    'try',
    'expression',
    'object',
    'statement',
    'ternary'
  }
}
