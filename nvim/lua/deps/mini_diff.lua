--- @type MiniDep
return {
    source = "mini.nvim",
    later = function()
        -- Mini files
        require("mini.diff").setup()
    end
}
