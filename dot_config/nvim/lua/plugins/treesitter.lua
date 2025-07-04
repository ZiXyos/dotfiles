return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local status_ok, conf = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        vim.notify("nvim-treesitter.configs not found", vim.log.levels.ERROR)
        return
      end

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
    end,
  },
}
