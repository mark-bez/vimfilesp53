set autoindent                 " copy indent from current line when starting a new line
set autoread                   "autoreload the file if is has been changed outside Vim
set backspace=indent,eol,start " Allows you to backspace to the left of the Insert mode entry character
set backupdir=/tmp//,.
set cmdheight=2                " give more space for displaying messages
set cursorline                 " highlight current line - this may slow down performance
set directory=/tmp//,.
set encoding=utf-8             " set encoding to UTF-8 (default was "latin1")
set expandtab smarttab         " convert <TAB> key-presses to spaces
set filetype=on
set hidden                     " It hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first.
set hlsearch                   " highlight search matches
set incsearch                  " search as characters are entered, which is incremental search
set laststatus=2               " always show statusline (even with only single window)
set lazyredraw                 " redraw screen only when we need to
set matchpairs+=<:>            " Use % to jump between pairs
set number                     " show line numbers
set mouse=a                    " enable mouse support (might not work well on Mac OS X)
set nobackup
set nocompatible               " This should be set by default in Vim8, but just in case
set nostartofline
set noswapfile
set nowrap                     " do not wrap lines
set regexpengine=1
set relativenumber             " set relative line numbers
set ruler                      " show line and column number of the cursor on right side of statusline
set scrolloff=3                " keep three lines between the cursor and the edge of the screen
set shiftwidth=2               " number of spaces to use for each step of (auto)indent
set showcmd
set noshowmatch                  "turn off highlight matching parentheses / brackets [{()}]
set showmode
set smartcase
set smartindent                " even better autoindent (e.g. add indent after '{')
set spelllang=en_us
set splitbelow
set splitright
set tabstop=2                  " width that a <TAB> character displays as
set textwidth=0
set timeoutlen=500
set updatetime=300             " default is 4 s which can cause delays
set softtabstop=2              " backspace after pressing <TAB> will remove up to this many spaces
set undodir=~/.vim/undodir     " Saves undo steps to a file so you can redo even after exiting Vim
set undofile
set wildmenu                   " visual autocomplete for command menu

" -----------------------------------------------------------------------------
" Set current directory on startup
" -----------------------------------------------------------------------------

cd $HOME/Documents

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------


" Specify a directory for plugins
call plug#begin()

" Startup screen
Plug 'mhinz/vim-startify'

" Navigate and manipulate files in a tree view.
Plug 'lambdalisue/fern.vim'

" Run a diff on 2 directories.
Plug 'will133/vim-dirdiff'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Highlight which character to jump to when using horizontal movement keys.
Plug 'unblevable/quick-scope'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show git file changes in the gutter.
Plug 'mhinz/vim-signify'

" Asciidoctor plugins
Plug 'habamax/vim-asciidoctor'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/incsearch.vim'

" Integrate fzf with Vim.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" Plug 'dense-analysis/ale'
Plug 'w0rp/ale'
" post install (yarn install | npm install) then load plugin only for editing supported files

" Prettifying code files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'xml'] }

" Font size changer
Plug 'drmikehenry/vim-fontsize'

Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'

call plug#end()

" -----------------------------------------------------------------------------
" Cursor line - see gvimrc for other cursor line settings
" -----------------------------------------------------------------------------

" shows/hides cursor line when switching modes
:autocmd InsertEnter,InsertLeave * set cul!

" -----------------------------------------------------------------------------
" Syntax highlighting and indenting
" -----------------------------------------------------------------------------

syntax enable

" Detect filetypes and run language-specific plugins in the ftplugin folder
filetype plugin indent on

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>

" map Esc key alternative to jk and kj for insert mode and visual mode
inoremap jk <esc>
inoremap kj <esc>
xnoremap jk <esc>
xnoremap kj <esc>
" map the ENTER key to switch back to Normal mode from Insert and Visual
" Use Caps Lock ENTER (mapped to Ctrl) to add a line return from Insert mode
" inoremap <ENTER> <esc>
" xnoremap <ENTER> <esc>

" Shortcuts for changing the window focus
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" move among buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :blast<CR>

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

set statusline=%t%=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y\ %c\ %l/%L\ %P

" set the mapleader
let mapleader = " "
let g:mapleader = " "

" Add an asciidoc bullet from normal mode
nmap <leader>b a<CR>* 

" Add an asciidoc checkbox from normal mode
nmap <leader>bb a<CR>* [ ] 

" splits the line on a character in Normal mode when pressing s
nnoremap <leader>s i<CR><ESC>

" open _vimrc file with ,ev (leader edit vim)
"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
map <leader>ev :tabnew $MYVIMRC<CR>

" open a new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l

" Open a new empty tab
nnoremap <leader>a :tabnew<CR>

" Toggle spell check.
map <F7> :setlocal spell!<CR>

" Spelling mistakes will also be colored red if you uncomment the colors.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
" hi SpellCap cterm=underline ctermfg=203 guifg=DarkMagenta

" Use F8 to toggle relative line numbers and regular line numbers.
nmap <F8> :set invrelativenumber<CR>

" Use F4 to remove trailing whitespace without removing empty lines
:nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" using vim-better-whitespace plugin instead now - to delete -  Toggle visually showing all whitespace charactersT - to turn off, :set nolist
" noremap <F9> :set list!<CR>
" inoremap <F9> <C-o>:set list!<CR>
" cnoremap <F9> <C-c>:set list!<CR>

