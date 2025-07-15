--- @type MiniDep
return {
    source = "folke/tokyonight.nvim",
    name = "tokyo",
    now = function()
        require("tokyonight").setup({
            style = "moon",
            light_style = "day",
            transparent = true,
        })

        -- Make this the default theme
        vim.cmd.colorscheme "tokyonight"
    end,
}
