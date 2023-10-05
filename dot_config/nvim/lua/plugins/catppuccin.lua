return {
  "catppuccin/nvim",
  version = "1.5.0",
  lazy = false,
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      flavour = "mocha",
      transparent_background = true,
      notify = {
        transparent_background = true,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        keywords = { "italic" },
        types = { "bold" },
        functions = { "bold" },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = false,
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
