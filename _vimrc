""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" OS���ˑ��֘A�͐擪�ɋL�q����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �o�b�N�A�b�v�f�B���N�g���̎w��(�ł��o�b�N�A�b�v�͎g���ĂȂ�)
set backupdir=$HOME/.vimbackup
" set backupdir=C:\Users\{name}\Documents\myBox\temp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin�֘A�̈ڐA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin�f�B���N�g�����ڐA(�����ňڐA���������L��)
" - mru.vim
" - caw.vim

" autoload�f�B���N�g���̈ڐA(�����Œǉ����������L��)
" - caw.vim
"
"""""""""""""""
" �w�i�𔼓����ɂ���
"""""""""""""""
if executable("vimtweak.dll")
    autocmd guienter * call libcallnr("vimtweak","SetAlpha",222)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""
""" �^�u�̃t�@�C�����\������ �}���`�o�C�g�Ή� strlen() �� strpart()
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
  if length > 10   "�t�@�C������11�����ȏ��̏ꍇ�A�������؂��l�߂�10�����ɂ����B
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

" netrw�͏���tree view
let g:netrw_liststyle = 3
" CVS��.�Ŏn�܂��t�@�C���͕\�����Ȃ�
" let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'�Ńt�@�C�����J���Ƃ��͉E���ɊJ���B(�f�t�H���g�������Ȃ̂œ����ւ�)
let g:netrw_altv = 1
" 'o'�Ńt�@�C�����J���Ƃ��͉����ɊJ���B(�f�t�H���g���㑤�Ȃ̂œ����ւ�)
let g:netrw_alto = 1

"""""""""""""
" �J�[�\���s�������\������
"""""""""""""""
" augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinLeave * set nocursorcolumn
"  autocmd WinEnter,BufRead * set cursorline
"  autocmd WinEnter,BufRead * set cursorcolumn
" augroup END

"""""""""""
" backup���Ƃ��Ȃ�
"""""""""""
set nobackup

"""""""""""
" esc esc�œ��񉟂����ƂŃn�C���C�g�������B
""""""""""
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"""""""""""
" �R�����g�A�E�g�p�̃V���[�g�J�b�g�B
""""""""""
" caw.vim�v���O�C���𗘗p
" noremap <C-/> :s/^/\/\//<CR>:nohlsearch<CR>
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
nmap <C-/> <Plug>(caw:i:toggle)
vmap <C-/> <Plug>(caw:i:toggle)


"""""""""""
set showtabline=2
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" �}�����[�h���A�X�e�[�^�X���C���̐F���ύX
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
" �����I�ɕ����ʂ�����
""""""""""""""""""""""""""""""
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" �V���[�g�J�b�g�L�[
""""""""""""""""""""""""""""""
" Enter�ŉ��s
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
" for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"  exec "imap " . k . " " . k . "<C-N><C-P>"
" endfor
"
" imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

""""""""""""""""""""""""""""""
" �Ō��̃J�[�\���ʒu�𕜌�����
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" �e���I�v�V�����̐ݒ�
""""""""""""""""""""""""""""""
" �^�O�t�@�C���̎w��(�ł��^�O�W�����v�͎g�������Ƃ��Ȃ�)
set tags=~/.tags
" �X���b�v�t�@�C���͎g���Ȃ�(�Ƃ��ǂ��ʓ|�Ȍx�����o�邾���Ŗ��ɗ��������Ƃ��Ȃ�)
set noswapfile
" �J�[�\�������s�ڂ̉����ڂɒu�����Ă��邩���\������
set ruler
" �R�}���h���C���Ɏg���������ʏ��̍s��
set cmdheight=2
" �G�f�B�^�E�B���h�E�̖�������2�s�ڂɃX�e�[�^�X���C�����펞�\��������
set laststatus=2
" �X�e�[�^�X�s�ɕ\�������������̎w��(�ǂ����炩�R�s�y�����̂ōׂ����Ӗ��͂킩���Ă��Ȃ�)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" �X�e�[�^�X�s�Ɍ��݂�git�u�����`���\������
" set statusline+=%{fugitive#statusline()}
" �E�C���h�E�̃^�C�g���o�[�Ƀt�@�C���̃p�X���񓙂��\������
set title
" �R�}���h���C�����[�h��<Tab>�L�[�ɂ����t�@�C�����⊮���L���ɂ���
set wildmenu
" ���͒��̃R�}���h���\������
set showcmd
" �o�b�t�@�ŊJ���Ă����t�@�C���̃f�B���N�g���ŃG�N�X�N���[�����J�n����(�ł��G�N�X�v���[�����Ďg���ĂȂ�)
set browsedir=buffer
" �������݂̂Ō��������Ƃ��ɑ啶���������𖳎�����
set smartcase
" �������ʂ��n�C���C�g�\������
set hlsearch
" �Â��w�i�F�ɍ��킹���z�F�ɂ���
set background=dark
" �^�u���͂𕡐��̋󔒓��͂ɒu��������
set expandtab
" �������[�h�̍ŏ��̕��������͂������_�Ō������J�n����
set incsearch
" �ۑ������Ă��Ȃ��t�@�C���������Ƃ��ł��ʂ̃t�@�C�����J�����悤�ɂ���
set hidden
" �s���������\������
set list
" �^�u�ƍs�̑�������������
" set listchars=tab:>\ ,extends:<
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<
" �S�p�\��
"highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
" au BufRead,BufNew * match JpSpace /�@/
" �s�ԍ����\������
set number
" �Ή����銇�ʂ��u���[�X���\������
set showmatch
" ���s���ɑO�̍s�̃C���f���g���p������
set autoindent
" ���s���ɓ��͂��ꂽ�s�̖����ɍ��킹�Ď��̍s�̃C���f���g�𑝌�����
set smartindent
" �^�u�����̕\����
set tabstop=4
" Vim���}�������C���f���g�̕�
set shiftwidth=4
" �s���̗]������ Tab ���ł����ނƁA'shiftwidth' �̐������C���f���g����
set smarttab
" �J�[�\�����s���A�s���Ŏ~�܂��Ȃ��悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]
" �\�����ɕ����F���ω�������
syntax on
" �J���[�X�L�[�}�̎w��
colorscheme desert
" �s�ԍ��̐F
highlight LineNr ctermfg=darkyellow
" �܂��Ԃ��\�������Ȃ�
set nowrap
" �����ő啶�������������ʂ��Ȃ�
set ignorecase

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"�S�p�X�y�[�X���\��
""""""""""""""""""""""""""""""
"�R�����g�ȊO�őS�p�X�y�[�X���w�肵�Ă����̂� scriptencoding�ƁA
"���̃t�@�C���̃G���R�[�h�����v�����悤���ӁI
"�S�p�X�y�[�X�������\�������Ȃ��ꍇ�A������scriptencoding���w�肷���Ɨǂ��B
"scriptencoding cp932

"�f�t�H���g��ZenkakuSpace�����`
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=darkgrey gui=reverse guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpace���J���[�t�@�C���Őݒ肷���Ȃ玟�̍s�͍폜
    autocmd ColorScheme       * call ZenkakuSpace()
    " �S�p�X�y�[�X�̃n�C���C�g�w��
    autocmd VimEnter,WinEnter * match ZenkakuSpace /�@/
    autocmd VimEnter,WinEnter * match ZenkakuSpace '\%u3000'
  augroup END
  call ZenkakuSpace()
endif
