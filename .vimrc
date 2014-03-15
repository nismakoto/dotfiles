set t_Co=256

"------------------------------------------------
" Back up
"------------------------------------------------
set backup
set backupdir=$HOME/.vimbackup
set browsedir=buffer 
set directory=$HOME/.vimbackup

"------------------------------------------------
" Indent
"------------------------------------------------
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

"------------------------------------------------
" Display
"------------------------------------------------
set nocompatible
set listchars=eol:$,tab:>\ ,extends:<
set number
set showmatch
set laststatus=2
"set visualbell t_vb=
set noerrorbells

"------------------------------------------------
" Search
"------------------------------------------------
set hidden
set incsearch
set smartcase
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan

"------------------------------------------------
" Encoding
"------------------------------------------------
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,euc-jp,sjis,cp932,iso-2022-jp
set fileformats=unix,mac,dos

"------------------------------------------------
" plugin - NeoBundle
"------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

let g:neobundle_default_git_protocol='https'

NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/vimfiler.vim.git'
NeoBundle 'https://github.com/Rip-Rip/clang_complete.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.vim.git'
NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/itchyny/lightline.vim.git'
" color scheme
NeoBundle 'https://github.com/twerth/ir_black.git'
NeoBundle 'https://github.com/tomasr/molokai.git'
NeoBundle 'https://github.com/w0ng/vim-hybrid.git'

filetype plugin on
filetype indent on

syntax on
colorscheme hybrid

"------------------------------------------------
" neocomplcache
"------------------------------------------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_force_overwrite_completefunc=1
if !exists("g:neocomplcache_force_omni_patterns")
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|::'

"------------------------------------------------
" clang_complete
"------------------------------------------------
let g:clang_complete_auto=0
let g:clang_use_library=1
let g:clang_library_path='/home/makoto/Downloads/clang+llvm-3.3-amd64-debian6/lib'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"------------------------------------------------
" lightline
"------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': ' ', 'right': '' },
      \ 'subseparator': { 'left': ' ', 'right': '' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
