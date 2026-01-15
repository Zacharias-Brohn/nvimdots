local function flatten_to_array(t)
	local res = {}
	local function _flatten(tbl)
		for _, v in ipairs(tbl) do
			if type(v) == "table" then
				_flatten(v)
			else
				table.insert(res, v)
			end
		end
	end
	_flatten(t)
	return res
end
local capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	require("blink.cmp").get_lsp_capabilities()
)

require("fidget").setup {}
require("mason").setup()
require("mason-lspconfig").setup {
	automatic_enable = true,
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"gopls",
	},
	handlers = {
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup {
				capabilities = capabilities,
			}
		end,

		["tailwindcss"] = function()
			local lspconfig = require "lspconfig"
			lspconfig.tailwindcss.setup {
				capabilities = capabilities,
			}
		end,

		["css-lsp"] = function()
			local lspconfig = require "lspconfig"
			lspconfig.cssls.setup {
				capabilities = capabilities,
			}
		end,

		zls = function()
			local lspconfig = require "lspconfig"
			lspconfig.zls.setup {
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern(
					".git",
					"build.zig",
					"zls.json"
				),
				settings = {
					zls = {
						enable_inlay_hints = true,
						enable_snippets = true,
						warn_style = true,
					},
				},
			}
			vim.g.zig_fmt_parse_errors = 0
			vim.g.zig_fmt_autosave = 0
		end,
		["lua_ls"] = function()
			local lspconfig = require "lspconfig"
			lspconfig.lua_ls.setup {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = {
								"bit",
								"vim",
								"it",
								"describe",
								"before_each",
								"after_each",
							},
						},
					},
				},
			}
		end,
	},
}

vim.diagnostic.config {
	virtual_text = false,
	virtual_lines = false,
	signs = true,
	underline = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
}

local lspconfig = vim.lsp.config

lspconfig("texlab", {
	cmd = { "texlab" },
	filetypes = { "tex", "bib", "plaintex" },
	root_markers = {
		".git",
		".latexmkrc",
		"latexmkrc",
		".texlabroot",
		"texlabroot",
		"Tectonic.toml",
	},
	settings = {
		texlab = {
			rootDirectory = nil,
			build = {
				executable = "latexmk",
				args = {
					"-pdf",
					"-interaction=nonstopmode",
					"-synctex=1",
					"%f",
				},
				onSave = true,
				forwardSearchAfter = true,
			},
			forwardSearch = {
				executable = "zathura",
				args = {
					"--synctex-editor-command",
					[[ nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]]
						.. vim.v.servername,
					"--synctex-forward",
					"%l:1:%f",
					"%p",
				},
			},
			chktex = {
				onEdit = false,
				onOpenAndSave = true,
			},
			diagnosticsDelay = 300,
			latexFormatter = "latexindent",
			latexindent = {
				["local"] = nil,
				modifyLineBreaks = false,
			},
			bibtexFormatter = "texlab",
			formatterLineLength = 80,
		},
	},
})

lspconfig("qmlls", {
	cmd = { "qmlls6" },
})

lspconfig("jsonls", {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

lspconfig("yamlls", {
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})

local lspenable = vim.lsp.enable
local servers = {
	"html",
	"bashls",
	"pyright",
	"ts_ls",
	"texlab",
	"sourcekit",
	"qmlls",
	"tailwindcss",
	require("mason-lspconfig").get_installed_servers(),
}

local flat_servers = flatten_to_array(servers)

for _, server in ipairs(flat_servers) do
	lspconfig(server, {
		on_attach = function(client, bufnr)
			if client.name == "typos_lsp" then
				return
			end

			require("workspace-diagnostics").populate_workspace_diagnostics(
				client,
				bufnr
			)
		end,
		capabilities = capabilities,
	})
	lspenable(server)
end
