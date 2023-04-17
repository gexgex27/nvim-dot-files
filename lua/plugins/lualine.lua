local status_lualine, lualine = pcall(require, "lualine")
if not status_lualine then
  print("Lualine не подключен!")
  return
end

lualine.setup()
