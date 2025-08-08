-- Will enable all the configurations that are found in the `lsp/*` folder, only
-- start loading the files after a buffer is opened. In this case LSP settings
-- can still be changed from a `.nvim.lua` file.
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        local configs = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
            :map(function(f)
                return vim.fn.fnamemodify(f, ":t:r")
            end)
            :totable()

        vim.lsp.enable(configs)
    end
})
