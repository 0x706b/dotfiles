require'ibl'.setup {
  indent = {
    char = '│'
  },
  exclude = {
    buftypes = { 'nofile' }
  },
  whitespace = {
    remove_blankline_trail = true,
  },
  scope = {
    show_start = false,
    include = {
      node_type = {
        ["*"] = {
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
    }
  }
}
