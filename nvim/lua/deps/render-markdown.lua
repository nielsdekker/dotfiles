--- @type MiniDep
return {
    source = "MeanderingProgrammer/render-markdown.nvim",

    later = function()
        require("render-markdown").setup({
            file_types = { "markdown", "codecompanion" }
        })
    end
}
