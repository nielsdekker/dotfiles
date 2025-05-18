local deps = require("mini.deps")

deps.later(function()
    deps.add({
        name = "codecompanion",
        source = "olimorris/codecompanion.nvim",
        depends = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    })

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
                return require("codecompanion.adapters").extend("mistral", {
                    schema = {
                        model = { default = "codestral-2501" }
                    }
                })
            end
        }
    })
end)
