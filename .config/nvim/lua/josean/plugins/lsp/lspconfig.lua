return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", vim.lsp.buf.references, opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        -- TODO: No se
        -- opts.desc = "Show buffer diagnostics"
        -- keymap.set("n", "<leader>D", vim.lsp.buf.diagnostics, opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

        opts.desc = "Signature Help"
        keymap.set("n", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
      end,
    })

    mason_lspconfig.setup {}
--     mason_lspconfig.setup_handlers({
      -- default handler for installed servers
--     function(server_name)
--        lspconfig[server_name].setup({
--          capabilities = capabilities,
--        })
--      end,
--      ["lua_ls"] = function()
--        -- configure lua server (with special settings)
--        lspconfig["lua_ls"].setup({
--          capabilities = capabilities,
--          settings = {
--            Lua = {
--              -- make the language server recognize "vim" global
--              diagnostics = {
--                globals = { "vim" },
--              },
--              completion = {
--                callSnippet = "Replace",
--              },
--            },
--          },
--        })
--      end,
--      ["clangd"] = function()
--        lspconfig["clangd"].setup({
--          capabilities = capabilities,
--          cmd = {
--            "clangd",
--            "--all-scopes-completion",
--            "--background-index",
--            "--clang-tidy",
--            "--completion-parse=always",
--            "--completion-style=bundled",
--            "--cross-file-rename",
--            "--debug-origin",
--            "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
--            "--fallback-style=Qt",
--            "--folding-ranges",
--            "--function-arg-placeholders",
--            "--header-insertion=iwyu",
--            "--pch-storage=memory", -- could also be disk
--            "--suggest-missing-includes",
--          },
--        })
--      end,
--    })
  end,
}

