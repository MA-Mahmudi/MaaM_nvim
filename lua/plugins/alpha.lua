return {
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
            local dashboard = require 'alpha.themes.dashboard'
            dashboard.section.buttons.val = {
                dashboard.button("e", "󰉋  Explore", ":Oil<CR>"),
                dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
            }
            dashboard.section.header.val = {
                "                                                                       ",
                "                                                                       ",
                "                                                                       ",
                "                                                                       ",
                "                                                                       ",
                "        d8888    8888888b.           d8888    8888888b.           d8888",
                "       d88888    888  Y88b          d88888    888   Y88b         d88888",
                "      d88P888    888    888        d88P888    888    888        d88P888",
                "     d88P 888    888    888       d88P 888    888   d88P       d88P 888",
                "    d88P  888    888    888      d88P  888    8888888P        d88P  888",
                "   d88P   888    888    888     d88P   888    888 T88b       d88P   888",
                "  d8888888888    888  .d88P    d8888888888    888  T88b     d8888888888",
                " d88P     888    8888888P     d88P     888    888   T88b   d88P     888",
                "                                                                       ",
                "                                                                       ",
                "                                                                       ",
                "                                                                       ",
                "                                                                       ",
            }
        end
    }
}
