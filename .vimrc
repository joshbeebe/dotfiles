"Auto indent
set ai

"Set tab to 4 spaces
set ts=4 sts=4 sw=4 noexpandtab

"visible tabs
set list listchars=trail:¤,tab:├\ 

"Always show current position
set ruler

"Always show status bar
set laststatus=2

"Show line numbers
set number
set rnu "Make numbers relative

"Make backspace work right
set backspace=2

"Set how the status bar looks
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"Set leader to ,
let mapleader="\<Space>"

"Set keys for window management
"next window
nnoremap <Leader>ww <C-w><C-w> 
"close window
nnoremap <Leader>wq :hide<CR>
"new window
nnoremap <Leader>wn <C-w><C-v>
"change buffer
nnoremap <Leader>n :bnext<CR>

"Save
nnoremap <Leader>s :w<CR>

"make ; function as :
nnoremap ; :


" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction


" vimconf is not vi-compatible
set nocompatible

""" Plugins {{{
" Toggle tagbar (definitions, functions etc.)
map <F1> :TagbarToggle<CR>

" Toggle the NERDTree file browser
map <F2> :NERDTreeToggle<CR>


"Pathogen
execute pathogen#infect()

" NERDTree
let g:NERDTreeWinPos = "left"
let g:NERDTreeHijackNetrw = 1

""" Return to last edit position when opening files {{{
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	 exe "normal! g`\"" |
		\ endif 

"Turn syntax hilighting on
"For some reason only works on the last line
syntax on
