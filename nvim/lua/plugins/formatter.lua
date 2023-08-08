return {
  "mhartington/formatter.nvim",
  config = function()
    local formatter = require("formatter");
    local f = require("formatter.filetypes")

    formatter.setup {
      filetype = {
        typescript = f.typescript.prettier,
        typescriptreact = f.typescriptreact.prettier,
        json = f.json.prettier,
        javascript = f.javascript.prettier,
        javascriptreact = f.javascriptreact.prettier,
        yaml = f.yaml.prettier
      }
    }

    local augroup = vim.api.nvim_create_augroup("FormatAutoGroup", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = augroup,
      callback = function()
        vim.cmd("FormatWrite")
      end
    })
  end
}
