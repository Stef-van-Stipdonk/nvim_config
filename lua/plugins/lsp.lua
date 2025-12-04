return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local group = vim.api.nvim_create_augroup("UserLspKeymaps", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          local function nmap(lhs, rhs, desc)
            opts.desc = "LSP: " .. (desc or "")
            vim.keymap.set("n", lhs, rhs, opts)
          end

          nmap("gd", vim.lsp.buf.definition,        "Goto Definition")
          nmap("gD", vim.lsp.buf.declaration,       "Goto Declaration")
          nmap("gi", vim.lsp.buf.implementation,    "Goto Implementation")
          nmap("gr", vim.lsp.buf.references,        "Goto References")

          nmap("K",  vim.lsp.buf.hover,             "Hover Docs")
          nmap("<leader>sd", vim.diagnostic.open_float, "Line Diagnostics")

          nmap("<leader>rn", vim.lsp.buf.rename,        "Rename Symbol")
          nmap("<leader>ca", vim.lsp.buf.code_action,   "Code Action")
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      local servers = { "lua_ls", "clangd" }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          settings = server == "lua_ls" and {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          } or nil,
        })
      end

      vim.lsp.enable(servers)
    end,
  },
}

