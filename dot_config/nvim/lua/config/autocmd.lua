local debug = require("util.debug")

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})


local auto_start_telescope = function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local arg = vim.api.nvim_get_vvar("argv")

  debug.dump("auto_start_telescope called", {
    buf_name = buf_name,
    arg = arg,
    arg_count = #arg
  })

  if buf_name == "" and #arg == 1 and vim.fn.isdirectory(arg[1]) == 1 then
    vim.cmd("cd " .. vim.fn.fnameescape(arg[1]))

    vim.defer_fn(function()
      vim.cmd("Telescope file_browser")
    end, 100)
  end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
        auto_start_telescope()
	end
})
