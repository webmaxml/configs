" <<{ plugins

call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'

call plug#end()

let g:ranger_map_keys = 0

" }>>

" <<{ general

" turn off legacy vi-compatible mode
set nocompatible

" encoding
set encoding=utf-8

" disable swap file
set noswapfile

" filetype detection
filetype on

" loading the plugin files for specific file types
" filetype plugin on

" enable command-line file completion with <tab> 
set wildmenu

" enable confirm dialog when it is needed
set confirm

" show input commands in the right corner of the command line
set showcmd

" disable max width of inserted text, so it won't automatically broke lines
set textwidth=0

" }>>

" <<{ colors

" set terminal colors
set t_Co=256

" syntax highlighting
syntax enable

" theme
colorscheme ron

" folded lines colors
highlight Folded cterm=NONE ctermbg=NONE

" status line colors
highlight StatusLine cterm=NONE ctermbg=NONE ctermfg=White

" }>>

" <<{ status line

" will the last window have a status line, 0 - never, 1 - only if at least 2 windows, 2 - always
set laststatus=2

" disable line and column number of the cursor positon in status line's right corner
set noruler

" statusline
set statusline=\     " space
set statusline+=%F   " full file path
set statusline+=\    " space
set statusline+=%l   " current line
set statusline+=/    " separator
set statusline+=%L   " total lines
set statusline+=\    " space
set statusline+=%m   " modified flag
set statusline+=%=   " go to right side
set statusline+=%y   " filetype in square brackets
set statusline+=\    " space

" }>>

" <<{ indenting

" number of spaces for <tab>
set tabstop=2

" use the spaces instead of tab in insert mode
set expandtab

" number of spaces to use when using >>/<<
set shiftwidth=2

" copy indent from current line when starting new with <cr> or o
set autoindent

" }>>

" <<{ formatting

" disabling some format options
" setting this way cause its getting remapped by something every time when vim is opened
" -r - disabling auto inserting comments after hitting <cr> in insert mode
" -o - disabling auto inserting comments after hitting o/O in normal mode
augroup formatOptions
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r formatoptions-=o
augroup END

" }>>

" <<{ folding

" fold with marker
set foldmethod=marker

" fold marker
set foldmarker=<<{,}>>

" }>>

" <<{ search

" show what matches so far while typing a search command
set incsearch

" highlight search results
set hlsearch

" dont highlight last search results on vim start
nohlsearch

" }>>

" <<{ unmap

nnoremap f <Nop>
nnoremap ; <Nop>
nnoremap , <Nop>
nnoremap <CR> <Nop>

" }>>

" <<{ leaders

let mapleader="f"
let maplocalleader=";"

" }>>

" <<{ normal mode mappings

nnoremap <CR> o<C-c>

nnoremap <leader>d :BD<cr>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :BLines<cr>
nnoremap <leader>e :NERDTreeToggle<CR>
" nnoremap <leader>e :RangerNewTab<cr>
nnoremap <leader><leader> za
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
nnoremap <leader>m zm
nnoremap <leader>n :noh<CR>
nnoremap <leader>p :Rg<cr>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :Files<cr>
nnoremap <leader>u ~h
nnoremap <leader>w :w<CR>
nnoremap <leader>z :wqa<CR>
nnoremap <leader>; $
nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>

" }>>

" <<{ insert mode mappings

inoremap jj <c-c>

" }>>

" <<{ vim snippets

nnoremap <localleader>vc I"<space><c-c>
nnoremap <localleader>vu ^2x<space><c-c>
nnoremap <localleader>vh I"<space><<{<space>
nnoremap <localleader>ve I"<space>}>><c-c>

" }>>

" <<{ txt snippets

nnoremap <localleader>th I<<{<space>
nnoremap <localleader>te I}>><c-c>

" }>>

" <<{ html snippets

nnoremap <localleader>hc I<!--<space><c-c>A<space>--><c-c>
nnoremap <localleader>hu ^5x$3h4x
nnoremap <localleader>hh I<!--<space><<{<space><space>--><c-c>3hi
nnoremap <localleader>he I<!--<space>}>><space>--><c-c>

" }>>

" <<{ sass snippets

nnoremap <localleader>sc I//<space><c-c>
nnoremap <localleader>su ^3x
nnoremap <localleader>sh I//<space><<{<space>
nnoremap <localleader>se I//<space>}>><c-c>

" }>>

" <<{ css snippets

nnoremap <localleader>cc I/*<space><c-c>A<space>*/<c-c>
nnoremap <localleader>cu ^3x$2h3x
nnoremap <localleader>ch I/*<space><<{<space><space>*/<c-c>2hi
nnoremap <localleader>ce I/*<space>}>><space>*/<c-c>

" }>>

" <<{ javascript snippets

nnoremap <localleader>jc I//<space><c-c>
nnoremap <localleader>ju ^3x
nnoremap <localleader>jh I//<space><<{<space>
nnoremap <localleader>je I//<space>}>><c-c>
nnoremap <localleader>jbc :read ~/.vim/snippets/hub_content.txt<cr>
nnoremap <localleader>jbb :read ~/.vim/snippets/hub_block.txt<cr>
nnoremap <localleader>jbi o{ name: '', desc: '', link: '' },<c-c>23h

" }>>

" <<{ buffer delete (:BD) command for fzf

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" }>>

