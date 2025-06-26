function GTV()
  local line = vim.fn.getline(".")
  local view = line:match("'(.-)'"):gsub("%.", "/")
  vim.api.nvim_command('edit ./resources/views/' .. view .. '.blade.php')
end
