return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"eslint",
			"lua_ls",
			"pyright",
			"pylsp",
			"rust_analyzer",
			"tailwindcss",
			"ts_ls",
			-- Some tools are also used, but aren't valid in this list, install afterwards using :MasonInstall eslint_d prettierd
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
