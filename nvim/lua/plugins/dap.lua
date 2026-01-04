--- @type MiniDep
return {
	source = "igorlfs/nvim-dap-view",
	depends = { "mfussenegger/nvim-dap" },
	later = function()
		local dap = require("dap")

		-- Setup UI
		vim.fn.sign_define("DapBreakpoint", { text = "|>", texthl = "Comment" })
		vim.fn.sign_define("DapStopped", { text = "|>", texthl = "Bold" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "!<", texthl = "Error" })
		vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "Comment" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "~>", texthl = "Comment" })

		dap.adapters.go = function(callback, client_config)
			local host = client_config.host or "127.0.0.1"
			local port = client_config.port or 36999

			callback({
				type = "server",
				port = port,
				executable = {
					command = "dlv",
					args = {
						"dap",
						"-l",
						host .. ":" .. port,
					},
				},
			})
		end
		-- dap.adapters.go = {
		-- 	type = "server",
		-- 	port = "36999",
		-- 	executable = {
		-- 		command = "dlv",
		-- 		args = {
		-- 			"dap",
		-- 			"-l",
		-- 			"127.0.0.1:36999",
		-- 		},
		-- 	},
		-- }

		dap.configurations.go = {
			{
				type = "go",
				name = "Run cmd/main",
				request = "launch",
				program = "./cmd/main.go",
				outputMode = "remote",
			},
			{
				type = "go",
				name = "Run file",
				request = "launch",
				program = "${file}",
				outputMode = "remote",
			},
		}
	end,
}
