" ==================================================
" 初期化処理
" ==================================================

" 不要なデフォルトプラグインを止める
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

" autocmdグループ 'vimrc' のリセット
" （以降のautocmd設定時は 'vimrc' グループに属させる事）
augroup vimrc
  autocmd!
augroup END


" ==================================================
" 基本設定
" ==================================================

" ファイルタイプ設定
" ----------------------------------

" シンタックスハイライトの有効化
syntax enable
" ファイルタイプ検出及び各種プラグイン有効化
filetype plugin indent on
" Markdownファイルタイプの拡張子指定
autocmd vimrc BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" YAMLファイルタイプの拡張子指定
autocmd vimrc BufNewFile,BufRead *.{yaml,yml} set filetype=yaml
" CGIファイルタイプの拡張子指定
autocmd vimrc BufNewFile,BufRead *.cgi set filetype=php


" エンコーディング
" ----------------------------------

" vim内部文字コード設定
set encoding=utf8
" 書き込み時の文字コード設定
set fileencoding=utf-8
" 読み込み時の文字コード設定
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
" 書き込み時の改行コード設定
set fileformat=unix
" 読み込み時の改行コード設定
set fileformats=unix,dos,mac
" Vim scriptファイルの文字コード
scriptencoding utf-8


" 表示
" ----------------------------------

" 特殊全角文字があってもカーソル位置をずらさない
set ambiwidth=double
" 80列目を強調表示（折り返しの参考のため）
set colorcolumn=80
" カーソル行を強調表示
set cursorline
" 画面最後の行を省略せず表示する
set display=lastline
" 不可視文字を表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 括弧の対応表示時間を変更
set matchtime=1
" 行番号表示
set number
" カーソルの位置を表示
set ruler
" 起動時のメッセージを表示しない
set shortmess+=I
" 括弧の対応表示
set showmatch
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 文字が無い場所にもカーソルを移動可能にする
set virtualedit=all
" ウィンドウの幅より長い行は折り返し、次の行に続けて表示する
set wrap


" ステータスライン・タブライン
" ----------------------------------

" " コマンドラインの高さを設定
set cmdheight=1
" "ステータスラインを常に表示
set laststatus=2
" "ステータスラインにコマンドを表示
set showcmd
" 常にタブラインを表示
set showtabline=2


" 検索
" ----------------------------------

" 検索でヒットした文字列の強調表示
set hlsearch
" 検索文字列の大文字小文字を区別しない
set ignorecase
" インクリメンタルサーチを有効化
" （検索文字列を入力完了する前に、入力中の文字列にマッチしている場所へ移動する）
set incsearch
" 検索文字列に大文字小文字の両方が含まれている場合は大文字小文字を区別する
set smartcase
" 検索がファイル末尾まで進んだ場合、再び最初から検索を行う
set wrapscan
" '*grep' の結果をquickfixで開く
autocmd vimrc QuickFixCmdPost *grep* cwindow
" grepに外部コマンドを使用（'highway' -> 'ag' の順に設定）
if executable('hw')
  set grepprg=hw\ --no-group\ --no-color
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif


" 入力
" ----------------------------------

" バックスペースでインデントや改行を削除
set backspace=indent,eol,start
" クリップボードを外部と共有
set clipboard=unnamed,autoselect


" インデント
" ----------------------------------

" 改行時に前の行のインデントを継続する
set autoindent
" タブをスペースに置き換える
set expandtab
" インデント幅
set shiftwidth=2
" インデントをshiftwidthの倍数に丸める
set shiftround
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ挿入時のスペース数
set softtabstop=2
" タブの表示幅
set tabstop=2
" 改行時の自動コメントアウトを無効化
autocmd vimrc BufEnter * setlocal formatoptions-=ro


" 補完
" ----------------------------------

" 補完の際、候補が1つしかないときもポップアップメニューを表示
set completeopt=menuone
" 補完の際の大文字小文字の区別しない
set infercase


" 移動
" ----------------------------------

