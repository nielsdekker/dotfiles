--- @type MiniDep
return {
    source = "savq/melange-nvim",
    now = function()
        vim.cmd.colorscheme("melange")
    end
}
