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

        -- Basic adapter config. Project specific configs should be set up in a projects
        -- .nvim.lua file.
        dap.adapters.delve = {
            type = "server",
            port = "${port}",
            executable = {
                command = "dlv",
                args = {
                    "dap",
                    "-l",
                    "127.0.0.1:${port}",
                    "--log",
                    "--log-output=dap"
                }
            }
        }
    end
}
