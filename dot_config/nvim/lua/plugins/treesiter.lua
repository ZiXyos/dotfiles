return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = "0.9.1",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    dependencies = {"windwp/nvim-ts-autotag"},
    config = function()
      local conf = require("nvim-treesitter.configs")
      conf.setup({
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "go",
          "rust",
          "jsdoc",
          "json",
          "sql",
          "toml",
          "yaml",
          "tsx",
        },
        highlight = { enable = true },
        autotag = { enable = true },
        indent = { enable = true },
        auto_install = true,
      })
    end
  }
}
