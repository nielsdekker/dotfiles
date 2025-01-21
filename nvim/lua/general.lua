-- window
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.textwidth = 80
vim.o.colorcolumn = "+" .. vim.fn.join(vim.fn.range(1, 254), ",+")

-- Tabs and spaces
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '+' }

vim.o.signcolumn = "yes"

vim.g.shell = "/bin/zsh"
vim.o.shell = "/bin/zsh"
vim.o.exrc = true
vim.o.cursorline = true

-- Enable spell checking
vim.o.spell = true
vim.o.spelllang = "en,nl"
vim.o.spelloptions = "camel,noplainbuffer"

-- Autocommands

-- Some default configuration about how the LSP should handle diagnostics.
-- In short this disables the inline virtual text and adds a float when
-- hovering over an error instead.
vim.diagnostic.config({
    virtual_text = false
})
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})

-- Prevents the integrated terminal from closing on exit. Now an explicit close
-- call needs to be given.
vim.api.nvim_create_autocmd("TermClose", {
    callback = function(ctx)
        vim.cmd('stopinsert')
        vim.api.nvim_create_autocmd("TermEnter", {
            callback = function()
                vim.cmd('stopinsert')
            end,
            buffer = ctx.buf,
        })
    end,
    nested = true,
})

-- Make sure terraform files work as intended
vim.filetype.add({
    extension = {
        tf = "terraform"
    }
})
