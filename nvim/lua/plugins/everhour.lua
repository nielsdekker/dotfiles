--- @type MiniDep
return {
	source = "git@github.com:nielsdekker/everhour.nvim.git",
	name = "everhour",
	setup = function()
		local token = os.getenv("EVERHOUR_TOKEN")
		local pattern = os.getenv("EVERHOUR_PATTERN")

		if token == nil or pattern == nil then
			-- No settings for everhour so no need to start it
			return
		end

		require("everhour").setup({
			pattern = pattern,
			token = token,
		})
	end,
}
