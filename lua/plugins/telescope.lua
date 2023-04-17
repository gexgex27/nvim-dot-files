local status_telescope, telescope = pcall(require, "telescope")
if not status_telescope then
  print("Telescope не подключен!")
  return
end

local status_actions, actions = pcall(require, "telescope.actions")
if not status_actions then
  print("Telescope.actions не подключен!")
  return
end

telescope.setup({})

telescope.load_extension("fzf")
