vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------- LAZY ---------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

--------------- LAZY PLUGINS ---------------

require("lazy").setup({
	-- gruvbox
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

	-- fzf
	{ "ibhagwan/fzf-lua", opts = {} },

	-- utils
	{ "tpope/vim-sleuth" },
	{ "sbdchd/neoformat" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true, opts = {} },
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

--------------- KEYS ---------------

-- fzf
vim.keymap.set("n", "<leader>p", ":FzfLua files<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", ":FzfLua live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":FzfLua git_status<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", ":FzfLua git_bcommits<CR>", { silent = true })

-- neoformat
vim.keymap.set("n", "<leader>i", ":Neoformat<CR>", { silent = true })

-- netrw
vim.keymap.set("n", "-", ":Ex<CR>", { silent = true })

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
vim.g.netrw_banner = false
