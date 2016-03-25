set hidden

set statusline =
set statusline +=%l     " current line
set statusline +=\      " space separator
set statusline +=%t     " file name
set statusline +=%m     " modified file marker
set statusline +=\ %P   " percent through file

" keep status line all the time; otherwise it dissapears
set laststatus=2

" tab takes 4 spaces
set tabstop=4
" always use tabs if tabstop == softtabstop
set softtabstop=4
" set automatic indent to 4; without it it is 8
set shiftwidth=4

set background=dark
highlight clear Normal
colorscheme darkblue

if has("gui_running")
	set guifont=Lucida_Console:h10:cANSI
endif

" https://github.com/junegunn/vim-plug
call plug#begin('~/vimfiles/plugged')
" Make sure you use single quotes
Plug 'fatih/vim-go'
call plug#end()

" \-i runs go-info command
au FileType go nmap <leader>i <Plug>(go-info)
" \-bt runs go-build with new tab
au FileType go nmap <C-B> <Plug>(go-build)
au FileType go imap <C-B> <Plug>(go-build)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

if has("gui_running")
	" GUI is running or about to start
	set lines=50 columns=120
else
	" This is console vim
	"if exists("+lines")
	"	set lines=50
	"endif
	"if exists("+columns")
	"	set columns=100
	"endif
endif	

" map <A-Right> :tabNext

" BACKUP and SWAP
" If path ends with two path separators, then a full name of the file
" is written that includes its directory path.  This preserves uniquness.
"
" Default configuration writes .back and .swp files to the current directory
" That's disruptive in many cases including WinRAR built-in view of the file.
"
" backup directory
set backupdir=~/editorbackup//
"
" swap is used to make sure file write is not disruptive
set directory=~/editorbackup//
