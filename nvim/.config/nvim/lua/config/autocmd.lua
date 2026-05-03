vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- New way to get log path
    local log_path = vim.fs.joinpath(vim.fn.stdpath("log"), "lsp.log")
    local stat = vim.loop.fs_stat(log_path)
    if stat and stat.size > 10 * 1024 * 1024 then -- If log > 10MB
      vim.fn.writefile({}, log_path)
      print("Cleared large LSP log (" .. math.floor(stat.size / 1024 / 1024) .. "MB)")
    end
  end,
})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("oil").open()
    end
  end,
})
vim.api.nvim_create_autocmd('TermClose', {
  callback = function(ev)
    if vim.v.event.status == 0 then
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(ev.buf) then
          vim.api.nvim_buf_delete(ev.buf, { force = true })
        end
      end)
    end
  end,
})
