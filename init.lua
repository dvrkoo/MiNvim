vim.g.mapleader = " "
vim.g.maplocalleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	for i in ipairs(vim.fn.systemlist({ "git", "submodule", "status" })) do
		if string.find(vim.fn.systemlist({ "git", "submodule", "status" })[i], "-") then
			vim.fn.system({
				"git",
				"submodule",
				"update",
				"--init",
				"--recursive",
				"--",
				vim.fn.systemlist({ "git", "submodule", "status" })[i]:match("%S+"),
			})
		end
	end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } })
require("config.keymaps")
require("config.options")
