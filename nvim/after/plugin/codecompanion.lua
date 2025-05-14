require("mini.deps").later(function()
    local cc = require("codecompanion")

    cc.setup({
        strategies = {
            inline = { adapter = "mistral" },
            cmd = { adapter = "mistral" },
            chat = { adapter = "mistral" },
        },
        display = {
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
