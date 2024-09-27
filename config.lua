-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

require 'luasnip'.filetype_extend("typescript", { "javascript" })

-- Only show virtual text on current line
vim.diagnostic.config({
  virtual_text = false
})
local ns = vim.api.nvim_create_namespace('CurlineDiag')
vim.opt.updatetime = 100
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = args.buf,
      callback = function()
        pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
        local hi = { 'Error', 'Warn', 'Info', 'Hint' }
        local curline = vim.api.nvim_win_get_cursor(0)[1]
        local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
        local virt_texts = { { (' '):rep(4) } }
        for _, diag in ipairs(diagnostics) do
          virt_texts[#virt_texts + 1] = { diag.message, 'Diagnostic' .. hi[diag.severity] }
        end
        vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
          virt_text = virt_texts,
          hl_mode = 'combine'
        })
      end
    })
  end
})

lvim.colorscheme = "tokyonight-storm"

-- Disable alpha
lvim.builtin.alpha.active = false
lvim.builtin.which_key.mappings[';'] = {}

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
  w = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
  S = { "<cmd>Trouble symbols toggle<cr>", "Symbols (Trouble)" },
  q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
  l = { "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)" },
  s = { "<cmd>Trouble lsp toggle<cr>", "LSP references/definitions/... (Trouble)" },
}

lvim.builtin.which_key.mappings["j"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" }
lvim.builtin.which_key.mappings["k"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" }

lvim.leader = ","

lvim.plugins = {
  { "folke/tokyonight.nvim" },
  { "stevearc/dressing.nvim" },
  { "gcmt/wildfire.vim" },
  { "mhinz/vim-grepper" },
  { "vim-scripts/BufOnly.vim" },
  { "tpope/vim-repeat" },
  {
    'mistweaverco/kulala.nvim',
    opts = {},
    config = function()
      vim.filetype.add({
        extension = {
          ['http'] = 'http',
        },
      })
    end,
  },
  {
    "unblevable/quick-scope",
    config = function()
      vim.g.qs_lazy_highlight = 1
      vim.g.qs_max_chars = 120
    end,
  },
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    -- require: npm install -g cspell
    "davidmh/cspell.nvim",
    config = function()
      local cspell = require('cspell')
      lvim.lsp.null_ls.setup = {
        sources = {
          cspell.diagnostics.with({
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity["INFO"]
            end,
            -- No need to have spell check on filter explorer, otherwise the error sign(underline) flashing
            disabled_filetypes = { "NvimTree" },
          }),
          cspell.code_actions,
        }
      }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
  },
  {
    "Shatur/neovim-session-manager",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('session_manager').setup({
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- define what to do when neovim is started without arguments. possible values: disabled, currentdir, lastsession
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "typescript", "typescriptreact" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
}

lvim.keys.normal_mode["qo"] = ":BufOnly<CR>"

-- Map <Leader><Leader>a to run :GrepperRg
lvim.keys.normal_mode["<leader><leader>a"] = ":GrepperRg "

lvim.keys.normal_mode["qq"] = ":BufferKill<CR>"

-- toggle between two buffers
lvim.keys.normal_mode["t"] = "<C-^>"

-- Use 'm/M' to move among buffers
lvim.keys.normal_mode["m"] = ":bn<CR>"
lvim.keys.normal_mode["M"] = ":bp<CR>"

lvim.keys.normal_mode[";"] = ":"
lvim.keys.normal_mode["'"] = ":b"

-- Go to home and end using capitalized directions
lvim.keys.normal_mode["H"] = "0"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.normal_mode["Y"] = "y$"
-- Remap VIM 0 to first non-blank character
lvim.keys.normal_mode["0"] = "^"

-- Speed up scrolling of the viewport slightly
lvim.keys.normal_mode["<C-e>"] = "2<C-e>"
lvim.keys.normal_mode["<C-y>"] = "2<C-y>"

-- Treat long lines as break lines (useful when moving around in them)
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"

-- goto older/newer position in change list
lvim.keys.normal_mode["("] = "g;"
lvim.keys.normal_mode[")"] = "g,"

-- replace currently selected text with default register without yanking it
-- lvim.keys.visual_mode["p"] = "\"_dP"

-- use ctrl-c to copy to system clipboard
lvim.keys.visual_mode["<C-c>"] = "\"*y"

-- use <C-V> to paste yanked content
lvim.keys.insert_mode["<C-V>"] = "<C-R>\""

-- select all
lvim.keys.normal_mode["<Leader>sa"] = "ggVG"
lvim.keys.normal_mode["dp"] = ":diffput<CR>"
lvim.keys.normal_mode["dg"] = ":diffget<CR>"

-- Telescope
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.path_display = { "truncate" }
lvim.builtin.telescope.theme = "center"
lvim.builtin.telescope.defaults.mappings = {
  i = {
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-c>"] = actions.close,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-q>"] = function(...)
      actions.smart_send_to_qflist(...)
      actions.open_qflist(...)
    end,
    ["<CR>"] = actions.select_default,
  }
}
lvim.builtin.which_key.mappings["m"] = { "<cmd>Telescope oldfiles<CR>", "Recent files" }
lvim.builtin.which_key.mappings["f"] = {
  function()
    require("lvim.core.telescope.custom-finders").find_project_files { previewer = true }
  end,
  "Find File",
}

-- Setup formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = {},
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact", "scss" },
  },
}
lvim.format_on_save.enabled = true

-- Setup linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "eslint" },
}
