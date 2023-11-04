-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'RRethy/nvim-base16'}
  use {'mattn/emmet-vim'}
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'EdenEast/nightfox.nvim'}
  use {'nyoom-engineering/oxocarbon.nvim'}
  use {"catppuccin/nvim", as = "catppuccin" }
  use {'shaunsingh/nord.nvim'}
  use { "cseelus/vim-colors-lucid"}
  use { "TheNiteCoder/mountaineer.vim"}
  use { "owickstrom/vim-colors-paramount"}
  use {"nikolvs/vim-sunbather"}
  use {"rakr/vim-two-firewatch"}
  use {'olivercederborg/poimandres.nvim'}
  use { 'Everblush/nvim', as = 'everblush' }
  use {'morhetz/gruvbox'}
  use {'sainnhe/everforest'}
  use {'hachy/eva01.vim'}
  use {'bluz71/vim-moonfly-colors'}

  use {'nvim-treesitter/nvim-treesitter', {run = 'TSUpdate'}}
  use {'fatih/vim-go',  run = ':GoUpdateBinaries' }
  use {'windwp/nvim-ts-autotag'}
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'}
	  }
  }

  use {
    'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }

  use { 'mlaursen/vim-react-snippets'}
  use {'rafamadriz/friendly-snippets'}
  use {"lukas-reineke/indent-blankline.nvim"}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  use {'norcalli/nvim-colorizer.lua'}
  use {'luochen1990/rainbow'}
  use {'jsborjesson/vim-uppercase-sql'}
end)
