--- @type MiniDep
return {
    source = "folke/snacks.nvim",
    later = function()
        require("snacks").setup({
            picker = { enabled = true },
            indent = {
                only_scope = true,
                animate = { enabled = false }
            },
        });
    end,
}
