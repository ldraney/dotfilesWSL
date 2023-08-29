call plug#begin()
" relative and absolute line numbers
"Plug 'sitiom/nvim-numbertoggle'

"format json files
Plug 'XadillaX/json-formatter.vim'
"must also run:
"npm install -g jjson
"usage:
":JSONFormatter"

Plug 'github/copilot.vim'
"must also run:
":Copilot setup
"# Go to my Microsoft Edge bookmark named "Copilot Login"
":Copilot enable

"format terraform file with a :TerraformFmt ex command
"Also include TerraformSyntax highlighting
Plug 'hashivim/vim-terraform'

"bash script syntax highlighting
"Plug 'godlygeek/tabular'
"Plug 'arzg/vim-sh'

" Telescope stuff
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'ThePrimeagen/harpoon'
"Start using vim with googgle docs :)))
"Plug 'aadv1k/gdoc.vim', {'do': './install.py'}

"LSP stuff
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neovim/nvim-lspconfig'

" AUTOCOMPLETE STUFF?
"Plug 'hrsh7th/nvim-cmp'
"Plug 'williamboman/nvim-lsp-installer'
"Plug 'tami5/lspsaga.nvim'
"Plug 'simrat39/symbols-outline.nvim'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'saadparwaiz1/cmp_luasnip'
"Plug 'L3MON4D3/LuaSnip'
"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
"Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
"Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
"
"Debugger
"Plug 'puremourning/vimspector'

" AESTHETICS
Plug 'gruvbox-community/gruvbox'

"highlighting plugins that may be useful when I'm a senior dev
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'

" FILE FORMATTING AND VISUAL HELPS

"smooth scrolling
Plug 'psliwka/vim-smoothie'

"search blink
Plug 'ivyl/vim-bling'

Plug 'antoinemadec/FixCursorHold.nvim'
"
"Super handy.  Shows the current function or class when scrolling down
Plug 'wellle/context.vim'

"useful for aligning dictionaries or other declarations
"Plug 'junegunn/vim-easy-align'

Plug 'lukas-reineke/indent-blankline.nvim'

" Automatic numbering and bullet points for new lines
"Plug 'dkarter/bullets.vim'

" FUNCTIONALITIES
Plug 'tpope/vim-repeat'
"
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'svermeulen/vim-easyclip' "Fixes the clipboard functionality

"Useful vim surround Keys:
"1. cs"'  to change the outer characters of current sentence
"2. ds" to delete outer characters entirely
"3. ysiw" to "surround current" word with "
"4. yssb or yss( to wrap entire line with parenthesis
"5. S" in visual mode will surround with quotes
Plug 'tpope/vim-surround'

"shows an outline of imports, functions, and classes by scope
Plug 'majutsushi/tagbar'

"  git assistant
Plug 'tpope/vim-fugitive'

"Plug 'ryanoasis/vim-devicons'
"Plug 'kyazdani42/nvim-web-devicons'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" source all files in the nvim/config directory
"for filename in split(globpath($HOME . '/.config/nvim/config', '*.vim'), '\n')
"    execute 'source' filename
"endfor

for file in split(glob('$HOME/.config/nvim/config/*.vim'), "\n")
    execute 'source' file
endfor


