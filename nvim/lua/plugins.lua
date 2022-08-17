local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "ellisonleao/gruvbox.nvim",
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'mhartington/oceanic-next'
  use 'nvim-lualine/lualine.nvim'
  use 'neovim/nvim-lspconfig' 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'nvim-lua/plenary.nvim'
  use 'BurntSushi/ripgrep'
  use 'sharkdp/fd'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'kyazdani42/nvim-web-devicons'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use({
    "glepnir/lspsaga.nvim",
    branch = "main"
  }) 
  use "windwp/nvim-autopairs"
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release' -- To use the latest release
  }
  use {
    'dinhhuy258/git.nvim'
}
  use 'terrortylor/nvim-comment'
end)
