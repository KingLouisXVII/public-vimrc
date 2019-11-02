"             $$\                                                                     
"             \__|                                  
"  $$\    $$\ $$\ $$$$$$\$$$$\   $$$$$$\   $$$$$$$\ 
"  \$$\  $$  |$$ |$$  _$$  _$$\ $$  __$$\ $$  _____|
"   \$$\$$  / $$ |$$ / $$ / $$ |$$ |  \__|$$ /      
"    \$$$  /  $$ |$$ | $$ | $$ |$$ |      $$ |      
"  $$\\$  /   $$ |$$ | $$ | $$ |$$ |      \$$$$$$$\ 
"  \__|\_/    \__|\__| \__| \__|\__|       \_______| by Daniel Jakobian
"  
set nocompatible " be iMproved, required
filetype off " required 
set number " show line numbers
set cursorline " highlight line cursor is on
set noswapfile " disable swapfile
set encoding=UTF-8 " set encoding
set clipboard=unnamed " use system clipboard
set backspace=indent,eol,start " allow backspacing over autoindent, line breaks, the start of insert 
set hlsearch " highlight search
set incsearch " incremental search
set ignorecase " ignore case when searching 
set smartcase " if capitalized letter then case sensitive search, otherwise not
set modifiable " allow modifications to buffer
set autoindent " copies the indentation from the previous line, when starting a new line
" set mouse=n " mouse support in normal mode
"                             __                    __      
"                            /\ \__                /\ \__   
"    ___     ___         ____\ \ ,_\    __     _ __\ \ ,_\  
"   / __`\ /' _ `\      /',__\\ \ \/  /'__`\  /\`'__\ \ \/  
"  /\ \L\ \/\ \/\ \    /\__, `\\ \ \_/\ \L\.\_\ \ \/ \ \ \_ 
"  \ \____/\ \_\ \_\   \/\____/ \ \__\ \__/.\_\\ \_\  \ \__\
"   \/___/  \/_/\/_/    \/___/   \/__/\/__/\/_/ \/_/   \/__/

" OPEN NERDTREE + STARTIFY ON VIM START, IF FILE WAS OPENED WITH VIM NO STARTIFY
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | Startify | NERDTree | wincmd w | endif
" CLOSE VIM IF NERDTREE IS LAST OPEN WINDOW
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autoclose preview window for youcompleteme
autocmd CompleteDone * pclose
"    ___ ___      __     _____   _____ /\_\    ___      __     ____  
"  /' __` __`\  /'__`\  /\ '__`\/\ '__`\/\ \ /' _ `\  /'_ `\  /',__\ 
"  /\ \/\ \/\ \/\ \L\.\_\ \ \L\ \ \ \L\ \ \ \/\ \/\ \/\ \L\ \/\__, `\
"  \ \_\ \_\ \_\ \__/.\_\\ \ ,__/\ \ ,__/\ \_\ \_\ \_\ \____ \/\____/
"   \/_/\/_/\/_/\/__/\/_/ \ \ \/  \ \ \/  \/_/\/_/\/_/\/___L\ \/___/ 
"                          \ \_\   \ \_\                /\____/      
"                           \/_/    \/_/                \_/__/

let mapleader = "-"
noremap <silent> <leader>n :NERDTreeToggle<CR>
noremap <silent> <leader>f :NERDTreeFind<CR>
noremap <silent> <leader>g :Goyo<CR>
noremap <silent> <leader><leader> :Startify<CR>
noremap <silent> <leader>gg :GitGutterToggle<cr>

" indent buffer
nnoremap <leader>i maHmbgg=G`bzt`a

" WINDOW MANAGEMENT
" jump between windows
noremap <silent> <C-w> :wincmd w<CR>
" quit window
noremap <silent> <leader>q :wincmd q<CR>
" resize windows
nnoremap <silent> <ESC>OA <C-w>+
nnoremap <silent> <ESC>OB <C-w>-
nnoremap <silent> <ESC>OC <C-w>>
nnoremap <silent> <ESC>OD <C-w><

" enable arrow keys in insert mode
inoremap <ESC>oA <ESC>ki
inoremap <ESC>oB <ESC>ji
inoremap <ESC>oC <ESC>li
inoremap <ESC>oD <ESC>hi

" move to beginning of line
nnoremap <leader>h 0
nnoremap <leader>l $
" jump 5 lines
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l

" move line down
noremap <silent> <leader>j :m +1<cr>
" move line up
noremap <silent> <leader>k :m -2<cr>

" jump linewise with line-wrapping on
noremap j gj
noremap k gk

" join lines
noremap <leader>J J

" select word with visual mode
noremap <space> viw
" splits
noremap <silent> <leader>v :vnew<CR>
noremap <silent> <leader>s :new<CR>

" create new tab with no name
noremap <Leader>tt :tabedit<CR>

" remove search highlights on esc press
noremap <silent> <esc> :noh<cr>

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" fzf
noremap <leader>c :FZF<CR> " search current directory
noremap <leader>r :FZF ~<CR> " search root directory
noremap <leader>p :FZF ~/Sites/Privat<CR> " search Privat directory
"         ___                                          
"        /\_ \                    __                   
"   _____\//\ \    __  __     __ /\_\    ___     ____  
"  /\ '__`\\ \ \  /\ \/\ \  /'_ `\/\ \ /' _ `\  /',__\ 
"  \ \ \L\ \\_\ \_\ \ \_\ \/\ \L\ \ \ \/\ \/\ \/\__, `\
"   \ \ ,__//\____\\ \____/\ \____ \ \_\ \_\ \_\/\____/
"    \ \ \/ \/____/ \/___/  \/___L\ \/_/\/_/\/_/\/___/ 
"     \ \_\                   /\____/                  
"      \/_/                   \_/__/   

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDTree File System Explorer
Plugin 'scrooloose/nerdtree'

