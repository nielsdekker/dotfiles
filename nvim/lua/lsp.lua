-- A list of LSP's that are disabled for now because of issues or other
-- problems.
local disabled_lsp = {
    -- Cause the EsLint LSP can not handle the eslint-suppressions file
    "eslint",
    -- Cause cucumber ls does not support Kotlin
    "cucumber_ls",
}

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

        configs = vim.tbl_filter(function(v)
            return vim.tbl_contains(disabled_lsp, v) == false
        end, configs)

        vim.lsp.enable(configs)
    end
})
