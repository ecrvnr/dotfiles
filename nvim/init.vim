" Plugin Installs

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

""""""""""""" VARIABLES """"""""""""

" Vim variables

let g:netrw_list_hide= '.*\.swp$,\._.*,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$' " Filename patterns to hide in netrw

" Plugin variables

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'dist\|node_modules\|DS_Store\|git'

""""""""""""" CONFIGS """"""""""""""

" Vim configs

set nocompatible " Enter the current millenium
syntax enable " Enable syntax highlighting
filetype plugin on " Enable plugins
set t_Co=256 " Enable 256 colors terminal
colorscheme onehalflight " Theme
set clipboard=unnamedplus " Set + register to system clipboard
set expandtab " Always uses spaces instead of tab characters
set number " Display current line number
set relativenumber " Display relative line numbers
set shiftwidth=2 " Number of spaces for each indentation
set tabstop=2 " Number of spaces printed when pressing TAB
set signcolumn=yes " Always show the signcolumn
set path+=** " Provides tab-completion for all file-related tasks
set wildmenu " Display all matching files when we tab complete

""""""""""""" KEYBINDINGS """"""""""""""

" Vim Keybindings

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j') " j will move virtual lines (lines that wrap)
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k') " k will move virtual lines (lines that wrap)
