return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = '0.1.5',
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-project.nvim",
    },
    keys = {
      {
        "<leader>fd", "<cmd>Telescope file_browser<cr>",
        silent = true,
        desc = "Open File Browser (Project Directory)",
      },
      {
        "<leader>fb", "<cmd>Telescope file_browser path=%:p:h<cr>",
        silent = true,
        desc = "Open file Browser (Current Directory)",
      },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", silent = true, desc = "Find file" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", silent = true, desc = "Live grep" },
      { "<leader>bf", "<cmd>Telescope buffers<CR>", silent = true, desc = "Open buffer browser" },
      { "<leader>fs", "<cmd>:lua require('telescope.builtin').find_files({hidden=true})<CR>", silent = true, desc = "Find File with hidden" }
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }

      require("telescope").load_extension("ui-select")
    end
  },
   {
    "lewis6991/gitsigns.nvim",
    tag = "v0.6",
    opts = {
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = "",
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = "ﰣ",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitSignsDelete",
          text = "",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = "",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = "ﰣ",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
    },
  },
  {
    "numToStr/FTerm.nvim",
    commit = "d1320892cc2ebab472935242d9d992a2c9570180",
    keys = {
      { "`", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Toggle terminal" },
      { "`", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "Toggle terminal" },
      -- { "<ESC><ESC>", "<C-\\><C-n>", mode = "t", desc = "Terminal normal mode" },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    commit = "1e08e3f5ac1152339690140e61a4a32b3bdc7de5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<CMD>LazyGit<CR>", desc = "Open LazyGit" },
    },
  },
}
