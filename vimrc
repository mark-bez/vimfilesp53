"""" Basic Behavior

set guicursor=
set number              " show line numbers
set rnu                 " set relative line numbers
set nowrap              " do not wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
" set visualbell          " blink cursor on error, instead of beeping
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir " Saves undo steps to a file so you can redo even after exiting Vim
set undofile
set gdefault               " applies find and replace subsitition globally by default. To only replace first occurrence use /g
" set list lcs=eol:¬,space:. " sets whitespace characters for end of line and spaces. To turn off, :set nolist
set hidden                 " It hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first.

cd $HOME/Documents

call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'lambdalisue/fern.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'habamax/vim-asciidoctor'
Plug 'haya14busa/incsearch.vim'
Plug 'othree/xml.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'dense-analysis/ale'
Plug 'w0rp/ale'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

"""" Key Bindings

" move vertically by visual line (don't skip wrapped lines)
" Turned this off because I want j to move down one physical line
" nmap j gj
" nmap k gk

" :map <C-n> : NERDTree  " map the shortcut for NERDTree
" let NERDTreeHijackNetrw=1 "changes NERDTree from a project drawer to a split explorer - see http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/

"""" Vim Appearance
" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on

set cursorline         " highlight current line
highlight LineNr guifg=#ffea00 guibg=gray
highlight CursorLineNr gui=bold guifg=#ffffff guibg=#c0d0e0
highlight iCursor guifg=white guibg=steelblue

"""" Tab settings
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces
set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')

"""" Search settings
set incsearch           " search as characters are entered, which is incremental search
set hlsearch            " highlight matches

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>

" map Esc key alternative to jk and kj for insert mode and visual mode
inoremap jk <esc>
inoremap kj <esc>
xnoremap jk <esc>
xnoremap kj <esc>

" Shortcut for changing the window focus
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" open a new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l

" Map copy and paste to ctrl-c and ctrl-p
noremap <C-c> "+y
map <C-p> "+p

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

"""" Miscellaneous settings that might be worth enabling

set background=light   " configure Vim to use brighter colors
set autoread           " autoreload the file in Vim if it has been changed outside of Vim



" Remapping of alt-j, alt-k to move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <esc>:m .+1<CR>==gi
inoremap <A-k> <esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Press * to search for the term under the cursor or a visual selection and then press a key below to replace all instances of it in the current file.
nnoremap <F2> :%s///g<Left><Left>
nnoremap <F3> :%s///gc<Left><Left><Left>

" use tab to move around to bracket pairs
nnoremap <tab> %
vnoremap <tab> %

set filetype=on
set statusline=%t%=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y\ %c\ %l/%L\ %P

let mapleader = " "

" strip all trailing whitespace with ,W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" open _vimrc file with ,ev (leader edit vim)
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Fugitive Git plugin mappings
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>
nnoremap <leader>gc :GCheckout<CR>

"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"setting this value forces wrapping even if nowrap is set
"set textwidth=100

"" habamax/asciidoctor plugin settings
" Fold sections, default `0`.
let g:asciidoctor_folding = 1

" Fold options, default `0`.
let g:asciidoctor_fold_options = 2

" What to use for HTML, default `asciidoctor`.
let g:asciidoctor_executable = 'asciidoctor'

" What extensions to use for HTML, default `[]`.
let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge']

" Path to the custom css
let g:asciidoctor_css_path = 'C:\Users\echo\Documents\notes\css'

" Custom css name to use instead of built-in
let g:asciidoctor_css = 'asciidoctor-wide.css'

" Conceal *bold*, _italic_, `code` and urls in lists and paragraphs, default `0`.
" See limitations in end of the README
let g:asciidoctor_syntax_conceal = 0

" Highlight indented text, default `1`.
let g:asciidoctor_syntax_indented = 0

" Function to create buffer local mappings and add default compiler
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
    nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
    nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " :make will build pdfs
    compiler asciidoctor2pdf
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END

" setting opening window size
winpos 1020 50
winsize 130 70

" Used with incsearch plugin to hide highlights after moving the cursor following a search
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Insert date and time in normal and insert modes:
:nnoremap <F5> "=strftime("%Y-%m-%d %H:%M")<CR>P
:inoremap <F5> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

" Insert date in normal and insert modes:
:nnoremap <F6> "=strftime("%Y-%m-%d")<CR>P
:inoremap <F6> <C-R>=strftime("%Y-%m-%d")<CR>

" Mappings for fzf for finding buffers, files, and tags
nmap <Leader>; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>

" Copies the current file path from present working directory onwards to the unnamed register so you can paste with p
:nmap cp :let @" = expand("%")<CR>

" Copies the current complete file path to the unnamed register so you can paste with p
:nmap cP :let @" = expand("%:p")<CR> 

" splits the line on a character with q in Normal mode
nmap m i<C-m><esc>

" pretty print for use with HTML Tidy
command! tidyHTML !tidy -mi -html -wrap 0 %
command! tidyXML !tidy -mi -xml -wrap 0 %

" Prettier autoformat on save
let g:prettier#autoformat_require_pragma = 0

" See https://medium.com/@jimeno0/eslint-and-prettier-in-vim-neovim-7e45f85cf8f9
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier','stylelint'],
\}

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_linters = {
 \   'css': ['stylelint'],
 \   'html': ['tidy'],
 \   'javascript': ['eslint'],
 \}

let g:ale_html_tidy_executable = "C:\Program Files\tidy-5.6.0-vc14-64b\bin\tidy.exe" 

let g:CSSLint_FileTypeList = ['css', 'less', 'sess'] " Activates csslint for use in Vim with css files


" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>n :Fern . -drawer -reveal=% -toggle -width=45<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> s <Plug>(fern-action-mark-toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" This setting must be at toward the bottom for it to work. 
" It maps cd to change the working directory to the directory of active file
nnoremap <leader>cd :cd %:p:h<CR>
