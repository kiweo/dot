vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------- PLUGINS ---------------

vim.pack.add({
	-- gruvbox
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },

	-- fzf & oil
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },

	-- utils
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/sbdchd/neoformat" },
	{ src = "https://github.com/windwp/nvim-autopairs" },

	-- kulala
	{ src = "https://github.com/mistweaverco/kulala.nvim" },

	-- lsp, treesitter & blink.cmp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

--------------- PLUGINS CONFIG ---------------

-- gruvbox
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- fzf
require("fzf-lua").setup({
	winopts = { height = 0.95, width = 0.95 },
	keymap = {
		builtin = { ["<C-d>"] = "preview-half-page-down", ["<C-u>"] = "preview-half-page-up" },
		fzf = { ["ctrl-d"] = "preview-half-page-down", ["ctrl-u"] = "preview-half-page-up" },
	},
})

-- oil
require("oil").setup({
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, bufnr)
			return name == ".git" or name == "node_modules"
		end,
	},
})

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

-- autopairs
require("nvim-autopairs").setup({})

-- kulala
require("kulala").setup({ global_keymaps = true })

-- blink.cmp
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
	},
	completion = {
		documentation = { auto_show = true },
		menu = { draw = { columns = { { "label", "source_name", "kind", gap = 1 } } } },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	cmdline = { completion = { menu = { auto_show = true } } },
})

-- lsp
vim.diagnostic.config({ virtual_text = true })
vim.lsp.enable("cssls")
vim.lsp.enable("html")
vim.lsp.enable("ts_ls")

--------------- KEYS ---------------

-- fzf
vim.keymap.set("n", "<leader>p", ":FzfLua files<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", ":FzfLua live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":FzfLua git_status<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", ":FzfLua git_bcommits<CR>", { silent = true })

-- neoformat
vim.keymap.set("n", "<leader>i", ":Neoformat<CR>", { silent = true })

-- lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "K", vim.diagnostic.open_float)

-- netrw
vim.keymap.set("n", "-", ":Oil<CR>", { silent = true })

--------------- SETS ---------------

vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.mouse = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.updatetime = 50
vim.o.wrap = false
