local M = {}

-- A safe wrapper for bufdelete
function M.safe_bufdelete(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	local satellite = require("satellite")

	-- 1. Check if satellite is visible in the current window and close it
	local was_open = false
	if satellite.view:is_visible() then
		satellite.view:close()
		was_open = true
	end

	-- 2. Call the original bufdelete function
	-- The bufnr argument is passed to bufdelete.
	require("bufdelete").bufdelete(bufnr)

	-- 3. If satellite was open, trigger a refresh/open to recreate the view
	if was_open then
		-- Use vim.schedule to ensure this runs *after* all buffer closing events
		vim.schedule(function()
			-- This function essentially re-opens and draws the satellite view
			satellite.api.refresh_view()
		end)
	end
end

return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				close_command = M.safe_bufdelete,
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
