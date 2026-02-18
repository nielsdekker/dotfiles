--- @type MiniDep
return {
	source = "stevearc/quicker.nvim",

	later = function()
		require("quicker").setup()
	end,
}
