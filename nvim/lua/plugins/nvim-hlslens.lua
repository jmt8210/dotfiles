return {
	"kevinhwang91/nvim-hlslens",
	event = "VeryLazy",
	config = function()
		require("hlslens").setup()

		-- Optional: Map search keys to trigger lens
		local kopts = { noremap = true, silent = true }

		vim.keymap.set(
			"n",
			"n",
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.keymap.set(
			"n",
			"N",
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

		local colors = require("catppuccin.palettes").get_palette("mocha")
		vim.api.nvim_set_hl(0, "HlSearchLens", {
			fg = colors.overlay0,
			bg = "NONE",
			bold = false,
		})
		vim.api.nvim_set_hl(0, "HlSearchLensNear", {
			fg = colors.lavender,
			bg = "NONE",
			bold = true,
		})
	end,
}
