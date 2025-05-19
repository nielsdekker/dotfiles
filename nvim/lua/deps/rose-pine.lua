return {
    source = "rose-pine/neovim",
    name = "rose-pine",
    now = function()
        require("rose-pine").setup({
            enable = {
                legacy_highlights = false,
            },
        })

        -- This also makes this the default theme
        vim.cmd.colorscheme("rose-pine")
    end
}
