local map = vim.keymap.set

-- BUFFERS
map("n", "bp", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd<cr>", "<cmd>bd<cr>", { desc = "Delete Current Buffer" })

-- FILE
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<C-S>", "<cmd>wa<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<C-q>", "<cmd>wqa<cr><esc>", { desc = "Save File" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- QFIX
map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- DIAGNOSTIC
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
  
-- ACTIONS
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- EDITOR
local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end

map("n", "<leader>fd", "<cmd>Telescope file_browser<cr>", { desc = "Open File Browser (Project Directory)" })
map("n", "<leader>fb", "<cmd>Telescope file_browser path=%:p:h<cr>", { desc = "Open file Browser (Current Directory)" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find file" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>bf", "<cmd>Telescope buffers<CR>", { desc = "Open buffer browser" })
map("n", "<leader>fs", "<cmd>:lua require('telescope.builtin').find_files({hidden=true})<CR>", { desc = "Find File with hidden" })
map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function() Util.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
map("n", "<leader>tt", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- WINDOW
map("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = "Open panel vertically" })
map("n", "<leader>ss", "<cmd>sp<cr>", { desc = "Open panel vertically" })
map("n", "<leader>wl", "<C-W><C-L>", { desc = "Move to left panel" })
map("n", "<leader>wh", "<C-W><C-H>", { desc = "Move to right panel" })
map("n", "<leader>wj", "<C-W><C-J>", { desc = "Move to lower panel" })
map("n", "<leader>wk", "<C-W><C-K>", {desc = "Move to upper panel"} )

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })