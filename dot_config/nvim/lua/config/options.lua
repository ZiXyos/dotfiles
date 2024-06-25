vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.cmdheight = 1
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.signcolumn = "yes"
vim.opt.wrap = false -- Long lines are not wrapper
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitbelow = true -- Cursor go on the left window when split
vim.opt.splitright = true -- Cursor go on the right windows when split
vim.opt.confirm = true -- Confirm before closing an unsaved buffer
vim.opt.cursorline = true -- Highlight current line
vim.opt.autowrite = true
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.winbar = ""

vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }

vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end
