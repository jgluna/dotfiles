return{
	'stevearc/conform.nvim',
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			python = { "black" },
			json = { lsp_format = "fallback" },
			lua = { lsp_format = "fallback" },
			go = { lsp_format = "fallback" },
			typescript = { lsp_format = "fallback" },
			javascript = { lsp_format = "fallback" },
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
