call plug#begin()
Plug 'jacoborus/tender.vim'
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme tender
