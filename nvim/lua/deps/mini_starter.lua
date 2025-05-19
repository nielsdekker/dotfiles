--- @type MiniDep
return {
    source = "mini.nvim",
    now = function()
        require("mini.starter").setup({
            footer = "",
            silent = true,
        })
    end
}
