" Set colours
colorscheme lucius
set background=dark

" Configure base settings
set encoding=utf-8
set spelllang=en_gb
set cursorline " Highlight the current line
set nocompatible " Remove vi compatibility
set modelines=0 " Remove modelines for security
"set visualbell " Disable sounds and flash screen instead
set scrolloff=5 " Allow 5 lines of context either side of the cursor
set showcmd " Show the current commands in the status bar
set showmode " Show the current editor mode the in status bar
set hidden " Allow switching between buffers even if the current buffer is modified otherwise you would need to :w first
set wildmenu " When pressing tab command-line completion operates in an enhanced menu like mode
set wildmode=list:longest " When more than one match, list all matches and complete till longest common string
set backspace=indent,eol,start " Allow backspace over everything in insert mode
" Set the mapleader key to comma
let mapleader=","

" Line settings
set number relativenumber " Show relative line numbers
set textwidth=79 " Maximum width of text that is being inserted
set colorcolumn=85 " Show coloured line at character column 85
set formatoptions=qrn1 " Set how autoformat works

" Persistent undo and temporary directories
set undofile
set undodir=$HOME/.vim/.vim_tempfiles//
set directory=$HOME/.vim/.vim_tempfiles//
set backupdir=$HOME/.vim/.vim_tempfiles//

" A status bar that shows nice information
set laststatus=2
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

" Set indentation settings
set shiftwidth=4 softtabstop=4 tabstop=4
set expandtab

" Use indentation from current line when starting a new line
set autoindent cindent smartindent

" Searching
set gdefault " Applies substitutions globally on lines automatically
" Auto add \v to regex to use PCRE style regex
nnoremap / /\v
vnoremap / /\v
set ignorecase " Ignore case for searches
set smartcase " Only go case sensitive when one or more uppercase characters are searched for
set incsearch " Move cursor to matched string, while typing search string
set showmatch " Jump to matching bracket briefly to indicate closing one
set hlsearch " Highlight search results
" Map to remove highlight after your down searching
nnoremap <leader><space> :noh<cr>

" Moving around bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Auto complete menu
set cot+=menuone
" Turn on auto complete
setlocal omnifunc=syntaxcomplete#Complete

" Toggle NERDTree file tree viewer
map <F2> :NERDTreeToggle<CR>
" Toggle spell checking
map <F10> :set spell!<CR>

" Change movement key mappings
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Split screen and move to the new split
nnoremap <leader>w <C-w>v<C-w>l

" Auto save when the focus is lost
au FocusLost * :wa

" Indicate indentation (tabs or spaces)
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.
highlight SpecialKey guifg=LightGray ctermfg=LightGray "set cinkeys=0{,0},:,0#,!^F

" To get nice CWD with ~ substitution
function! CurDir()
        let curdir = substitute(getcwd(), '/home/simon', "~/", "g")
            return curdir
        endfunction

" Setup pathogen managed plugins use :Helptext to generate docs
call pathogen#infect()
" Open a NERDTree if no files were specified when vim was started
autocmd vimenter * if !argc() | NERDTree | endif
" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h
