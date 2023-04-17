local status_mason, mason = pcall(require, "mason")
if not status_mason then
  print("Mason не подключен!")
  return
end

local status_mason_lspc, mason_lspc = pcall(require, "mason-lspconfig")
if not status_mason_lspc then
  print("Mason lsp-config не подключен!")
  return
end

mason.setup()

mason_lspc.setup({
  ensure_installed = {
    "lua_ls",
    "intelephense",
    "vuels",
    "clangd",
    "cssls",
    "html",
  },
  automatic_installation = true
})
