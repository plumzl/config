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
set clipboard=unnamedplus   " Works only for vim 7.3 and higher
set wildmenu                " Command line completion

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap and backups
set directory=~/.vim/swap	" Set swp file dir.
set backupdir=~/.vim/backup	" Set backup dir.

" Mouse support
set mouse=a
behave xterm

" Indentation
set tabstop=4				" Set tab width to be 4 spaces.
set shiftwidth=4
set autoindent
set expandtab

" Persistant undo between sessions (7.3 only)
if has("undofile")
	set undofile
	set undodir=/tmp/vimundos
endif

" Search options
set ignorecase				" Ignore case on searches.
set smartcase				" Do case sensitive searches when search string contains capitals.
set incsearch				" Search while typing
set hlsearch				" Highlight search matches

" Set right margin to 80
set textwidth=79			" Unlimited line length by default.
if exists('+colorcolumn')
    set colorcolumn=80
    hi ColorColumn ctermbg=DarkGrey guibg=DarkGrey
else
    au BufEnter * highlight OverLength ctermbg=235 guibg=DarkGrey
    au BufEnter * match OverLength /\%80v.*/
endif

" Folding
set foldmethod=indent       " automatically fold by indent level
set nofoldenable            " but have folds open by default

" Source the .vimrc immediately after you save it.
autocmd! bufwritepost .vimrc source %

" Get the file under the cursor in a split
map gf :sp <cfile><CR>

" Set <leader> to ',' (comma).
let mapleader=';'

" Spell check
if has("spell")
    set spelllang=en_us
    nnoremap <leader>s :set spell!<CR>
endif

"Ctrl-l to redraw the screen
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Highlight trailing spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Delete all trailing whitespace
nnoremap <leader>ds :%s/\s\+$//g<CR>

" Easier way to increase / decrease the size of splits
map + 5<C-W>+
map - 5<C-W>-

" Maximize current window vertically or horizontally
set wmh=0 " Set minimum split size
set wmw=0 " Set minimum vsplit size
map <leader>z <C-W>\|<C-W>_

" Navigate vim window splits for gnome-terminal
nnoremap <silent> <Esc>k :wincmd k<CR>
nnoremap <silent> <Esc>j :wincmd j<CR>
nnoremap <silent> <Esc>h :wincmd h<CR>
nnoremap <silent> <Esc>l :wincmd l<CR>

" Forgot to sudo before editing a file?
cmap w!! w !sudo tee >/dev/null %

" Fix vim splits resize bug
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Vim tabs
map <LEADER>t <Esc>:tabnew
nmap tp :tabprevious<CR>
nmap tn :tabnext<CR>


" ctags
set tags=./tags;/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

" pathogen
" Runtime path management.
call pathogen#infect()

" tagbar
" Scoped tags with exuberant ctags.
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_sort = "Order"

"NERDTree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
" Close vim if only a NERDTree is left
autocmd bufenter * if (winnr("$") == 1 &&
        \ exists("b:NERDTreeType") &&
        \ b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\~$', '\.pyc$']

" Supertab
inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
inoremap <expr> k pumvisible() ? "\<C-p>" : "k"
inoremap <expr> h pumvisible() ? "\<PageUp>\<C-n>\<C-p>" : "h"
inoremap <expr> l pumvisible() ? "\<PageDown>\<C-n>\<C-p>" : "l"

" Gitgutter
nnoremap <silent> <F5> :GitGutterToggle<CR>
set updatetime=750

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
set t_Co=16							" Force 16 color terminal.
"let g:solarized_termcolors=256     " Useful when use terminals not configurated with solarized color
set background=dark
colo solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype setting
filetype plugin indent on
" Set file types.
au BufNewFile,BufRead *.js,*.jsx,*.javascript,*.es	set filetype=javascript
au BufNewFile,BufRead *.module set filetype=tcl
au BufNewFile,BufRead *.scala set filetype=scala
au BufNewFile,BufRead *.jinja set filetype=jinja

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

