
" PLUG ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

Plug 'rafi/awesome-vim-colorschemes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'luochen1990/rainbow'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'

call plug#end()

" }}}

" VUNDLE ---------------------------------------------------------------- {{{
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'jeaye/color_coded'

call vundle#end()
filetype plugin indent on
" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Leader mapping

nnoremap <SPACE> <Nop>
map <Space> <Leader>
"
" Mappings code goes here.
noremap ; :
noremap : ;

" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" COC.VIM 
inoremap <silent><expr> <C-Space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> K :call CocActionAsync('doHover')<CR>

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

nnoremap <silent> K :call ShowDocumentation()<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" Go to last active tab

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"autocmd VimEnter * NERDTree | wincmd p

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

let g:NERDTreeWinSize=20

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" More Vimscripts code goes here.
set updatetime=300
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
set clipboard=unnamedplus
colorscheme sonokai
" gruvbox
" purify
" sonokai
" solarized8
" spacecamp
" spacecamp_lite
set nocompatible
filetype on
filetype plugin on
filetype indent on
set number
set ruler
set autoindent
set ignorecase
set noexpandtab
set tabstop=4
set shiftwidth=4
set wrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=3
set sidescrolloff=5
set laststatus=2
set wildmenu
set foldcolumn=1
set background=dark
set showmode
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set noerrorbells
set mouse=a
set title
set foldnestmax=5
set history=500
set backspace=eol,start,indent


" }}}

" ALE CONFIG ------------------------------------------------------------- {{{
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 0

let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'python': ['black', 'isort'],
\   'rust': ['rustfmt'],
\}

let g:ale_linters = {
\   'c': ['clangd'],
\   'cpp': ['clangd'],
\   'python': ['flake8', 'mypy'],
\   'rust': ['analyzer'],
\}

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_virtualtext_cursor = 1

let g:ale_cpp_clangformat_options = '-style=\{BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 0\}'
let g:ale_python_flake8_options = '--max-line-length=80'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_autopep8_options = '--indent-size=4'
let g:ale_rust_analyzer_executable = 'rust-analyzer'

nnoremap <leader>at :ALEToggle<CR>
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>al :ALELint<CR>

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
