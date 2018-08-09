" Vim-Plug
call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
"Plug 'vim-syntastic/syntastic'
"Plug 'joonty/vdebug'
"Plug 'joonty/vim-phpqa'
"Plug 'joonty/vim-sauce'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'joonty/vim-taggatron'
"Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'Shougo/denite.nvim'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'edkolev/tmuxline.vim'
Plug 'mileszs/ack.vim'
"Plug 'swekaj/php-foldexpr.vim'
Plug 'rizzatti/dash.vim'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Ack use Silver Searcher instead
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" PHP Folding
"let b:phpfold_use=0
"let b:phpfold_docblocks=0
"let b:phpfold_text_right_lines=1

" Configure netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25

" Ensure tmux window names get updated when buffer changes
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window 'nvim | " . expand("%:t") . "'")
autocmd VimLeave * call system("tmux setw automatic-rename")

" Ignore CamelCase words when spell checking
fun! IgnoreCamelCaseSpell()
  syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
  syn cluster Spell add=CamelCase
endfun
autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

scriptencoding utf8
set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swap
set undofile
set undodir=~/.local/share/nvim/undo
set hidden " hide buffers, don't close them
set nowrap " don't wrap lines
set tabstop=4 " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" set autoindent " always set autoindenting on
" set copyindent " copy the previous indentation on autoindenting
set number " always show line numbers
set shiftwidth=4 " number of spaces to use for autoindenting
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab " insert spaces instead of tabs
set showmatch " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set history=10000 " remember 10000 comamnds and search history
set undolevels=1000 " a bunch of levels of undo
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set nolist
"set foldlevelstart=2 " start with 2 levels of folding open on new buffers
set clipboard=unnamed

" Ignore the following globs in file completions
set wildignore+=*.o,*.obj,*.pyc,*.so,*.swp,*.zip,*.jpg,*.gif,*.png,*.pdf
set wildignore+=.git,.hg,.svn,DS_STORE,bower_components,node_modules

colorscheme wombat256
let g:airline_theme='wombat'

" Map leader (the dedicated user-mapping prefix key) to comma
"let mapleader = ","
"let maplocalleader = ","

" Move between splits with CTRL+[hjkl]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open a file (relative to the current file)
" See: http://vimcasts.org/episodes/the-edit-command/
" Synonyms: {e: edit, where: {w: window, s: split, v: vertical split, t: tab}}
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Quickly edit/reload the vimrc file
nmap <silent> <leader>evim :e $MYVIMRC<CR>
nmap <silent> <leader>svim :so $MYVIMRC<CR>

" Quickly clear search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" Quickly get sudo to overwrite a file
cmap w!! w !sudo tee % >/dev/null

" Quickly change to next and previous buffers (complimenting <C-6>)
nmap <leader>n :bn<CR>
nmap <leader>p :bp<CR>

" Quickly get to CtrlP shortcuts
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>

" Work Log Shortcut
nmap <leader>wl :e ~/Dropbox/Notational\ Data/Work\ Log.md<CR>

