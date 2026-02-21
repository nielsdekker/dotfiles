--- @type MiniDep
return {
	source = "mason-org/mason.nvim",
	setup = function()
		require("mason").setup()
	end,
}
