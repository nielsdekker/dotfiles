--- @type MiniDep
return {
    source = "folke/tokyonight.nvim",
    name = "tokyo",
    now = function()
        require("tokyonight").setup({
            style = "night",
            light_style = "day",
            transparent = true,
        })
    end,
}
