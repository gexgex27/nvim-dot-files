local status_gitsigns, gitsigns = pcall(require, "gitsigns")
if not status_gitsigns then
	print("Gitsigns не подключен!")
	return
end

gitsigns.setup()
