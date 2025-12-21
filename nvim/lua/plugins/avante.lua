return {
	name = "avante",
	source = "nielsdekker/avante.nvim",
	checkout = "fix/codex-acp-no-output",
	depends = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	later = function()
		require("avante").setup({
			behaviour = {
				jump_result_buffer_on_finish = true,
				auto_approve_tool_permissions = false,
				include_generated_by_commit_line = true,
				auto_set_keymaps = false,
			},

			provider = "codex",
			acp_providers = {
				["codex"] = {
					-- Make sure codex is ran in a sandbox container
					command = "podman",
					args = {
						"run",
						"--interactive",

						-- Map the `codex` config folder in the container.
						-- Allows updating the config without rebuilding the
						-- container.
						"--volume",
						vim.fn.getenv("HOME") .. "/.config/codex/:/root/.codex/:rw,z",

						-- Map the current folder on the same path in the
						-- container.
						"--volume",
						vim.fn.getcwd() .. "/:" .. vim.fn.getcwd() .. "/:rw,z",

						-- Make sure the container uses the correct working
						-- directory.
						"--workdir",
						vim.fn.getcwd(),
						"codex",
					},
				},
			},
		})
	end,
}
