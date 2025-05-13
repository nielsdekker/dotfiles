require("mini.deps").later(function()
    local cc = require("codecompanion")

    cc.setup({
        strategies = {
            chat = { adapter = "mistral" },
            inline = { adapter = "mistral" },
            cmd = { adapter = "mistral" },
        },
        display = {
            chat = {
                intro_message = "Press `?` for options",
                window = {
                    position = "right",
                },
            },
        },
    })
end)
