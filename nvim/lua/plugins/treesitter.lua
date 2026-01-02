--- @type MiniDep
return {
	source = "nvim-treesitter/nvim-treesitter",
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
	later = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {},
			ignore_install = {},
			modules = {},
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
			},
			injections = {
				enable = true,
			},
		})
	end,
}
