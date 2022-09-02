" Neovim configuration

" F2 -> open/close nerdtree
" F3 -> open/close tagbar
" ;; -> save buffer
" ;x -> save buffer and quit
" ;q -> quit
" Ctrl + j -> jump 15 lines below
" Ctrl + k -> jump 15 lines above
" Ctrl + a -> search file in project
" Ctrl + q -> search term in project
" Ctrl + s -> search current term in file
" Ctrl + x -> list buffers
" Ctrl + d -> go to definition
" Ctrl + i -> go to implementation
" Ctrl + e -> go to next warning/error
" Ctrl + o -> show documentation
" AltGr + \ + silence + h -> split horizontal
" AltGr + \ + silence + v -> split vertical
" AltGr + \ + silence + r -> replace current word and all its occurrences
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
set scrolloff=3     " show context above/below cursorline
set display=lastline " show as much as possible of last line
set splitright      " put new vertical split windows to the right
set splitbelow      " put new horizontal split windows to the bottom
set list            " show trailing whitespace
set listchars=trail:⋅,nbsp:⋅,tab:›\  " define characters to show

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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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

" airline
let g:airline_powerline_fonts=1"

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

" python-mode
let g:pymode_indent=1
let g:pymode_lint=1
let g:pymode_lint_on_fly=1
let g:pymode_lint_ignore = ["W", "E501", "E402"]
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
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Invoke nerdtree
nnoremap <F2> :NERDTreeToggle<CR>

" Invoke tagbar
nnoremap <F3> :TagbarToggle<CR>

" Get standard keys
nnoremap j gj
nnoremap k gk

" Jump more lines up
nnoremap <C-j> 15gj
nnoremap <C-k> 15gk

" Save buffer
nnoremap ;; :w<CR>

" Save buffer and quit
nnoremap ;x :x<CR>

" Quit
nnoremap ;q :q<CR>

" Horizontal split
nnoremap <Leader>h :split<CR>

" Vertical split
nnoremap <Leader>v :vsplit<CR>

" Invoke fzf to search file in project
nnoremap <C-a> :GFiles<CR>

" Invoke fzf to search term in project
nnoremap <C-q> :Rg<CR>

" Invoke fzf to search current term in file
nnoremap <C-s> :BLines <C-r><C-w><CR>

" Invoke fzf to list buffers
nnoremap <C-x> :Buffers<CR>

" Replace current word and all its occurrences
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" Turn off highlighting and clear any message already displayed
nnoremap <Space> :noh<Bar>:echo<CR>

" Set cursor to the last position (history on required)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif
augroup END

" Code navigation
nmap <C-d> <Plug>(coc-definition)
nmap <C-i> <Plug>(coc-implementation)
nmap <C-e> <Plug>(coc-diagnostic-next)

" Trigger completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" Show documentation in preview window
nnoremap <C-o> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
