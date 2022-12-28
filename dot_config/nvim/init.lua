--- INIT PLUGINS FIRST ---
vim.g.mapleader = " "

---- OPTIONS ---
vim.opt.encoding = "UTF-8"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

require("plugins")

require("zixyos.remap")

--- PACKER --- 
require("zixyos.lsp_setup")
require("zixyos.treesitter_setup")
require("zixyos.autopairs_setup")
require("zixyos.telescope_setup")
require("zixyos.treesitter_setup")
require("zixyos.toggleterm_setup")
require("zixyos.devicons_setup")
require("zixyos.lualine_setup")

-- require("zixyos.nvimtree_setup")

require("zixyos.cmp")
require("zixyos.comment")
require("zixyos.gitsigns")
require("zixyos.indentblankline")
require("zixyos.nulls")

--- Startup Command ---
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Configure Base Neovim
vim.wo.number = true
-- Load the colorscheme
vim.cmd("colorscheme tokyonight")
