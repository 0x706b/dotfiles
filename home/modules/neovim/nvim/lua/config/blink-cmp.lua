local kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
  Ollama = ' 󰚩 '
}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("blink.cmp").setup({
  appearance = {
    nerd_font_variant = "mono",
    use_nvim_cmp_as_default = true
  },
  sources = {
    default = {
      'lsp',
      -- 'minuet',
      'path',
      'buffer'
    },
    providers = {
      minuet = {
        name = 'minuet',
        module = 'minuet.blink',
        async = true,
        -- Should match minuet.config.request_timeout * 1000,
        -- since minuet.config.request_timeout is in seconds
        timeout_ms = 3000,
        score_offset = 50, -- Gives minuet higher priority among suggestions
      },
    },
  },
  keymap = {
    preset = "enter",
    -- Manually invoke minuet completion.
    ['<A-y>'] = require('minuet').make_blink_map(),
    ['<Tab>'] = {
      function(cmp)
        if cmp.is_menu_visible() then
          return cmp.select_next()
        elseif cmp.snippet_active() then
          return cmp.snippet_forward()
        end
      end,
      'fallback',
    },
    ['<S-Tab>'] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.snippet_backward()
        else
          return cmp.select_prev() end
      end,
      'fallback',
    },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = {
    enabled = true,
    trigger = {
      -- Show the signature help automatically
      enabled = true,
      -- Show the signature help window after typing any of alphanumerics, `-` or `_`
      show_on_keyword = false,
      blocked_trigger_characters = {},
      blocked_retrigger_characters = {},
      -- Show the signature help window after typing a trigger character
      show_on_trigger_character = true,
      -- Show the signature help window when entering insert mode
      show_on_insert = false,
      -- Show the signature help window when the cursor comes after a trigger character when entering insert mode
      show_on_insert_on_trigger_character = true,
    },
    window = {
      min_width = 1,
      max_width = 100,
      max_height = 10,
      border = nil, -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
      winblend = 0,
      winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
      scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
      -- Which directions to show the window,
      -- falling back to the next direction when there's not enough space,
      -- or another window is in the way
      direction_priority = { 'n', 's' },
      -- Can accept a function if you need more control
      -- direction_priority = function()
      --   if condition then return { 'n', 's' } end
      --   return { 's', 'n' }
      -- end,

      -- Disable if you run into performance issues
      treesitter_highlighting = true,
      show_documentation = true,
    },
  },
  completion = {
    trigger = { prefetch_on_insert = false },
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500
    },
    menu = {
      draw = {
        padding = { 0, 1 },
        components = {
          kind_icon = {
            text = function(ctx)
              local icon = ctx.kind_icon
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                      icon = dev_icon
                  end
              else
                  icon = kinds[ctx.kind] or ctx.kind
              end

              return icon .. ctx.icon_gap
            end,

            -- Optionally, use the highlight groups from nvim-web-devicons
            -- You can also add the same function for `kind.highlight` if you want to
            -- keep the highlight groups in sync with the icons.
            highlight = function(ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                  hl = dev_hl
                end
              end
              return hl
            end,
          }
        }
      }
    }
  },
})

