"                                        _
"  ___  _   _ _ __ ___  _ __   __ ___  _(_)_ __   __ _
" / _ \| | | | '__/ _ \| '_ \ / _` \ \/ / | '_ \ / _` |
"| (_) | |_| | | | (_) | | | | (_| |>  <| | | | | (_| |
" \___/ \__,_|_|  \___/|_| |_|\__, /_/\_\_|_| |_|\__, |
"                             |___/              |___/
"
" Author: @ourongxing & @theniceboy

" ===============================
" ======== Editor Setup =========
" ===============================
" ===
" === System
" ===

" set clipboard=unnamedplus
" set the <leader> = backspace
let &t_ut=''
set autochdir

" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set noshowmode
set expandtab
set autoindent
set autoread
set go=
set hidden
set helplang=cn
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap "自动换行
" set linebreak "整字换行
set tw=0 
set indentexpr=
set foldmethod=manual
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set noswapfile     " no swap files
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
"set colorcolumn=80
set updatetime=100
set wildmode=list:longest
set termguicolors
let g:deoplete#enable_at_startup = 1

set tabstop=2
set shiftwidth=2
set softtabstop=2
autocmd FileType c setlocal et sta sw=4 sts=4
autocmd FileType cpp setlocal et sta sw=4 sts=4
autocmd FileType java setlocal et sta sw=4 sts=4
autocmd FileType python setlocal et sta sw=4 sts=4

" =================================
" ======== Basic Mappings =========
" =================================
"
let g:python_host_prog='~/miniconda3/envs/python27/bin/python'
let g:python3_host_prog='~/miniconda3/envs/python36/bin/python'

" markdown_preview
let g:mkdp_browser = 'vimb'

" some functions
source ~/.config/nvim/custom-utils.vim

" snippets
source ~/.config/nvim/custom-snippets.vim

" Set <LEADER> as <SPACE>
let mapleader=" "

" Open Startify
noremap <silent> <LEADER>tt :Startify<CR>

" Open the vimrc file anytime
noremap <silent> <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open up lazygit
noremap <silent> <C-g> :term lazygit<CR>i

" Remove search highlighting
noremap <silent> <LEADER><CR> :nohlsearch<CR>

" 保存和加载折叠
noremap <silent> zs :mkview<CR>
noremap <silent> zl :loadview<CR>

" 切换缓冲区
noremap <silent> <C-j> :bp<CR>
noremap <silent> <C-k> :bn<CR>
noremap <silent> <Leader>x :w<CR>:bd<CR>
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q :q<CR>
noremap <LEADER>z ZZ
noremap <LEADER>w :w<CR>

" Clipboard
noremap <LEADER>y "+y
noremap <LEADER>p "+p

" inner termidsdl esc
" tnoremap <Esc> <C-\><C-n>

noremap H ^
noremap L $

nmap U <C-r>

" noremap <LEADER><LEADER> <Esc>

" Press ` to change case (instead of ~)
" 快速切换首字母大小写
" ~的作用就是切换大小写
noremap ` b~

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap cw  <C-w>w

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap ck :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap cl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>

" Resize splits with arrow keys
noremap cdj :res +5<CR>
noremap cdk :res -5<CR>
noremap cdl :vertical resize+5<CR>
noremap cdh :vertical resize-5<CR>

" Rotate screens
noremap crh <C-w>b<C-w>K
noremap crv <C-w>b<C-w>H

" figlet
noremap tx :r !figlet

noremap <F5> :call CompileRunGcc()<CR>
noremap <silent> <leader>\ :Autoformat<CR>
let g:formatdef_my_cpp = '"astyle --style=kr"'
let g:formatdef_my_c = '"astyle --style=kr"'
let g:formatters_cpp = ['my_cpp']
let g:formatters_c = ['my_c']
autocmd Filetype markdown noremap <buffer> <silent> <leader>\ :call PanGuSpacing()<CR>

" Easy indent for code blocks
nmap <tab>      v>
nmap <s-tab>    v<
vmap <tab>      >gv
vmap <s-tab>    <gv

" =================================
" = Install Plugins with Vim-Plug =
" =================================
source ~/.config/nvim/plug-list.vim
colorscheme seoul256
" colorscheme gruvbox
let g:seoul256_background = 234
colo seoul256
set background=dark

" =================================
" ========== Plug Setup ===========
" =================================
source ~/.config/nvim/plug-setting.vim
