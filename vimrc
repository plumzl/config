" General settings
syn on						" Syntax highlighting on. 
set nocompatible			" Don't make vim behave like vi.
set ruler                   " Show row/column position.
set ai						" Auto-indent."
set showmode				" Show INSERT, VISUAL, etc. XXX: i want to use different color for it.
set bs=indent,start,eol		" Allow backspacing over everything in insert mode (except n & t).
set shortmess=lnrxIT		" Get rid of splash screens.
set pastetoggle=<F3>		" Allow F3 to toggle paste mode.
set laststatus=2            " Use an extra screen line to keep windows looking good

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap and backups
set directory=~/.vim/swap	" Set swp file dir.
set backupdir=~/.vim/backup	" Set backup dir.

" Mouse support
set mouse=nv
behave xterm

" Indentation
set tabstop=4				" Set tab width to be 4 spaces.
set shiftwidth=4 
set autoindent
set expandtab

" Search options
set ignorecase				" Ignore case on searches.
set smartcase				" Do case sensitive searches when search string contains capitals.
set incsearch				" Search while typing
set hlsearch				" Highlight search matches

" Source the .vimrc immediately after you save it.
autocmd! bufwritepost .vimrc source %

" Set right margin to 79 
set textwidth=79			" Unlimited line length by default.
au BufEnter * highlight OverLength ctermbg=235 guibg=DarkGrey
au BufEnter * match OverLength /\%80v.*/

" Folding
set foldmethod=indent       " automatically fold by indent level
set nofoldenable            " but have folds open by default

" Get the file under the cursor in a split
map gf :sp <cfile><CR>

" Set <leader> to ',' (comma).
let mapleader=','

" Spell check
if has("spell")
    set spelllang=en_nz
    nnoremap <leader>s :set spell!<CR>
endif

"Ctrl-l to redraw the screen
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Easier way to increase / decrease the size of splits
map + 5<C-W>+
map - 5<C-W>-

" Forgot to sudo before editing a file?
cmap w!! w !sudo tee >/dev/null %

" Filetype setting
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
set t_Co=256							" Force 256 color terminal. 
" BREAKS COMPLETELY ON VERSIONS OLDER THAN 7.0. Luckily I don't need to work on
" any of those machines.
try
    colo mustang 
catch
    " Not sure whether I like this or not.
    let xterm16_colormap    = 'allblue'		" Allblue, soft, softlight, standard.
    let xterm16_brightness  = 'med'			" Low, med, high, or default (med).
    color xterm16							" This is in ~/.vim/colors/xterm16.vim.
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set file types.
au BufNewFile,BufRead *.js,*.jsx,*.javascript,*.es	set filetype=javascript
au BufNewFile,BufRead *.sco,*.orc,*.csd	set filetype=csound
au BufNewFile,BufRead *.mm set filetype=objc
" Framestore filetypes.
au BufRead,BufNewFile *.def set filetype=tcl
au BufRead,BufNewFile *.sdl,*.jdl set filetype=fcdl
au BufRead,BufNewFile *.ma set filetype=mel

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-close brackets
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap (( (
inoremap () ()
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap [ []<Left>
inoremap [<CR> [<CR>]<Esc>O
inoremap [[ [
inoremap [] [] 
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

" pathogen
" Runtime path management.
call pathogen#infect()

" tagbar
" Scoped tags with exuberant ctags.
" http://www.vim.org/scripts/script.php?script_id=3465
" http://majutsushi.github.com/tagbar/
nnoremap <silent> <F9> :TagbarToggle<CR>

"NERDTree
nnoremap <silent> <F4> :NERDTree<CR>
" Close vim if only a NERDTree is left
autocmd bufenter * if (winnr("$") == 1 &&
        \ exists("b:NERDTreeType") &&
        \ b:NERDTreeType == "primary") | q | endif


