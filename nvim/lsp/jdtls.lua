---@type vim.lsp.Config
return {
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
    },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    resolveSupport = {
                        properties = {
                            "documentation",
                            "additionalTextEdits",
                            "insertTextFormat",
                            "insertTextMode",
                            "command"
                        }
                    }
                }
            }
        }
    }
}
