local i_opts = {
  mode = "i",
  silent = true,
  noremap = true,
}

local i_mapping = {
  -- Use jk To Exit Insert Mode
  ["jk"] = { "<ESC>", "Exit Insert Mode" },
  -- Next/Previous Word
  ["<C-b>"] = { "<ESC>^i", "Start Line" },
  ["<C-e>"] = { "<End>", "End Line" },
}

local x_opts = {
  mode = "x",
  silent = true,
  noremap = true,
}

local x_mapping = {
  -- Move Selected Line / Block Of Text In Visual Mode
  ["K"] = { ":move '<-2<CR>gv-gv", "Move Selected Up" },
  ["J"] = { ":move '>+1<CR>gv-gv", "Move Selected Down" },
}

local v_opts = {
  mode = "v",
  silent = true,
  noremap = true,
}

local v_mapping = {
  -- Better Indent
  ["<"] = { "<gv", "Indent Left" },
  [">"] = { ">gv", "Indent Right" },
}

local n_opts = {
  mode = "n",
  silent = true,
  noremap = true,
}

local n_mapping = {
  -- Visual Line Wraps
  ["k"] = { "v:count == 0 ? 'gk' : 'k'", "Visual Line Wraps", expr = true },
  ["j"] = { "v:count == 0 ? 'gj' : 'j'", "Visual Line Wraps", expr = true },
  -- Clear Search Highlights
  ["<leader>nh"] = { ":nohl<CR>", "Clear Search Highlights" },
  -- delete Single Character Without Copying Into Register
  ["x"] = { '"_x', "Delete Char Without Copying" },
  -- Increment/Decrement Numbers
  ["<leader>+"] = { "<C-a>", "Increment Number" },
  ["<leader>-"] = { "<C-x>", "Decrement Number" },
  -- Window Management
  ["<leader>s"]  = { name = "Window Managment" },
  ["<leader>sv"] = { "<C-w>v", "Split Vertical" },
  ["<leader>sh"] = { "<C-w>s", "Split Horizontal" },
  ["<leader>se"] = { "<C-w>=", "Split ?" },
  ["<leader>sx"] = { ":close<CR>", "Close Split" },
  -- Tabs Management
  ["<leader>t"] = { name = "Tab Managment" },
  ["<leader>to"] = { ":tabnew<CR>", "New Tab" },
  ["<leader>tx"] = { ":tabclose<CR>", "Close Tab" },
  ["<leader>tn"] = { ":tabn<CR>", "Next Tab" },
  ["<leader>tp"] = { ":tabp<CR>", "Previous Tab" },
  -- Select All
  ["<leader>a"] = { ":keepjumps normal! ggVG<cr>", "Select All" },
  -- New File
  ["<leader>b"] = { "<cmd> enew <CR>", "New File" },
  -- Center Search Results
  ["n"] = { "nzz", "Next Search" },
  ["N"] = { "Nzz", "Previous Search" },
  -- Show WichKey
  ["<leader>wk"] = { ":WhichKey <CR>", "WhichKey Info" },
  -- Tmux Navigate
  ["<C-h>"]      = { ":TmuxNavigateLeft <CR>", "Tmux Navigate Left" },
  ["<C-j>"]      = { ":TmuxNavigateDown <CR>", "Tmux Navigate Down" },
  ["<C-k>"]      = { ":TmuxNavigateUp <CR>", "Tmux Navigate Up" },
  ["<C-l>"]      = { ":TmuxNavigateRight <CR>", "Tmux Navigate Right" },
  ["<C-Bslash>"] = { ":TmuxNavigatePrevious <CR>", "Tmux Navigate Previous" },
  -- Telescope
  ["<leader>"] = {
    f = {
      name = "Telescope",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      s = { "<cmd>Telescope live_grep<cr>", "Live Grep"},
      c = { "<cmd>Telescope grep_string<cr>", "Grep String"},
      b = { "<cmd>Telescope buffers<cr>", "Buffers"},
      h = { "<cmd>Telescope help_tags<cr>", "Find Help"},
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
  },
  -- NvimTree
  ["<leader>e"] = { ":NvimTreeToggle<CR>", "NvimTree Open/Close" },
  -- Packer
  ["<leader>"] = {
    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
  },
  -- LSP
  ["<leader>"] = {
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
      w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
      k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    },
  }
}

local conf = {
  icons = {
  breadcrumb = "»",
  separator = "➜ ",
  group = "+",
  },
}

local status_wk, whichkey = pcall(require, "which-key")
if not status_wk then
  return
end

whichkey.register(i_mapping, i_opts)
whichkey.register(x_mapping, x_opts)
whichkey.register(v_mapping, v_opts)
whichkey.register(n_mapping, n_opts)
whichkey.setup(conf)
