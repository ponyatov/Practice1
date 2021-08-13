source $VIMRUNTIME/../vimrc

"set encoding=utf-8

colorscheme darkblue
"colorscheme pablo
"au ColorScheme * highlight LineNr ctermfg=darkblue guifg=darkblue
"au ColorScheme * highlight ColorColumn ctermbg=darkblue guibg=darkblue
"au ColorScheme * highlight Todo ctermbg=blue ctermfg=white guibg=blue guifg=white
"au ColorScheme * highlight String ctermfg=magenta guifg=magenta
"au ColorScheme * highlight Number ctermfg=green guifg=green

set number
set colorcolumn=80

syntax on
"au BufRead,BufNewFile *.log set filetype=log|set autoread
au BufRead,BufNewFile *.ypp set filetype=yacc
au BufNewFile,BufRead *.yacc set filetype=yacc
au BufRead,BufNewFile *.lpp set filetype=lex
au BufNewFile,BufRead *.lex set filetype=lex
au BufRead,BufNewFile *.hpp set filetype=cpp
au BufRead,BufNewFile *.cpp set filetype=cpp

au BufNewFile,BufRead *.log set filetype=log
au BufNewFile,BufRead *.log set autoread
au BufNewFile,BufRead *.log set nowrap

au BufNewFile,BufRead *.py set expandtab

filetype on
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

inoremap <F2> <ESC>:w<CR><INS>
nnoremap <F2> :w<CR>
inoremap <c-s> <ESC>:w<CR><INS>
nnoremap <c-s> :w<CR>

inoremap <F4> <ESC>:w<CR>:!make clean<CR>
nnoremap <F4> :w<CR>:!make clean<CR>

"inoremap <F9> <ESC>:syn off<CR>:syn on <CR><INS>
"nnoremap <F9> :syn off<CR>:syn on <CR>

nnoremap <F12>      :w<CR>:!make OS=linux RES= EXE= TAIL=-n17 test<CR>
inoremap <F12> <ESC>:w<CR>:!make OS=linux RES= EXE= TAIL=-n17 test<CR>

nnoremap <F9>		:w<CR>:call system('make OS=linux')<CR>
inoremap <F9> <ESC>:w<CR>:call system('make OS=linux')<CR><INS>

noremap <c-t> :tabf<space>
noremap <c-w> ZZ
inoremap <c-t> <ESC>:tabf<space>
inoremap <c-w> <ESC>ZZ

behave mswin

if has("gui_running")
	set columns=85 lines=37
endif
