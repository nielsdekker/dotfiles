local MiniDeps = require("mini.deps")
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Setup mini
require("plugins.mini")

-- Tools
later(function()
    add({ source = "tpope/vim-fugitive" })
    add({ source = "stevearc/conform.nvim" })
    add({
        source = "neovim/nvim-lspconfig",
        depends = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        }
    })
    add({ source = "mfussenegger/nvim-dap", })
    add({ source = "mbbill/undotree" })
    add({
        source = "nvim-neotest/neotest",
        depends = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "fredrikaverpil/neotest-golang",
        }
    })

    require("plugins.conform_settings")
    require("plugins.lsp")
    require("plugins.dap")
    require("plugins.neotest")
end)

now(function()
    add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end
        },
    })

    require("plugins.treesitter")
end)

-- Theming
now(function()
    add({ source = "folke/tokyonight.nvim", name = "tokyonight" })

    require("plugins.tokyonight")
end)
