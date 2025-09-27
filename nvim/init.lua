require("config.lazy")

-- Set hybrid line numbers (relative and show current line number)
vim.wo.number = true
vim.wo.relativenumber = true

-- Make search case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- New splits open on bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.scrolloff = 10

-- Automatically refresh open files when changed on disk
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- Prevent shift for signcolumn
vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Display errors in float
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- Goto definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
-- Goto reference
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })

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

-- Prevent text wrapping for long lines
vim.wo.wrap = false

-- Allow copy to clipboard from visual mode
vim.api.nvim_set_keymap("v", "<leader>y", "::w !pbcopy<CR><CR>", { noremap = true, silent = true })

-- Bufferline
vim.keymap.set("n", "<leader>n", function()
	vim.api.nvim_command("bn")
end)
vim.keymap.set("n", "<leader>p", function()
	vim.api.nvim_command("bp")
end)
vim.keymap.set("n", "<leader>c", ":Bdelete<CR>", { noremap = true, silent = true })

-- Reopen last closed buffer
vim.keymap.set("n", "<leader>t", ':lua require("bufferline").go_to_buffer(-1, true)<CR>', { silent = true })

-- Close quickfix window (usually go to definition) after selection
vim.api.nvim_create_autocmd("FileType", { pattern = { "qf" }, command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]] })

-- Set border for popup windows
vim.opt.winborder = "rounded"

-- Close No Name buffer if another buffer is opened
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		local buffers = vim.api.nvim_list_bufs()
		for _, bufnr in ipairs(buffers) do
			if
				vim.api.nvim_buf_is_loaded(bufnr)
				and vim.api.nvim_buf_get_name(bufnr) == ""
				and vim.api.nvim_buf_get_option(bufnr, "buftype") == ""
				and vim.api.nvim_buf_line_count(bufnr) == 1
				and vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] == ""
			then
				-- Close the buffer if it's empty, unnamed, and has no content
				vim.cmd("bd! " .. bufnr)
			end
		end
	end,
})
