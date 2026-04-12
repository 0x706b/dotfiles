local fn = vim.fn

require("lazy").setup({
  -- Themes
  { '0x706b/zenburn.nvim', enabled = false },
  { '0x706b/crumbling.nvim', enabled = false },
  { '0x706b/parchment.nvim', enabled = false },
  { 'mcchrish/zenbones.nvim', enabled = false },
  { 'sainnhe/sonokai', enabled = false },
  { 'lifepillar/vim-solarized8', enabled = false },
  { 'Mofiqul/dracula.nvim', enabled = false },
  { 'ellisonleao/gruvbox.nvim', enabled = false },
  { "projekt0n/github-nvim-theme", enabled = false },

  {
    '0x706b/monotone.nvim',
    priority = 9999,
    enabled = false,
    config = function()
      require("config.colorscheme.current_color").set_colorscheme("monotone")
    end,
  },
  {
    "catppuccin/nvim",
    priority = 9999,
    config = function()
      require("config.colorscheme.current_color").set_colorscheme("catppuccin")
    end,
    enabled = false
  },

  {
    'ramojus/mellifluous.nvim',
    priority = 9999,
    config = function()
      require("config.colorscheme.current_color").set_colorscheme("mellifluous")
    end,
    enabled = false,
  },

  {
    'baliestri/aura-theme',
    lazy = false,
    priority = 9999,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      require("config.colorscheme.current_color").set_colorscheme("aura")
    end,
    enabled = false,
  },

  {
    "vague2k/vague.nvim",
    priority = 9999,
    config = function ()
      require("config.colorscheme.current_color").set_colorscheme("vague")
    end,
    enabled = true,
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 9999,
    config = function ()
      require("config.colorscheme.current_color").set_colorscheme("kanagawa")
    end,
    enabled = false,
  },

  { 'sainnhe/everforest', enabled = false },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    enabled = false
  },

  {
    'glepnir/galaxyline.nvim',
    config = function ()
      require("config.galaxyline")
    end,
    dependencies =
      {
        { 'nvim-tree/nvim-web-devicons', opt = true },
      }
  },

  'purescript-contrib/purescript-vim',

  -- LSP

  {
    'neovim/nvim-lspconfig',
    branch = "master",
    config = function ()
      require('config.lsp')
    end
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function ()
      require('config.typescript-tools')
    end
  },

  {
    "windwp/nvim-ts-autotag",
    config = function ()
      require('config.nvim-ts-autotag')
    end
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "neovim/nvim-lspconfig",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-cmdline",
  --     "hrsh7th/cmp-vsnip",
  --     "hrsh7th/vim-vsnip",
  --     -- "hrsh7th/cmp-nvim-lsp-signature-help",
  --     "onsails/lspkind.nvim",
  --     "David-Kunz/cmp-npm",
  --   },
  --   config = function ()
  --     require('config.cmp')
  --   end
  -- },

  {
    "saghen/blink.cmp",
    version = "1.x",
    config = function()
      require('config.blink-cmp')
    end,
  },

  -- {
  --   "nvimdev/lspsaga.nvim",
  --   config = function()
  --     require('config.lspsaga')
  --   end,
  --   dependencies = {
  --     "nvim-lspconfig",
  --     'nvim-treesitter/nvim-treesitter',
  --     'nvim-tree/nvim-web-devicons',
  --   }
  -- },

  {
    "aznhe21/actions-preview.nvim",
    config = function ()
      require("config.actions-preview")
    end
  },

  {
    "smjonas/inc-rename.nvim",
    config = function ()
      require("config.inc-rename")
    end
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("config.lsp_signature")
    end
  },

  {
    "mrcjkb/haskell-tools.nvim",
    tag = '3.1.9',
    config = function()
      require("config.haskell-tools")
    end
  },

  -- Neotree

  {
    "0x706b/neo-tree.nvim",
    branch = "feat/allow-win-options-override",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('config.neotree')
    end
  },

  -- Telescope

  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("config.telescope")
    end
  },

  {
    "elentok/format-on-save.nvim",
    config = function()
      require("config.format-on-save")
    end
  },

  -- Typescript

  -- {
  --   'HerringtonDarkholme/yats.vim',
  --   config = function ()
  --     vim.g.yats_host_keyword = 0
  --   end
  -- },
  -- 'othree/yajs.vim',
  -- 'Quramy/vim-js-pretty-template',
  -- 'MaxMEllon/vim-jsx-pretty',
  {
    'numToStr/Comment.nvim',
    config = function ()
      require("config.comment")
    end
  },
  'ryanoasis/vim-devicons',
  'tpope/vim-surround',
  'tpope/vim-fugitive',

  {
    'jdhao/better-escape.vim',
    config = function ()
      vim.g.better_escape_interval = 300
      vim.g.better_escape_shortcut = { 'jj' }
    end
  },

  'nvim-tree/nvim-web-devicons',

  {
    'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require'config.barbar'
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    commit = "e7a4442e055ec953311e77791546238d1eaae507",
    config = function()
      require'config.indent-blankline'
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require'config.gitsigns'
    end
  },

  'rktjmp/lush.nvim',

  -- Treesitter

  {
    'nvim-treesitter/nvim-treesitter',
    branch = "master",
    run = ':TSUpdate',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/playground',
    },
    config = function ()
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
      require'config.treesitter'
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    config = function ()
      require("config.nvim-ts-autotag")
    end
  },

  {
    'windwp/nvim-autopairs',
    config = function ()
      require("config.nvim-autopairs")
    end
  },

  "edgedb/edgedb-vim",

  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    config = function()
      require("config.nvim-metals")
    end
  },

  {
    "mvllow/modes.nvim",
    config = function()
      require("config.modes")
    end
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  -- {
  --   'luckasRanarison/tailwind-tools.nvim',
  --   name = "tailwind-tools",
  --   build = ":UpdateRemotePlugins",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim", -- optional
  --     "neovim/nvim-lspconfig", -- optional
  --   },
  --   opts = {} -- your configuration
  -- },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("config.noice")
    end
  },

  {
    "folke/drop.nvim"
  },

  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "0x706b/neo-tree.nvim"
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    config = function ()
      require("config.nvim-scrollbar")
    end
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require("config.nvim-colorizer")
    end
  },

  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>",  { silent = true, desc = "navigate left or tab"  } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
      { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" } },
    },
    opts = {},
  },

  {
    "p00f/clangd_extensions.nvim",
    config = function ()
      -- require("config.clangd_extensions")
    end
  },

  -- OpenCode
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    dependencies = {
      {
        "folke/snacks.nvim",
        opts = {
          input = {}, -- Enhances `ask()`
          picker = { -- Enhances `select()`
            actions = {
              opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      }
    },
    config = function()
      require("config.opencode")
    end,
  },

  -- llama.nvim
  -- {
  --   "hmunye/llama.nvim",
  --   dependencies = {},
  --   config = function()
  --     require("config.llama")
  --   end
  -- },

  -- Minuet
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('config.minuet')
    end,
  }
})
