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

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Display errors inline
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- Goto definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })

vim.lsp.enable("gopls")

-- Luasnip
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

-- Bufferline
vim.keymap.set("n", "<leader>c", function()
	vim.api.nvim_command("bp|bd")
end)
vim.keymap.set("n", "<leader>n", function()
	vim.api.nvim_command("bn")
end)
vim.keymap.set("n", "<leader>p", function()
	vim.api.nvim_command("bp")
end)
