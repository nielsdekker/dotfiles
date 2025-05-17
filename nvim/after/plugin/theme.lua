require("mini.deps").now(function()
    require("rose-pine").setup({
        enable = {
            legacy_highlights = false,
        },
    })

    vim.cmd.colorscheme("rose-pine")
end)
