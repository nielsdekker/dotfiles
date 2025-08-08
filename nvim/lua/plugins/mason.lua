--- @type MiniDep
return {
    source = "mason-org/mason.nvim",
    later = function()
        require("mason").setup()
    end
}
