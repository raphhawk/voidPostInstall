require('luasnip').filetype_extend("typescriptreact", { "javascriptreact" })
require('luasnip').filetype_extend("typescriptreact", { "html" })
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  completion = {completionopt = "noselect"},
  preselect = cmp.PreselectMode.None,
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'buffer'}
  },

  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }
})

