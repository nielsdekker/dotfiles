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

    local mason_path = vim.fn.stdpath("data") .. "/mason"
    dap.adapters.javascript = {
      type = "executable",
      command = "node",
      args = { mason_path .. "/packages/node-debug2-adapter/out/src/nodeDebug.js" },
    }

    dap.adapters.kotlin = {
      type = "executable",
      command = mason_path .. "/packages/kotlin-debug-adapter/adapter/bin/kotlin-debug-adapter",
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

    -- Setup dap UI and auto open/close
    dap_ui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dap_ui.open()
    end
    dap.listeners.after.event_terminated["dapui_config"] = function()
      dap_ui.close()
    end
    dap.listeners.after.event_exited["dapui_config"] = function()
      dap_ui.close()
    end
  end
}
