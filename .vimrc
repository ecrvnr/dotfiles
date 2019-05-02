" LOAD PLUGINS:
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'w0rp/ale'
  Plug 'Quramy/tsuquyomi'
" Initialize plugin system
call plug#end()

" BASIC SETUP:
set runtimepath+=~/.vim,~/.vim/after  
set packpath+=~/.vim

" enter the current millenium
set nocompatible
set backspace=indent,eol,start

" enable syntax and plugins (for netrw)
filetype plugin on
syntax on
set noswapfile
set ignorecase "Case-insensitive search.
set history=200 "By default is 20 or 50.
set exrc "Enable per project configuration.
set number " Show line numbers.
set mouse=a "Activate mouse inside vim. It is better to have such feature I think
set cursorline "Highlight current line.
highlight Cursorline term=none cterm=none
call matchadd('ColorColumn', '\%81v', 120) "Ruler.
highlight ColorColumn ctermbg=magenta "Ruler style.
set splitright "Open new buffer on the right of the current buffer.
set splitbelow "Open new buffer below the current buffer.
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set cindent

" ALE Options
highlight ALEError ctermbg=Brown
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

" 256 BASE16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

