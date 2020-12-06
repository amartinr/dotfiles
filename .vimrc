"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'chrisbra/Colorizer.git'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'edkolev/promptline.vim'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'vimperator/vimperator.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

" Filetype detection and indentation
filetype plugin on
filetype plugin indent on

" For everything else, use a tab width of 4 space chars.
set tabstop=4		" The width of a TAB is set to 4.
					" Still it is a \t. It is just that
					" Vim will interpret it to be having
					" a width of 4.
set shiftwidth=4	" Indents will have a width of 4.
set softtabstop=4	" Sets the number of columns for a TAB.
set expandtab		" Expand TABs to spaces.

" colors
set bg=dark

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1

if &term=~'linux'
    set t_Co=8
    let g:airline_theme='solarized'
    colorscheme default
else
    set t_Co=256
    let g:airline_theme='atomic'
    colorscheme atomic
endif

let g:promptline_preset = {
        \'b' : [ promptline#slices#python_virtualenv(), '$USER' ],
        \'a' : [ promptline#slices#vcs_branch() ],
        \'c' : [ promptline#slices#cwd() ],
        \'options': {
          \'left_sections' : [ 'b', 'a', 'c' ],
          \'left_only_sections' : [ 'b', 'a', 'c' ]}}

" Flag unnecesary whitespaces (after colorscheme)
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" a line below the current line
set cursorline

" UTF-8
set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Remap move keys to behave like i3 (Spanish keyboard)
nnoremap ñ l
nnoremap j h
nnoremap l k
nnoremap k j

" SimplyFold
let g:SimpylFold_docstring_preview=1

let mapleader = 'ç' 

" YouCompleteMe {
"let g:ycm_server_python_interpreter = '/usr/bin/python2'
"let g:ycm_python_binary_path = '/usr/bin/python2'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/python/ycm/tests/testdata/.ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_server_keep_logfiles = 0
"let g:ycm_server_log_level = 'warn'
"map <Leader>g  :YcmCompleter GoToDefinition<CR>
"
"" disable YCM for Python files
"let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
"let g:ycm_filetype_blacklist = { 'python' : 1 }
"}

" jedi-vim {
let g:jedi#force_py_version = 3
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
"}

let python_highlight_all=1
syntax on

" run python and bash scripts
"autocmd FileType sh nnoremap <buffer> <F9> :exec '!bash' shellescape(@%, 1)<cr>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 " Don't auto open/close location list
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode = "passive"
let g:syntastic_enable_signs = 0
nnoremap <F7> :SyntasticCheck<CR> :lopen<CR>

let g:syntastic_sh_checkers = [ "shellcheck" ]
