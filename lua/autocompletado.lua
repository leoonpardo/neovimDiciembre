
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),

    -- ENTER: confirm si hay menú, si no, deja Enter normal
    ["2"] = cmp.mapping(function(fallback)
      local luasnip = require("luasnip")

      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp",  max_item_count = 5 },
    { name = "buffer",    max_item_count = 5 },
    { name = "path",      max_item_count = 5 },
  }),
})
