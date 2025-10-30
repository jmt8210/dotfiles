return {
	"stevearc/conform.nvim",
	dependencies = {
		"rcarriga/nvim-notify",
	},
	opts = {
		format_on_save = function()
			local notify = require("notify")
			if vim.g.disable_autoformat then
				notify(
					"Autoformatting disabled, use :EnableFormatting to re-enable",
					"warn",
					{ title = "conform.nvim" }
				)
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "eslint_d" },
			javascriptreact = { "prettierd", "eslint_d" },
			typescript = { "prettierd", "eslint_d" },
			typescriptreact = { "prettierd", "eslint_d" },
			go = { "gofmt" },
		},
	},
}
