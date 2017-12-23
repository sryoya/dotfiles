" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype off

""""""""""""""""""""""""""""""
" プラグインのセットアップ """"""""""""""""""""""""""""""

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


let $DOTVIM = expand('~/.vim')
let $VIMBUNDLE = $DOTVIM . '/bundle'

" Required:
call neobundle#begin(expand($VIMBUNDLE))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
" NeoBundle 'Shougo/unite.vim'
" ファイルオープン用
NeoBundle 'kien/ctrlp.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" neocompleteとmarkdown-vimを共存させるため
NeoBundle 'konfekt/fastfold'
" 入力補完
NeoBundle 'Shougo/neocomplete.vim'
" pythonの入力補完
NeoBundle 'davidhalter/jedi-vim'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'
" csvの編集ができるようにしてくれる
NeoBundle 'chrisbra/csv.vim'

" vimからアクセスするカレンダー生活
NeoBundle 'itchyny/calendar.vim'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'
" less用のsyntaxハイライト
NeoBundle 'KohPoll/vim-less'
" Markdown便利化
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'jkramer/vim-checkbox'

" vim上でgit
NeoBundle 'lambdalisue/gina.vim'

" incremental search
NeoBundle 'haya14busa/incsearch.vim'

" visualモードの範囲拡大
NeoBundle 'terryma/vim-expand-region'

" ColorSchemaを追加
NeoBundle 'tomasr/molokai'
" go syntax
NeoBundle 'fatih/vim-go'

" HTML入力補完
NeoBundle 'mattn/emmet-vim'

" Syntax for force.com
NeoBundle 'ejholmes/vim-forcedotcom'

" Deal with 'surroundings'
NeoBundle 'tpope/vim-surround'

" 簡易script実行環境
NeoBundle 'thinca/vim-quickrun'
""NeoBundle 'Shougo/vimproc.vim', {
""      \ 'build' : {
""      \     'windows' : 'tools\\update-dll-mingw',
""      \     'cygwin' : 'make -f make_cygwin.mak',
""      \     'mac' : 'make',
""      \     'linux' : 'make',
""      \     'unix' : 'gmake',
""      \    },
""      \ }
""
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" バックアップディレクトリの指定(でもバックアップは使ってない)
set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 行番号を表示する
set number
"" 縦横にハイライト
"set cursorline
"set cursorcolumn
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme molokai
set t_Co=256
highlight Normal ctermbg=none
""""""""""""""""""""""""""""""

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" let g:unite_enable_ignore_case = 1
" let g:unite_enable_smart_case = 1
" " バッファ一覧
" noremap <C-P> :Unite buffer<CR>
" " ファイル一覧
" noremap <C-N> :Unite -buffer-name=file file<CR>
" " 最近使ったファイルの一覧
" "noremap <C-Z> :Unite file_mru<CR>
" " sourcesを「今開いているファイルのディレクトリ」とする
" noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" " ウィンドウを分割して開く
" au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" " ウィンドウを縦に分割して開く
" au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" " ESCキーを2回押すと終了する
" au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
" au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""""""""""""""""
" Neocompleteの設定
""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

""" Recommended key-mappings.
""" <CR>: close popup and save indent.
""inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
""function! s:my_cr_function()
""  " return neocomplete#close_popup() . "\<CR>"
""  " For no inserting <CR> key.
""  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
""endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

""""""""""""""""""""""""""""""
" NeocompleteとJedi(Python入力補完)の連携
""""""""""""""""""""""""""""""
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
""""""""""""""""""""""""""""""
" Markdown拡張子適用
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set filetype=markdown
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Markdown画像挿入自動化
""""""""""""""""""""""""""""""
imap <F2> <C-c>:r! image_paste_for_markdown %:h<CR>lli

""""""""""""""""""""""""""""""
" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Emmetのキーマップ作成
""""""""""""""""""""""""""""""
let g:user_emmet_leader_key = '<c-y>'
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }
"""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Markdown Table用の入力補助
""""""""""""""""""""""""""""""
let g:table_mode_corner="|"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" 簡易script実行環境
""""""""""""""""""""""""""""""
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 日本語入力補助
""""""""""""""""""""""""""""""
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
" 表示単位で上下
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" showbreaks
" set showbreak=↪

nnoremap し” ci"
nnoremap し’ ci'
" jjでエスケープ
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っｊ <ESC>
""""""""""""""""""""""""""""""
" MapLeaderを利用したキーバインド
""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
nnoremap <Leader>ww :w!<CR>
nnoremap <Leader>wq :wq!<CR>
vmap <Leader>y "+y
vmap <Leader>p "+p
nmap <Leader><Leader> V
noremap <Leader>l  $
noremap <Leader>/  *
noremap <Leader>h  ^
noremap <Leader>s :%s/
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" visualモードの範囲指定の簡易化
""""""""""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Calenderを利用できるように
""""""""""""""""""""""""""""""
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" ClipboadにYankした内容をコピーする
""""""""""""""""""""""""""""""
set clipboard=unnamed,autoselect
""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" emacs風味
""""""""""""""""""""""""""""""
imap <C-d> <ESC><RIGHT>xi
imap <C-h> <ESC>xa
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" csv用の設定
""""""""""""""""""""""""""""""
if exists("did_load_csvfiletype")
  finish
endif
let did_load_csvfiletype=1

augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
augroup END
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" incremental search の設定
""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


""""""""""""""""""""""""""""""
" source external vim setting files
""""""""""""""""""""""""""""""

"if 1
"  execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/scripts/init.vim'
"endif

""""""""""""""""""""""""""""""


" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on

