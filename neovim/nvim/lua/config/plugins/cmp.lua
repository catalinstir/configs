return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind-nvim", -- Required for lspkind formatting
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Define highlight groups for completion menu
    vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#3c3836", fg = "#ebdbb2" }) -- Normal menu background
    vim.api.nvim_set_hl(0, "CmpPmenuSel", { bg = "#504945", fg = "#ebdbb2", bold = true }) -- Selected item
    vim.api.nvim_set_hl(0, "CmpPmenuBorder", { fg = "#504945" }) -- Border color

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:CmpPmenuSel,Search:None",
          col_offset = -3, -- Offset to align types on the left
          side_padding = 1, -- Slight padding for better readability
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,Search:None",
        }),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" }, -- Kind (type) on the left
        format = function(entry, vim_item)
          local kind = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " " -- Type icon/text on the left
          kind.menu = "    (" .. (strings[2] or "") .. ")" -- Menu text offset to the right
          return kind
        end,
      },
    })
  end,
}
