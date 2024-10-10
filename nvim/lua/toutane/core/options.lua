vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true

-- vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.foldlevel = 99
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.signcolumn = "yes"
