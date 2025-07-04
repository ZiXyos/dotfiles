return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        branch = "master",
        dependencies = {
          "nvim-lua/plenary.nvim",
          { "nvim-telescope/telescope-file-browser.nvim" },
          { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
          "nvim-telescope/telescope-project.nvim",
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
        keys = {
          { "`", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Toggle terminal" },
          { "`", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "Toggle terminal" },
          -- { "<ESC><ESC>", "<C-\\><C-n>", mode = "t", desc = "Terminal normal mode" },
        },
      },
      {
        "kdheepak/lazygit.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        keys = {
          { "<leader>gg", "<CMD>LazyGit<CR>", desc = "Open LazyGit" },
        },
      },
      {
        "folke/twilight.nvim",
        opts = {
          dimming = {
            alpha = 0.25,
            inactive = true,
          },
          context = 10,
          treesitter = true,
          expand = {
            "function",
            "method",
            "table",
            "if_statement",
          },
        },
    },
}
