-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
require("nvim-surround").setup({
  keymaps = {
    insert = "<C-g>z",
    insert_line = "gC-ggZ",
    normal = "gz",
    normal_cur = "gZ",
    normal_line = "gzgz",
    normal_cur_line = "gZgZ",
    visual = "gz",
    visual_line = "gZ",
    delete = "gzd",
    change = "gzc",
  },
})

local function run_python_script_floating_window()
  -- window size and pos
  local win_height = math.ceil(vim.o.lines * 0.8)
  local win_width = math.ceil(vim.o.columns * 0.8)
  local x_pos = math.ceil((vim.o.lines - win_height) * 0.5)  --> Center
  local y_pos = math.ceil((vim.o.columns - win_width) * 0.5) --> Center

  local path = vim.fn.expand("%:p")

  vim.cmd(":w")

  local win_opts = {
    border = "rounded", --> sigle, double, rounded, solid, shadow
    relative = "editor",
    style = "minimal",  --> No number, cursorline, etc.
    width = win_width,
    height = win_height,
    row = x_pos,
    col = y_pos,
  }

  -- create preview buffer
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- options
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe") --> Kill the buffer when hidden
  vim.api.nvim_win_set_option(win, "winblend", 0)      --> 0 for solid color, 80 for transparent

  -- keymaps
  local keymaps_opts = { silent = true, buffer = buf }
  vim.keymap.set('n', "q", function() vim.api.nvim_win_close(win, true) end, keymaps_opts)
  vim.keymap.set('n', "<ESC>", function() vim.api.nvim_win_close(win, true) end, keymaps_opts)

  -- command
  
  local cmd = "python "
  local concat = cmd .. '"' .. path .. '"'
  print('running file: ' .. path) 
  vim.fn.termopen(concat) 
end

vim.api.nvim_create_user_command("RunPython", run_python_script_floating_window, { nargs = 0 })

vim.keymap.set({"n", "i"}, "<F5>", "<cmd>RunPython<CR>", {})

--tailwind

vim.keymap.set({"n"}, "<Leader>tn", "<cmd>TailwindNextClass<CR>", { desc = 'Go to Next Class Tag'})
vim.keymap.set({"n"}, "<Leader>tp", "<cmd>TailwindPrevClass<CR>", { desc = 'Go to Previous Class Tag'})
vim.keymap.set({"n"}, "<Leader>ts", "<cmd>TailwindSort<CR>", { desc = 'Sort all Tailwind Classes in buffer'})
vim.keymap.set({"n"}, "<Leader>tt", "<cmd>TailwindConcealToggle<CR>", { desc = 'Toggle Conceal of tailwind Classes'})

vim.api.nvim_set_keymap("n", "<F12>", "<cmd>ASToggle<CR>", {})