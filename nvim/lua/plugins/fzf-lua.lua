return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    fzf_opts = {
      ['--query'] = "!node_modules !.next/ ",
    },
      
    config = function()
      require("fzf-lua").setup({
        files = {
          -- fd_opts = "--type f --strip-cwd-prefix --hidden",
          fzf_opts = {
            ["--query"] = "!node_modules !.next/ ",
          },
        },
      })
      -- Keybinding to open file finder
      vim.keymap.set("n", "<leader>ff", function()
        require("fzf-lua").files()
      end, { desc = "FZF: Find Files" })
      
      -- Keybinding to open grep finder
      vim.keymap.set("n", "<leader>fg", function()
        require("fzf-lua").grep()
      end, { desc = "FZF: Grep Files" })
    end,
  }
}

