-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/peter/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/peter/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/peter/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/peter/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/peter/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.fterm\frequire\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numtostr/FTerm.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.barbar\frequire\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["better-escape.vim"] = {
    config = { "\27LJ\2\nf\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1,\1=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\2\0\0\ajj\27better_escape_shortcut\27better_escape_interval\6g\bvim\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/better-escape.vim",
    url = "https://github.com/jdhao/better-escape.vim"
  },
  ["coc-fzf"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/coc-fzf",
    url = "https://github.com/antoinemadec/coc-fzf"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\nY\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0)source ~/.config/nvim/config/coc.vim\17nvim_command\bapi\bvim\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["crumbling.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/crumbling.nvim",
    url = "https://github.com/0x706b/crumbling.nvim"
  },
  delimitMate = {
    config = { "\27LJ\2\n`\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\29delimitMate_expand_space\26delimitMate_expand_cr\6g\bvim\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/delimitMate",
    url = "https://github.com/Raimondi/delimitMate"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  everforest = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  fzf = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nY\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0)source ~/.config/nvim/config/fzf.vim\17nvim_command\bapi\bvim\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.galaxyline\frequire\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28config.indent-blankline\frequire\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["monotone.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/monotone.nvim",
    url = "https://github.com/0x706b/monotone.nvim"
  },
  nerdcommenter = {
    config = { "\27LJ\2\nc\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0003source ~/.config/nvim/config/nerdcommenter.vim\17nvim_command\bapi\bvim\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parchment.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/parchment.nvim",
    url = "https://github.com/0x706b/parchment.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["purescript-vim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/purescript-vim",
    url = "https://github.com/purescript-contrib/purescript-vim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com//Users/peter/dev/rose-pine"
  },
  sonokai = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easymotion"] = {
    config = { "\27LJ\2\n`\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0000source ~/.config/nvim/config/easymotion.vim\17nvim_command\bapi\bvim\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-js-pretty-template"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/vim-js-pretty-template",
    url = "https://github.com/Quramy/vim-js-pretty-template"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty",
    url = "https://github.com/MaxMEllon/vim-jsx-pretty"
  },
  ["vim-solarized8"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/vim-solarized8",
    url = "https://github.com/lifepillar/vim-solarized8"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["yajs.vim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/yajs.vim",
    url = "https://github.com/othree/yajs.vim"
  },
  ["yats.vim"] = {
    config = { "\27LJ\2\n3\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\22yats_host_keyword\6g\bvim\0" },
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/yats.vim",
    url = "https://github.com/HerringtonDarkholme/yats.vim"
  },
  ["zenbones.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  },
  ["zenburn.nvim"] = {
    loaded = true,
    path = "/Users/peter/.local/share/nvim/site/pack/packer/start/zenburn.nvim",
    url = "https://github.com/0x706b/zenburn.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: delimitMate
time([[Config for delimitMate]], true)
try_loadstring("\27LJ\2\n`\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\29delimitMate_expand_space\26delimitMate_expand_cr\6g\bvim\0", "config", "delimitMate")
time([[Config for delimitMate]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.fterm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: vim-easymotion
time([[Config for vim-easymotion]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0000source ~/.config/nvim/config/easymotion.vim\17nvim_command\bapi\bvim\0", "config", "vim-easymotion")
time([[Config for vim-easymotion]], false)
-- Config for: better-escape.vim
time([[Config for better-escape.vim]], true)
try_loadstring("\27LJ\2\nf\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1,\1=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\2\0\0\ajj\27better_escape_shortcut\27better_escape_interval\6g\bvim\0", "config", "better-escape.vim")
time([[Config for better-escape.vim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0)source ~/.config/nvim/config/coc.vim\17nvim_command\bapi\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.barbar\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28config.indent-blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0)source ~/.config/nvim/config/fzf.vim\17nvim_command\bapi\bvim\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: nerdcommenter
time([[Config for nerdcommenter]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0003source ~/.config/nvim/config/nerdcommenter.vim\17nvim_command\bapi\bvim\0", "config", "nerdcommenter")
time([[Config for nerdcommenter]], false)
-- Config for: yats.vim
time([[Config for yats.vim]], true)
try_loadstring("\27LJ\2\n3\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\22yats_host_keyword\6g\bvim\0", "config", "yats.vim")
time([[Config for yats.vim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
