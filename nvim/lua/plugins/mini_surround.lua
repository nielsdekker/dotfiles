--- @type MiniDep
return {
	source = "nvim-mini/mini.nvim",
	setup = function()
		require("mini.surround").setup()
	end,
}
