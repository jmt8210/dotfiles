-- Copied from https://github.com/QuiiBz/dotfiles/commit/5de82103aa5d9a4e462d778a2ecbe596d5f90cf4#diff-5ebd926f4dd2ccff6ad1d5edbf05ff666d8481c8e6edcce55fa7329b7bc8dda9R1-R30
-- Issue tracked at https://github.com/lewis6991/satellite.nvim/issues/90
local patches = {
	["satellite.nvim"] = "satellite-gitsigns-fix.patch",
}

-- Reset repos to clean state before update
vim.api.nvim_create_autocmd("User", {
	pattern = { "LazyInstallPre", "LazyUpdatePre" },
	callback = function()
		for repo, _ in pairs(patches) do
			local cmd = string.format("cd ~/.local/share/nvim/lazy/%s && git reset --hard", repo)
			os.execute(cmd)
		end
	end,
})

-- Apply patches after install or update
vim.api.nvim_create_autocmd("User", {
	pattern = { "LazyInstall", "LazyUpdate" },
	callback = function()
		for repo, patch in pairs(patches) do
			local cmd =
				string.format("cd ~/.local/share/nvim/lazy/%s && git apply ~/.config/nvim/patches/%s", repo, patch)
			os.execute(cmd)
		end
	end,
})
