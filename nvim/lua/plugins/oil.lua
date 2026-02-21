--- @type MiniDep
return {
	source = "stevearc/oil.nvim",
	now = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
