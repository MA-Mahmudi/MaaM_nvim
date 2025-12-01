return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
        require("themery").setup({
            -- themes = { "tokyonight", "rose-pine", "dracula" },
            themes = {
                {
                    name = "rose-pine",
                    colorscheme = "rose-pine",
                },
                {
                    name = "rose-pine Moon",
                    colorscheme = "rose-pine-moon",
                },
                {
                    name = "rose-pine Dawn",
                    colorscheme = "rose-pine-dawn",
                },
                {
                    name = "tokyonight",
                    colorscheme = "tokyonight",
                },
                {
                    name = "tokyonight Moon",
                    colorscheme = "tokyonight-moon",
                },
                {
                    name = "tokyonight Storm",
                    colorscheme = "tokyonight-storm",
                },
                {
                    name = "tokyonight Night",
                    colorscheme = "tokyonight-night",
                },
                {
                    name = "tokyonight Day",
                    colorscheme = "tokyonight-day",
                },
                {
                    name = "kanagawa",
                    colorscheme = "kanagawa",
                },
                {
                    name = "kanagawa Wave",
                    colorscheme = "kanagawa-wave",
                },
                {
                    name = "kanagawa Dragon",
                    colorscheme = "kanagawa-dragon",
                },
                {
                    name = "kanagawa Lotus",
                    colorscheme = "kanagawa-lotus",
                },
                {
                    name = "catppuccin Latte",
                    colorscheme = "catppuccin-latte",
                },
                {
                    name = "catppuccin Frappe",
                    colorscheme = "catppuccin-frappe",
                },
                {
                    name = "Dracula",
                    colorscheme = "dracula",
                },
            },
            livePreview = true,
            globalAfter = [[
                        vim.api.nvim_set_hl(0, "LineNr", { fg = "#ff7373" }),
                        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#805957" }),
                        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#805957" }),
                        vim.api.nvim_set_hl(0, "signColumn", { bg = "none" }),
            ]]
        })
    end
}
