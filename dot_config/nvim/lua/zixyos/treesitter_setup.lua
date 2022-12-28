require('nvim-treesitter.configs').setup {

    enable = true,

    ensure_installed = 'all',

    ignore_install = {'phpdoc'},

    auto_install = true,

    highlight = {

        enable = true,

        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },

    autotag = { enable = true }
}

