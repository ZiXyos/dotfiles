local sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
}

local inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
}

local component_separators = { left = '', right = '' }

local section_separators = { left = '👺', right = '👺' }

return {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
                table.insert(opts, { ['sections'] = sections })
                table.insert(opts, { ['inactive_sections'] = inactive_sections })
                table.insert(opts, { ['component_separators'] = component_separators })
                table.insert(opts, { ['section_separators'] = section_separators })
                return {
                        options = {
                                icons_enabled = true,
                                always_divide_middle = true,
                        }
                }
        end
}
