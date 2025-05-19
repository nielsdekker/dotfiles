--- @type MiniDep
return {
    source = "NeogitOrg/neogit",
    depends = { "nvim-lua/plenary.nvim" },
    later = function()
        require("neogit").setup({
            integrations = {
                mini_pick = true,
            }
        })
    end
}
