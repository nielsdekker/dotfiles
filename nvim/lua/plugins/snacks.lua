--- @type MiniDep
return {
	source = "folke/snacks.nvim",
	now = function()
		local snacks = require("snacks")
		snacks.setup({
			statuscolumn = { enabled = true },
			picker = {
				enabled = true,
				sources = {
					files = { hidden = true },
					grep = { hidden = true },
					explorer = {
						hidden = true,
						ignored = true,
						auto_close = true,
					},
				},
			},
			indent = {
				only_scope = true,
				animate = { enabled = false },
			},
			notifier = { enabled = true },
		})
	end,
}
