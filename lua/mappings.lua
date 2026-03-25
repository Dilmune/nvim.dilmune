require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "Enter command mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })

map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>x", "<cmd>Bdelete<CR>", { desc = "Close buffer" })

map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("v", "p", '"_dP', { desc = "Paste without yanking" })

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force quit all" })

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover documentation" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
map("n", "<leader>D", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Line diagnostics" })
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "Notification history" })

map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff this" })

map("n", "<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Ask AI" })
map("v", "<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Ask AI about selection" })
map("n", "<leader>ae", "<cmd>AvanteEdit<CR>", { desc = "Edit with AI" })
map("v", "<leader>ae", "<cmd>AvanteEdit<CR>", { desc = "Edit selection with AI" })
map("n", "<leader>ar", "<cmd>AvanteRefresh<CR>", { desc = "Refresh AI" })
map("n", "<leader>at", "<cmd>AvanteToggle<CR>", { desc = "Toggle AI sidebar" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File explorer" })
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo tree" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_format = "fallback" }
end, { desc = "Format file" })

map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to bottom window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to top window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window" })
