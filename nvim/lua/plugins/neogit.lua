vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/NeogitOrg/neogit" },
})

require("neogit").setup({
	prompt_force_push = false,
	integrations = {
		snacks = true,
	},
})
