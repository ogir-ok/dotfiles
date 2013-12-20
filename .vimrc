autocmd BufWritePost .vimrc source $MYVIMRC

filetype off
filetype plugin on
set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251

"view
set termencoding=utf-8
set t_Co=256
colorscheme wombat256 
set guifont=DejaVu\ Sans\ Mono:h11
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
let g:pymode_virtualenv = 1
let g:pymode_lint_on_fly = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pep8']
let g:pymode_lint_ignore = "E501,W"
let g:pymode_lint_select = "E501,W0011,W430"
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = "~/virtualenvs/accellion/"


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



"shortcuts
abbrev W w
nmap ,n :NERDTreeToggle<cr>
nmap ,m :Project<cr>

nmap <space> :
nmap <ctrl><tab> :tabnext<cr>
nmap ,o :CtrlP<cr>  

"Vundle
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on

Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'majutsushi/tagbar'
Bundle 'gregsexton/MatchTag'
Bundle 'kien/ctrlp.vim'
Bundle 'itchyny/lightline.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'gotcha/vimpdb'
Bundle 'amiorin/vim-project'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'





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
