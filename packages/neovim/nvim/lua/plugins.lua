local fn = vim.fn

require("lazy").setup({
  -- Themes
  { '0x706b/monotone.nvim', enabled = false },
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
    'ramojus/mellifluous.nvim',
    priority = 9999,
    config = function()
      require("config.colorscheme.current_color").set_colorscheme("mellifluous")
    end
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
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "onsails/lspkind.nvim"
    },
    config = function ()
      require('config.cmp')
    end
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require('config.lspsaga')
    end,
    dependencies = {
      "nvim-lspconfig",
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
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

  -- Telescope

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
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

  {
    'HerringtonDarkholme/yats.vim',
    config = function ()
      vim.g.yats_host_keyword = 0
    end
  },
  'othree/yajs.vim',
  'Quramy/vim-js-pretty-template',
  'MaxMEllon/vim-jsx-pretty',
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
    config = function()
      require'config.indent-blankline'
    end
  },

  {
   'easymotion/vim-easymotion',
   config = function ()
     vim.api.nvim_command('source ~/.config/nvim/config/easymotion.vim')
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

  {
    "numtostr/FTerm.nvim",
    config = function ()
      require'config.fterm'
    end
  },

  'rktjmp/lush.nvim',

  -- Treesitter

  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    dependencies = { 'nvim-treesitter/playground' },
    config = function ()
      require'config.treesitter'
    end
  },

  {
    'windwp/nvim-ts-autotag',
    config = function ()
      require("config.nvim-ts-autotag")
    end
  },

  "JoosepAlviste/nvim-ts-context-commentstring",

  {
    'windwp/nvim-autopairs',
    config = function ()
      require("config.nvim-autopairs")
    end
  },

  "edgedb/edgedb-vim"
})
