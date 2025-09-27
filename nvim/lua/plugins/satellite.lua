return {
	"lewis6991/satellite.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	event = "VeryLazy", -- or "BufReadPre" to load earlier
	config = function()
		require("satellite").setup({
			-- width = 2, -- Wider scrollbar
			winblend = 0,
			handlers = {
				search = { enable = true },
				diagnostic = { enable = true },
				gitsigns = { enable = true },
				cursor = { enable = true },
			},
		})
	end,
}
