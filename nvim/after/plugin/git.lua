require("mini.deps").later(function()
    require("gitsigns").setup()
    require("neogit").setup({
        integrations = {
            mini_pick = true,
        }
    })
end)
