-- Set up "mini.deps" (customize to your liking)
local deps = require("mini.deps")

deps.add({ source = "mason-org/mason.nvim" })
deps.add({ source = "lewis6991/gitsigns.nvim", name = "gitsigns" })
deps.add({
    source = "NeogitOrg/neogit",
    depends = { "nvim-lua/plenary.nvim" }
})
deps.add({ source = "stevearc/conform.nvim" })
deps.add({ source = "stevearc/quicker.nvim" })
deps.add({
    source = "igorlfs/nvim-dap-view",
    depends = { "mfussenegger/nvim-dap" },
})
deps.add({ source = "mbbill/undotree" })
deps.add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
        post_checkout = function()
            vim.cmd("TSUpdate")
        end
    },
})
deps.add({
    name = "codecompanion",
    source = "olimorris/codecompanion.nvim",
    depends = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    }
})
deps.add({ source = "MeanderingProgrammer/render-markdown.nvim" })

deps.add({
    source = "saghen/blink.cmp",
    checkout = "v1.3.0"
})
