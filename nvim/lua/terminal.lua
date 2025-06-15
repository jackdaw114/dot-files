-- Function to check buffer names and perform actions
function CheckAndCloseTermBuffer()
  local term_buf = nil

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if string.match(buf_name, "term:.*") then
      term_buf = buf
      break
    end
  end

  if term_buf then
    vim.api.nvim_buf_delete(term_buf, {force = true})
  else
	vim.cmd("wincmd l")
	vim.cmd("30split")
	vim.cmd("wincmd j")
	vim.cmd("term")
  end
end

-- Map a key to this function
vim.api.nvim_set_keymap('n', '<C-f>', ':lua CheckAndCloseTermBuffer()<CR>', { noremap = true, silent = true })