" 移動コマンドを使った際行頭に移動しない
set nostartofline
" 上下スクロールの開始位置
set scrolloff=5
" 左右スクロール幅
set sidescroll=1
" 左右スクロールの開始位置
set sidescrolloff=15


" キーマッピング
" ----------------------------------

" マッピングとキーコードにタイムアウトを設定
set timeout
" マッピングされたキー列が完了するのを待ち合わせる時間m秒
set timeoutlen=1000
" キーコードが完了するのを待ち合わせる時間m秒
set ttimeoutlen=75


" バッファ
" ----------------------------------

" 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
" バッファを切り替える際、新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen


" 履歴・バックアップ
" ----------------------------------

" コマンド、検索パターンの保存数
set history=100
" ファイルの上書きの前にバックアップを作る
" （バックアップは上書きに成功した後削除される）
set nobackup
set writebackup
" swapを作るまでの時間m秒
set updatetime=0


" 音声出力
" ----------------------------------

" エラー音抑止
set noerrorbells
" ビジュアルベル抑止
set novisualbell
" ビープ音抑止
set visualbell t_vb=


" ==================================================
" マッピング
" ==================================================

" 'Space -> .' で.vimrcを編集する
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
" 'Space -> s -> .' で.vimrcを読み込み直す
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
" 'Space -> o' でインサートモードに移行せず改行する
nnoremap <Space>o :<C-u>call append(expand('.'), '')<CR>j
" 'Esc + Esc' でハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>
" 'Ctrl + j' 、 'Ctrl + k' でカーソル位置を変えずにスクロールする
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
" 'Ctrl + a' で行の先端、 'Ctrl + e' で行の終端に移動する
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
" 'Ctrl + n' で新規タブオープン
nnoremap <C-n> :tabnew<CR>
" 'Ctrl + l' 、 'Ctrl + h' でタブ移動
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
" 'v -> v' で行末まで選択
vnoremap v $h
" カーソル下の単語を '*' で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" 表示行単位で行移動する
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
" 'F2' でペーストモードを切り替え
" ノーマルモードへ戻った際にペーストモードを解除
set pastetoggle=<F2>
autocmd vimrc InsertLeave * set nopaste
" '/{pattern}' の入力中は '/' をタイプすると自動で '\/' が、
" '?{pattern}' の入力中は '?' をタイプすると自動で '\?' 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" インサートモード中に'Ctrl + b' で左に移動
inoremap <C-b> <left>


" ==================================================
" ショートカット
" ==================================================

" 'w!!' でsudo権限で保存
cabbr w!! w !sudo tee > /dev/null %


" ==================================================
" マーク
" ==================================================

" [Mark] キー割り当てを削除
nnoremap [Mark] <Nop>
" 'm' に [Mark] キーを割り当てる
nmap m [Mark]
" '[Mark] -> j' で次のマーク、 '[Mark] -> k' で前のマークへ移動
nnoremap [Mark]j ]`
nnoremap [Mark]k [`
" バッファ読み込み時に前回終了位置に移動
autocmd vimrc BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" バッファ読み込み時にマークを初期化
autocmd vimrc BufReadPost * delmarks!

" マークに割り当てるアルファベットを指定
if !exists('g:markrement_char')
  let g:markrement_char = [
        \   'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \   'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
        \ ]
endif

" 自動でマークを設定する関数
function! AutoMark()
  if !exists('b:markrement_pos')
    let b:markrement_pos = 0
  else
    let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
  endif
  execute 'mark' g:markrement_char[b:markrement_pos]
  echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

" '[Mark] -> m' でカーソル位置をマーク
nnoremap <silent>[Mark]m :<C-u>call <SID>AutoMark()<CR>


" ==================================================
" 補完
" ==================================================

" 補完ポップアップ表示時に 'Tab' で次のキーワードを表示
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 補完ポップアップ表示時に 'Shift -> Tab' で次のキーワードを表示
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Googleのサジェストから補完候補を取得する関数
function! GoogleComplete(findstart, base)
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\S'
      let start -= 1
    endwhile
    return start
  else
    let ret = system('curl -s -G --data-urlencode "q='
          \ . a:base . '" "http://suggestqueries.google.com/complete/search?&client=firefox&hl=ja&ie=utf8&oe=utf8"')
    let res = split(substitute(ret,'\[\|\]\|"','','g'),',')
    return res
  endif
