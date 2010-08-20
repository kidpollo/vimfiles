" Copy or symlink to ~/.vimrc

set t_Co=256                      " Enable colors (must be set before syntax enable)

set nocompatible                  " Must come first because it changes other options.

filetype off

call pathogen#runtime_append_all_bundles() " load pathogen

syntax enable                     " Turn on syntax highlighting.

filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plug-in.

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

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set softtabstop=2                 " set backspace to return the same number of spaces with indentation
set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

set spell                         " Display spelling errors

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{rvm#statusline()}\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

colorscheme railscasts            " set color scheme

" Mappings

" Change leader key from \ to
let mapleader = ","

map <Leader>s :TlistToggle<CR>
map <Leader>f :FuzzyFinderTextMate<CR>
map <Leader>l :BufExplorer<CR>

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType css        setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType html       setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Vim Notes plug-in configuration
let g:notesRoot='~/Notes'
let g:notesFileExtension = '.textile'
let g:notesFileType = 'textile'
let g:notesWordSeparator = '_'

" Tag List plug-in configuration
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Append closing characters
inoremap (( ()<Left>
inoremap [[ []<Left>
inoremap {{ {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap \|\| \|\|<Left>

" Easy access to the start and the end of the line
nmap - ^
nmap _ $

" Keep selection after indent
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv

" Alternate  ESC on insert mode
imap jj <Esc>

" Map Ctrl-Movement Keys to window switching
nmap <C-k> <C-w><Up>
nmap <C-j> <C-w><Down>
nmap <C-l> <C-w><Right>
nmap <C-h> <C-w><Left>

" Switch to next and previous files
nmap <C-Tab> :bnext<CR>
nmap <C-S-Tab> :bprevious<CR>

" Map system clipboard to Cmd+C (copy) and Cmd+V (paste)
nmap <D-c> "+y
nmap <D-v> "+p
vmap <D-c> "+y
vmap <D-v> "+p

" Auto load vimrc and gvimrc every time it changes
autocmd BufWritePost .vimrc source $MYVIMRC
autocmd BufWritePost .gvimrc source $MYGVIMRC

" Auto create tags file
set tags=./tags;
nmap <Leader>g :!/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=public/assets --exclude=public/vendor *<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Resize windows
map <M-]> :set lines=61 columns=233
map <M-[> :set lines=45 columns=150

" Annoyances
cmap W w
cmap Q q

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list

" Strip trailing white spaces before file is saved
function StripTrailingWhiteSpaces()
  " Store the current position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Strip white spaces
  %s/\s\+$//e
  " Restore previous search history and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre *.js,*.rb,*.html,*.erb,*.css call StripTrailingWhiteSpaces()
