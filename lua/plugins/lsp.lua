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
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.diagnostic.config({
                virtual_text = true, -- This enables inline diagnostics
                signs = true,        -- Shows signs in the gutter
                underline = true,
                update_in_insert = false,
                float = true
            })

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

            local vue_language_server_path = vim.fn.stdpath 'data' ..
                '/mason/packages/vue-language-server/node_modules/@vue/language-server'
            local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
            local vue_plugin = {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
                configNamespace = 'typescript',
            }

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "ts_ls", "html", "gopls", "vue_ls", "tailwindcss", "cssls", "intelephense", "phpactor", "bashls", "laravel_ls", "lua_ls", "vtsls", "docker_language_server" },
                automatic_installation = true,
                vim.lsp.config("vue_ls", {
                    capabilities = capabilities,
                    cmd = { 'vue-language-server', '--stdio' },
                    filetypes = { 'vue' },
                    root_markers = { 'package.json', 'bun.lock' },
                    on_init = function(client)
                        client.handlers['tsserver/request'] = function(_, result, context)
                            local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'ts_ls' })
                            local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
                            local clients = {}

                            vim.list_extend(clients, vtsls_clients)
                            vim.list_extend(clients, ts_clients)

                            if #clients == 0 then
                                vim.notify(
                                    'Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.',
                                    vim.log.levels.ERROR)
                                return
                            end
                            local ts_client = clients[1]

                            local param = unpack(result)
                            local id, command, payload = unpack(param)
                            ts_client:exec_cmd({
                                title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                                command = 'typescript.tsserverRequest',
                                arguments = {
                                    command,
                                    payload,
                                },
                            }, { bufnr = context.bufnr }, function(_, r)
                                local response = r and r.body
                                -- TODO: handle error or response nil here, e.g. logging
                                -- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
                                local response_data = { { id, response } }

                                ---@diagnostic disable-next-line: param-type-mismatch
                                client:notify('tsserver/response', response_data)
                            end)
                        end
                    end,
                }),
                vim.lsp.config("html", {
                    filetypes = { "html", "blade" },
                    capabilities = capabilities,
                }),
                vim.lsp.config("gopls", {
                    filetypes = { "go", "gomod", "gowork", "gotmpl" },
                    capabilities = capabilities,
                }),
                vim.lsp.config("vtsls", {
                    capabilities = capabilities,
                    settings = {
                        vtsls = {
                            tsserver = {
                                globalPlugins = {
                                    vue_plugin,
                                },
                            },
                        },
                    },
                    filetypes = tsserver_filetypes,
                    init_options = { hostInfo = "neovim" },
                }),
                vim.lsp.config("ts_ls", {
                    capabilities = capabilities,
                    init_options = {
                        plugins = {
                            vue_plugin,
                        },
                    },
                    filetypes = tsserver_filetypes,
                }),
                vim.lsp.config("tailwindcss", {
                    filetypes = { "html", "css", "vue", "blade" },
                    capabilities = capabilities,
                }),
                vim.lsp.config("cssls", {
                    filetypes = { "html", "css", "vue", "blade" },
                    capabilities = capabilities,
                }),
                vim.lsp.config("intelephense", {
                    filetypes = { "php", "blade" },
                    capabilities = capabilities,
                }),
                vim.lsp.config("bashls", {
                    cmd = { 'bash-language-server', 'start' },
                    filetypes = { "bash", "sh" },
                    capabilities = capabilities,
                }),
                vim.lsp.config("laravel_ls", {
                    filetypes = { "php", "laravel" },
                    capabilities = capabilities,
                }),
                vim.lsp.config("phpactor", {
                    init_options = {
                        ["language_server.diagnostic_providers"] = {},
                        ["language_server_worse_reflection.diagnostics.enable"] = false,
                        ["language_server_worse_reflection.inlay_hints.enable"] = true,
                        ["language_server_worse_reflection.inlay_hints.types"] = false,
                    },
                }),
            })
        end,
    }
}
