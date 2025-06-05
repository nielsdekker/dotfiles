--- @type MiniDep
return {
    source = "webhooked/kanso.nvim",
    name = "kanso",
    now = function()
        require("kanso").setup({
            transparent = true,
            background = { dark = "zen", light = "pearl" }
        })

        -- Make this the default theme
        vim.cmd("colo kanso")
    end
}
