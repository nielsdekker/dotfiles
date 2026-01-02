--- @type MiniDep
return {
	source = "nvim-mini/mini.nvim",
	later = function()
		require("mini.surround").setup()
	end,
}
