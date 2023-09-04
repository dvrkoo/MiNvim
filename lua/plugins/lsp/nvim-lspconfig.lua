return {

  --nvim-lspconfig
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',

  },
  config = function()
    local lspconfig = require('lspconfig')
    require('neodev').setup()

    require('mason').setup({})

    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'rust_analyzer', 'pyright' }
    })

    require('mason-lspconfig').setup_handlers({
      function(server)
        lspconfig[server].setup({})
      end,
    })
  end,
}
