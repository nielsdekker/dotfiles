local mason = require("mason")
local masonPath = vim.fn.stdpath("data") .. "/mason/"
local lspBinPath = masonPath .. "bin/"

mason.setup {
    install_root_dir = masonPath
}

-- GO
vim.lsp.config["gopls"] = {
    cmd = { "gopls" },
    filetypes = { "go" },
    root_markers = { "go.mod", ".git" },
}

-- Javascript/typescript
vim.lsp.config["ts_ls"] = {
    -- Should be installed with mason
    cmd = {
        lspBinPath .. "typescript-language-server",
        "--stdio"
    },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    root_markers = { ".git" },
}

-- Lua
vim.lsp.config["lua_ls"] = {
    --  Should be installed with mason
    cmd = { lspBinPath .. "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { "init.lua", ".nvim.lua", ".git" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,

                library = {
                    unpack(vim.api.nvim_get_runtime_file("", true)),
                },
            }
        }
    }
}

-- Yaml
vim.lsp.config["yamlls"] = {
    cmd = { lspBinPath .. "yaml-language-server" },
    filetypes = { "yaml" },
    root_markers = { ".git" },
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

vim.lsp.enable({ "gopls", "ts_ls", "lua_ls", "yamlls" })
