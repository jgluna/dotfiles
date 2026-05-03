return{
	'stevearc/conform.nvim',
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			python = { "black" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
		},
		formatters = {
			black = {
				timeout_ms = 10000,
			},
		},
	},
}
