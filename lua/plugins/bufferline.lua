local status_bl, bufferline = pcall(require, "bufferline")
if not status_bl then
  return
end

bufferline.setup({
  options = {
--    numbers = "none",
    separator_style = "padded_slant",
--    show_tab_indicators = true,
--    show_buffer_close_icons = false,
--    show_close_icon = false,
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
