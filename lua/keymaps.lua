vim.g.mapleader = " "

-- Exit insert mode with jk 
vim.keymap.set("i", "jk", "<ESC>")

-- faster write, quit
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>a", ":qa<cr>")

-- window navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- no use of arrow keys in normal mode
vim.keymap.set("n", "<up>", "<Nop>")
vim.keymap.set("n", "<down>", "<Nop>")
vim.keymap.set("n", "<left>", "<Nop>")
vim.keymap.set("n", "<right>", "<Nop>")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", "1<C-w>+", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "1<C-w>-", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "1<C-w><", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "1<C-w>>", { noremap = true, silent = true })

-- Remove Highlighting
vim.keymap.set("n", "<leader>nh", vim.cmd.noh)

-- Center after down/up/next
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Easy line manipulation
vim.keymap.set("n", "<A-d>", "yyp")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>")

-- easy yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
-- exit terminal mode
vim.keymap.set('t', '<M-q>', '<C-\\><C-n>')

-- method jumping
vim.keymap.set('n', 'mn', ']m')
vim.keymap.set('n', 'mp', '[m')
