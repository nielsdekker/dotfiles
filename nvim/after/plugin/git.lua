local deps = require("mini.deps")

deps.later(function()
    deps.add({ source = "lewis6991/gitsigns.nvim", name = "gitsigns" })
    deps.add({
        source = "NeogitOrg/neogit",
        depends = { "nvim-lua/plenary.nvim" }
    })

    require("gitsigns").setup()
    require("neogit").setup({
        integrations = {
            mini_pick = true,
        }
    })
end)
