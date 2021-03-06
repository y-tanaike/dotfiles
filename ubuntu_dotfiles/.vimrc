""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" OS環境依存関連は先頭に記述する
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" バックアップディレクトリの指定(でもバックアップは使ってない)
set backupdir=/home/tanaike/vimbackup
" set backupdir=C:¥Users¥{name}¥Documents¥myBox¥temp
set noswapfile
set directory=/home/tanaike/vimswp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin関連の移植
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pluginディレクトリを移植(自分で移植した分を記載)
" - mru.vim
" - caw.vim

" autoloadディレクトリの移植(自分で追加した分を記載)
" - caw.vim
"
"""""""""""""""
" 背景を半透明にする
"""""""""""""""
" for windows
" if executable("vimtweak.dll")
"    autocmd guienter * call libcallnr("vimtweak","SetAlpha",222)
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""
""" タブのファイル名表示調整 マルチバイト対応 strlen() と strpart()
""" via http://vimwiki.net/?ScriptSample%2F16
""""""""""""""
function! StringLength(str)
  return strlen(substitute(a:str, ".", "x", "g"))
endfunction

function! StringPart(str, start, len)
  let bend = byteidx(a:str, a:start + a:len) - byteidx(a:str, a:start)
  if bend < 0
    return strpart(a:str, byteidx(a:str, a:start))
  else
    return strpart(a:str, byteidx(a:str, a:start), bend)
  endif
endfunction

function! GuiTabLabel()
  let label = expand("%:t")
  let length = StringLength(label)
  if length > 10   "ファイル名が11文字以上の場合、末尾を切り詰めて10文字にする。
    let label = StringPart(label, 0, 10) . ".."
  endif
  return label
endfunction

set guitablabel=%{GuiTabLabel()}

"""""""""""""""
" Don't exit vim when closing last tab with :q and :wq, :qa, :wqa
"""""""""""""""
cabbrev q   <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 && tabpagenr('$') == 1 && winnr('$') == 1 ? 'enew' : 'q')<CR>
cabbrev wq  <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 && tabpagenr('$') == 1 && winnr('$') == 1 ? 'w\|enew' : 'wq')<CR>
cabbrev qa  <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'tabonly\|only\|enew' : 'qa')<CR>
cabbrev wqa <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'wa\|tabonly\|only\|enew' : 'wqa')<CR>

" default encoding
set encoding=utf-8
" for auto encoding
set fileencodings=ucs-bom,iso-2022-jp,utf-8,cp932,euc-jp,default,latin

" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
" let g:netrw_list_hide = 'CVS,¥(^¥|¥s¥s¥)¥zs¥.¥S¥+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

"""""""""""""
" カーソル行を強調表示する
"""""""""""""""
" augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinLeave * set nocursorcolumn
"  autocmd WinEnter,BufRead * set cursorline
"  autocmd WinEnter,BufRead * set cursorcolumn
" augroup END

"""""""""""
" backupをとらない
"""""""""""
set nobackup

"""""""""""
" esc escで二回押すことでハイライトを消す。
""""""""""
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"""""""""""
" コメントアウト用のショートカット。
""""""""""
" caw.vimプラグインを利用
" noremap <C-/> :s/^/¥/¥//<CR>:nohlsearch<CR>
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
nmap <C-/> <Plug>(caw:i:toggle)
vmap <C-/> <Plug>(caw:i:toggle)


"""""""""""
set showtabline=2
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
  let hl = substitute(hl, '[¥r¥n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" ショートカットキー
""""""""""""""""""""""""""""""
" Enterで改行
" nmap <CR> i<CR><ESC>
nmap <CR> <Up>o<ESC><Down>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap <C-u> <ESC><C-u>i
inoremap <C-d> <ESC><C-d>i

inoremap <C-s> <Home>
inoremap <C-e> <End>

""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Auto select
""""""""""""""""""""""""""""""
" set completeopt=menuone
" for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'¥zs')
"  exec "imap " . k . " " . k . "<C-N><C-P>"
" endfor
"
" imap <expr> <TAB> pumvisible() ? "¥<Down>" : "¥<Tab>"

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
     if line("'\"") > 0 && line ("'\"") <= line("$") |
       exe "normal! g'\"" |
     endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=‾/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
" set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
" set listchars=tab:>\ ,extends:<
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<
" 全角表示
"highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
" au BufRead,BufNew * match JpSpace /　/
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=4
" Vimが挿入するインデントの幅
set shiftwidth=4
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow
" 折り返し表示させない
set nowrap
" 検索で大文字小文字を区別しない
set ignorecase

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"scriptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=darkgrey gui=reverse guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    autocmd VimEnter,WinEnter * match ZenkakuSpace '¥%u3000'
  augroup END
  call ZenkakuSpace()
endif
