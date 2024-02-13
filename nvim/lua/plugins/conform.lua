return {
  "stevearc/conform.nvim",
  config = function()
    local confirm = require("conform")

    confirm.setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      }
    })
  end
}
