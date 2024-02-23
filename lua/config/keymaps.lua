vim.cmd("map <Leader>lF :lua vim.lsp.buf.format({ async = true })<CR>")
-- Set highlight on search
-- keymap to use telescope fzf currently the live grep one is better as it searches througth multiple files and gives a better preview
-- vim.keymap.set("n", "<leader>/", function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--     winblend = 10,
--     previewer = false,
--   }))
-- end, { desc = "[/] Fuzzily search in current buffer]" })

-- This file is automatically loaded by lazyvim.config.init
--

vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
-- deprecated in favor of smart-splits for better tmux integration
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
-- vim.keymap.set('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
-- vim.keymap.set('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
-- vim.keymap.set('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

-- See `:help K` for why this keymap
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
--vim.keymap.set("n", '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })
-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- move through buffers with bufferline

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>c", "<CMD>bdelete<CR>")
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

--  better ctrl d ctrl u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- selecta all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
-- Lesser used LSP functionality
-- vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, { desc = "n", '[G]oto [D]eclaration' })
-- vim.keymap.set("n", '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
-- vim.keymap.set("n", '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[w]orkspace [r]emove folder' })
-- vim.keymap.set("n", '<leader>wl', function()
-- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, { '[W]orkspace [L]ist Folders' })

-- Create a command `:Format` local to the LSP buffer
-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
-- vim.lsp.buf.format()
-- end, { desc = 'Format current buffer with LSP' })

--
-- local Util = require("lazyvim.util")
--
-- local function map(mode, lhs, rhs, opts)
--   local keys = require("lazy.core.handler").handlers.keys
--   ---@cast keys LazyKeysHandler
--   -- do not create the keymap if a lazy keys handler exists
--   if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--     opts = opts or {}
--     opts.silent = opts.silent ~= false
--     if opts.remap and not vim.g.vscode then
--       opts.remap = nil
--     end
--     vim.keymap.set(mode, lhs, rhs, opts)
--   end
-- end
--
-- -- better up/down
-- map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--
-- -- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
--

-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- --map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--
-- -- Clear search with <esc>
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
--
-- -- Clear search, diff update and redraw
-- -- taken from runtime/lua/_editor.lua
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / clear hlsearch / diff update" }
-- )
--
-- map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
--
-- -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
--
-- -- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")
--
-- -- save file
-- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
--
-- -- better indenting
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")
--
-- -- lazy
-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
--
-- -- new file
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
--
-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
--
-- if not Util.has("trouble.nvim") then
--   map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
--   map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
-- end
--
-- -- stylua: ignore start
--
-- -- toggle options
-- map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
-- map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>ul", function()
--   Util.toggle("relativenumber", true)
--   Util.toggle("number")
-- end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
--   { desc = "Toggle Conceal" })
-- if vim.lsp.inlay_hint then
--   map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
-- end
--
-- -- lazygit
-- map("n", "<leader>gg",
--   function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end,
--   { desc = "Lazygit (root dir)" })
-- map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false }) end,
--   { desc = "Lazygit (cwd)" })
--
-- -- quit
-- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
--
-- -- highlights under cursor
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- end
--
-- -- floating terminal
-- local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
--
-- -- Terminal Mappings
-- map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
-- map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
-- map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
-- map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
-- map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
--
-- -- windows
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
-- map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
--
-- -- tabs
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
