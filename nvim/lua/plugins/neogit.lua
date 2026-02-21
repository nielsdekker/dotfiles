--- @type MiniDep
return {
	source = "NeogitOrg/neogit",
	depends = { "nvim-lua/plenary.nvim" },
	now = function()
		require("neogit").setup({
			prompt_force_push = false,
			integrations = {
				snacks = true,
			},
		})
	end,
}
