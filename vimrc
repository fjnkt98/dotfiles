set number     " 行数を表示
set splitright " 新しいウィンドウを右側に開く
set clipboard&
set clipboard^=unnamedplus " クリップボードを使う
set nohls      " 検索時のハイライトを消す

" 分割画面時の画面遷移設定
noremap <silent><C-h> <C-w>h
noremap <silent><C-j> <C-w>j
noremap <silent><C-k> <C-w>k
noremap <silent><C-l> <C-w>l

" vi互換を使用しない
if &compatible
  set nocompatible
endif

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

" git commit時はプラグインを読み込まない
if $HOME!=$USERPROFILE && $GIT_EXEC_PATH!=""
  finish
end

" プラグインの読み込み
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

call plug#end()

" プラグインの設定ファイル読み込み
source ~/dotfiles/config/tender.vim
source ~/dotfiles/config/lexima.vim
source ~/dotfiles/config/nerdtree.vim
source ~/dotfiles/config/nerdtree-git-plugin.vim
source ~/dotfiles/config/vim-gitgutter.vim
