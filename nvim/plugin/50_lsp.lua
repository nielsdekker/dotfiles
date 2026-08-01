-- Will enable all the configurations that are found in the `lsp/*` folder, only
-- start loading the files after a buffer is opened. In this case LSP settings
-- can still be changed from a `.nvim.lua` file.
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        for _, lsp in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
            vim.lsp.enable(vim.fn.fnamemodify(lsp, ":t:r"))
        end
    end,
})

-- Enable completion on attach
-- Doc: https://neovim.io/doc/user/lsp/#lsp-attach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("dot.lsp", {}),
    callback = function(evt)
        local client = assert(vim.lsp.get_client_by_id(evt.data.client_id))
        vim.lsp.completion.enable(true, client.id, evt.buf, { autotrigger = true })

        -- Enable format on save using the LSP
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("dot.lsp", { clear = false }),
            buffer = evt.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = evt.buf, id = client.id, timeout_ms = 1000 })
            end
        })
    end,
})
