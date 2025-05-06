require("config.lazy")

-- Set hybrid line numbers (relative and show current line number)
vim.wo.number = true
vim.wo.relativenumber = true

-- Make search case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- New splits open on right
vim.opt.splitright = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.scrolloff = 10

vim.cmd[[autocmd BufWritePre {*.js,*.jsx,*.ts,*.tsx} Neoformat]]

-- Display errors inline
vim.diagnostic.config({virtual_text = true})
vim.cmd[[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_flat(nil, {focus=false})]]

-- Goto definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '"', '""<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '\'', '\'\'<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '`', '``<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true })