" Toggle quickfix window.
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>

" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
" autocmd InsertLeave * silent! set nopaste

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" -----------------------------------------------------------------------------
" Opening window size
" -----------------------------------------------------------------------------

winpos 1020 50
winsize 130 70

" -----------------------------------------------------------------------------
" Startify settings
" -----------------------------------------------------------------------------

let g:startify_custom_header = [
    \ 'WELCOME TO VIM'
    \ ]

let g:startify_session_dir = '~/.vim/session'

let g:startify_bookmarks = [ 'C:\Users\echo\Documents\notes', 'C:\Users\echo\Documents\websites\tek-write-jekyll\site' ]

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks:']      },
      \ { 'type': 'files',     'header': ['   Recent Files:']            },
      \ { 'type': 'dir',       'header': ['   Files in Current Directory sorted by save time: '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions:']       },
      \ { 'type': 'commands',  'header': ['   Commands:']       },
      \ ]

" -----------------------------------------------------------------------------
" Airline settings
" -----------------------------------------------------------------------------
"
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1

" -----------------------------------------------------------------------------
" Insert date and time
" -----------------------------------------------------------------------------

" Insert date and time in normal and insert modes:
:nnoremap <F6> "=strftime("%Y-%m-%d %H:%M")<CR>P
:inoremap <F6> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

" Insert date in normal and insert modes:
:nnoremap <F5> "=strftime("%Y-%m-%d")<CR>P
:inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

" -----------------------------------------------------------------------------
" Copy file paths
" -----------------------------------------------------------------------------

" Copies the current file path from present working directory onwards to the unnamed register so you can paste with p
:nmap cp :let @" = expand("%")<CR>

" Copies the current complete file path to the unnamed register so you can paste with p
:nmap cP :let @" = expand("%:p")<CR>

" -----------------------------------------------------------------------------
" Pretty print formatting
" -----------------------------------------------------------------------------

" pretty print for use with HTML Tidy
command! TidyHTML !tidy -mi -html -wrap 0 %
command! TidyXML !tidy -mi -xml -wrap 0 %
command! XmlLint %!xmllint % --format

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" FZF plugin mappings
" .............................................................................

"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Mappings for fzf for finding buffers, files, and tags
nmap <Leader>; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>

" If installed using git
Plug '~/.fzf'

" .............................................................................
" Prettier
" .............................................................................

" Prettier autoformat on save
let g:prettier#autoformat_require_pragma = 0

" .............................................................................
" incsearch plugin settings
" .............................................................................

" hide highlights after moving the cursor following a search - works with hlsearch setting set above
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" .............................................................................
" unblevable/quick-scope
" .............................................................................

" Trigger a highlight in the appropriate direction when pressing these keys.
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#af005f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#0087ff' gui=underline ctermfg=81 cterm=underline
augroup END

" .............................................................................
" habamax/asciidoctor plugin settings
" .............................................................................

" Fold sections, default `0`.
let g:asciidoctor_folding = 1

" Fold options, default `0`.
let g:asciidoctor_fold_options = 2

" What to use for HTML, default `asciidoctor`.
let g:asciidoctor_executable = 'asciidoctor'

" What extensions to use for HTML, default `[]`.
let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge']

" Path to the custom css - turned off so I can specify as a file attribute
" let g:asciidoctor_css_path = 'C:\Users\echo\Documents\notes\css'

" Custom css name to use instead of built-in - turned off so I can specify as a file attribute
" let g:asciidoctor_css = 'asciidoctor-wide.css'

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

" .............................................................................
" ALE plugin settings
" .............................................................................

let g:ale_html_tidy_executable = "C:\Program Files\tidy-5.6.0-vc14-64b\bin\tidy.exe"

" See https://medium.com/@jimeno0/eslint-and-prettier-in-vim-neovim-7e45f85cf8f9
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
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

let g:CSSLint_FileTypeList = ['css', 'less', 'sass'] " Activates csslint for use in Vim with css files

" .............................................................................
" lambdalisue/fern.vim plugin settings
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

noremap <silent> <Leader>n :Fern %:h -reveal=% -drawer -toggle -width=45<CR><C-w>l

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

" Quickfix list
" -----------------------------------------------------------------------------

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" -----------------------------------------------------------------------------
" Autocomplete
" -----------------------------------------------------------------------------

" autocloses html and xml tags
inoremap ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>

" -----------------------------------------------------------------------------
" Set current directory on the fly
" -----------------------------------------------------------------------------

" This setting must be at toward the bottom for it to work.
" It maps cd to change the working directory to the directory of active file
" nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>cd :lcd %:h<CR>

" -----------------------------------------------------------------------------
" Enable use of standard Windows copy and paste commands
" -----------------------------------------------------------------------------

" use ctrl-c in normal and visual modes to store in the Windows clipboar
nnoremap <C-c> "+y
vnoremap <C-c> "+y

" while in any Vim mode, use ctrl-p to paste into Vim from the Windows clipboard
map <C-p> "+p

" use ctrl-x in normal and visual modes of Vim to cut and store in the Windows clipboard
map <C-x> "+x
