local dap = require("dap")
local dapui = require("dapui")

-- Set defaults for DAP
dap.defaults.fallback.exception_breakpoints = {}

-- Basic adapter config. Project specific configs should be set up in a
-- projects .nvim.lua file.
dap.adapters.delve = function(cb, config)
    if config.buildCmds then
        for _, v in pairs(config.buildCmds) do
            print(table.concat(v, " "))
            local job = vim.system(v, {
                stderr = function(_, data)
                    if data then
                        print(data)
                    end
                end,
                stdout = function(_, data)
                    if data then
                        print(data)
                    end
                end,
            })
            local result = job.wait(job)

            if result.code > 0 then
                print("Build failed")
                return
            end
        end
    end

    cb({
        type = "server",
        port = "${port}",
        executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:", "--log", "--log-output=dap" }
        }
    })
end

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
