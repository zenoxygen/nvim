" Neovim configuration

" ;; -> save buffer
" ;x -> save buffer and quit
" ;q -> quit
" F2 -> open/close nerdtree
" F3 -> open/close tagbar
" Ctrl + j -> jump 15 lines below
" Ctrl + k -> jump 15 lines above
" AltGr + \ + silence + h -> split horizontal
" AltGr + \ + silence + v -> split vertical
" AltGr + \ + silence + f -> invoke fuzzy finder
" AltGr + \ + silence + w -> find current word in a navigable menu
" AltGr + \ + silence + l -> find last search in a navigable menu
" AltGr + \ + silence + rc -> replace current word and all its occurrences
" AltGr + \ + silence + ci -> comment line/block
" AltGr + \ + silence + cu -> uncomment line/block

" Behavior
set encoding=utf-8  " set encoding
set mouse=a         " enable mouse mode
set backspace=indent,eol,start " backspace through anything in insert mode
set noerrorbells    " disable errors bells
set novisualbell    " disable visual bell
set undofile        " save undos

" Display
syntax on           " override default scheme
syntax enable       " enable syntax highlighting
set title           " show file in titlebar
set laststatus=2    " display status line
set number          " show line number
set ruler           " show current cursor position
set cursorline      " highlight current line
set showmatch       " highlight matching parentheses
set matchtime=2     " show matching parentheses
set showmode        " show current mode in command-line
set scrolljump=5    " set line to scroll when cursor leaves screen
set scrolloff=5     " show context above/below cursorline
set display=lastline " show as much as possible of last line
set splitright      " put new vertical split windows to the right
set splitbelow      " put new horizontal split windows to the bottom
set list            " show trailing whitespace
set listchars=trail:⋅,nbsp:⋅,tab:›\  " define characters to show
set textwidth=79    " broke lines longer than 79 columns

" Indentation
set autoindent      " turn on auto indentation
set tabstop=4       " set number of characters for a tabulation
set softtabstop=4   " set number of spaces for a tabulation in insert mode
set shiftwidth=4    " set number of spaces for normal mode indentation commands
set shiftround      " round indent to multiple of shiftwidth
set smartindent     " insert indentation in some cases
set cindent         " like smartindent, but stricter and more customisable

" Search
set incsearch       " start searching while typing characters
set hlsearch        " highlight all search matches
set ignorecase      " case-insensitive search
set smartcase       " case-sensitive search if any caps

" Completion
set completeopt=menuone,noinsert " do not show extra info on completions
set wildmenu        " show navigable menu instead of just completing
set wildmode=list:longest,full " set completion mode settings
set wildignore+=*.so,*.o,*.a,*.obj,*.swp,*.pyc,*.pyo,*.class " ignore some files on completions

" Cache settings
set autoread        " autoload file changes
set confirm         " pop up when processing unsaved or read-only files
set nobackup        " disable backups
set noswapfile      " disable swap files
set history=100     " enable history

" Enable 24-bit color terminal support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Colorscheme
let g:onedark_terminal_italics=1
colorscheme onedark

" Specify directory for plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'zah/nim.vim'

" Initialize plugin system
call plug#end()

" lightline
let g:lightline = { "colorscheme": "onedark" }

" nerdtree
let NERDTreeWinSize=30
let g:NERDSpaceDelims=1
let g:NERDTreeShowHidden=1

" nerdcommenter
let g:NERDCommentEmptyLines=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign="left"
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1

" tagbar
let g:tagbar_autoclose=0
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_singleclick=1
let g:tagbar_width=30

" syntastic
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" python-mode
let g:pymode_indent=1
let g:pymode_lint=0
let g:pymode_options_colorcolumn=1
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_slow_sync=1
let g:pymode_virtualenv=1

" vim-go
let g:go_auto_type_info=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_extra_types=1
let g:go_highlight_operators=1
let g:go_highlight_types=1
let g:go_fmt_command="goimports"

" rust.vim
let g:rustfmt_autosave=1

" Get standard keys
nnoremap j gj
nnoremap k gk

" Jump more lines up
nnoremap <C-j> 15gj
nnoremap <C-k> 15gk

" Save buffer
nnoremap ;; :w<CR>

" Quit
nnoremap ;q :q<CR>
nnoremap ;x :x<CR>

" Horizontal split
nnoremap <Leader>h :split<CR>

" Vertical split
nnoremap <Leader>v :vsplit<CR>

" Find current word in a navigable menu
nnoremap <Leader>w :execute "vimgrep ".expand("<cword>")." %"<cr>:copen<CR>

" Find last search in a navigable menu
nnoremap <Leader>l :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Replace current word and all its occurrences
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/

" Turn off highlighting and clear any message already displayed
nnoremap <Space> :noh<Bar>:echo<CR>

" Invoke nerdtree
nnoremap <F2> :NERDTreeToggle<CR>

" Invoke tagbar
nnoremap <F3> :TagbarToggle<CR>

" Invoke fzf
nnoremap <Leader>f :FZF<CR>

" Set cursor to the last position (history on required)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif
augroup END
