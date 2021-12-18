require("bufferline").setup{
  options = {
    numbers = function(opts)
        return string.format('%s.', opts.id)
    end,
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = 'coc',
  }
}
