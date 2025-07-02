--- @type MiniDep
return {
    source = "webhooked/kanso.nvim",
    name = "kanso",
    now = function()
        require("kanso").setup({
            transparent = true,
            background = { dark = "zen", light = "pearl" }
        })
    end
}
