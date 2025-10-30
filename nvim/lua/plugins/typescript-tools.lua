return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = function()
		require("typescript-tools").setup({})
		local ts_tools_group = vim.api.nvim_create_augroup("TSToolsAutoFix", { clear = true })

		-- Function to check if the TSServer client is attached
		local function is_tsserver_attached(bufnr)
			bufnr = bufnr or vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr })
			for _, client in ipairs(clients) do
				if client.name == "tsserver" then
					return true
				end
			end
			return false
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = ts_tools_group,
			pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				-- Only proceed if tsserver is attached
				if not is_tsserver_attached(bufnr) then
					return
				end

				-- Your existing logic
				local notify = require("notify")
				if vim.g.disable_autoformat then
					notify(
						"Autoformatting disabled, use :EnableFormatting to re-enable",
						"warn",
						{ title = "typescript-tools.nvim" }
					)
				else
					vim.cmd("TSToolsAddMissingImports sync")
					vim.cmd("TSToolsOrganizeImports sync")
					vim.cmd("TSToolsRemoveUnusedImports sync")
				end
			end,
		})
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
	end,
}
