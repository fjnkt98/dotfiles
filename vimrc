set number     " 行数を表示
set splitright " 新しいウィンドウを右側に開く
set clipboard&
set clipboard^=unnamedplus " クリップボードを使う
set nohls      " 検索時のハイライトを消す

" 分割画面時の画面遷移設定
noremap <slient><C-h> <C-w>h
noremap <slient><C-j> <C-w>j
noremap <slient><C-k> <C-w>k
noremap <slient><C-l> <C-w>l

filetype plugin indent on
syntax enable

set autoindent     " オートインデントをオン
set smartindent    " スマートインデントをオン
set softtabstop=2  " タブキーで2つスペースを追加
set tabstop=2      " スペース2つで1つのタブとしてカウント
set expandtab      " タブ文字を使わない
set shiftwidth=2   " 自動挿入されるスペースは2つ分

" Pythonを使うときだけスペース4つでインデント
autocmd FileType python setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab

" vim-plugの自動インストール
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if $HOME!=$USERPROFILE && $GIT_EXEC_PATH!=""
  finish
end

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
call plug#end()

source ~/vimfiles/config/tender.vim
