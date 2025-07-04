local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        "LazyVim/LazyVim",
        import = "lazyvim.plugins",
        opts = {
            new = {
                lazyvim = true,
                neovim = true,
            }
        },
        { import = "plugins" }
    },
    defaults = {
        lazy = false,
        version = false,
    },
    checker = { enabled = true, notify = true },
    change_detection = { enabled = true, notify = true },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "netrwPlugin",
                "rplugin",
                "tohtml",
                "tutor",
                "zipPlugin",
             },
        }
    },
    ui = {
        custom_keys = {
            ["<localleader>d"] = function(plugin)
                dd(plugin)
            end
        },
    },
})