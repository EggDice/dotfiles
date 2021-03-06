set nocompatible
au BufNewFile,BufRead *.{js,mjs,jsm,es,es6},Jakefile setf javascript

" remove white-space on edit
autocmd BufWritePre * %s/\s\+$//e

:set number relativenumber
:set nu rnu


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

execute pathogen#infect()
filetype plugin indent on

syntax enable
set background=dark
colorscheme delek

set mouse=a
set nu
set ruler
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
highlight ColorColumn ctermbg=7

let g:ctrlp_custom_ignore = 'dist\|bower_components\|node_modules\|DS_Store\|git\|cache\|plugins'

set hidden
set nobackup
set noswapfile

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set tabstop=2
set autoindent
set smartindent
set expandtab
set cindent
set shiftwidth=2
set wildmenu

" emacs like tab
set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
set indentkeys=!<Tab>,o,O
map <Tab> i<Tab><Esc>^


" fix odd backspace behaviour
set backspace=start,eol,indent

" powerline status always visible
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" disable cursor keys in navigation
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" command-t directory ignore
set wildignore+=bower_components
set wildignore+=node_modules

" Disable Syntastic for HTML
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_compiler_options = "-std=c++17"
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_warning_symbol = '⚠'
map <C-F12> <ESC>:SyntaticCheck<CR>

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" powerline slow escape fix
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
" map key for vimux command
map <Leader>vp :VimuxPromptCommand<CR>

let g:vim_markdown_folding_disabled = 1
set t_Co=256
let g:molokai_original = 1
colorscheme darkest-space
set spell
set spellfile=~/.vim/spell/en.utf-8.add

set clipboard=unnamedplus

" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" Move Lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Plugins
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" fzf

nnoremap <C-p> :Files<CR>
