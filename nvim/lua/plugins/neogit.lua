--- @type MiniDep
return {
    source = "NeogitOrg/neogit",
    depends = { "nvim-lua/plenary.nvim" },
    later = function()
        require("neogit").setup({
            prompt_force_push = false,
            integrations = {
                snacks = true,
            },
        })
    end
}
