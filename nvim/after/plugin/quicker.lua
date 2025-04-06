require("mini.deps").later(function()
    require("quicker").setup({
        highlight = {
            treesitter = true,
            lsp = true,
        },
        follow = {
            enabled = true,
        },
    })
end)
