local status_null_ls, null_ls = pcall(require, "null-ls")
if not status_null_ls then
	print("Null-ls не подключен!")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		diagnostics.eslint_d,
		diagnostics.clang_check,
		diagnostics.cmake_lint,
		diagnostics.hadolint,
		diagnostics.php,
		diagnostics.rubocop,
		diagnostics.selene,
		diagnostics.stylelint,
		diagnostics.twigcs,
		diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
		formatting.clang_format,
		formatting.cmake_format,
		formatting.nginx_beautifier,
		formatting.perltidy,
		formatting.pg_format,
		formatting.phpcsfixer,
		formatting.prettier_eslint,
		formatting.ptop,
		formatting.rubocop,
		formatting.stylua,
		formatting.sql_formatter,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
