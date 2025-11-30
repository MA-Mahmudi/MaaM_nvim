return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        version = '17.33.0',
        opts = {
            opts = {
                log_level = "DEBUG", -- or "TRACE"
            },
            adapters = {
                http = {
                    myopenai = function()
                        return require("codecompanion.adapters").extend("openai", {
                            url = os.getenv("CODECOMPANION_ARVAN_URL"),
                            env = {
                                api_key = os.getenv("CODECOMPANION_ARVAN_API_KEY"),
                            },
                            schema = {
                                model = {
                                    default = "GPT-5-mini",
                                },
                            },
                        })
                    end,
                },
            },
            strategies = {
                chat = {
                    adapter = "myopenai",
                },
                inline = {
                    adapter = "myopenai",
                },
                cmd = {
                    adapter = "myopenai",
                }
            },
        },
    },
}
