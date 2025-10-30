return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for filetype icons
		config = function()
			-- Load lualine with catppuccin theme
			require("lualine").setup({
				options = {
					theme = "catppuccin",
				},
				sections = {
					lualine_c = {
						{
							"filename",
							file_status = true,
							path = 1,
						},
					},
				},
			})
		end,
	},
}
