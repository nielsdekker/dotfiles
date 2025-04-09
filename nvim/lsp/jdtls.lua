vim.lsp.config.jdtls = {
    cmd = { "jdtls" },
    filetypes = { "java" },
    root_markers = { ".git" },
    settings = {
        java = {
            format = { enabled = false }
        }
    },
    handlers = {
        -- Disables the annoying "validate document" pop-ups
        ["$/progress"] = function() end
    }
}
return {}
