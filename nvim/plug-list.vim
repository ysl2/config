call plug#begin('~/.vim/plug')

" Theme
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Tpope is so powerful
" ======================
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
" =======================

Plug 'preservim/nerdcommenter'

Plug 'mg979/scroll.vim'
Plug 'mg979/vim-visual-multi'

" Code change tree
Plug 'mbbill/undotree'

" Auto toggle fcitx
Plug 'lilydjwg/fcitx.vim'
" , {'branch': 'fcitx5'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim tartup screen
Plug 'mhinz/vim-startify'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Auto to format
Plug 'Chiel92/vim-autoformat'

" 
Plug 'junegunn/vim-easy-align'

"
Plug 'jwarby/antovim'

" Git
" Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
"
" Rainbow bracket
Plug 'luochen1990/rainbow'

" Remember last edit
Plug 'farmergreg/vim-lastplace'

" Chinese vimdoc
Plug 'yianwillis/vimcdoc'

" EasyMOtion
Plug 'Lokaltog/vim-easymotion'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

"
Plug 'honza/vim-snippets'

Plug 'jiangmiao/auto-pairs'

" Cpp
Plug 'octol/vim-cpp-enhanced-highlight'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'html', 'javascript', 'css','less', 'stylus'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'html', 'javascript', 'css', 'less', 'stylus'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'html', 'javascript', 'css', 'less', 'stylus'] }
Plug 'jaxbot/browserlink.vim'
Plug 'stephpy/vim-yaml', { 'for' :['yaml','vim-plug'] }
Plug 'leafgarland/typescript-vim', { 'for': ['vim-plug', 'typescript'] }
Plug 'posva/vim-vue', { 'for' :['vue','vim-plug'] }

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Rust
Plug 'rust-lang/rust.vim' , { 'for': ['rust', 'vim-plug']}

" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'
Plug 'cjrh/vim-conda', { 'for' :['python', 'vim-plug'] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for' :['markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

call plug#end()
