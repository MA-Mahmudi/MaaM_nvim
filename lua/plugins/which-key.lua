return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function()
        local wk = require("which-key")
        wk.add({
            -- Find (telescope)
            { "<leader>f",  group = "Find",    icon = "" },
            { "<leader>fd", desc = "Find files",               icon = "" },
            { "<leader>fh", desc = "Help tags",                icon = "󰋗" },
            { "<leader>fg", desc = "Live grep",                icon = "" },
            { "<leader>fe", desc = "Diagnostics",              icon = "󰅚" },
            { "<leader>fr", desc = "Resume",                   icon = "󰁯" },
            { "<leader>fv", desc = "Workspace symbols",        icon = "󰉓" },
            { "<leader>fb", desc = "Find in buffer",           icon = "󰈙" },
            { "<leader>fw", desc = "Grep string",              icon = "󰈬" },
            { "<leader>ft", desc = "Floaterm",                 icon = "" },
            -- Config
            { "<leader>e",  group = "Config",  icon = "󰒓" },
            { "<leader>en", desc = "Neovim config",            icon = "" },
            { "<leader>ep", desc = "Plugins",                  icon = "󰏖" },
            -- Git
            { "<leader>g",  group = "Git",     icon = "󰊢" },
            { "<leader>gf", desc = "Git fetch / status",       icon = "󰛂" },
            -- Harpoon
            { "<leader>h",  group = "Harpoon", icon = "󰛐" },
            { "<leader>hq", desc = "Add buffer",               icon = "󰐕" },
            { "<leader>hw", desc = "Show buffers list",        icon = "󰮗" },
            { "<leader>hr", desc = "Remove buffer",            icon = "󰆴" },
            { "<leader>ha", desc = "Select buffer 1",          icon = "󰎡" },
            { "<leader>hs", desc = "Select buffer 2",          icon = "󰎢" },
            { "<leader>hd", desc = "Select buffer 3",          icon = "󰎣" },
            { "<leader>hf", desc = "Select buffer 4",          icon = "󰎤" },
            { "<leader>hg", desc = "Select buffer 5",          icon = "󰎥" },
            { "<leader>hh", desc = "Select buffer 6",          icon = "󰎦" },
            -- Explorer
            { "<leader>p",  group = "Explorer", icon = "󰉋" },
            { "<leader>pv", desc = "File explorer",            icon = "󰉋" },
            -- Yank
            { "<leader>y",  group = "Yank",    icon = "󰆏" },
            { "<leader>ys", desc = "To system clipboard",      icon = "󰆏" },
            { "<leader>Ys", desc = "Line to system clipboard",  icon = "󰆏" },
            -- Toggle
            { "<leader>u",  desc = "Undotree", icon = "󰁯" },
        })
    end
}
