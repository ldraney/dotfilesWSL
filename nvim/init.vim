"use alt-/ to search within a highlighted visual field
vnoremap <M-/> <Esc>/\%V
"
"Go to last position in file
"check if ./vim/view directory exists for opening last location
"https://vi.stackexchange.com/questions/20212/how-do-i-check-whether-a-given-directory-exists
"if isdirectory("/home/ldraney/.vim/view")
"autocmd BufWinLeave * silent! mkview
"
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

"if isdirectory("~/.local/share/nvim/view")
    """""open at last location and scroll view
    """""https://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
    "autocmd BufWinLeave * silent! mkview
    "autocmd BufWinEnter * silent! loadview
"else
    "call mkdir(expand("~/.local/share/nvim/view"), "p")
    """/home/ldraney/.local/share/nvim/view/
"endif

call plug#begin()
"Start using vim with googgle docs :)))
"Plug 'aadv1k/gdoc.vim', {'do': './install.py'}

"
"Plug 'easymotion/vim-easymotion'
"
"Trying to get tmux and vim splits to split more evently 
Plug 'christoomey/vim-tmux-navigator'
"
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
Plug 'dkarter/bullets.vim'

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

"system clipboard on wsl2
if system('uname -r') =~ "microsoft"
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
endif
"set statusline=%!MyStatusLine()
"function! MyStatusLine()

set statusline+=%F

let mapleader=" "
let g:netrw_keepdir= 0
"
set formatoptions-=cro
set nopaste
"set splitright
"set tabline
set conceallevel=0
set autochdir
set ignorecase
set smartcase
set tabstop=4 softtabstop=4 shiftwidth=4
set mouse=a
set indentexpr=''
"set expandtab
"set autoindent
"set smarttab
"set incsearch ignorecase smartcase hlsearch
"set nohlsearch
"set hlsearch!
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set textwidth=0
set nohidden
set number
set title
set undodir=~/.vim/undodir  "I need to set up this directory
set undofile
set incsearch
set backspace
set autoread
set scrolloff=20
set colorcolumn=80
set clipboard=unnamed,unnamedplus
set relativenumber
""" Coloring
set splitbelow
set splitright

set nocindent
set showbreak=>>
"set nosmartindent
"set noautoindent
"set indentexpr=
"filetype indent off
"filetype plugin indent off

lua require ('init')
let g:coq_settings = { 'auto_start': v:true }

"return to previous place in buffer

""" Main Configurations
"filetype plugin indent on

"nmap M <Plug>MoveMotionEndOfLinePlug

" Functions and autocmds to run whenever changing colorschemes
function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\│
    highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that

" Main Coloring Configurations
syntax on
color gruvbox


" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors
"
"CURSOR SETTINGS
"cursor settings MUST COME AFTER set TERMGUICOLORS
"https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
"highlight Cursor guifg=yellow guibg=yellow
"highlight Cursor guifg=blue guibg=blue
"set guicursor=i:block-Cursor-blinkon1
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
"set timeout timeoutlen=1000 ttimeoutlen=100
"inoremap <C-c> <Esc>:w<CR>
"
"save with ctrl s
nnoremap <C-s> <C-c>:w<CR>
inoremap <C-c> <Esc><right>
inoremap <Esc> <Esc><right>


"netrw to automatically change working directory
au FileType netrw nmap <buffer> <leader>k mt:!tmux split-window -h;tmux select-layout even-horizontal<CR>
au FileType netrw nmap <buffer> <leader>z mt:!tmux split-window -h; tmux select-pane -L; tmux kill-pane; tmux select-layout even-horizontal<CR>
nnoremap <leader>z :!tmux split-window -h -c; tmux select-pane -L; tmux kill-pane; tmux select-layout even-horizontal<CR>
"tmux split-window -h -c "#{pane_current_path}"; tmux select-layout even-horizontal

"OVERCOMING ANNOYING LITTLE VIM THINGS
"nnoremap <CR> <CR><left>
"inoremap <CR> <CR><left>
"nnoremap o o<left>

"highlight search settings
highlight link Searchlight Incsearch
hi Search guibg=white guifg=green
"hi Search cterm=NONE ctermfg=grey ctermbg=blue
""" PLUGIN CONFIGURATIONS

"let ctrlp search for hidden files and directories
let g:ctrlp_show_hidden = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
"tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>

"delete
"I don't know what this does...
"autocmd BufWinEnter,WinEnter term://* startinsert
"autocmd BufLeave term://* stopinsert

" vim-pydocstring
let g:pydocstring_doq_path = '~/.config/nvim/env/bin/doq'

" delete
" Supertab
"let g:SuperTabDefaultCompletionType = "<C-n>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
"let g:vim_json_syntax_conceal = 0
"let g:vim_markdown_conceal = 0
"let g:vim_markdown_conceal_code_blocks = 0

" TagBar
let g:tagbar_width = 40

" fzf-vim
"let g:fzf_action = {
  "\ 'ctrl-t': 'tab split',
  "\ 'ctrl-s': 'split',
  "\ 'ctrl-v': 'vsplit' }



"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
  "\ 'bg':      ['bg', 'Normal'],
  "\ 'hl':      ['fg', 'Comment'],
  "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  "\ 'hl+':     ['fg', 'Statement'],
  "\ 'info':    ['fg', 'Type'],
  "\ 'border':  ['fg', 'Constant'],
  "\ 'prompt':  ['fg', 'Character'],
  "\ 'pointer': ['fg', 'Exception'],
  "\ 'marker':  ['fg', 'Keyword'],
  "\ 'spinner': ['fg', 'Label'],
  "\ 'header':  ['fg', 'Comment'] }

