return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local _util = require("_util")
    local null_ls = require("null-ls")
    local null_ls_h = require("null-ls.helpers")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "json",
            "markdown",
            "html",
            "css",
            "scss",
            "less",
            "lua",
            "yaml",
          },
          command = "npx",
          args = null_ls_h.range_formatting_args_factory({
            "prettier",
            "--stdin-filepath",
            "$FILENAME",
          }, "--range-start", "--range-end", { row_offset = -3, col_offset = -1 }),
        })
      },
      on_attach = _util.formatIfSupported
    })
  end
}
