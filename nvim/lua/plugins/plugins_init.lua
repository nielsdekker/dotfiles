local MiniDeps = require("mini.deps")
local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

now(function()
    -- Mini
    require("plugins.mini")

    -- Theming
    require("plugins.colo")

    -- Make sure LSP is initialized immediately, just in case a file is opened
    -- directly.
    add({ source = "williamboman/mason.nvim" })
    require("plugins.lsp")
end)

-- Tools
later(function()
    add({ source = "tpope/vim-fugitive" })
    add({ source = "lewis6991/gitsigns.nvim", name = "gitsigns" })
    add({ source = "stevearc/conform.nvim" })
    add({
        source = "igorlfs/nvim-dap-view",
        depends = { "mfussenegger/nvim-dap" },
    })
    add({ source = "mbbill/undotree" })
    add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end
        },
    })

    require("plugins.treesitter")
    require("plugins.conform_settings")
    require("plugins.dap")
    require("plugins.gitsigns")
end)
