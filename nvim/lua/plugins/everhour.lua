vim.pack.add({
	{ src = "git@github.com:hubper/devday-everhour.nvim.git", name = "everhour" },
})

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
