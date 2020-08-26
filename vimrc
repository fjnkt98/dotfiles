set encoding=utf-8
scriptencoding utf-8

set number     " Display row number
set splitright " Open new window to right
set clipboard&
set clipboard^=unnamedplus " Use clipboard
set nohls      " No highlight when searching

" View movement settings in split view
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l

" No use vi-compatible
if &compatible
  set nocompatible
endif

set autoindent     " Auto indent
set smartindent    " Smart indent
set softtabstop=2  " Insert 2 spaces with Tab key
set tabstop=2      " 1 indent with 2 spaces
set expandtab      " Never use Tab-character
set shiftwidth=2   " 2 spaces automatically inserted

" Indent with 4 spaces only when edit Python
autocmd FileType python setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab

" Turn on syntax highlighting in .launch file
autocmd BufEnter *.launch :setlocal filetype=xml

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Not loading plugins when run 'git commit'
if $HOME!=$USERPROFILE && $GIT_EXEC_PATH!=""
  finish
end

" Check the specified plugin is installed
function s:is_plugged(name)
    if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
        return 1
    else
        return 0
    endif
endfunction

" Load plugins
call plug#begin()
Plug 'jacoborus/tender.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'

Plug 'cohama/lexima.vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
call plug#end()

" Load settings for each plugin
if s:is_plugged("tender.vim")
  source ~/dotfiles/config/tender.vim.conf
endif

if s:is_plugged("lexima.vim")
  source ~/dotfiles/config/lexima.vim.conf
endif

if s:is_plugged("nerdtree")
  source ~/dotfiles/config/nerdtree.conf
endif

if s:is_plugged("nerdtree-git-plugin.vim")
  source ~/dotfiles/config/nerdtree-git-plugin.vim.conf
endif

if s:is_plugged("vim-gitgutter.vim")
  source ~/dotfiles/config/vim-gitgutter.vim.conf
endif

if s:is_plugged("vim-lsp")
  source ~/dotfiles/config/vim-lsp.conf
endif
