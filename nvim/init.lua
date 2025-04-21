require("config.lazy")

vim.opt.relativenumber = true

-- Make search case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.tabstop = 2

vim.cmd[[autocmd BufWritePre {*.js,*.jsx,*.ts,*.tsx} Neoformat]]

-- Display errors inline
vim.diagnostic.config({virtual_text = true})

-- Goto definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
