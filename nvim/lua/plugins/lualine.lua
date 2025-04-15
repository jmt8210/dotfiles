return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for filetype icons
    config = function()
      -- Load lualine with catppuccin theme
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          --section_separators = { left = "", right = "" },
          --component_separators = { left = "", right = "" },
        },
      })
    end,
  },
}

