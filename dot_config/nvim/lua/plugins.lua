local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")

local packer = require("packer")
local util = require("packer.util")

packer.init({
	package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

  -- Auto indent detection
    packer.use("tpope/vim-sleuth")

  -- Auto Save
    packer.use("907th/vim-auto-save")

  -- Auto Pair
    packer.use("windwp/nvim-autopairs")

  -- Better mappings
    packer.use("b0o/mapx.nvim")

  -- Bufferline
    packer.use {
      'akinsho/bufferline.nvim',
      tag = "v2.*",
      requires = 'kyazdani42/nvim-web-devicons'
    }

  -- Color Sceme
    packer.use('folke/tokyonight.nvim')
    packer.use("kyazdani42/nvim-web-devicons")

  -- Comment
    packer.use("numToStr/Comment.nvim")

  -- Completion
    packer.use("hrsh7th/nvim-cmp") -- Engine
    packer.use("hrsh7th/cmp-nvim-lsp") -- LSP completion
    packer.use("hrsh7th/cmp-buffer") -- buffer completion
    packer.use("hrsh7th/cmp-path") -- path completion
    packer.use("saadparwaiz1/cmp_luasnip") -- complex completion

  -- Format and linting engine
    packer.use("jose-elias-alvarez/null-ls.nvim") -- Null LS

  -- Git Blame
    packer.use("f-person/git-blame.nvim")

  -- Git signals
    packer.use("lewis6991/gitsigns.nvim")

  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

  -- Indentation and blank lines indicators
    packer.use("lukas-reineke/indent-blankline.nvim")

  -- LazyGit integration
    packer.use("kdheepak/lazygit.nvim")

  -- LSP
    packer.use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {

       -- LSP Support
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
	{'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-nvim-lua'},

      -- Snippets
	{'L3MON4D3/LuaSnip'},
	{'rafamadriz/friendly-snippets'},
      }
    }

  -- Native LSP
    packer.use("neovim/nvim-lspconfig") -- Preconfig for LSPs

  -- Surround
    packer.use("ur4ltz/surround.nvim")

  -- Status bar
    packer.use({
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

  -- Telescope
    packer.use({
      "nvim-telescope/telescope.nvim",
      requires = {
	"nvim-lua/plenary.nvim",
      },
    })
    packer.use("nvim-telescope/telescope-file-browser.nvim")
    packer.use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    packer.use("nvim-telescope/telescope-project.nvim")

  -- Terminal
    packer.use({
      "akinsho/toggleterm.nvim",
      tag = "v2.*",
    })

  -- TreeLister
    packer.use {
	'kyazdani42/nvim-tree.lua',
	requires = {
	    'kyazdani42/nvim-web-devicons',
	},
	tag = 'nightly'
    }

  -- Treesitter
    packer.use("nvim-treesitter/nvim-treesitter")
    packer.use("windwp/nvim-ts-autotag") -- Auto tag extension

end)
