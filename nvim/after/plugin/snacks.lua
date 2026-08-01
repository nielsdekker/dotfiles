require("snacks").setup({
    statuscolumn = { enabled = true },
    picker = {
        enabled = true,
        sources = {
            files = { hidden = true },
            grep = { hidden = true },
            explorer = {
                hidden = true,
                ignored = true,
                auto_close = true,
            },
        },
    },
})
