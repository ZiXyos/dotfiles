return {
  "lukas-reineke/indent-blankline.nvim", -- Indentation and blankline indicator
  tag = "v3.2.4",
  config = function()
    local ibl = require("ibl")
    ibl.setup()
  end,
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
}
