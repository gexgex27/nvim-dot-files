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
	["K"] = { "<CMD>move '<-2<CR>gv-gv", "Move Selected Up" },
	["J"] = { "<CMD>move '>+1<CR>gv-gv", "Move Selected Down" },
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
	["<leader>nh"] = { "<CMD>nohl<CR>", "Clear Search Highlights" },
	-- delete Single Character Without Copying Into Register
	["x"] = { '"_x', "Delete Char Without Copying" },
	-- Increment/Decrement Numbers
	["<leader>+"] = { "<C-a>", "Increment Number" },
	["<leader>-"] = { "<C-x>", "Decrement Number" },
	-- Window Management
	["<leader>s"] = { name = "Window Managment" },
	["<leader>sv"] = { "<C-w>v", "Split Vertical" },
	["<leader>sh"] = { "<C-w>s", "Split Horizontal" },
	["<leader>se"] = { "<C-w>=", "Split ?" },
	["<leader>sx"] = { "<CMD>close<CR>", "Close Split" },
	-- Tabs Management
	["<leader>t"] = { name = "Tab Managment" },
	["<leader>to"] = { "<CMD>tabnew<CR>", "New Tab" },
	["<leader>tx"] = { "<CMD>bd<CR>", "Close Tab" },
	["<leader>tn"] = { "<CMD>BufferLineCycleNext<CR>", "Next Tab" },
	["<leader>tp"] = { "<CMD>BufferLineCyclePrev<CR>", "Previous Tab" },
	-- Select All
	["<leader>a"] = { "<CMD>keepjumps normal! ggVG<CR>", "Select All" },
	-- New File
	["<leader>b"] = { "<CMD>enew<CR>", "New File" },
	-- Center Search Results
	["n"] = { "nzz", "Next Search" },
	["N"] = { "Nzz", "Previous Search" },
	-- Show WichKey
	["<leader>wk"] = { "<CMD>WhichKey<CR>", "WhichKey Info" },
	-- Tmux Navigate
	["<C-h>"] = { "<CMD>TmuxNavigateLeft<CR>", "Tmux Navigate Left" },
	["<C-j>"] = { "<CMD>TmuxNavigateDown<CR>", "Tmux Navigate Down" },
	["<C-k>"] = { "<CMD>TmuxNavigateUp<CR>", "Tmux Navigate Up" },
	["<C-l>"] = { "<CMD>TmuxNavigateRight<CR>", "Tmux Navigate Right" },
	["<C-Bslash>"] = { "<CMD>TmuxNavigatePrevious<CR>", "Tmux Navigate Previous" },
	-- Telescope
	["<leader>f"] = {
		name = "Telescope",
		f = { "<CMD>Telescope find_files<CR>", "Find File" },
		s = { "<CMD>Telescope live_grep<CR>", "Live Grep" },
		c = { "<CMD>Telescope grep_string<CR>", "Grep String" },
		b = { "<CMD>Telescope buffers<CR>", "Buffers" },
		h = { "<CMD>Telescope help_tags<CR>", "Find Help" },
		g = { "<CMD>Telescope git_branches<CR>", "Checkout branch" },
		M = { "<CMD>Telescope man_pages<CR>", "Man Pages" },
		r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
		R = { "<CMD>Telescope registers<CR>", "Registers" },
		k = { "<CMD>Telescope keymaps<CR>", "Keymaps" },
		C = { "<CMD>Telescope commands<CR>", "Commands" },
	},
	-- NvimTree
	["<leader>e"] = { "<CMD>NvimTreeToggle<CR>", "NvimTree Open/Close" },
	-- Packer
	["<leader>p"] = {
		name = "Packer",
		c = { "<CMD>PackerCompile<CR>", "Compile" },
		i = { "<CMD>PackerInstall<CR>", "Install" },
		s = { "<CMD>PackerSync<CR>", "Sync" },
		S = { "<CMD>PackerStatus<CR>", "Status" },
		u = { "<CMD>PackerUpdate<CR>", "Update" },
	},
	-- LSP
	["<leader>l"] = {
		name = "LSP",
		a = { "<CMD>CodeActionMenu<CR>", "Code Action" },
		d = { "<CMD>Telescope diagnostics bufnr=0<CR>", "Document Diagnostics" },
		w = { "<CMD>Telescope diagnostics<CR>", "Workspace Diagnostics" },
		f = { "<CMD>lua vim.lsp.buf.format{async=true}<CR>", "Format" },
		i = { "<CMD>LspInfo<CR>", "Info" },
		j = { "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
		l = { "<CMD>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
		q = { "<CMD>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
		r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
		s = { "<CMD>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		S = { "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },
	},
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
