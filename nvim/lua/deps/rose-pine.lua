--- @type MiniDep
return {
    source = "rose-pine/neovim",
    name = "rose-pine",
    now = function()
        require("rose-pine").setup({
            enable = {
                legacy_highlights = false,
            },
        })
    end
}
