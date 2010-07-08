" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

call pathogen#runtime_append_all_bundles() " load pathogen

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{rvm#statusline()}\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

colorscheme moria      " set color scheme
set background=dark    " set colors to handle dark backgrounds

" Mappings

" Change leader key from \ to ,
let mapleader = ","

map <leader>s :TlistToggle<cr>
map <leader>f :FuzzyFinderTextMate<cr>
map <leader>b :BufExplorer<cr>
map <leader>t :NERDTreeToggle<cr>

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby       set foldmethod=syntax
autocmd FileType css        setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType html       setlocal shiftwidth=4 tabstop=4

" Vim Notes plugin configuration
let g:notesRoot='~/Notes'
let g:notesFileExtension = '.rdoc'
let g:notesFileType = 'rdoc'
let g:notesWordSeparator = '_'

" TagList plugin configuration
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

