return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				close_command = require("bufdelete").bufdelete,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})
	end,
}
