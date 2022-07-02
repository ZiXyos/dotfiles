-- INIT PLUGINS FIRST
require("plugins")

-- Auto compile PackerCompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local m = require("mapx").setup({ global = true })

vim.g.mapleader = " "

m.noremap("<leader>w", ":w<CR>", "silent")

-- -- tab navigation
m.noremap("<S-H>", ":tabprev<CR>", "silent")
m.noremap("<S-L>", ":tabnext<CR>", "silent")

-- -- window navigation
m.noremap("<F2>", "<C-w>w", "silent")

-- -- lazygit
m.nnoremap("gg", ":LazyGit<CR>", "silent")

-- PACKER
require("lsp_setup")
require("cmp_setup")
require("telescope_setup")
-- require("toggleterm_setup")
require("treesitter_setup")
require("lualine_setup")
require("comment_setup")
-- require("surround_setup")
require("nullls_setup")
require("indentblankline_setup")
require("autopairs_setup")
require("gitsigns_setup")
require("trouble_setup")
require("nvimtree_setup")
require("devicons_setup")
require('tabbar_setup')

-- Startup Command
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Configure Base Neovim
vim.wo.number = true
-- Load the colorscheme
vim.cmd("colorscheme tokyonight")
