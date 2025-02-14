local lsp_config = require("lspconfig")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

local lsp_to_skip = {
    -- Cucumber doesn't allow for disabling the formatter. And IJ doesn't format
    -- cucumber files as it should. Besides kotlin not having any tooling
    -- outside IJ so just disable the cucumber language server by default.
    "cucumber_language_server"
}

mason.setup {}
mason_lsp.setup {
    ensure_installed = {
        "ts_ls",
        "gopls",
    }
}

mason_lsp.setup_handlers {
    -- Default config for all langauge servers
    function(server_name)
        if vim.tbl_contains(lsp_to_skip, server_name) == false then
            require("lspconfig")[server_name].setup {}
        end
    end,

    ["lua_ls"] = function()
        lsp_config.lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT"
                    },
                    workspace = {
                        checkThirdParty = false,

                        library = {
                            unpack(vim.api.nvim_get_runtime_file("", true)),
                        },
                    }
                }
            }
        }
    end,

    ["yamlls"] = function()
        lsp_config.yamlls.setup {
            settings = {
                yaml = {
                    disableDefaultProperties = true,
                    keyOrdering = false,
                    schemas = {
                        kubernetes = { "**/k8s/**/templates/*.yaml" }
                    }
                }
            }
        }
    end,

    ["ts_ls"] = function()
        lsp_config.ts_ls.setup {
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    }
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    }
                }
            },
            on_attach = function(client)
                client.server_capabilities.document_formatting = false
            end
        }
    end,
}
