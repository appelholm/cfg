call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'ripxorip/bolt.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/async.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()


let mapleader = ","

set history=700

filetype plugin on
filetype indent on

set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Display line numbers on the left
set number relativenumber

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Enable use of the mouse for all modes
set mouse=a


syntax enable

nnoremap <silent> <Leader>t :NERDTreeToggle<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


" Remap VIM 0 to first non-blank character
map 0 ^


" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Aerojump
nmap <Leader>as <Plug>(AerojumpSpace)
nmap <Leader>ab <Plug>(AerojumpBolt)
nmap <Leader>aa <Plug>(AerojumpFromCursorBolt)
nmap <Leader>ad <Plug>(AerojumpDefault) " Boring mode

" Color
set background=dark
colorscheme gruvbox
let g:airline_theme = "gruvbox"
"set termguicolors

" FZF
nmap <silent> <Leader>ff :FZF<CR>

"set shortmess-=F

source ~/.config/nvim/ccls.vim
source ~/.config/nvim/coc.vim
