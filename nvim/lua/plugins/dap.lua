local dap = require("dap")
local dapui = require("dapui")
local notify = require("mini.notify")

---@diagnostic disable-next-line: missing-fields
dapui.setup({
    controls = {
        element = "repl",
        enabled = false,
    },
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
        }, {
            id = "breakpoints",
            size = 0.25
        }, {
            id = "stacks",
            size = 0.25
        }, {
            id = "watches",
            size = 0.25
        } },
        position = "right",
        size = 40
    }, {
        elements = { {
            id = "repl",
            size = 1
        } },
        position = "bottom",
        size = 10
    } },
});

-- Set defaults for DAP
dap.defaults.fallback.exception_breakpoints = {}

-- Basic adapter config. Project specific configs should be set up in a
-- projects .nvim.lua file.
dap.adapters.delve = function(cb, config)
    if config.buildCmds then
        for _, v in pairs(config.buildCmds) do
            local notificationData = table.concat(v, " ")
            local notification = notify.add(notificationData, "INFO")

            local job = vim.system(v, {
                stderr = function(_, data)
                    if data then
                        notificationData = notificationData .. data
                        notify.update(notification, { msg = notificationData })
                    end
                end,
                stdout = function(_, data)
                    if data then
                        notificationData = notificationData .. data
                        notify.update(notification, { msg = notificationData })
                    end
                end,
            })
            local result = job.wait(job)

            if result.code > 0 then
                notificationData = notificationData .. "\r\nBuild failed"
                notify.update(notification, { msg = notificationData, level = "ERROR" })
                vim.defer_fn(function() notify.remove(notification) end, 7000)
                return
            else
                notify.remove(notification)
            end
        end
    end

    cb({
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
    })
end

--[[ Example delve configuration with templ
dap.configurations.go = {
    {
        type = "delve",
        name = "Run",
        request = "launch",
        program = "./cmd/main.go",
        outputMode = "remote",
        env = {
            DB_CONNECTION_STRING = "postgres://..."
        },
        buildCmds = {
            { "go", "run", "github.com/a-h/templ/cmd/templ@v0.3.833", "generate" },
        }
    }
}
--]]

-- Setup UI
vim.fn.sign_define("DapBreakpoint", { text = "|>", texthl = "Comment" })
vim.fn.sign_define("DapStopped", { text = "|>", texthl = "Bold" })
vim.fn.sign_define("DapBreakpointRejected", { text = "!<", texthl = "Error" })
vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "Comment" })
vim.fn.sign_define("DapBreakpointCondition", { text = "~>", texthl = "Comment" })
