local status_bl, bufferline = pcall(require, "bufferline")
if not status_bl then
	return
end

bufferline.setup({
	options = {
		separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
	highlights = {
		buffer_selected = {
			italic = false,
		},
	},
})
