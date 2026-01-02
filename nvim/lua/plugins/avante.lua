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
			selector = {
				provider = "fzf",
				provider_opts = {},
			},
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

						-- Map the `codex` config folder in the container. This
						-- way the config can be updated without rebuilding the
						-- container.
						"--volume",
						vim.fn.getenv("HOME") .. "/.config/codex/:/root/.codex/:rw,z",

						-- Map the current folder on the same path in the pod.
						"--volume",
						vim.fn.getcwd() .. "/:" .. vim.fn.getcwd() .. "/:rw,z",

						-- Also update the working directory to this folder.
						"--workdir",
						vim.fn.getcwd(),
						"codex",
					},
				},
			},
		})
	end,
}
