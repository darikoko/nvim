local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'christoomey/vim-tmux-navigator'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-autopairs'

  -- My Themes
  use 'Mofiqul/dracula.nvim'
  use 'morhetz/gruvbox'
  use 'yorickpeterse/happy_hacking.vim'
  use 'catppuccin/vim'

  -- Svelte support
  use 'othree/html5.vim'
  use 'pangloss/vim-javascript'
  use 'evanleck/vim-svelte'

  -- Stylus support
  use 'ChiliConSql/neovim-stylus'

  -- HTML Utilities
  use 'tpope/vim-surround'
  use 'AndrewRadev/tagalong.vim'

  use 'karb94/neoscroll.nvim'


  -- V support
  use 'ollykel/v-vim'

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  
  -- cmp
  use {
     'ms-jpq/coq_nvim',
     branch = 'coq',
     event = "VimEnter",
     config = 'vim.cmd[[COQnow]]'
}

  -- Completion with coq
  use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

  -- Format code
  use 'sbdchd/neoformat'


  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
