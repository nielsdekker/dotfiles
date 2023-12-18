return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap = require("dap")
    local dap_ui = require("dapui")

    local mason_path = vim.fn.stdpath("data") .. "/mason"

    -- Set defaults for DAP
    dap.defaults.fallback.exception_breakpoints = {}

    -- Basic adapter config. Project specific configs should be set up in a
    -- projects .nvim.lua file.
    dap.adapters.node = {
      type = "executable",
      command = "node",
      args = { mason_path .. "/packages/node-debug2-adapter/out/src/nodeDebug.js" },
    }

    dap.adapters.rust_lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode",
    }

    dap.adapters.zig_lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode"
    }

    dap.configurations.javascript = {
      {
        type = "node",
        request = "launch",
        name = "Launch JS file",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
      },
    }

    dap.configurations.rust = {
      {
        type = "rust_lldb",
        request = "launch: ",
        name = "Launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = {}
      },
    }

    dap.configurations.zig = {
      setmetatable(
        {
          type = "zig_lldb",
          request = "launch",
          name = "Debug",
          program = vim.fn.getcwd() .. "/zig-out/bin/debug",
          args = {}
        },
        {
          __call = function(config)
            local output = vim.fn.system(
              "zig build-exe " .. vim.fn.getcwd() .. "/src/main.zig " ..
              "-femit-bin=" .. vim.fn.getcwd() .. "/zig-out/bin/debug"
            )
            if (output:len() > 0) then
              error(output)
              return nil
            end
            return config
          end
        }
      ),
      {
        type = "zig_lldb",
        request = "launch",
        name = "Debug tests current file",
        program = function()
          local fullPath = vim.api.nvim_buf_get_name(0)
          local basename = vim.fs.basename(fullPath)

          local handle = io.popen("zig test " .. fullPath .. " -femit-bin=zig-out/test_" .. basename)
          if handle == nil then
            return nil
          end
          handle:read("*a")
          handle:close()

          return vim.fn.getcwd() .. "/zig-out/test_" .. basename
        end,
        args = {}
      }
    }

    -- Setup UI
    vim.fn.sign_define("DapBreakpoint", { text = "" })
    vim.fn.sign_define("DapStopped", { text = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "" })
    vim.fn.sign_define("DapLogPoint", { text = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "" })

    dap_ui.setup({
      icons = {
        collapsed = "",
        expanded = ""
      },
      layouts = { {
        elements = { {
          id = "stacks",
          size = 0.4
        }, {
          id = "watches",
          size = 0.3
        }, {
          id = "breakpoints",
          size = 0.2
        }, {
          id = "scopes",
          size = 0.2
        } },
        position = "left",
        size = 60
      }, {
        elements = { {
          id = "repl",
          size = 1
        } },
        position = "bottom",
        size = 20
      } }
    })
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dap_ui.open()
    end
  end
}
