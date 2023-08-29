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
for filename in split(globpath($HOME . '/.config/nvim/config', '*.vim'), '\n')
    execute 'source' filename
endfor


" REMAPS
nnoremap <leader>gf :Telescope git_files<cr>

"Harpoon
nnoremap <leader>pf :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>pf :lua require("harpoon.ui").toggle_quick_menu()
nnoremap <leader>pf :lua require("harpoon.ui").toggle_quick_menu()

"set timeout timeoutlen=1000 ttimeoutlen=100
"inoremap <C-c> <Esc>:w<CR>
"

"netrw to automatically change working directory
au FileType netrw nmap <buffer> <leader>% mt:!tmux split-window -h;tmux select-layout even-horizontal<CR>
au FileType netrw nmap <buffer> <leader>z mt:!tmux split-window -h; tmux select-pane -L; tmux kill-pane; tmux select-layout even-horizontal<CR>
"open current NETRW directory in a new tab
nnoremap <leader>z mt:!tmux split-window -h; tmux select-pane -L; tmux kill-pane; tmux select-layout even-horizontal<CR>
"open current NETRW directory in a new tab
nnoremap <leader>% mt:!tmux split-window -h;tmux select-layout even-horizontal<CR>

function! OpenInTmuxPane()
    " Get the current directory from the netrw buffer
    let l:current_dir = b:netrw_curdir

    " Get the name of the file under the cursor
    let l:filename = expand('<cfile>')

    " Combine the directory and filename to get the full path
    let l:filepath = l:current_dir . '/' . l:filename

    " Prepare the tmux command
    let l:tmux_command = "tmux split-window -h 'nvim " . l:filepath . "'"

    " Call the command
    call system(l:tmux_command)
endfunction

nnoremap <leader>4 :call OpenInTmuxPane()<CR>

"netrw copy a file
au FileType netrw nmap <buffer> <leader>yp mt:!cp -r <C-R><C-F> ./<C-R><C-F>
"netrw delete under cursor
au FileType netrw nmap <buffer> <leader>x mt:!rm -rf <C-R><C-F><CR><CR>
"netrw mkdir command
au FileType netrw nmap <buffer> <leader>mkdir mt:!mkdir -p 

"let ctrlp search for hidden files and directories
let g:ctrlp_show_hidden = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
"let g:vim_json_syntax_conceal = 0
"let g:vim_markdown_conceal = 0
"let g:vim_markdown_conceal_code_blocks = 0

" TagBar
let g:tagbar_width = 40

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'gray'
nmap <Leader>l :Limelight!!<CR>
xmap <Leader>l :Limelight!!<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Startify
"let g:startify_fortune_use_unicode = 1

"" Startify + NERDTree on start when no file is specified
"let &tags = expand("%:p")

"COC VIM START

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  "" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw =1

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

"scroll sync lock
nnoremap <leader><leader>sl :set scb!<CR>

nmap <silent> <leader>no :set hlsearch!<CR>

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
