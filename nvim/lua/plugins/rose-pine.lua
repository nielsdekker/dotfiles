--- @type MiniDep
return {
    source = "rose-pine/neovim",
    name = "rose-pine",
    now = function()
        require("rose-pine").setup({
            variant = "auto",
            dark_variant = "moon",
            light_variant = "dawn",
            disable_background = false,
            disable_float_background = false,
            disable_italics = false,
        })

        -- Make this the default theme
        vim.cmd.colorscheme "rose-pine"
    end,
}
