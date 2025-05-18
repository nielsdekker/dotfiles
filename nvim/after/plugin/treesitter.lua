local deps = require("mini.deps")

deps.now(function()
    deps.add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end
        },
    })

    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {},
        ignore_install = {},
        modules = {},
        sync_install = false,
        auto_install = true,

        highlight = {
            enable = true,
        },
        injections = {
            enable = true,
        },
    })
end)
