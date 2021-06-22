call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'yggdroot/indentline'
Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'APZelos/blamer.nvim'
Plug 'rhysd/git-messenger.vim'
Plug 'jlanzarotta/bufexplorer'
"Plug 'honza/vim-snippets'
"Plug 'sirver/ultisnips'
Plug 'liuchengxu/vista.vim'

" Language server stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

let mapleader = ","

set history=1000

syntax enable
filetype indent plugin on

set spelllang=en

set wildignore=*.o,*~,*.pyc
set wildmenu

" Open splits to the right
set splitright

set ruler
set cursorline

" Display line numbers on the left
set number relativenumber

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set hlsearch
set incsearch
set inccommand=split

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set visualbell
set timeoutlen=500

" Enable use of the mouse for all modes
set mouse=a
set mousehide

" Tab stuff
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Display all characters
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set list
set colorcolumn=120

set autoindent
filetype plugin indent on
set wrap

set scrolloff=4

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Color
set termguicolors
set background=dark
let g:gruvbox_material_background='hard'
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'

" Move up and down one line also for wrapped lines
nnoremap                j               gj
nnoremap                k               gk

" Remap VIM 0 to first non-blank character
nnoremap                0               ^

" Smart way to move between windows
nnoremap                <C-j>           <C-W>j
nnoremap                <C-k>           <C-W>k
nnoremap                <C-h>           <C-W>h
nnoremap                <C-l>           <C-W>l

" Useful mappings for managing tabs
nnoremap                <leader>tn      :tabnew<cr>
nnoremap                <leader>to      :tabonly<cr>
nnoremap                <leader>tc      :tabclose<cr>
nnoremap                <leader>tm      :tabmove

" \<space> toggles space in listchars
nnoremap    <silent>    <Bslash><Space> :call ListcharSpaceToggle()<cr>

" Remove all trailing whitespaces
nnoremap    <silent>    <leader>cw      :call Strip_trailing_whitespace()<cr>

" \d inserts local date
nnoremap    <silent>    <Bslash>d       :read !date<cr>
" \D inserts UTC date
nnoremap    <silent>    <Bslash>d       :read !date -u<cr>

" Enter turns of search highlight
nnoremap    <silent>    <Return>        :nohls<Return>

" Leader w saves current buffer
nnoremap    <silent>    <leader>w       :w<cr>

" autoclose brackets
inoremap                {<CR>           {<CR>}<C-c>O
inoremap                {;              {<CR>};<C-c>O
inoremap                {,              {<CR>},<C-c>O
inoremap                (;              (<CR>);<C-c>O
inoremap                (,              (<CR>),<C-c>O
inoremap                [;              [<CR>];<C-c>O
inoremap                [,              [<CR>],<C-c>O

" Spell check
nnoremap    <silent>    <leader>ss      :setlocal spell<cr>

" NERDTree
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncNERDTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

autocmd BufRead * call SyncNERDTree()
nnoremap    <silent>    <Leader>t       :NERDTreeToggle<CR><c-w>l:call SyncNERDTree()<cr><c-w>h

" FZF
nnoremap    <silent>    <Leader>ff      :FZF<CR>

" vista
nnoremap    <silent>    <Leader>v       :Vista!!<CR>

" vim-rainbow
let g:rainbow_active = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%l %p%%'

let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }

" git blamer
"let g:blamer_enabled = 0

" Ultisnips
"let g:UltisnipsExpandTrigger="<c-s>"
"let g:UltisnipsJumpForwardTrigger="<c-b>"
"let g:UltisnipsJumpBackwardTrigger="<c-z>"

" Scratch buffer
function! OpenScratchBuffer()
    split
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    file scratch
endfunction

" cpp man
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

source ~/.config/nvim/coc.vim
