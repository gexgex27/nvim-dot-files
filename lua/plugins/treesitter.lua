local status_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_treesitter then
	print("Treesitter не подключен!")
	return
end

treesitter.setup({
	ensure_isntalled = {
		"lua",
		"css",
		"html",
		"yaml",
		"json",
		"vim",
		"bash",
		"dockerfile",
		"markdown",
		"c",
		"cpp",
		"perl",
		"pascal",
		"php",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
	},
})
