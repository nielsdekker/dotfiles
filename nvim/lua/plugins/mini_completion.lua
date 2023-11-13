return {
  "echasnovski/mini.completion",
  dependencies = {
    "echasnovski/mini.nvim",
  },
  config = function()
    require("mini.completion").setup({
      -- Fallback to files
      fallback_action = "<C-x><C-f>",
      lsp_completion = {
        process_items = function(items)
          local completionKind = vim.lsp.protocol.CompletionItemKind;
          local res = vim.tbl_filter(function(item)
            -- Remove text and snippet kinds
            return item.kind ~= completionKind.Text and item.kind ~= completionKind.Snippet
          end, items)

          table.sort(res, function(a, b) return (a.sortText or a.label) < (b.sortText or b.label) end)

          return res
        end
      }
    })
  end
}