" visual cues for git changes
Plugin 'Xuyuanp/nerdtree-git-plugin'

" code completion
Plugin 'valloric/youcompleteme'

" css colors as background 
Plugin 'ap/vim-css-color'

" citylights theme
Plugin 'agreco/vim-citylights'

" devicons
Plugin 'ryanoasis/vim-devicons'

" autoclose html tags
Plugin 'alvan/vim-closetag'

" autoclose brackets etc.
Plugin 'raimondi/delimitmate'

" twig syntax highlighting
Plugin 'evidens/vim-twig'

" statusline on bottom
Plugin 'vim-airline/vim-airline'

" center text in window
Plugin 'junegunn/goyo.vim'

" start screen for vim
Plugin 'mhinz/vim-startify'

" shows git difference on side
Plugin 'airblade/vim-gitgutter'

" javascript syntax highlighting and indentation
Plugin 'pangloss/vim-javascript'

" react and jsx syntax
Plugin 'maxmellon/vim-jsx-pretty'

" json plugin
Plugin 'elzr/vim-json'

" dockerfile plugin
Plugin 'ekalinin/dockerfile.vim'

" solidity plugin
Plugin 'tomlion/vim-solidity'

" nginx plugin
Plugin 'chr4/nginx.vim'

" operate on text objects
Plugin 'wellle/targets.vim'

" support for .todo files
Plugin 'irrationalistic/vim-tasks'

" comment stuff out
Plugin 'tpope/vim-commentary'

" change surrounding quotes,brackets,parentheses
Plugin 'tpope/vim-surround'

" typescript syntax
Plugin 'leafgarland/typescript-vim'

" fuzzy finder for files
Plugin 'junegunn/fzf.vim'

" autoinsert html tags
Plugin 'mattn/emmet-vim'

" visual indentation
Plugin 'yggdroot/indentline'

" linter
Plugin 'w0rp/ale'

" swap window positions
Plugin 'wesq3/vim-windowswap'

call vundle#end()            " required
"         ___                                                              ___                 
"        /\_ \                    __                                     /'___\ __             
"   _____\//\ \    __  __     __ /\_\    ___         ___    ___     ___ /\ \__//\_\     __     
"  /\ '__`\\ \ \  /\ \/\ \  /'_ `\/\ \ /' _ `\      /'___\ / __`\ /' _ `\ \ ,__\/\ \  /'_ `\   
"  \ \ \L\ \\_\ \_\ \ \_\ \/\ \L\ \ \ \/\ \/\ \    /\ \__//\ \L\ \/\ \/\ \ \ \_/\ \ \/\ \L\ \  
"   \ \ ,__//\____\\ \____/\ \____ \ \_\ \_\ \_\   \ \____\ \____/\ \_\ \_\ \_\  \ \_\ \____ \ 
"    \ \ \/ \/____/ \/___/  \/___L\ \/_/\/_/\/_/    \/____/\/___/  \/_/\/_/\/_/   \/_/\/___L\ \
"     \ \_\                   /\____/                                                   /\____/
"      \/_/                   \_/__/                                                    \_/__/

" NERDTREE CONFIG
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden = 1

" STARTIFY CONFIG
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'z': '~/.zshrc'}, {'t': '~/Documents/todo.todo'} ]

" GOYO CONFIG
let g:goyo_height = '100%'
let g:goyo_width = '110'

" YOUCOMPLETEME CONFIG
let g:ycm_key_list_stop_completion = ['<CR>', '<ESC>']

" DELIMITMATE CONFIG
let delimitMate_matchpairs = "(:),[:],{:}"

" EMMET AUTOINSERT TAGS CONFIG
let g:user_emmet_leader_key='<leader>,'

" VIM CLOSE-TAG OPTIONS
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
            \ 'typescript.tsx': 'jsxRegion,tsxRegion',
            \ 'javascript.jsx': 'jsxRegion',
            \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" linter config
let b:ale_linters = ['eslint']
let g:airline#extensions#ale#enabled = 1
"                          ___                 
"                        /'___\ __             
"    ___    ___     ___ /\ \__//\_\     __     
"   /'___\ / __`\ /' _ `\ \ ,__\/\ \  /'_ `\   
"  /\ \__//\ \L\ \/\ \/\ \ \ \_/\ \ \/\ \L\ \  
"  \ \____\ \____/\ \_\ \_\ \_\  \ \_\ \____ \ 
"   \/____/\/___/  \/_/\/_/\/_/   \/_/\/___L\ \
"                                       /\____/
"                                       \_/__/
"
filetype plugin indent on " recognize filetype, load ftplugin.vim, load indent.vim 
syntax on " syntax highlighting on

set tabstop=2 " show existing tab with 4 spaces width
set shiftwidth=2 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces

" set filetypes
autocmd BufRead,BufNewFile *.html.twig set filetype=html
autocmd BufRead,BufNewFile *.sol set filetype=solidity

" set styles & colors
set termguicolors
set background=dark
colorscheme citylights
hi Search guibg=peru guifg=wheat
