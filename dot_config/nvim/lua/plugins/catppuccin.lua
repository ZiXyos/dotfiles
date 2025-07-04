return {
    "catppuccin/nvim",
     lazy = false,
     priority = 1000,
     config = function()
       local catppuccin = require("catppuccin")
       catppuccin.setup({
         flavour = "mocha",
         transparent_background = true,
         styles = {
            conditionals = { "bold"},
            types = { "bold"},
            keywords = { "italic"},
         }
       })
       vim.cmd("colorscheme catppuccin")
     end,
   }