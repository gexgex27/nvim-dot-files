local status_nt, nvim_tree = pcall(require, "nvim-tree")
if not status_nt then
  return
end

nvim_tree.setup({
  hijack_cursor = true,
  view = {
    number = true,
    relativenumber = true,
  },
})
