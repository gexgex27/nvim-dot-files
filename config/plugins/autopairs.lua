local status_pairs, pairs = pcall(require, "nvim-autopairs")
if not status_pairs then
  print("Auto-pairs не подключен!")
  return
end

pairs.setup()
