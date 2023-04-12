return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope-dap.nvim"
  },
  config = function()
    local dap = require("dap")
    local dap_ui = require("dapui")

    local mason_path = vim.fn.stdpath("data") .. "/mason"

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
          id = "scopes",
          size = 0.3
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
