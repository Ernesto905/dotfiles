-- lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- loads vscode style snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- Keymaps for the completion menu
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous item
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Next item
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),            -- Manually trigger completion
        ["<C-e>"] = cmp.mapping.abort(),                   -- Close the menu
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
      }),
      -- These are the sources it will draw completions from
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Source for LSP
        { name = "luasnip" },  -- Source for snippets
        { name = "buffer" },   -- Source for text in current file
      }),
      -- Adds icons to the menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
