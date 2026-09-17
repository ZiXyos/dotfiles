local map = vim.keymap.set

-- BUFFERS --
map("n", "<leader>b]<cr>", "<cmd>bnext<cr>", { desc = "Move to next Buffer" })
map("n", "<leader>b[<cr>", "<cmd>bprevious<cr>", { desc = "Move to previous Buffer" })
map("n", "<leader>bd<cr>", "<cmd>bd<cr>", { desc = "Delete current Buffer" })

-- FILE --
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<C-S>", "<cmd>wa<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<C-q>", "<cmd>wqa<cr><esc>", { desc = "Save File" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- QFIX --
map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- EDITOR --
local lazyterm = function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end

map("n", "<leader>fd", function()
  Snacks.picker.explorer({
    cwd = LazyVim.root.cwd(),
    layout = { preset = "default", preview = true },
    auto_close = true,
    jump = { close = true },
  })
end, { desc = "Floating File Browser (Project Directory)" })
map("n", "<leader>fb", function()
  Snacks.picker.explorer({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Open File Browser (Current File Directory)" })
map("n", "<leader>ff", function()
  Snacks.picker.files({ cwd = LazyVim.root() })
end, { desc = "Find File" })
map("n", "<leader>fg", function()
  Snacks.picker.grep({ cwd = LazyVim.root() })
end, { desc = "Live Grep" })
map("n", "<leader>bf", function()
  Snacks.picker.buffers()
end, { desc = "Open Buffer Browser" })
map("n", "<leader>fs", function()
  Snacks.picker.files({ cwd = LazyVim.root(), hidden = true })
end, { desc = "Find File with Hidden" })
map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
map("n", "<leader>tt", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- WINDOW --
map("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = "Open panel vertically" })
map("n", "<leader>ss", "<cmd>sp<cr>", { desc = "Open panel vertically" })
map("n", "<leader>wl", "<C-W><C-L>", { desc = "Move to left panel" })
map("n", "<leader>wh", "<C-W><C-H>", { desc = "Move to right panel" })
map("n", "<leader>wj", "<C-W><C-J>", { desc = "Move to lower panel" })
map("n", "<leader>wk", "<C-W><C-K>", { desc = "Move to upper panel" })
