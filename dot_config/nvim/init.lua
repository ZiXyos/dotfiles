if vim.loader then
  vim.loader.enable()
end

-- Keep the debug shorthand without replacing Neovim's built-in printer.
_G.dd = vim.print

require("config.options")
require("config.lazy")
