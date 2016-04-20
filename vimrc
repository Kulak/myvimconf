" Use if has('mac') for OS dependent code
" Values are mac unix, win32

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
" highlight all search results
set hlsearch

if has("gui_running")
	if has('gui_gtk2')
		" works with Ubuntu; requires Liberation fonts installed
		set guifont=Liberation\ Mono\ 10
	else
		" works with cygwin and windows
		set guifont=Lucida_Console:h10:cANSI
	endif
endif

" https://github.com/junegunn/vim-plug
if has('unix')
	call plug#begin('$HOME/.vim/plugged')
else
	call plug#begin('~/vimfiles/plugged')
endif
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/fatih/vim-go
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'moll/vim-bbye'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Plug 'fidian/hexmode' - generates errors

" After new Plug 'userid/project' is written
" Use :PlugInstall command to install new plugin.

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
	
	" http://superuser.com/questions/634326/how-can-i-get-a-block-cursor-in-vim-in-the-cygwin-terminal#634327
	" set environment variable in ~/.bashrc file:
	" export MYHOST=CYGWIN only if using cygwin
	if $MYHOST ==? 'CYGWIN'
		source ~/.vim/cygwin.vim
	elseif $MYHOST ==? 'TERATERM'
		source ~/.vim/teraterm.vim
	elseif $TERM ==? 'xterm'
		source ~/.vim/cygwin.vim
	endif
endif	

" Use Ctrl-V and ESC to generate ^[
" The following two sequences work in putty and vim 7.4
" Right Alt key does not work in putty.
" The sequences do not work in Tera Term,
" because it simply does not send Alt keys.
"
" Putty sends ESC sequence for its arrow keys.
" Thus the sequences below are ESC followed by key.
"
" :map <Right> :hide bn<CR>
" :map <Left> :hide bp<CR>
"
" The following remapping of the lines above does not work
" :map  <Esc>
"
" Go to next file in the buffer list (Esc-Right arrow)
:map <Esc><Right> :hide bn<CR>
" Go to the prev file in the buffer list (Esc-Left arrow)
:map <Esc><Left> :hide bp<CR>

" BACKUP and SWAP
" If path ends with two path separators, then a full name of the file
" is written that includes its directory path.  This preserves uniquness.
"
" Default configuration writes .back and .swp files to the current directory
" That's disruptive in many cases including WinRAR built-in view of the file.
"
" backup directory
set backupdir=~/.backup//
"
" swap is used to make sure file write is not disruptive
set directory=~/.backup//

" enable window title (terminal emulator window title)
set title
" simplest way to display file being edited
let &titlestring = @%

