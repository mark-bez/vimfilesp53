set guioptions-=T " Removes top toolbar
" set guioptions-=r " Removes right hand scroll bar
" set go-=L " Removes left hand scroll bar
set guioptions-=m " Removes top menu bar
set guitablabel=%N\ %f " Sets the syntax of the tab label to a tab number and the filename of the current window.

colorscheme markai

" highlight Cursor guifg=white guibg=yellow
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkwait3000
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait3000

" set guifont=Monoid:h14:cANSI:qDRAFT
set guifont=Roboto_Mono:h13:W300:cANSI:qDRAFT

" I used the following line with my markai colorscheme - however if I want to
" back to this I need to transfer it to my colorscheme instead of here
" highlight CursorLine cterm=NONE ctermbg=yellow ctermfg=White guibg=gray10 guifg=White

set linespace=2
set sidescroll=1 " scrolls the window left/right to see text outside the window