" Bat theme for syntax coloring when viewing files in fzf
"let $BAT_THEME='base16'

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use <c-space> to trigger completion.
"if has('nvim')
  ""inoremap <silent><expr> <c-space> coc#refresh()
"else
  ""inoremap <silent><expr> <c-@> coc#refresh()
"endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			      ""\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"nnoremap <leader>9 <Plug>(coc-rename)
"nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>=  <Plug>(coc-format-selected)
"nmap <leader>=  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  """ Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json,python,yaml setl formatexpr=CocAction('formatSelected')
  """ Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"let g:python3_host_prog = "/usr/bin/python3.8"
" coc.vim END

" signify
"let g:signify_sign_add = '│'
"let g:signify_sign_delete = '│'
"let g:signify_sign_change = '│'
"hi DiffDelete guifg=#ff5555 guibg=none

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

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

""" CUSTOM MAPPINGS

"open up a terminal
nmap <leader><C-t> <c-W>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <C-t> <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>

" NerdTree
"nmap <leader>q :NERDTreeToggle<CR>
"nnoremap <leader>e :NERDTreeFocus<CR>
"nnoremap <C-f> :NERDTreeFind<CR>  """open NerdTree current directory"""
"nmap \\ <leader>q
"
"CHADtree
"let &tags = expand("%:p")
"nnoremap <leader>e :CHADopen<CR>
"nnoremap <leader>3 :CHADopen --always-focus<CR>

nnoremap  <leader>e :Vexplore<CR><C-w>r
nnoremap  <leader>E :Ex<CR>

"Tagbar
"nmap <leader>w :TagbarToggle<CR>
"nmap \| <leader>w

"Source vim
nmap <leader>R :so ~/.config/nvim/init.vim<CR>


nmap <leader>t :call TrimWhitespace()<CR>
"nmap <leader>y <C-w>v<C-w>l:HackerNews best<CR>J
"nmap <leader>p <Plug>(pydocstring)

"easy align
xmap <leader>a gaip*
nmap <leader>a gaip*
"nmap <leader>s :Rg<CR>

"scroll sync lock
nnoremap <leader><leader>sl :set scb!<CR>

"quick grep search
"all system files -- not useful
"nmap <leader>d :Files<CR>
"nnoremap <silent> <Leader>h: :History:<CR>
"nnoremap <silent> <Leader>h/ :History/<CR>
""latest files -- very useful!
"nnoremap <silent> <Leader>hh :History<CR>
""find file in line
"nmap <leader>z :BLines<CR>
"nmap <leader>H :RainbowParentheses!!<CR>
"nnoremap """ :reg<CR>
"


"nmap <leader>g :Goyo<CR>
"nmap <leader>j :set filetype=journal<CR>
"nmap <leader>l :Limelight!!<CR>
"xmap <leader>l :Limelight!!<CR>
"
"I actually don't like what this does.  It makes the python indent all weird.
"Figure out what plugin would cause indent to be like this, then delete it.
"I still have an annoying indentation error when I'm typing as well.
"autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>

nmap <silent> <leader>no :set hlsearch!<CR>

"nmap <Tab> :tabn<CR>
"nmap <S-Tset -g status-left "#{pane_current_path}"ab> :tabp<CR>

" view current buffers and type the number you want to go to.
":bd to delete a single buffer
nnoremap <F5> :buffers<CR>:buffer<Space>

"go back to file tree
"nnoremap <C-e> :Ex

"splits
"nnoremap <leader><C-v> <C-w><C-v>
"nnoremap <leader><C-h> <C-w><s>

"Navigate split buffers
"Normal Mode
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>
"Terminal mode
tnoremap <C-j> <C-\><C-n><C-W><C-J>
tnoremap <C-k> <C-\><C-n><C-W><C-K>
tnoremap <C-l> <C-\><C-n><C-W><C-L>
tnoremap <C-h> <C-\><C-n><C-W><C-H>


"add current cursor position to jumplist
nnoremap <Leader>m  :autocmd CursorHold * normal! m'<CR>


""easymotion mappings
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
"nnoremap <Leader>f <Plug>(easymotion-prefix)f
nnoremap <Leader>s <Plug>(easymotion-s2)
nnoremap <Leader>f <Plug>(easymotion-prefix)s
"nnoremap  <c-_> <Plug>(easymotion-sn)
nnoremap  <Leader>/ <Plug>(easymotion-sn)
"nnoremap <Leader>F <Plug>(easymotion-prefix)F
"nnoremap <Leader>s <Plug>(easymotion-prefix)s


"map  <C-;> <Plug>(easymotion-next)
"map  <C-,> <Plug>(easymotion-prev)" Terminal mode:
"nmap <leader>f <Plug>(easymotion-overwin-f)
"nmap <leader>cf c<Plug>(easymotion-overwin-f)
"nmap s <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

"fuzzy finder
"I have to remap ctrlp's default in order to make my custom command to work
let g:ctrlp_map = '<c-p>'
"open up all files including dotfiles
nnoremap <leader>p :CtrlP /home/ldraney<CR>
set wildignore+=*/.vim/*
"

"Rename tmux window tab after current file with path
"autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))


let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
