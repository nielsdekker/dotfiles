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
    dap.adapters.go = {
      type = "server",
      port = 8001,
      executable = {
        command = mason_path .. "/bin/dlv",
        args = { "dap", "-l", "127.0.0.1:8001" }
      }
    }

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = 7544,
      executable = {
        command = mason_path .. "/bin/js-debug-adapter",
        args = { "7544" }
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

    dap_ui.setup({
      controls = {
        element = "repl",
        enabled = "true",
        icons = {
          disconnect = "~",
          pause = "≥",
          play = ">",
          run_last = "↺",
          step_back = "←",
          step_into = "⬎",
          step_out = "⬏",
          step_over = "↪",
          terminate = "◊",
        }
      },
      icons = {
        collapsed = "▶",
        current_frame = "▶",
        expanded = "▼",
      },
      layouts = { {
        elements = { {
          id = "repl",
          size = 0.5
        }, {
          id = "stacks",
          size = 0.25
        }, {
          id = "scopes",
          size = 0.25
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
