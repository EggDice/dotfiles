set nocompatible

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

execute pathogen#infect()
filetype plugin indent on

syntax enable
set background=dark
colorscheme neon

set nu
set ruler

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
set laststatus=2

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

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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
