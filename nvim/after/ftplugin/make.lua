-- Use actual tabs in make files. Tabs have a special meaning in these files.
vim.o.expandtab = false

-- Disable the editor config for this. Tabs are required in makefiles and we
-- don't want the editor config to enforce spaces instead.
vim.b.editorconfig = false
