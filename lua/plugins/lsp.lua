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

      CB = function(event) -- callback
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end

      lspconfig.lua_ls.setup { capabilites = capabilities }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })

      local default_setup = function(server)
        require("lspconfig")[server].setup({
          capabilities = capabilities,
        })
      end

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "html", "gopls", "volar" },
        automatic_installation = false,
        handlers = {
          default_setup,
          ['html'] = function()
            lspconfig.html.setup {
              filetypes = { "html", "vue" },
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
              filetypes = { "vue" },
              capabilities = capabilities,
            }
          end,
          ["ts_ls"] = function()
            lspconfig.ts_ls.setup {
              filetypes = { "ts", "js" },
              capabilities = capabilities,
            }
          end,
        }
      })
    end,
  }
}
