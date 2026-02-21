--- @type MiniDep
return {
	source = "mason-org/mason.nvim",
	now = function()
		require("mason").setup()
	end,
}
