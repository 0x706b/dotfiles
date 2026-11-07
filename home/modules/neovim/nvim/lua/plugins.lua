local fn = vim.fn

require("lazy").setup({
  -- AI

  {
    "copilotlsp-nvim/copilot-lsp",
    config = function()
      require("config.copilot-lsp")
    end,
  },

  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('config.minuet')
    end,
  },

  -- Completion

  {
    "saghen/blink.cmp",
    enabled = true,
    branch = "main",
    build = function()
      require('blink.cmp').build():pwait()
    end,
    dependencies = {
      "saghen/blink.lib",
      "fang2hou/blink-copilot"
    },
    config = function()
      require('config.blink-cmp')
    end,
  },

  -- Editing

  {
    'jdhao/better-escape.vim',
    config = function ()
      vim.g.better_escape_interval = 300
      vim.g.better_escape_shortcut = { 'jj' }
    end
  },

  {
    'numToStr/Comment.nvim',
    config = function ()
      require("config.comment")
    end
  },

  'tpope/vim-surround',

  {
    'windwp/nvim-autopairs',
    config = function ()
      require("config.nvim-autopairs")
    end
  },

  -- File navigation

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
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

  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("config.telescope")
    end
  },

  -- Git

  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require'config.gitsigns'
    end
  },

  'tpope/vim-fugitive',

  -- Languages

  "edgedb/edgedb-vim",

  {
    "mrcjkb/haskell-tools.nvim",
    tag = '3.1.9',
    config = function()
      require("config.haskell-tools")
    end
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "p00f/clangd_extensions.nvim",
  },

  'purescript-contrib/purescript-vim',

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

  -- LSP

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
    "aznhe21/actions-preview.nvim",
    config = function ()
      require("config.actions-preview")
    end
  },

  {
    "elentok/format-on-save.nvim",
    config = function()
      require("config.format-on-save")
    end
  },

  {
    'neovim/nvim-lspconfig',
    branch = "master",
    config = function ()
      require('config.lsp')
    end
  },

  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   config = function ()
  --     require('config.typescript-tools')
  --   end
  -- },

  {
    "smjonas/inc-rename.nvim",
    config = function ()
      require("config.inc-rename")
    end
  },

  -- Themes

  { '0x706b/crumbling.nvim', enabled = false },

  {
    '0x706b/monotone.nvim',
    priority = 9999,
    enabled = false,
    config = function()
      require("config.colorscheme.current_color").set_colorscheme("monotone")
    end,
  },

  { '0x706b/parchment.nvim', enabled = false },

  { '0x706b/zenburn.nvim', enabled = false },

  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    enabled = false
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
    "catppuccin/nvim",
    priority = 9999,
    config = function()
      require("config.colorscheme.current_color").set_colorscheme("catppuccin")
    end,
    enabled = false
  },

  { 'ellisonleao/gruvbox.nvim', enabled = false },

  { 'lifepillar/vim-solarized8', enabled = false },

  { 'mcchrish/zenbones.nvim', enabled = false },

  { 'Mofiqul/dracula.nvim', enabled = false },

  { "projekt0n/github-nvim-theme", enabled = false },

  {
    'ramojus/mellifluous.nvim',
    priority = 9999,
    config = function()
      require("config.colorscheme.current_color").set_colorscheme("mellifluous")
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

  'rktjmp/lush.nvim',

  { 'sainnhe/everforest', enabled = false },

  { 'sainnhe/sonokai', enabled = false },

  {
    "vague2k/vague.nvim",
    priority = 9999,
    config = function ()
      require("config.colorscheme.current_color").set_colorscheme("vague")
    end,
    enabled = false,
  },

  -- Treesitter

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
    'nvim-treesitter/nvim-treesitter',
    branch = "main",
    run = ':TSUpdate',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      -- 'nvim-treesitter/playground',
    },
    config = function ()
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
      require'config.treesitter'
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function ()
      require('config.nvim-ts-autotag')
    end
  },

  {
    'windwp/nvim-ts-autotag',
    config = function ()
      require("config.nvim-ts-autotag")
    end
  },

  -- UI

  {
    "folke/drop.nvim"
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
    config = function()
      require("config.noice")
    end
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

  {
    'lukas-reineke/indent-blankline.nvim',
    commit = "e7a4442e055ec953311e77791546238d1eaae507",
    config = function()
      require'config.indent-blankline'
    end
  },

  {
    "mvllow/modes.nvim",
    config = function()
      require("config.modes")
    end
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require("config.nvim-colorizer")
    end
  },

  'nvim-tree/nvim-web-devicons',

  {
    "petertriho/nvim-scrollbar",
    version = "v1",
    config = function ()
      require("config.nvim-scrollbar")
    end
  },

  {
    'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require'config.barbar'
    end
  },

  'ryanoasis/vim-devicons',

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
})
