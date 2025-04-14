return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider and vim.bo.filetype ~= "vue" then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end

          local c = vim.lsp.get_client_by_id(event.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = event.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = event.buf, id = c.id })
              end,
            })
          end
        end
      })
      local default_setup = function(server)
        require("lspconfig")[server].setup({
          capabilities = capabilities,
        })
      end

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "html", "gopls", "volar", "tailwindcss", "cssls" },
        automatic_installation = false,
        handlers = {
          default_setup,
          ["html"] = function()
            lspconfig.html.setup {
              filetypes = { "html" },
              capabilities = capabilities,
            }
          end,
          ["gopls"] = function()
            lspconfig.gopls.setup {
              filetypes = { "go", "gomod", "gowork", "gotmpl" },
              capabilities = capabilities,
            }
          end,
          ["volar"] = function()
            lspconfig.volar.setup {
              filetypes = { "vue", "typescript", "javascript" },
              capabilities = capabilities,
            }
          end,
          ["ts_ls"] = function()
            lspconfig.ts_ls.setup {
              filetypes = { "vue", "typescript", "javascript" },
              capabilities = capabilities,
              init_options = {
                plugins = {
                  {
                    name = '@vue/typescript-plugin',
                    location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                    languages = { 'vue' },
                  },
                },
              },
            }
          end,
          ["tailwindcss"] = function()
            lspconfig.tailwindcss.setup {
              filetypes = { "typescript", "javascript", "html", "css", "vue" },
              capabilities = capabilities,
            }
          end,
          ["cssls"] = function()
            lspconfig.cssls.setup {
              filetypes = { "html", "css", "vue" },
              capabilities = capabilities,
            }
          end,
        }
      })
    end,
  }
}
