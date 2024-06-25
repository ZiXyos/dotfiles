local map = vim.keymap.set

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "b[", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bd<cr>", "<cmd>bd<cr>", { desc = "Delete Current Buffer" })
map("n", "b]", "<cmd>bnext<cr>", { desc = "Next Buffer" })

--  File
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<C-S>", "<cmd>wa<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<C-q>", "<cmd>wqa<cr><esc>", { desc = "Save File" })

map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })


map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- Diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

map("n", "<leader>cd<cr>", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e",diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

map("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = "Open panel vertically" })
map("n", "<leader>ss", "<cmd>sp<cr>", { desc = "Open panel vertically" })
map("n", "<leader>wl", "<C-W><C-L>", { desc = "Move to left panel" })
map("n", "<leader>wh", "<C-W><C-H>", { desc = "Move to right panel" })
map("n", "<leader>wj", "<C-W><C-J>", { desc = "Move to lower panel" })
map("n", "<leader>wk", "<C-W><C-K>", {desc = "Move to upper panel"} )

-- floating term
local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function() Util.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
