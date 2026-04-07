return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				-- LSP servers
				"basedpyright",
				"lua-language-server",
				"typescript-language-server",
				"gopls",
				"css-lsp",
				"html-lsp",
				"json-lsp",
				"emmet-ls",
				-- Formatters
				"black",
				"prettier",
			},
		},
	},
}
