return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"rust_analyzer",
			"eslint",
			"tailwindcss",
			-- This is covered by typescript-tools, consider removing
			-- "ts_ls",
			-- eslint_d and prettierd are also used, but aren't valid in this list, install afterwards using :MasonInstall eslint_d prettierd
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
