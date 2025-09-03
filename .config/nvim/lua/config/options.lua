vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.number = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "

vim.opt.textwidth = 80
vim.opt.formatoptions:append("t")

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window', noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window', noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window', noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window', noremap = true, silent = true })

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
