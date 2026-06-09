--@module 'lazy'

return {
  {
    "snacks.nvim",
    ---@type snacks.Config
    opts = {
      statuscolumn = { folds = { open = false } },
      notifier = { sort = { "added" } },
      scroll = { debug = false },
      -- animate = {
      --   fps = 240,
      -- },
      image = {
        force = false,
        -- enabled = false,
        debug = { request = false, convert = false, placement = false },
        math = { enabled = true },
        -- doc = { inline = true, float = true },
      },
      lazygit = {
        config = {
          os = {
            edit = 'test -z "$NVIM"; and nvim -- {{filename}}; or begin; nvim --server "$NVIM" --remote-send "q"; and nvim --server "$NVIM" --remote {{filename}}; end',
          },
        },
      },
      picker = {
        previewers = {
          diff = { style = "fancy" },
        },
        debug = { scores = false, leaks = false, explorer = false, files = false, proc = true },
        sources = {
          files = {
            hidden = true,
          },
          grep = {
            hidden = true,
          },
          select = {
            kinds = {
              sidekick_cli = {
                layout = { preset = "vscode" },
              },
              sidekick_prompt = {
                layout = { preset = "vscode" },
              },
            },
          },
          explorer = {
            hidden = true,
            layout = {
              preset = "sidebar",
              preview = { main = true, enabled = false },
            },
          },
        },
        win = {
          input = {
            keys = {
              ["<c-l>"] = { "toggle_lua", mode = { "n", "i" } },
            },
          },
        },
        actions = {
          toggle_lua = function(p)
            local opts = p.opts --[[@as snacks.picker.grep.Config]]
            opts.ft = not opts.ft and "lua" or nil
            opts.dirs = opts.ft == "lua" and { "lua" } or nil
            p:refresh()
          end,
        },
      },
      profiler = {
        runtime = "~/projects/neovim/runtime/",
        presets = {
          on_stop = function()
            Snacks.profiler.scratch()
          end,
        },
      },
      indent = {
        -- enabled = true,
        chunk = { enabled = true },
      },
      dashboard = vim.fn.has("win32") == 1 and {} or {
        -- github example, minus the `colorscript -e square` header panel
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          {
            pane = 2,
            icon = " ",
            desc = "Browse Repo",
            padding = 1,
            key = "b",
            action = function()
              Snacks.gitbrowse()
            end,
          },
          function()
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                title = "Notifications",
                cmd = "gh notify -s -a -n5",
                action = function()
                  vim.ui.open("https://github.com/notifications")
                end,
                key = "n",
                icon = " ",
                height = 5,
                enabled = true,
              },
              {
                title = "Open Issues",
                cmd = "gh issue list -L 3",
                key = "i",
                action = function()
                  vim.fn.jobstart("gh issue list --web", { detach = true })
                end,
                icon = " ",
                height = 7,
              },
              {
                icon = " ",
                title = "Open PRs",
                cmd = "gh pr list -L 3",
                key = "P",
                action = function()
                  vim.fn.jobstart("gh pr list --web", { detach = true })
                end,
                height = 7,
              },
              {
                icon = " ",
                title = "Git Status",
                cmd = "git --no-pager diff --stat -B -M -C",
                height = 10,
              },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                pane = 2,
                section = "terminal",
                enabled = in_git,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
              }, cmd)
            end, cmds)
          end,
          { section = "startup" },
        },
      },
      gitbrowse = {
        open = function(url)
          vim.fn.system(" ~/dot/config/hypr/scripts/quake")
          vim.ui.open(url)
        end,
      },
    },
    -- TODO: export keys to keys.config.
    keys = {
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Open",
      },
      {
        "<leader>dd",
        function()
          Snacks.picker.grep({ search = "^(?!\\s*--).*\\b(bt|dd)\\(", args = { "-P" }, live = false, ft = "lua" })
        end,
        desc = "Debug Searcher",
      },
      {
        "<leader>t",
        function()
          local file = vim.uv.fs_stat("TODO.md") and "TODO.md" or "~/dot/TODO.md"
          Snacks.scratch({ icon = " ", name = "Todo", ft = "markdown", file = file })
        end,
        desc = "Todo List",
      },
      {
        "<leader>T",
        function()
          Snacks.scratch({ icon = " ", name = "Todo", ft = "markdown", file = "~/dot/TODO.md" })
        end,
        desc = "Todo List",
      },
      {
        "<leader>dpd",
        desc = "Debug profiler",
        function()
          if not Snacks.profiler.running() then
            Snacks.notify("Profiler debug started")
            Snacks.profiler.start()
          else
            Snacks.profiler.debug()
            Snacks.notify("Profiler debug stopped")
          end
        end,
      },
    },
  },
}
