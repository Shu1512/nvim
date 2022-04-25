vim.cmd([[
  augroup = fern
    autocmd!
    autocmd VimEnter * ++nested Fern .
  augroup END
]])

vim.g["fern#default_hidden"] = 1
vim.g["fern#renderer"] = 'nerdfont'

vim.api.nvim_set_keymap('n', '<Leader>j', ':<c-u>Fern . -drawer -toggle -reveal=%<cr>',
                        { noremap = true })

-- アイコンに色をつける
vim.cmd([[
  augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END
]])
