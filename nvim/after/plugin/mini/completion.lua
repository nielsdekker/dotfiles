local completion = require("mini.completion")

-- Mini completion
completion.setup({
    window = {
        info = { height = 25, width = 80, border = "none" },
        signature = { height = 25, width = 80, border = "none" }
    },
    -- Fallback to files
    fallback_action = "<C-x><C-f>",
    lsp_completion = {
        process_items = function(items, base)
            local completionKind = vim.lsp.protocol.CompletionItemKind;
            local result = vim.tbl_filter(function(item)
                -- Remove text and snippet kinds
                return item.kind ~= completionKind.Text and item.kind ~= completionKind.Snippet
            end, items)

            -- Make sure the list is sorted
            table.sort(result, function(a, b)
                return (a.sortText or a.label) < (b.sortText or b.label)
            end)

            return completion.default_process_items(result, base)
        end
    }
})
