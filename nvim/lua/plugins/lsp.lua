return {
  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },

  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      settings = {
        tsserver_plugins = {},
      },
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
      end,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    },
  },


  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup{}
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("tailwind-tools").setup({})

      -- on_attach with just go to definition
      local on_attach = function(_, bufnr)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
        vim.keymap.set("n", "<leader>ii", "<cmd>TSToolsAddMissingImports<CR>", { buffer = bufnr, desc = "Add Missing Imports" })
      end

      -- ESLint (optional)
      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  }
}
