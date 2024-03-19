return {
  setup = function()
    local confirm = require("conform")

    confirm.setup({
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true
      },
      formatters_by_ft = {
        json = { "prettier" },
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
