return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go", "html", "css", "javascript", "vue", "typescript", "scss", "php", "blade" },
        ignore_install = {},
        modules = {},
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 200 * 1024 -- 200 KB
            local ok, stats = pcall(vim.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        sync_install = false
      }
    end,
  }
}