endfunction
" ユーザ定義補完関数にGoogleのサジェスト補完を設定
" 'Ctrl + x -> Ctrl + u' でユーザ定義補完候補表示
set completefunc=GoogleComplete


" ==================================================
" スペルチェック
" ==================================================

" スペルチェック時に日本語を除外
set spelllang=en,cjk

" スペルチェックモードを切り替える関数
function! SpellToggle()
	setlocal spell!
	if exists('g:syntax_on')
		syntax off
	else
		syntax on
	endif
endfunction
" 'F9' でスペルチェックモードを切り替え
nnoremap <F9> :call SpellToggle()<CR>


" ==================================================
" プラグイン
" ==================================================

" vim-plug
" プラグイン管理マネージャ
" ----------------------------------

" プラグイン管理管理マネージャ vim-plug 自動インストール
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug', { 'dir': '~/.vim/plugged/vim-plug/autoload' }


" vim-hybrid
" カラースキーマ
" ----------------------------------

Plug 'w0ng/vim-hybrid'


" fzf.vim
" Vim上で 'fzf' の機能を利用可能にする
" ----------------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <silent> <C-m> :History<CR>


" nerdtree
" ツリー型エクスプローラ
" ----------------------------------

Plug 'scrooloose/nerdtree'

" ブックマーク等の機能を無効化
let NERDTreeMinimalUI = 0
" 不可視ファイルの表示
let NERDTreeShowHidden = 1
" ツリーウィンドウのサイズ指定
let NERDTreeWinSize = 45


" vim-nerdtree-tabs
" nerdtreeを独立したパネルのように
" 扱うための拡張
" ----------------------------------

Plug 'jistr/vim-nerdtree-tabs'

" MacVim、GVim起動時にnerdtreeを開かない
let g:nerdtree_tabs_open_on_gui_startup = 0
" 起動の引数にディレクトリが指定されている時のみ、起動時に開く
let g:nerdtree_tabs_open_on_console_startup = 2

" '\ -> n -> t' で開く
nmap <Leader>nt :NERDTreeTabsToggle<CR>


" neocomplete.vim
" キーワード補完
" ----------------------------------

Plug 'Shougo/neocomplete.vim'

" Vim起動時に有効化
let g:neocomplete#enable_at_startup = 1
" 表示される候補の最大数
let g:neocomplete#max_list = 20
" キーワードパターン定義
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
" 日本語を補完候補として取得しないようにする
let g:neocomplete#keyword_patterns['_'] = '\h\w*'
" 関数を補完するための区切り文字パターン定義
if !exists('g:neocomplete#delimiter_patterns')
  let g:neocomplete#delimiter_patterns= {}
endif
let g:neocomplete#delimiter_patterns['vim'] = [ '#' ]
let g:neocomplete#delimiter_patterns['php'] = [ '->', '::', '\' ]
" 補完ソース定義
if !exists('g:neocomplete#sources')
  let g:neocomplete#sources = {}
endif
let g:neocomplete#sources = {
      \   '_'         : [ 'neosnippet', 'file',               'buffer' ],
      \   'php'       : [ 'neosnippet', 'file', 'dictionary', 'buffer' ],
      \   'javascript': [ 'neosnippet', 'file', 'dictionary', 'buffer' ],
      \ }
" 辞書定義
if !exists('g:neocomplete#dictionary#dictionaries')
  let g:neocomplete#dictionary#dictionaries = {}
endif
let g:neocomplete#sources#dictionary#dictionaries = {
      \   '_'         : '',
      \   'php'       : $HOME . '/.vim/dict/php.dict',
      \   'javascript': $HOME . '/.vim/dict/javascript.dict',
      \ }

