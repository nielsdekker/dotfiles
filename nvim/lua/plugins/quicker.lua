--- @type MiniDep
return {
	source = "stevearc/quicker.nvim",
	now = function()
		require("quicker").setup()
	end,
}
