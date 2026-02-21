--- @type MiniDep
return {
	source = "nvim-mini/mini.nvim",
	now = function()
		require("mini.surround").setup()
	end,
}