" ファイルタイプ毎にオムニ補完を有効化
autocmd vimrc FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" 補完候補選択中に 'Ctrl + g' で前回の補完をキャンセルする
inoremap <expr><C-g> neocomplete#undo_completion()
" 補完候補選択中に 'Ctrl + l' で候補中の共通文言を自動で設定する
inoremap <expr><C-l> neocomplete#complete_common_string()
" 補完候補選択中に 'Ctrl + h' あるいは 'BackSpace' でポップアップメニューが開く前の状態に戻す
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" ポップアップメニューの有無で '<CR>' の挙動を調整する関数
function! CompleteCR()
  return (pumvisible() ? "\<C-y>" : '' ) . "\<CR>"
endfunction
" 補完候補選択中に '<CR>' で通常の改行を行う
inoremap <silent> <CR> <C-r>=CompleteCR()<CR>


" neosnippet
" neosnippet-snippets
" neocompleteと連携するスニペット入力サポート
" ----------------------------------

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" スニペット展開中に 'Ctrl + k' で展開或いは次の候補へ移動
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)


" neco-look
" neocomplete用英語補完プラグイン
" ----------------------------------

Plug 'ujihisa/neco-look'

" インサートモード中に 'Ctrl + s' で英語補完候補表示
inoremap <expr><C-s> neocomplete#start_manual_complete('look')


" vim-sneak
" 高速なカーソル移動
" ----------------------------------

Plug 'justinmk/vim-sneak'

" 'f' によるカーソル移動をsneakに置き換える
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" 't' によるカーソル移動をsneakに置き換える
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T


" caw.vim
" コメント挿入・削除
" ----------------------------------

Plug 'tyru/caw.vim'

" 空行をコメントアウトしない
let g:caw_hatpos_skip_blank_line = 1
" 行末コメント時に挿入される文言
let g:caw_dollarpos_sp_left = ' '

" 'Ctrl + \ -> Ctrl + \' でコメントアウト
nmap <C-\><C-\> <Plug>(caw:hatpos:toggle)
vmap <C-\><C-\> <Plug>(caw:hatpos:toggle)


" vim-peekaboo
" レジスタの参照・挿入補助
" ----------------------------------

Plug 'junegunn/vim-peekaboo'

" peekabooウィンドウの位置・サイズを指定
let g:peekaboo_window = 'vertical botright 50new'


" winresizer
" ウィンドウサイズのリサイズ
" ----------------------------------
Plug 'simeji/winresizer'

" '\ -> w' でウィンドウリサイズ開始
" リサイズ中は 'h/j/k/l' でサイズ変更
let g:winresizer_start_key = '<Leader>w'


" vim-trailing-whitespace
" 文末のスペースを強調表示
" ----------------------------------

Plug 'bronson/vim-trailing-whitespace'


" vim-fugitive
" Vim上でGitの操作を行う
" ----------------------------------

Plug 'tpope/vim-fugitive'


" vim-gitgutter
" Gitの差分を表示する
" ----------------------------------

Plug 'airblade/vim-gitgutter'

" vim-gitgutterのマッピングを無効化
let g:gitgutter_map_keys = 0
" リアルタイムでの更新を無効化
let g:gitgutter_realtime = 0
" 常にサイン用のカラムを表示
let g:gitgutter_sign_column_always = 1

" '] -> c' で次のハンク、 '[ -> c' で前のハンクへ移動する
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk


" lightline.vim
" ステータスライン・タブラインの
" 表示設定
" ----------------------------------

Plug 'itchyny/lightline.vim'

" vim-fugitiveを利用したGitブランチ表示設定を追加
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste' ],
      \       [ 'fugitive', 'readonly', 'absolutepath', 'modified' ],
      \     ],
      \     'right': [
      \       [ 'qfstatusline', 'lineinfo' ],
      \       [ 'percent' ],
      \       [ 'fileformat', 'fileencoding', 'filetype' ],
      \     ],
      \   },
      \   'component': {
      \     'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   },
      \   'component_expand': {
      \     'qfstatusline': 'qfstatusline#Update',
      \   },
      \   'component_type': {
      \     'qfstatusline': 'error',
      \   },
      \   'component_visible_condition': {
      \     'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \   },
      \ }

let g:Qfstatusline#UpdateCmd = function('lightline#update')


" orkdownpen-browser.vim
" ブラウザの起動
" ----------------------------------

Plug 'tyru/open-browser.vim'

" '\ -> b' でカーソル下のURLや単語をブラウザで開く
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)


