filetype off


set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'gregsexton/MatchTag'
Plugin 'kien/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gotcha/vimpdb'
Plugin 'amiorin/vim-project'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jmcantrell/vim-virtualenv'

Plugin 'scrooloose/nerdtree'
Plugin 'albfan/nerdtree-git-plugin'

Plugin 'git://github.com/pangloss/vim-javascript.git'
Plugin 'git://github.com/itspriddle/vim-jquery.git'

Plugin 'git://github.com/leshill/vim-json.git'

Plugin 'lervag/vimtex'
Plugin 'isRuslan/vim-es6'

"Plugin 'vim-scripts/project.tar.gz'

call vundle#end()
filetype plugin indent on

set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251

set hlsearch

"windows ctrl+c/v/x
"source $VIMRUNTIME/mswin.vim
"behave mswin
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

"CTRL-Z for undo
noremap <C-Z> u 
vnoremap <C-Z> u 


"view
set termencoding=utf-8
set t_Co=256
colorscheme wombat256 
set guifont=Dejavu\ Sans\ Mono\ 13
set laststatus=2

"gui like console
if has('gui_running')
    set guioptions-=T " toolbar off
    set guioptions-=m " menu off
    set guioptions-=e " tabs like in consoles
    set guioptions-=r
    set guioptions-=L  
    set guioptions-=R
    set guioptions-=l
endif


"tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab 
set softtabstop=4 

"special tabs html/js
"autocmd FileType html :setlocal sw=2 ts=2 sts=2
"autocmd FileType javascript :setlocal sw=2 ts=2 sts=2

autocmd FileType lua :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType js :setlocal sw=2 ts=2 sts=2
autocmd FileType yaml :setlocal sw=2 ts=2 sts=2

"for coding
set autoindent
syntax on
set nu
let python_highlight_all=1
set foldcolumn=1
set colorcolumn=80

"remove trailing whitespace for python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"smart indents in *.py
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '.git', '.idea']
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1

"MBE
"switch buffers on crl+tab
vnoremap <C-Tab> :MBEbn<CR>
let g:miniBufExplCycleArround = 1


"clang auto completion problem
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_library_path = '/usr/lib/'
let g:clang_user_options='|| exit 0'

"Python-Mode
let g:pymode = 1
let g:pymode_rope = 0 "Slows down Jedi from YouCompleteMe
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_motion = 1
let g:pymode_folding = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pep8']
let g:pymode_lint_ignore = "E501,E128,W"
let g:pymode_virtualenv = 1


"MiniBufferExploer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplAutoStart = 1
let g:miniBufExplBuffersNeeded = 0


"YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = ',o'

"shortcuts
abbrev W w
nmap ,n :NERDTreeToggle<cr>
nmap ,m :Project<cr>

nmap <space> :
nmap <ctrl><tab> :tabnext<cr>
"nmap ,o :CtrlP<CR>  


"vimtex
let g:vimtex_fold_enabled = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:vimtex_build_dir = './build/'
let g:vimtex_indent_enabled = 1
let g:vimtex_latexmk_options = '-pdf -shell-escape -xelatex'
let g:vimtex_quickfix_ignore_all_warnings = 1
let g:vimtex_quickfix_mode = 2
let g:vimtex_view_enabled = 1
"let g:latex_view_general_viewer = 'foxireader'

"syntastic
let g:syntastic_javascript_checkers = ['eslint']

"lightline config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
