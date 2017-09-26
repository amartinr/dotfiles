"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'chrisbra/Colorizer.git'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

call vundle#end()

" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! archlinux.vim

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4		" The width of a TAB is set to 4.
					" Still it is a \t. It is just that
					" Vim will interpret it to be having
					" a width of 4.
set shiftwidth=4	" Indents will have a width of 4.
set softtabstop=4	" Sets the number of columns for a TAB.
set expandtab		" Expand TABs to spaces.

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" colors
set bg=dark
set t_Co=256
colorscheme darkocean

" Flag unnecesary whitespaces (after colorscheme)
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" a line below the current line
set cursorline

" UTF-8
set encoding=utf-8

" Airline
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Remap movements keys to behave like i3
nnoremap ñ l
nnoremap j h
nnoremap l k
nnoremap k j

" SimplyFold
let g:SimpylFold_docstring_preview=1

let mapleader = 'ç' 

" YouCompleteMe {
"let g:enable_ycm_at_startup = 0
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_keep_logfiles = 0
let g:ycm_server_log_level = 'warn'
map <Leader>g  :YcmCompleter GoToDefinition<CR>

" disable YCM for Python files
" let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
" let g:ycm_filetype_blacklist = { 'python' : 1 }
" }

" jedi-vim {
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""

" https://github.com/Valloric/YouCompleteMe/issues/1890
let g:jedi#show_call_signatures_delay = 0
let g:jedi#show_call_signatures = "1"

" jedi-vim defaults
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = "<leader>G"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"
" }

let python_highlight_all=1
syntax on

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
