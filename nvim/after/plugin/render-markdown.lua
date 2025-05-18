local deps = require("mini.deps")

deps.later(function()
    deps.add({ source = "MeanderingProgrammer/render-markdown.nvim" })

    require("render-markdown").setup({
        file_types = { "markdown", "codecompanion" }
    })
end)
