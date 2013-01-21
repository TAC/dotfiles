set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git

  call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'

filetype plugin on
filetype indent on

colorscheme molokai

set tabstop=2
setlocal shiftwidth=2 expandtab
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
setlocal splitright

autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
autocmd BufWritePost *.coffee :CoffeeCompile watch vert
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0

" indent guides
augroup indentguides
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
augroup END

