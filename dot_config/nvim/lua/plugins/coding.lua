return {
  {
    "folke/ts-comments.nvim",
    opts = {
      langs = {
        dts = "// %s",
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      use_local_fs = true,
      picker = "snacks",
    },
  },
  { "sindrets/diffview.nvim", opts = {}, cmd = { "DiffviewOpen" } },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        -- stylua is already added by the lazyvim none-ls extra
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.completion.spell,
      })
    end,
  },
  {
    "nvim-mini/mini.align",
    opts = {},
    keys = {
      { "ga", mode = { "n", "v" } },
      { "gA", mode = { "n", "v" } },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "Wansmer/treesj",
    keys = {
      -- TODO: export keys to keymap.config.
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  { "nvim-mini/mini.test", cond = vim.fn.isdirectory("tests") == 1 },
  {
    "folke/lazydev.nvim",
    opts = function(_, opts)
      local v = vim.version()
      opts.debug = true
      opts.runtime = v and v.prerelease and "~/projects/neovim/runtime" or nil
      opts.library = opts.library or {}
      vim.list_extend(opts.library, {
        -- { path = "wezterm-types", mods = { "wezterm" } },
        { path = "${3rd}/luassert/library", words = { "assert" } },
        { path = "${3rd}/busted/library", words = { "describe" } },
      })
    end,
  },
  { "markdown-preview.nvim", enabled = false },
  {
    "nvim-mini/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    -- TODO: Export command to command utilities.
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    -- TODO: export keys to keymap.config.
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      use_diagnostic_signs = true,
    },
  },
  {
    "YannickFricke/codestats.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("codestats-nvim").setup({
        token = vim.env.CODE_STATS_API_TOKEN,
      })
    end,
  },
}
