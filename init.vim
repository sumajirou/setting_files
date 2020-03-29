"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  call dein#add('crusoexia/vim-monokai')
  call dein#add('chase/vim-ansible-yaml')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""

" 行番号の表示
set nu
" タイトルバーにファイルパスを表示
set title
" カーソル行を目立たせる
set cursorline
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" yankをクリップボードに保存する"
set clipboard=unnamed
" 日本語文字化けを防ぐ
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
" マウスを有効化
set mouse=a
" 検索時に文字の大小を無視
set ignorecase
" (ignorecase有効時)小文字検索時文字の大小を無視し、大文字が入ると大小を区別する
set smartcase
" 検索時最後の単語から最初に戻る
set wrapscan
" インクリメンタルサーチ
set incsearch
" (neovim)文字列置換をインタラクティブに表示
set inccommand=split
" タブの大きさを変更
set tabstop=2
" インデント操作コマンドのスペース個数(0のときtabstopの値)
set shiftwidth=0
" shiftwidthの倍数になるようにスペースを挿入
set shiftround
" タブの代わりにスペースを使う
set expandtab
" インデント
set autoindent
" 折返しをカーソル移動
set whichwrap=b,s,<,>,[,]
" ファイル変更時自動再読み込み
set autoread

" カラーテーマ
colorscheme monokai

""""""""""""""""""""""""""""""
" キーバインドの設定
""""""""""""""""""""""""""""""

" init.vimを編集
nnoremap <Leader>v :e $MYVIMRC<CR>
" 検索のハイライトをオフに
nnoremap <ESC> :noh<CR><ESC>
" 次のバッファ
nnoremap <Leader>n :bn<CR>
" バッファ削除
nnoremap <Leader>d :bd<CR>
" フォーマット
nnoremap <Leader>i mmggVG=`m
" init.vimの読み込み
nnoremap <F8> :source $MYVIMRC<CR>
" インサートモード中jjで<ESC>
inoremap <silent> jj <ESC>
" 検索時カーソルを画面中央に
nnoremap n nzz
nnoremap N Nzz
" ウィンドウの移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Yの挙動をDやCと同じにする
nnoremap Y y$

"変更があれば保存
nnoremap <C-S> :up<CR>
inoremap <C-S> <C-O>:up<CR>

" 選択した文字列を*で検索
vnoremap * "zy:let @/ = @z<CR>n


""""""""""""""""""""""""""""""
" 検証中の機能
""""""""""""""""""""""""""""""

" 最後のカーソル位置を復元する(なんでこれでうごく？)
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif


