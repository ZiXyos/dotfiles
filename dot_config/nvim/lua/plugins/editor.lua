return {
  {
    "laytan/cloak.nvim",
    commit = "ff5e746e787de14675396beb642bf5010b8bc96d",
    opts = {
      enabled = true,
      cloak_character = "*",
      patterns = { { file_pattern = ".env*", cloak_pattern = "=.+" } },
    },
  },
  {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
      search = {
        forward = true,
        multi_window = false,
        wrap = false,
        incremental = true,
      },
    },
  },

  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {
      highlighters = {
        hsl_color = {
          pattern = "hsl%(%d+,? %d+,? %d+%)",
          group = function(_, match)
            local utils = require("solarized-osaka.hsl")
            local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
            h, s, l = tonumber(h), tonumber(s), tonumber(l)
            local hex_color = utils.hslToHex(h, s, l)
            return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
          end,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    commit = "8c69f58427f98b2ca39a90a36db830c06e30351c",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-project.nvim",
    },
    keys = {
      {
        "<leader>fd",
        ":Telescope file_browser<CR>",
        silent = true,
        desc = "Open file browser (project dir)",
      },
      {
        "<leader>fb",
        ":Telescope file_browser path=%:p:h<CR>",
        silent = true,
        desc = "Open file browser (current dir)",
      },
      { "<leader>ff", ":Telescope find_files<CR>", silent = true, desc = "Find file" },
      { "<leader>fg", ":Telescope live_grep<CR>", silent = true, desc = "Live grep" },
      { "<leader>bf", ":Telescope buffers<CR>", silent = true, desc = "Open buffer browser" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = telescope.extensions.file_browser.actions

      telescope.setup({
        pickers = {
          find_files = {
            previewer = false,
            find_command = {
              "fd",
              "--type",
              "f",
              "-H",
              "-E",
              "node_modules",
              "-E",
              "cache",
              "-E",
              ".git",
              "-E",
              ".env*",
              "-E",
              "Pods",
              "-I",
            },
          },
        },
        extensions = {
          file_browser = {
            hidden = true,
            respect_gitignore = true,
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                ["<A-t>"] = fb_actions.change_cwd,
                ["<C-t>"] = actions.select_tab,
              },
            },
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
          },
        },
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("fzf")
      telescope.load_extension("project")
    end,
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
}
