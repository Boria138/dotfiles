local lsp = require("lsp-zero")
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "bashls", "cssls", "emmet_ls", "html", "tsserver" },
})
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.prettier,
  },
})
require("mason-null-ls").setup({
  ensure_installed = { "stylua", "prettier" },
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = "local",
  sign_icons = {
    error = "✘",
    warn = "▲",
    hint = "",
    info = "",
  },
})
lsp.nvim_workspace()
lsp.setup()
