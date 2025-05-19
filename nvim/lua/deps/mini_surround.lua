--- @type MiniDep
return {
    source = "mini.nvim",
    later = function()
        require("mini.surround").setup()
    end
}
