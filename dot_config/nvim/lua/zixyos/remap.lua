--- REMAP ---
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex)

local ok_m, m = pcall(require, "mapx")
if ok_m then
  m.noremap("<leader>w", ":w<CR>", "silent")

  -- tab navigation
  m.noremap("<S-H>", ":tabprev<CR>", "silent")
  m.noremap("<S-L>", ":tabnext<CR>", "silent")

  -- window navigation
  m.noremap("<F2>", "<C-w>w", "silent")

  -- lazygit
  m.nnoremap("<Leader>gg", ":LazyGit<CR>", "silent")

  -- BufferLine navigation
  m.nnoremap("<Leader>bp", ":bprevious<CR>", "silent")
  m.nnoremap("<Leader>bn", ":bnext<CR>", "silent")

  -- telescope
  m.nnoremap("<Leader>tl", ":Telescope<CR>", "silent")

  -- Term
  m.nnoremap("<Leader>j", ":ToggleTerm<CR>", "silent")
end
