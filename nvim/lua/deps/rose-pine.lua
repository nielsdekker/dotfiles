--- @type MiniDep
return {
    source = "rose-pine/neovim",
    name = "rose-pine",
    now = function()
        require("rose-pine").setup({
            extend_background_behind_borders = false,
            enable = {
                legacy_highlights = false,
            },
        })

        -- Make this the default theme
        vim.cmd("colo rose-pine")
    end
}
