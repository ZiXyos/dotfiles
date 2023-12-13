return {
        {
                'nvimdev/dashboard-nvim',
                event = 'VimEnter',
                config = function()
                        require('dashboard').setup {
                                -- config
                        }
                end,
                dependencies = { { 'nvim-tree/nvim-web-devicons' } }
        },
        {
                "goolord/alpha-nvim",
                optional = true,
                enabled = function()
                        require("lazyvim.util").warn({
                                "`dashboard.nvim` is now the default LazyVim starter plugin.",
                                "",
                                "To keep using `alpha.nvim`, please enable the `lazyvim.plugins.extras.ui.alpha` extra.",
                                "Or to hide this message, remove the alpha spec from your config.",
                        })
                        return false
                end,
        },
}
