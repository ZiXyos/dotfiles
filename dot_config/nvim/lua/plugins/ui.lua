return {
    {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
        local lualine = require("lualine")
        local lint_progress = function()
        local linters = require("lint").get_running()
        if #linters == 0 then
            return "󰦕"
          end
          return "󱉶 " .. table.concat(linters, ", ")
        end
        
        lualine.setup({
            options = {
                icons_enabled = true,
                component_separators = { left = '', right = '' }
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
                lualine_c = {},
                lualine_x = { lint_progress },
                lualine_y = { "fileformat", "filetype" },
                lualine_z = {
                  { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
          },
          tabline = {},
          extensions = {},
        })
        end,
    },
    {
    'nvimdev/dashboard-nvim',
    lazy = false,
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
        config = {
          header = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
          },
          project = {
            enable = true,
            limit = 4,
            icon = "  ",
            label = "Recent projects:",
            --          action = "Neotree toggle position=float dir=",
          },
        }
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
    "folke/noice.nvim",
    event = "VeryLazy",
    branch = "main",
    opts = {
    lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        branch = "master",
        keys = {
          {
            "<leader>un",
            function()
              require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Dismiss All Notifications",
          },
        },
        opts = {
          background_colour = "#000000"
        }
      }
    }
    },
    {
        "stevearc/dressing.nvim",
        lazy = false,
    },
    {
        "echasnovski/mini.cursorword",
        lazy = false,
        version = "*",
        config = true,
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
    },
    {
        "b0o/incline.nvim",
        dependencies = { "craftzdog/solarized-osaka.nvim" },
        event = "BufReadPre",
        priority = 1200,
        config = function()
          local colors = require("solarized-osaka.colors").setup()
          require("incline").setup({
            highlight = {
              groups = {
                InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
                InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
              },
            },
            window = { margin = { vertical = 0, horizontal = 1 } },
            hide = {
              cursorline = true,
            },
            render = function(props)
              local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
              if vim.bo[props.buf].modified then
                filename = "[+] " .. filename
              end
    
              local icon, color = require("nvim-web-devicons").get_icon_color(filename)
              return { { icon, guifg = color }, { " " }, { filename } }
            end,
          })
        end,
      },
}
