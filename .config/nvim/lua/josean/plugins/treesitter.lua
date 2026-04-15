-- Instalar como dependencia el paquete tree-sitter-cli
return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = 'main',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
    "windwp/nvim-ts-autotag",
    },
    config = function()
        local ts = require 'nvim-treesitter'
        local parsers = {
            "asm",
            "bash",
            "c",
            "cpp",
            "diff",
            "dockerfile",
            "git_config",
            "gitcommit",
            "gitignore",
            "html",
            "lua",
            "make",
            "markdown",
            "python",
            "ssh_config",
            "sql",
            "toml",
            "vim",
            "vimdoc",
            "yaml",
        }

        for _, parser in ipairs(parsers) do
            ts.install(parser)
        end

        -- Not every tree-sitter parser is the same as the file type detected
        -- So the patterns need to be registered more cleverly
        local patterns = {}
        for _, parser in ipairs(parsers) do
            local parser_patterns = vim.treesitter.language.get_filetypes(parser)
            for _, pp in pairs(parser_patterns) do
                table.insert(patterns, pp)
            end
        end

        vim.treesitter.language.register("groovy", "Jenkinsfile")
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo[0][0].foldmethod = 'expr'

        vim.api.nvim_create_autocmd('FileType', {
            pattern = patterns,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
