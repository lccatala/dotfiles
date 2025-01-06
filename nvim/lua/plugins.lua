local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
  },
  {
      'savq/melange-nvim',
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --       require("cyberdream").setup({
  --           -- Recommended - see "Configuring" below for more config options
  --           transparent = true,
  --           italic_comments = true,
  --           hide_fillchars = true,
  --           borderless_telescope = true,
  --       })
  --       vim.cmd("colorscheme cyberdream") -- set the colorscheme
  --   end,
  -- },
  -- {name: W
  --   "ColinKennedy/hybrid2.nvim",
  --   priority = 1000,  -- Load this first
  -- },
  -- { 
  --     "craftzdog/solarized-osaka.nvim", 
  --     priority=1000, 
  --     lazy=true,
  --     config = function()
  --         vim.cmd[[colorscheme solarized-osaka]]
  --     end
  -- }, 
  { "folke/neodev.nvim", opts = {}},
  {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
          -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
          "MunifTanjim/nui.nvim",
          -- OPTIONAL:
            -- `nvim-notify` is only needed, if you want to use the notification view.
          --   If not available, we use `mini` as the fallback
          -- "rcarriga/nvim-notify",
          {'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'},
      }
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  { 'rose-pine/neovim', name = 'rose-pine' },
  'nvim-lualine/lualine.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'BurntSushi/ripgrep',
  'sharkdp/fd',
  'kyazdani42/nvim-web-devicons',
  {'nvim-telescope/telescope.nvim', branch = 'master',dependencies= { {'nvim-lua/plenary.nvim'} }},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  "windwp/nvim-autopairs",
  'dinhhuy258/git.nvim',
  'lewis6991/gitsigns.nvim',
  'terrortylor/nvim-comment',
  'onsails/lspkind.nvim',
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-dap-python',
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  'theHamsta/nvim-dap-virtual-text',

  'mbbill/undotree',
  'ThePrimeagen/harpoon',
  'jamestthompson3/nvim-remote-containers',
  {'VonHeikemen/searchbox.nvim',dependencies = {{'MunifTanjim/nui.nvim'}}},
  'AckslD/swenv.nvim',
 {'stevearc/dressing.nvim'},
 "nvim-tree/nvim-tree.lua",
 "williamboman/mason.nvim",
 {
     "L3MON4D3/LuaSnip",
     -- follow latest release.
     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
     -- install jsregexp (optional!).
     build = "make install_jsregexp"
 },
 'nvimdev/lspsaga.nvim',
 {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
})

