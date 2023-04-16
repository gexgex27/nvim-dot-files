local status_lspc, lspc = pcall(require, "lspconfig")
if not status_lspc then
  print("Lsp-config не подключен!")
  return
end

local status_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_lsp then
  print("Cmp-lsp не запущен!")
  return
end

local capabilities = cmp_lsp.default_capabilities()

lspc["html"].setup({
  capabilities = capabilities,
})

lspc["lua_ls"].setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  }
})

lspc["clangd"].setup({
  capabilities = capabilities,
})

lspc["cssls"].setup({
  capabilities = capabilities,
})

lspc["intelephense"].setup({
  capabilities = capabilities,
})

lspc["vuels"].setup({
  capabilities = capabilities,
})
