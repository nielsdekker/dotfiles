-- Custom plugin for running detekt, cause the kotlin-community thinks nvim
-- users are nothing more then degens who should "just use" jetbrains stuff.
--
-- The plugin does the following
-- - Setup an auto command for kotlin files
-- - On save, or open, detekt will be run and the output is written to a tmp
--   file
-- - The detekt file is parsed
-- - ???
-- - Profit
local M = {}

M.setup = function(tbl)
    local ns = vim.api.nvim_create_namespace("DetektCustom")
    local config_files = vim.fs.find(tbl.root_markers, { upward = true, type = "file" })
    local au_group = vim.api.nvim_create_augroup("DetektCustom", {
        clear = true,
    })
    vim.api.nvim_create_autocmd(
        { "BufAdd", "BufWritePost" },
        {
            pattern = "*.kt",
            group = au_group,
            callback = function()
                M._run_detekt(config_files[1], ns)
            end
        }
    )
end

M._run_detekt = function(config_file, ns)
    local tmp_file = os.tmpname()
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    local cmd = {
        "detekt",
        "-r",
        "sarif:" .. tmp_file,
        "--build-upon-default-config",
        "--includes",
        bufname,
    }

    if config_file ~= nil then
        table.insert(cmd, "--config")
        table.insert(cmd, config_file)
    end


    vim.notify("Detekt: Validating " .. bufname, vim.log.levels.INFO)
    vim.system(cmd, { text = true }, function(obj)
        if obj.code == 3 then
            vim.notify("Detekt: config invalid\n" .. obj.stderr, vim.log.levels.ERROR)
            return
        end

        local diagnostics = M._parse_sarif(tmp_file, bufnr)
        local diagnostics_len = vim.tbl_count(diagnostics)

        vim.schedule(function()
            if diagnostics_len == 0 then
                vim.notify("Detekt: No issues found :)", vim.log.levels.INFO)
            else
                vim.notify("Detekt: found " .. diagnostics_len .. " issues", vim.log.levels.WARN)
            end

            vim.diagnostic.set(ns, bufnr, diagnostics, {})
        end)
    end)
end

M._parse_sarif = function(tmp_file, bufnr)
    local f = io.open(tmp_file, "r")
    local diagnostics = {}

    if f == nil then
        return diagnostics
    end

    local sarif_json = f.read(f, "*a")
    local sarif_data = vim.json.decode(sarif_json)

    -- We should have 1 run
    for _, v in pairs(sarif_data.runs[1].results) do
        local loc = v.locations[1].physicalLocation.region

        table.insert(diagnostics, {
            bufnr = bufnr,
            lnum = loc.startLine - 1,
            end_lnum = loc.endLine - 1,
            col = loc.startColumn - 1,
            end_col = loc.endColumn - 1,
            message = v.message.text
        })
    end

    return diagnostics
end

return M
