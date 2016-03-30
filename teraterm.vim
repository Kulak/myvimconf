
" Tera Term specific configuration options.

" In Gnome 3's Terminal pressing ESC prints junk characters
" instead of changing cursor.
" Thus, I have disabled the code that's known to work in Tera Term and
" Cygwin

" Tera Term scenario as documented in
" http://www.teraterm.org/manual/en/usage/tips/vim.html
"
" In insert mode: Blink vertical line
let &t_SI.="\e[5 q"
" In normal mode: Blink block 
let &t_EI.="\e[1 q"
" delay to wait for cursor to change from Insert to Normal mode
" temoutlen solution appears to be the least complicated and it works
set timeoutlen=160

" For details about 
" - Speed up vsplit scrolling
" - Auto indent can be disabled on pasting from clipboard
" See:
" http://www.teraterm.org/manual/en/usage/tips/vim.html

" Allow title retrival and storage
" Thus default phraze "thanks for flying vim" is not displayed
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"
