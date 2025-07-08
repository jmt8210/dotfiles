return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Load your custom Lua snippets
      require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/lua/snippets" } })
    end,
  },
}

