return {

    -- No plugin: using native Tree-sitter
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false, -- explicitly disable if present in kickstart

    config = function()
        local group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

        local languages = {
            "python",
            "php",
            "go",
            "c",
            "cpp",
            "markdown",
            "html",
            "javascript",
            "typescript",
            "tsx",
            "bash",
            "query",
        }

        -- Register common aliases
        vim.treesitter.language.register("bash", "sh")
        vim.treesitter.language.register("cpp", "hpp")
        vim.treesitter.language.register("javascript", "jsx")
        vim.treesitter.language.register("typescript", "tsx")

        -- Start Tree-sitter + disable regex syntax
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = languages,
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
                vim.bo[args.buf].syntax = "off"
            end,
        })

        -- Folding
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldlevel = 99

        -- Optional: safe indentation fallback (no dependency)
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = languages,
            callback = function(args)
                -- Only set if no indentexpr already exists
                if vim.bo[args.buf].indentexpr == "" then
                    vim.bo[args.buf].autoindent = true
                    vim.bo[args.buf].smartindent = true
                end
            end,
        })
    end,
}
