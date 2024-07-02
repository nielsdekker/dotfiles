local dap = require("dap")
local mason_path = vim.fn.stdpath("data") .. "/mason"

-- Set defaults for DAP
dap.defaults.fallback.exception_breakpoints = {}

-- Basic adapter config. Project specific configs should be set up in a
-- projects .nvim.lua file.
dap.adapters.go = {
  type = "server",
  port = 8001,
  executable = {
    command = mason_path .. "/bin/dlv",
    args = { "dap", "-l", "127.0.0.1:8001" }
  }
}

--[[ Example go configuration
    dap.configurations.go = {
      {
        type = "go",
        request = "launch",
        name = "Debug current file",
        program = "${file}",
      }
    }
    ]]

-- Setup UI
vim.fn.sign_define("DapBreakpoint", { text = "|>", texthl = "Comment" })
vim.fn.sign_define("DapStopped", { text = "|>", texthl = "Bold" })
vim.fn.sign_define("DapBreakpointRejected", { text = "!<", texthl = "Error" })
vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "Comment" })
vim.fn.sign_define("DapBreakpointCondition", { text = "~>", texthl = "Comment" })
