local deps = require("mini.deps")

deps.now(function()
    deps.add({ source = "rose-pine/neovim", name = "rose-pine" })

    require("rose-pine").setup({
        enable = {
            legacy_highlights = false,
        },
    })

    vim.cmd.colorscheme("rose-pine")
end)
