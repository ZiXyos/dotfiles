return {
        "nvim-pack/nvim-spectre",
        opts = {},
        keys = {
                { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
        },
}
