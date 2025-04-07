-- Setup detekt for kotlin. Cause Jetbrains considers neovim users degens that
-- should not have any tooling some custom stuff is needed. In short we do the
-- following:
-- - On BufEnter, BufWritePost run detekt
-- - Parse the detekt diagnostics and yeet them to the diagnostics of this file
-- - ???
-- - Profit

---@param stdout string
---@param bufnr integer
---@param ns integer
local function stdout_to_diagnostics(stdout, bufnr, ns)
    local lines = vim.split(stdout, "\n", { plain = true, trimempty = true })

    ---@type vim.Diagnostic[]
    local diagnostics = {}

    for _, v in pairs(lines) do
        -- Example of the detekt output:
        -- /foo/bar.kt:33:11: Missing braces on this branch, add them. [BracesOnIfStatements]
        local splitted = vim.split(v, ":", { plain = true, trimempty = true })
        local len = vim.tbl_count(splitted)

        if len >= 4 then
            -- This looks like a diagnostics line, filename is on index 1 but
            -- not used currently.
            local lnum = tonumber(splitted[2])
            local col = tonumber(splitted[3])
            local message = splitted[4]

            -- It could be the message itself contained a ":", so join all
            -- remaining string parts into the message.
            for i = 5, len do
                message = message .. ":" .. splitted[i]
            end

            table.insert(diagnostics, {
                bufnr = bufnr,
                -- The line is parsed correctly but somehow this is of by one :/
                lnum = lnum - 1,
                col = col,
                message = message,
            })
        end
    end

    vim.schedule(function()
        vim.diagnostic.set(
            ns,
            bufnr,
            diagnostics,
            {}
        )
    end)
end

vim.api.nvim_create_autocmd(
    { "BufAdd", "BufWritePost" },
    {
        buffer = vim.api.nvim_get_current_buf(),
        callback = function()
            local bufnr = vim.api.nvim_get_current_buf()
            local ns = vim.api.nvim_create_namespace("Detekt")
            vim.notify("Running detekt for diagnostics", vim.log.levels.INFO)

            -- Run detekt in the background
            vim.system({
                    "detekt",
                    "--build-upon-default-config",
                    "--config",
                    "detekt.yaml",
                    "--includes",
                    vim.api.nvim_buf_get_name(bufnr),
                }, {
                    text = true
                },
                function(obj)
                    if obj.stdout == nil then
                        return
                    end

                    stdout_to_diagnostics(obj.stdout, bufnr, ns)
                    vim.notify("Detekt ran, check diagnostics for info", vim.log.levels.INFO)
                end
            )
        end
    }
)
