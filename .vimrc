" START PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'crusoexia/vim-monokai'

Plug 'scrooloose/nerdtree'

" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'sheerun/vim-polyglot'

Plug 'kien/ctrlp.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



 Plug 'Valloric/YouCompleteMe'


Plug 'dense-analysis/ale'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" END PLUGINS
call plug#end()



" SETTINGS"
set backspace=indent,eol,start
set nocompatible
colors monokai
set history=50
set ruler
set showcmd
set incsearch
set number
set smartindent
set tabstop=2
set shiftwidth=0
set expandtab
set clipboard=unnamed
set breakindent
set linebreak
let &showbreak='  '


" enable mouse"
if has('mouse')
   set mouse=a
endif


"get colors to the syntax of your code"
if &t_Co > 2 || has("gui_running")
   syntax on
   set hlsearch
endif


augroup vimrcEx

"Jump to last cursor position when editing a file"
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

augroup END



"MAPPINGS"
let mapleader ="\<Space>"
" Use arrow keys to navigate window splits
nnoremap <silent> <Right> :wincmd l <CR>
nnoremap <silent> <Left> :wincmd h <CR>
noremap <silent> <Up> :wincmd k <CR>
noremap <silent> <Down> :wincmd j <CR>
noremap K {
noremap J }
noremap H ^
noremap L $
imap jj <Esc>
vmap <c-j><c-j> <Esc>
map Q gq
map ss :w<CR>
map sa :wa<CR>
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k




" PLUGIN SETTINGS

let g:jsx_ext_required = 0

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
" ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " enter file search mode

" Nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'javascript' : []
  \ }


let g:ycm_complete_in_comments_and_strings=1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_show_diagnostics_ui = 0
let g:airline_theme='badwolf'
set completeopt-=preview



let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']




" BUFFER MANAGEMENT 
set hidden " Allow buffers to be hidden if you've modified a buffer

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
