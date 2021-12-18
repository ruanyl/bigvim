local lsp_installer = require'nvim-lsp-installer'
local lsp_installer_servers = require'nvim-lsp-installer.servers'

-- install LSP servers
local function installServer(name)
    local ok, server = lsp_installer_servers.get_server(name)
    if ok then
        if not server:is_installed() then
            server:install()
        end
    end
end

local function installServers(names)
    for _,name in pairs(names) do
        installServer(name)
    end
end

-- find a list of available ones here: https://github.com/williamboman/nvim-lsp-installer
installServers({'bashls', 'sumneko_lua', 'jsonls',  'cssls', 'cssmodules_ls', 'tsserver', 'eslint', 'graphql', 'vimls'})

-- setup installed servers
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == 'sumneko_lua' then
        opts = require'lsp-server-config'
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
    server:setup(opts)
end)

-- diagnostic symbols
local signs = { Error = "", Warn = "", Hint = "", Info =  ""}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- completion symbols
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}
