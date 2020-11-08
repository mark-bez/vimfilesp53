" set guioptions-=T " Removes top toolbar
set guioptions=rb " sets the right and bottom scrollbars and hides the menubar due to a missimg m
set guitablabel=%N\ %t\ %M  " Sets the syntax of the tab label to a tab number and the filename of the current window.

colorscheme solarized8_high
set background=light

" highlight Cursor guifg=white guibg=yellow
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkwait3000
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait3000

" set guifont=Monoid:h13:cANSI:qDRAFT
set guifont=Roboto_Mono:h13:W300
set encoding=utf-8

" I used the following line with my markai colorscheme - however if I want to
" back to this I need to transfer it to my colorscheme instead of here
" highlight CursorLine cterm=NONE ctermbg=yellow ctermfg=White guibg=gray10 guifg=White

set linespace=2
set sidescroll=1 " scrolls the window left/right to see text outside the window

let g:airline_powerline_fonts=1
