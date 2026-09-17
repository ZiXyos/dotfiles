---@diagnostic disable: missing-fields
return {
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
      servers = {
        ["*"] = {
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = false,
              },
            },
          },
        },
        qmlls = {
          cmd = { "qmlls6" },
          root_makers = { ".qmlls.ini" },
        },
        jsonls = { filetypes = { "json", "jsonc", "json5" } },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              -- napi-derive's `#[napi]` proc-macro prints during expansion, which
              -- rust-analyzer's proc-macro server rejects ("napi macro expand failed").
              -- Skipping expansion keeps the original tokens so hover/types work.
              procMacro = {
                ignored = {
                  ["napi-derive"] = { "napi" },
                },
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              -- parameters = { "--loglevel=trace" },
              hover = { expandAlias = true },
              type = {
                castNumberToInteger = true,
                inferParamType = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space", "missing-local-export-doc" },
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["typescript"] = { "dprint", "prettier" },
        ["typescriptreact"] = { "dprint" },
        ["rust"] = { "rustfmt", lsp_format = "fallback" },
        ["go"] = { "goimports", "gofmt" },
      },
      formatters = {
        dprint = {
          condition = function(_, ctx)
            return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        lua = { "selene" },
        typescript = { "biomejs" },
        typescriptreact = { "biomejs" },
        go = { "golangcilint" },
        rust = { "clippy" },
      },
      linters = {
        selene = {
          condition = function(ctx)
            local root = LazyVim.root.get({ normalize = true })
            if root ~= vim.uv.cwd() then
              return false
            end
            return vim.fs.find({ "selene.toml" }, { path = root, upward = true })[1]
          end,
        },
        luacheck = {
          condition = function(ctx)
            local root = LazyVim.root.get({ normalize = true })
            if root ~= vim.uv.cwd() then
              return false
            end
            return vim.fs.find({ ".luacheckrc" }, { path = root, upward = true })[1]
          end,
        },
      },
    },
  },
}
