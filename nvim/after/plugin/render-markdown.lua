require("mini.deps").later(function()
    require("render-markdown").setup({
        file_types = { "markdown", "codecompanion" }
    })
end)
