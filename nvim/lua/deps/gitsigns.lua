--- @type MiniDep
return {
    source = "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    later = function()
        require("gitsigns").setup()
    end
}
