local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {},
    ignore_install = {},
    modules = {},
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true
    },
})
