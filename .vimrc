" WipeReg with :WipeReg
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Map EXC KEY to  jj to exit input mode
inoremap jj <ESC>

" vim leader key is changed from "\" key to space key
let mapleader=" "
set mouse=a
set ttymouse=

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"#####################################
"  https://www.youtube.com/watch?v=IVAaGzclIdc
"#####################################

set runtimepath^=~/.vim/color/badwolf-master
colorscheme badwolf

"####################################
"## end video 40
"########Spell Section ###########

" Check <F6> file in Spell check
    map <F6> :setlocal spell! spelllang=en_us<CR>

    map <F7> :set spelllang=es<CR>
"# Type z= to bring up word suggestrions
"#### End Spell #################

" ##########vim-plug section: ####

call plug#begin('~/.vim/plugged')
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'vim-airline/vim-airline-themes'
" Automatically show Vim's complete nenu while typing
Plug 'vim-scripts/AutoComplPop'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'scrooloose/nerdtree'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'will133/vim-dirdiff'
call plug#end()

" Set airline theme
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Show hidden files in NERDTree
	let NERDTreeShowHidden=1

" START NERDTree if no files are specified
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call plug#begin('~/.vim/plugged')
Plug 'francoiscabrol/ranger.vim'
Plug 'junegknn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'vim-airline/vim-airline-themes'
" Automatically show Vim's complete nenu while typing
Plug 'vim-scripts/AutoComplPop'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'scrooloose/nerdtree'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Run a diff on 2 directories
Plug 'will133/vim-dirdiff'
call plug#end()

" Set airline theme
"let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Show hidden files in NERDTree
	let NERDTreeShowHidden=1

" START NERDTree if no files are specified
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree if it's the only window left open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" https://github.com/nathanaelkane/vim-indent-guides/issues/20
	let g:indent_guides_exclude_filetypes = ['nerdtree']
" END NERDTree

" Highlight characters over 80
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
"  autocmd BufEnter * match OverLength /\%81v.*/
"augroup END

" Make Vim able to edit crontab files again.
	set backupskip=/tmp/*,/private/tmp/*
	set backup                        " enable backups
	set noswapfile                    " it's 2015, Vim.
	set undodir=~/.vim/tmp/undo//     " undo files
	set backupdir=~/.vim/tmp/backup// " backups
	set directory=~/.vim/tmp/swap//   " swap files

 " Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Some basics
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8

" Resize splits
	map + <c-w>-
	map - <c-w>+
	map > <c-w><
	map < <c-w>>

""""""""""""""""""""""""""""""
" > Status line
""""""""""""""""""""""""""""""
" Always show the status line
"set laststatus=1

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set shortmess+=c
set complete+=kspell
set completeopt=menuone,longest
set t_Co=256
set modelines=1
set showmode
set history=700
set undofile
set undoreload=10000
set matchtime=3
set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1
set autowrite
set autoread
set shiftround
set title
set linebreak
set wildmenu        " Show multiple maches on one line
set path+=**        " Search all subdirectorys and recusively

set colorcolumn=+1
" A buffer becomes hidden when it is abandoned
set hid

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets 256 color mode if the terminal supports it
	set t_Co=256
    set background=dark

" Enable syntax highlighting
	syntax enable

" Don't redraw while executing macros (good performance config)
" For regular expressions turn magic on
	set magic

" Show matching brackets when text indicator is over them
	set showmatch

" Set auto indent
	set ai
    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8

"Use Unix as the standard dile type
    set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""F
" => Text, Paste tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
    set expandtab

" Copy and paste in vim: For copying and pasting selection
"    vnoremap <C-c> "+y
"   map  <C-v> "+P
"    vnoremap <C-c> "*y :let @+=@*<CR>

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

"set number                     " :show current line number
"set relativenumber             " Show relative line numbers


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
	cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
	set laststatus=1

" Format the status line
	set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Ignore case when searching
	set ignorecase

" When searching try to be smart about cases
	set smartcase

" Highlight search results
	set hlsearch

" Use Unix as the standard file type
	set ffs=unix,dos,mac

"## Enable Autocomplete
	set wildmode=longest,list,full
    " https://askubuntu.com/questions/42663/how-to-make-cursor-change-from-thin-line-to-block-based-on-normal-or-insert-mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' |
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" Disables automatic commenting on new line
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Makes search act like search in modern browsers
	set incsearch

" For regular expressions turn magic on
	set magic

" No annoying sound on errors
	set noerrorbells
	set novisualbell
	set t_vb=

" Splits open at the bottem and right
	set splitbelow splitright

" Automatically delete all trailing whitespaces on save

autocmd BufWritePre * %s/\s\+$//e
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Ranger in Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Resize splits
	map + <C-w>-
	map - <C-w>+
	map > <C-w><
	map < <C-w>>

" Close the current buffer
    map <leader>bd :Bclose<cr>

" Close all the buffers
    map <leader>ba :1.1000 bd!<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
    map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Open NERDTree with <F2>
map <F2> :NERDTreeToggle<CR>

" Spell-check set  to F6.
    map <F6> :setlocal spell! spelllang=en_us<CR>

" Shortcutting split navigation, saving a keypress:

 	map <C-h> <C-w>h
 	map <C-j> <C-w>j
 	map <C-k> <C-w>k
 	map <C-l> <C-w>l

"Useful for managing tabs
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove<cr>

" Switch CWD to the directory of the open buffer
    imap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
    set viminfo^=%

" Vim split options
" Remaps ctrl w + $key to ctrl $key
" ctrl j = move right
    nnoremap <C-J> <C-W><C-J>
" ctrl k = move up
    nnoremap <C-K> <C-W><C-K>
" ctp:l l = move down

    nnoremap <C-L> <C-W><C-L>
" ctrl h = move left
    nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"######## inserted by sms #######
"#################################

" toggle on and off the Relative numbers
	nmap <leader><F3> :set rnu! <CR>

" Map <leader>F3 to toggle on and off the Line numbers
 	map <F3> :set nu! <CR>
"
"Insert Header in .sh files
"    au bufnewfile *.sh 0r /home/sms/.vim/sh_header.sh
