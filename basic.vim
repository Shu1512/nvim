""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" Security
set modelines=1

" Enable mouse
set mouse=a

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Don't use Ex mode, use Q for formatting
map Q gq

" Enable filetype plugins
filetype indent on
filetype plugin indent on

" Delete comment character when joining commented lines
set formatoptions+=j

" Leader Shortcut
let mapleader="\<Space>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show current line number
set number

" relative line numbers
" set relativenumber

" highlight cursor line
set cursorline

" Start scrolling when 8 lines away from bottom
set scrolloff=8

" autocomplete vim commands by <tab>
set wildmenu

" highlight search terms
" set hlsearch

" search while typing
set incsearch

" When searching try to be smart about cases
set smartcase

" For regular expressions turn magic on
set magic

" show matching brackets
set showmatch

" Show input commands
set showcmd

" Wrap lines
set wrap

" Show line at 80 chars
set colorcolumn=80

" Alway show sign column
set signcolumn=yes

" Update swapfile after 100ms
set updatetime=100

" Don't redraw while executing macros
set lazyredraw

" Open new split panes to right and bottom
set splitbelow
set splitright

" set timeout for esc key
set ttimeout
set ttimeoutlen=100

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" show invisible chars
set list
set listchars=
set listchars+=tab:??\ 
set listchars+=trail:??
set listchars+=extends:??
set listchars+=precedes:??
set listchars+=nbsp:???


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Enable colors
try
  colorscheme  kanagawa
catch
endtry

" Set dark bg
set background=dark

" Set en_US as the standard language
let $LANG='ja'
set langmenu=ja

" Set utf8 as standard encoding
set encoding=utf-8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

lang en_US.UTF-8
set fileencodings=utf-8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable backups
set backup

" set backup dir to elsewhere than pwd
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" don't backup files in here
set backupskip=/tmp/*,/private/tmp/*

" make backup before writing file
set writebackup


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set default tabs to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" use spaces instead of tabs
set expandtab
set smarttab

" auto indent if prev line is indented
set autoindent

" language specific indentation
augroup configgroup
  autocmd!
  autocmd Filetype blade setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype php setlocal ts=4 sw=4 sts=4 expandtab
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enabled syntax highlight for code blocks
let g:markdown_fenced_languages = [
  \ 'html',
  \ 'vue',
  \ 'javascript',
  \ 'js=javascript',
  \ 'css',
\]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap pane switching
nnoremap <A-j> :resize +5<CR>
nnoremap <A-k> :resize -5<CR>
nnoremap <A-l> :vertical resize -5<CR>
nnoremap <A-h> :vertical resize +5<CR>

" remap meta keys for resizing for vim only
if !has('nvim')
  execute "set <M-j>=\ej"
  execute "set <M-k>=\ek"
  execute "set <M-l>=\el"
  execute "set <M-h>=\eh"
endif

" J to join lines, K to split lines
nnoremap K i<CR><esc>

" Remap K to gK
nnoremap gK K

" Y to copy to clipboard
set clipboard+=unnamed
nnoremap Y "+y

" Clear highlight
nnoremap <esc><esc> :noh<CR>

" Save/close buffer
nnoremap <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>
nnoremap <C-Q> :q<CR>

" New/close tab
nnoremap <C-T> :tabnew<CR>
nnoremap <C-X> :tabclose<CR>

" Edit/source vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Save/load session
nnoremap <leader>s :mksession! ~/.vimsession.vim<CR>
nnoremap <leader>o :source ~/.vimsession.vim<CR>

" Allow undo when deleting in insert mode
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Return to last edit position when opening files
au BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Move current line to up/down
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE '
  endif
  return ''
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


" coc.vim
" coc.nvim-specific settings
"
" Load coc manually
" Load coc configs when plugin is loaded
autocmd! User coc.nvim call LoadCocConfig()

function! LoadCocConfig() abort
  " :CocList shortcut
  nnoremap <leader>cc :CocList<CR>

  " :CocRestart shortcut
  nnoremap <leader>cr :CocRestart<CR>

  " confirm complete
  inoremap <silent><expr> <cr> pumvisible()
    \ ? coc#_select_confirm()
    \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " default extensions
  let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-snippets',
    \ 'coc-phpls',
    \ 'coc-json',
    \ 'coc-css',
    \ '@yaegassy/coc-volar',
    \ 'coc-eslint',
    \ 'coc-svelte',
    \ 'cc-html',
    \ 'coc-emmet',
    \ 'coc-tailwindcss',
    \ 'coc-tsserver',
    \ 'coc-flutter',
    \ 'coc-go',
    \ 'coc-lua',
  \]

  " autofix linting for JS
  autocmd FileType javascript,typescript,vue,svelte nnoremap <silent><buffer><leader>ll :CocCommand eslint.executeAutofix<CR>
  " format buffer
  nnoremap <silent> <leader>ll :call CocActionAsync('format')<CR>

  " Use `[g` and `]g` to navigate diagnostics
  " Use `,cd` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> <leader>cd :CocDiagnostics<CR>

  " GoTo code navigation
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nmap <silent> gK :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocActionAsync('doHover')
    endif
  endfunction

  " # coc-snippets
  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'
  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'
  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)
endfunction
