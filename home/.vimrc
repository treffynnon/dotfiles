" A status bar that shows nice information
set laststatus=2
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

" Searching
set ignorecase
set smartcase

" Auto complete menu
set cot+=menuone
  " Turn on auto complete
setlocal omnifunc=syntaxcomplete#Complete

  " Map NERD tree toggle to F2
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
colorscheme lucius
  " Set indentation settings
set shiftwidth=4 softtabstop=4 tabstop=4
set expandtab
set number
set nobackup
set background=dark
  " Use indentation from current line when starting a new line
set autoindent cindent smartindent
  " Allow backspace over everything in insert mode
set backspace=indent,eol,start
  " Move cursor to matched string, while typing search string
set incsearch
  " Allow syntax highlighting
syntax on

"set directory=/home/simon/.vim/.vim_tempfiles
set directory^=$HOME/.vim/.vim_tempfiles//

set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.
highlight SpecialKey guifg=LightGray ctermfg=LightGray "set cinkeys=0{,0},:,0#,!^F


" To get nice CWD with ~ substitution
function! CurDir()
        let curdir = substitute(getcwd(), '/home/simon', "~/", "g")
            return curdir
        endfunction
