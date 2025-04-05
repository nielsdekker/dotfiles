return {
    --  Should be installed with mason
    cmd = { "lua-language-server" },
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
