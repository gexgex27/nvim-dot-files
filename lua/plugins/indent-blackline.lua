local status_ib, ib = pcall(require, "indent_blankline")
if not status_ib then
	print("Indent blackline не подключен!")
	return
end

ib.setup({
	show_current_context = true,
	show_current_context_start = true,
})