" previm
" Markdownやテキストファイルを
" プレビューする
" ----------------------------------

Plug 'kannokanno/previm'


" indentLine
" インデントレベルを可視化する
" ----------------------------------

Plug 'Yggdroot/indentLine'

" プラグインを有効化するファイルタイプを指定
let g:indentLine_fileType = [ 'yaml' ]
" 処理の高速化
let g:indentLine_faster = 1


" vim-markdown
" Markdownの記述サポート
" ----------------------------------

Plug 'tpope/vim-markdown', { 'for': [ 'markdown' ] }

" キーマッピング無効
let g:vim_markdown_no_default_key_mappings = 1
" 折りたたみ無効
let g:vim_markdown_folding_disabled = 1
" 改行時のインデント幅
let g:vim_markdown_new_list_item_indent = 2


" vim-go
" GO言語の開発サポート
" ----------------------------------

Plug 'fatih/vim-go', { 'for': [ 'go' ] }


" PHPUnitファイルタイプの拡張子指定
autocmd vimrc BufNewFile,BufRead *Test.php set filetype=php.phpunit


Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/shabadou.vim'

if !exists('g:quickrun_config')
  let g:quickrun_config = {}
endif
let g:quickrun_config = {
      \   '_': {
      \     'runner'                                : 'vimproc',
      \     'runner/vimproc/updatetime'             : 50,
      \     'outputter'                             : 'multi:buffer:quickfix',
      \     'outputter/buffer/split'                : 'botright 8sp',
      \     'hook/close_quickfix/enable_hook_loaded': 1,
      \     'hook/close_quickfix/enable_success'    : 1,
      \     'hook/close_buffer/enable_empty_data'   : 1,
      \     'hook/close_buffer/enable_failure'      : 1,
      \   },
      \   'watchdogs_checker/_': {
      \     'hook/close_quickfix/enable_exit'       : 1,
      \     'hook/back_window/enable_exit'          : 0,
      \     'hook/back_window/priority_exit'        : 1,
      \     'hook/qfstatusline_update/enable_exit'  : 1,
      \     'hook/qfstatusline_update/priority_exit': 2,
      \     'outputter/quickfix/open_cmd'           : '',
      \    },
      \   'php/watchdogs_checker': {
      \     'type'  : 'watchdogs_checker/php',
      \     'cmdopt': '-l -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0',
      \     'exec'  : '%c %o %s:p',
      \   },
      \   'php.phpunit': {
      \     'command'                       : 'phpunit',
      \     'cmdopt'                        : '',
      \     'exec'                          : '%c %o %s',
      \     'outputter/quickfix/errorformat': '%f:%l,%m in %f on line %l',
      \   },
      \ }

let g:quickrun_no_default_key_mappings = 1

nnoremap <silent> <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
nnoremap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap <Leader>r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" Quickfixウィンドウしかなかったら自動で閉じる
autocmd vimrc WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif

Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'osyo-manga/vim-watchdogs'

let g:watchdogs_check_BufWritePost_enables = {
      \   'vim': 0,
      \   'php': 1
      \ }

Plug 'tpope/vim-surround'

" nmap ,s <Plug>Yssurround
" nmap ,w <Plug>Csurround w
" nmap ,c <Plug>Csurround
" nmap ,d <Plug>Dsurround
" xmap ,v <Plug>VSurround



call plug#end()


" ==================================================
" カラースキーマ
" ==================================================

" カラースキーマの存在チェック関数
function! HasColorscheme(name)
  return !empty(globpath(&rtp, 'colors/'.a:name.'.vim'))
endfunction

" 'hybrid' が存在する時はカラースキーマを 'hybrid' に設定
if HasColorscheme('hybrid')
  colorscheme hybrid
  set background=dark
endif
