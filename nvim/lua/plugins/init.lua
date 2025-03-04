local MiniDeps = require("mini.deps")
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Tools
later(function()
    add({ source = "tpope/vim-fugitive" })
    add({ source = "lewis6991/gitsigns.nvim", name = "gitsigns" })
    add({ source = "stevearc/conform.nvim" })
    add({
        source = "neovim/nvim-lspconfig",
        depends = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        }
    })
    add({
        source = "rcarriga/nvim-dap-ui",
        depends = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        }
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
    require("plugins.lsp")
    require("plugins.dap")
    require("plugins.gitsigns")
end)

-- Theming
now(function()
    require("plugins.mini")
    require("plugins.colo")
end)
