--- @type MiniDep
return {
    source = "MeanderingProgrammer/render-markdown.nvim",

    later = function()
        require("render-markdown").setup({
            completions = { blink = { enabled = true } },
            file_types = { "markdown", "codecompanion" },
        })
    end
}
