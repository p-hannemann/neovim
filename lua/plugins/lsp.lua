return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          -- "eslint",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.tsserver.setup({})
      -- lspconfig.eslint.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Goto Definition" })
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
    end
  },
}
