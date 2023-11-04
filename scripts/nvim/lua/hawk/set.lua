vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"
vim.opt.guicursor = ""
vim.g.reaibow_active = 1
-- vim.opt.guicursor = "i:ver100-iCursor"

vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float)
