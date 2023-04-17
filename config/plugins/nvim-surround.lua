local status_surround, surround = pcall(require, "nvim-surround")
if not status_surround then
  print("Nvim-surround не подключен!")
  return
end

surround.setup()
