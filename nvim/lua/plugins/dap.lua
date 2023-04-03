return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim"
  },
  config = function()
    local dap = require("dap")
    local dap_ui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    local mason_path = vim.fn.stdpath("data") .. "/mason"
    dap.adapters.javascript = {
      type = "executable",
      command = "node",
      args = { mason_path .. "/packages/node-debug2-adapter/out/src/nodeDebug.js" },
    }

    dap.adapters.rust_lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode",
    }

    dap.adapters.firefox = {
      type = "executable",
      command = mason_path .. "/packages/firefox-debug-adapter/firefox-debug-adapter",
    }

    dap.configurations.javascript = {
      {
        type = "javascript",
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

    -- Setup dap UI and auto open/close
    dap_ui.setup({
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
        position = "left",
        size = 40
      }, {
        elements = { {
          id = "repl",
          size = 1
        } },
        position = "bottom",
        size = 10
      } }
    })
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dap_ui.open()
    end
    dap.listeners.after.event_terminated["dapui_config"] = function()
      dap_ui.close()
    end
    dap.listeners.after.event_exited["dapui_config"] = function()
      dap_ui.close()
    end

    dap_virtual_text.setup()
  end
}
