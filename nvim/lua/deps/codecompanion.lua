--- @type MiniDep
return {
    name = "codecompanion",
    source = "olimorris/codecompanion.nvim",
    depends = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    later = function()
        require("codecompanion").setup({
            strategies = {
                inline = { adapter = "mistral" },
                cmd = { adapter = "mistral" },
                chat = { adapter = "mistral" },
            },
            display = {
                diff = {
                    enabled = true,
                    provider = "mini_diff"
                },
                chat = {
                    intro_message = "Press `?` for options",
                    window = {
                        position = "right",
                    },
                },
            },
            adapters = {
                mistral = function()
                    -- Mistral is openai compatible so hack in tools support
                    local openai = require("codecompanion.adapters.openai")

                    return require("codecompanion.adapters").extend("mistral", {
                        opts = {
                            stream = true,
                            tools = true,
                        },
                        schema = {
                            model = { default = "mistral-medium-latest" }
                        },
                        handlers = {
                            chat_output = function(self, data, tools)
                                return openai.handlers.chat_output(self, data, tools)
                            end,
                            form_tools = function(self, tools)
                                return openai.handlers.form_tools(self, tools)
                            end,
                            tools = openai.handlers.tools
                        },
                    })
                end
            }
        })
    end
}
